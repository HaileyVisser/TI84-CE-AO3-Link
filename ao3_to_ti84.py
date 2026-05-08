"""
AO3 to TI-84 Plus CE Chapter Fetcher
=====================================
Fetches a chapter from AO3, saves it as a .txt file,
then converts it to an 8xv file ready to send to your TI-84 Plus CE.

Requires Python 3, cloudscraper, and beautifulsoup4.
forgot why soup is needed but just do it
    pip install cloudscraper beautifulsoup4

Usage:
    python ao3_to_ti84.py
    Then paste an AO3 chapter URL when prompted.
"""

import cloudscraper
from bs4 import BeautifulSoup
import textwrap
import os
import re
import time
import subprocess

# HAILEY WHEN YOU GET CONFUSED; THE REPLACE LINES ARE COMMENTED OUT
# Settings 
# how many characters to wrap per line
LINE_WIDTH = 39

# files get saved here. Change to whatever is convenient
#I also need to change the instructions that get printed after grabbing a chapter
OUTPUT_FOLDER = r"C:\Users\visse\OneDrive\Desktop\CEDev\reader\Chapters"

# (cloudscraper handles browser headers automatically)

#  Helpers 

def sanitize_filename(name: str) -> str:
    """Remove characters that can't appear in filenames."""
    return re.sub(r'[\\/*?:"<>|]', "", name).strip()


def wrap_text(text: str, width: int = LINE_WIDTH) -> str:
    """
    Wrap every paragraph to `width` characters so it fits the
    TI-84 CE screen without scrolling sideways.
    """
    paragraphs = text.split("\n")
    wrapped = []
    for para in paragraphs:
        para = para.strip()
        if para == "":
            wrapped.append("")          # keep blank lines between paragraphs
        else:
            wrapped.extend(textwrap.wrap(para, width=width))
    return "\n".join(wrapped)


def build_header(title: str, author: str, chapter_title: str,
                 chapter_num: int, total_chapters) -> str:
    """Build a short info block shown at the top of the file."""
    total = str(total_chapters) if total_chapters else "?"
    lines = [
        "=" * LINE_WIDTH,
        textwrap.fill(title,     width=LINE_WIDTH),
        textwrap.fill(f"by {author}", width=LINE_WIDTH),
        f"Ch {chapter_num}/{total}",
    ]
    if chapter_title:
        lines.append(textwrap.fill(chapter_title, width=LINE_WIDTH))
    lines.append("=" * LINE_WIDTH)
    lines.append("")
    return "\n".join(lines)


# Core fetch logic 

def fetch_ao3_chapter(url: str):
    """
    Download one AO3 chapter page and return:
        (work_title, author, chapter_title, chapter_num,
         total_chapters, body_text)
    Raises ValueError with a readable message on failure.
    """

    # Validates the URL 
    if "archiveofourown.org" not in url:
        raise ValueError("That doesn't look like an AO3 URL. "
                         "Please paste a link from archiveofourown.org")

    # checks for single chapter, a whole work would use too much storage
    # and the calculator gets cranky when you run out og memory/storage
    # e.g. https://archiveofourown.org/works/12345/chapters/67890
    if "/chapters/" not in url:
        # If the user pasted a plain /works/ URL, redirect them helpfully
        # but still try — AO3 will give us chapter 1 by default
        print("  ℹ️  No chapter ID in URL — fetching chapter 1 by default.")

    # Download the page 
    print(f"  📡 Fetching: {url}")
    print("  ⏳ This may take ~5 seconds (Cloudflare check)...")
    try:
        scraper = cloudscraper.create_scraper(
            browser={"browser": "chrome", "platform": "windows", "desktop": True}
        )
        response = scraper.get(url, timeout=30)
    except Exception as e:
        raise ValueError(f"Connection failed: {e}")

    if response.status_code == 429:
        raise ValueError(
            "AO3 is rate-limiting us; too many requests. "
            "Wait a minute and try again."
        )
    if response.status_code == 403:
        raise ValueError(
            "AO3 returned 403 Forbidden. The work may be "
            "locked to logged-in users only."
        )
    if response.status_code != 200:
        raise ValueError(
            f"AO3 returned HTTP {response.status_code}. "
            "Check the URL and try again."
        )

    # Parse the HTML 
    soup = BeautifulSoup(response.text, "html.parser")

    # Work title
    title_tag = soup.find("h2", class_="title heading")
    work_title = title_tag.get_text(strip=True) if title_tag else "Unknown Title"

    # Author
    author_tag = soup.find("h3", class_="byline heading")
    author = author_tag.get_text(strip=True) if author_tag else "Unknown Author"

    # Chapter title (optional — not all chapters have one)
    chapter_title = ""
    ch_title_tag = soup.find("h3", class_="title")
    if ch_title_tag:
        chapter_title = ch_title_tag.get_text(strip=True)

    # Chapter number + total
    chapter_num = 1
    total_chapters = None

    # AO3's chapter dropdown is <select name="selected_id">.
    # None of the <option> tags carry a selected= attribute in the HTML —
    # instead we figure out which chapter we're on by matching the chapter
    # ID in the URL against each option's value attribute.
    #can you tell i spent way too long on this part? because i did. it was a nightmare.
    #also I hate python this makes no sense, #C superiority 
    chapter_select = soup.find("select", {"name": "selected_id"})
    if chapter_select:
        options = chapter_select.find_all("option")
        total_chapters = len(options) if options else None
        # Match URL chapter ID to the correct option
        url_chapter_match = re.search(r'/chapters/(\d+)', url)
        if url_chapter_match:
            url_chapter_id = url_chapter_match.group(1)
            for i, opt in enumerate(options, start=1):
                if opt.get("value") == url_chapter_id:
                    chapter_num = i
                    break
    else:
        total_chapters = 1

    # Chapter body text
    body_div = soup.find("div", class_="userstuff module")
    if not body_div:
        body_div = soup.find("div", class_="userstuff")
    if not body_div:
        raise ValueError(
            "Couldn't find the chapter text on this page. "
            "The work might be locked (login required) or the URL is wrong."
        )

    # Collect text
    paragraphs = []
    for element in body_div.find_all(["p", "br", "h1", "h2", "h3"]):
        text = element.get_text()
        paragraphs.append(text)

    raw_body = "\n\n".join(p for p in paragraphs if p.strip())

    return work_title, author, chapter_title, chapter_num, total_chapters, raw_body


def save_chapter(work_title: str, author: str, chapter_title: str,
                 chapter_num: int, total_chapters, body_text: str) -> str:
    """
    Wrap the text, prepend the header, and save to a .txt file.
    Returns the path to the saved file.
    """
    os.makedirs(OUTPUT_FOLDER, exist_ok=True)

    header = build_header(
        work_title, author, chapter_title, chapter_num, total_chapters
    )
    wrapped_body = wrap_text(body_text)
    full_text = header + wrapped_body

    # Replace characters that your calculator can't display, commented out because read.c deals with it and displays them or uses ?
   #full_text = full_text.replace('\u201c', '(')   # opening double quote
    #full_text = full_text.replace('\u201d', ')')   # closing double quote
    #full_text = full_text.replace('"',      '(')   # straight double quote
    #full_text = full_text.replace('\u2018', ')')   # opening single quote
    #full_text = full_text.replace('\u2019', ')')   # closing single quote / apostrophe
    #full_text = full_text.replace("'",      ')')   # straight apostrophe
    #full_text = full_text.replace('\u2026', '...')  # ellipsis character
    #full_text = full_text.replace('\u2014', '--')   # em dash
    #full_text = full_text.replace('\u2013', '-')    # en dash
    #full_text = full_text.replace('\u00a0', ' ')   # non-breaking space → regular space
    #full_text = full_text.replace('\r\n', '\n')     # Windows line endings → Unix
    #full_text = full_text.replace('\r', '\\n')       # old Mac line endings → Unix

    # Build filename as Ch[num]. txt, e.g. Ch1.txt, Ch2.txt, etc. 
    filename = f"Ch{chapter_num}.txt"
    filepath = os.path.join(OUTPUT_FOLDER, filename)

    # ascii encoding with replace catches any remaining non-ASCII characters
    with open(filepath, "wb") as f:
        f.write(full_text.encode("ascii", errors="replace"))

    return filepath


# converter 

def write_8xv(txt_filepath: str) -> str:
    
    # Write a valid TI-83+/84+ AppVar (.8xv) file directly from the txt file.
    # No ConvText needed.
    # Read the text to store.
    with open(txt_filepath, "rb") as f:
        data = f.read()

    # AppVar data is: 2 bytes for data length, then the data itself
    data_len = len(data)
    var_data = data_len.to_bytes(2, 'little') + data

    # Variable name: up to 8 chars, padded with null bytes
    # Extract "Ch1", "Ch2" etc from filename
    varname = os.path.splitext(os.path.basename(txt_filepath))[0]  # e.g. "Ch1"
    varname_bytes = varname.encode('ascii')[:8].ljust(8, b'\x00')

    # Variable entry
    var_entry = (
        b'\x0D\x00'                    # 2 bytes: entry length marker (13)
        + len(var_data).to_bytes(2, 'little')  # 2 bytes: data length
        + b'\x15'                      # 1 byte: type ID 0x15 = AppVar
        + varname_bytes                # 8 bytes: variable name
        + b'\x00'                      # 1 byte: version
        + b'\x00'                      # 1 byte: flag (not archived)
        + len(var_data).to_bytes(2, 'little')  # 2 bytes: data length again
        + var_data                     # actual data
    )

    # File header
    data_section_len = len(var_entry)
    comment = b'AO3 Reader'
    comment = comment.ljust(42, b'\x00')  # pad to 42 bytes

    header = (
        b'**TI83F*'                    # 8 bytes: signature
        + b'\x1A\x0A\x00'             # 3 bytes: further signature
        + comment                      # 42 bytes: comment
        + data_section_len.to_bytes(2, 'little')  # 2 bytes: data section length
    )

    # Checksum: lower 16 bits of sum of all bytes in data section
    checksum = sum(var_entry) & 0xFFFF
    checksum_bytes = checksum.to_bytes(2, 'little')

    # Write the file
    output_path = txt_filepath.replace('.txt', '.8xv')
    with open(output_path, 'wb') as f:
        f.write(header + var_entry + checksum_bytes)

    return output_path
    
# Interactive loop 

def main():
    print("=" * 50)
    print("  AO3 → TI-84 Plus CE Chapter Fetcher")
    print("=" * 50)
    print()
    print("Paste an AO3 chapter URL and press Enter.")
    print("Type 'quit' to exit.\n")

    while True:
        url = input("AO3 URL: ").strip()

        if url.lower() in ("quit", "exit", "q"):
            print("Bye!")
            break

        if not url:
            continue

        try:
            print()
            work_title, author, chapter_title, chapter_num, total, body = \
                fetch_ao3_chapter(url)

            txt_filepath = save_chapter(
                work_title, author, chapter_title, chapter_num, total, body
            )

            calc_filepath = write_8xv(txt_filepath)

            print()
            print(f"  ✅ Done!")
            print(f"  📖 Work   : {work_title}")
            print(f"  ✍️  Author : {author}")
            print(f"  📑 Chapter: {chapter_num}"
                  + (f" of {total}" if total else ""))
            print()
            print(f"  📁 Calculator file:")
            print(f"     {calc_filepath}")
            print()
            print()

        except ValueError as e:
            print(f"\n  ❌ Error: {e}\n")

        except Exception as e:
            print(f"\n  ❌ Unexpected error: {e}")
            print("  Try a different URL or check your connection.\n")

        # Remember to be nice, just waits for 1 second before allowing the next input
        time.sleep(1)


if __name__ == "__main__":
    main()
