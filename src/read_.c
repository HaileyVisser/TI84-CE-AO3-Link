#include <graphx.h>
#include <keypadc.h>
#include <fileioc.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

// Settings
#define LINES_ON_SCREEN   24   // lines visible on screen
#define LINE_HEIGHT       10   // pixels per line
#define LINE_WIDTH        39   // characters per line
#define SCREEN_WIDTH     320   //screen size in pixels
#define SCREEN_HEIGHT    240   //also screen size in pixels
#define SCROLL_BUFFER     2    // extra lines user can scroll past the last full screen

// Set to 1 to show character number:byte_value, 0 for normal reading
//not useful, requires file Ch1.8xv to be present
//don't use this, leftover from chunking attempts
#define DEBUG_MODE 0

// Line storage — dynamically allocated, one malloc per line
char **lines     = NULL;  // array of pointers to individual lines
int  total_lines = 0;     // how many lines are loaded

// The currently open file slot
ti_var_t open_slot = 0;

// Build filename from chapter number
void build_filename(int chapter_num, char *filename) {
    filename[0] = 'C';
    filename[1] = 'h';

    int n = chapter_num;
    char numstr[5];
    int len = 0;
    if (n == 0) {
        numstr[len++] = '0';
    } else {
        while (n > 0) {
            numstr[len++] = '0' + (n % 10);
            n /= 10;
        }
        for (int i = 0; i < len / 2; i++) {
            char tmp = numstr[i];
            numstr[i] = numstr[len - 1 - i];
            numstr[len - 1 - i] = tmp;
        }
    }
    numstr[len] = '\0';
    filename[2] = '\0';
    strncat(filename, numstr, 5);
}

// Read one line from the open file.
// I think this is an artifact from trying to load chapters in chunks of 100 lines
//chunking did not work, it kept excluding the last 15 lines of a chunk
//too scared to delete it
int read_line(char *buffer, int max_len) {
    int i = 0;
    uint8_t c;

    while (i < max_len - 1) {
        if (ti_Read(&c, 1, 1, open_slot) != 1) {
            if (i == 0) return 0;
            break;
        }
        if (c == 0x0A) break;  // newline
        buffer[i++] = (char)c;
    }

    buffer[i] = '\0';
    return 1;
}

// Free all dynamically allocated lines
void free_lines(void) {
    if (lines != NULL) {
        for (int i = 0; i < total_lines; i++) {
            free(lines[i]);
        }
        free(lines);
        lines = NULL;
    }
    total_lines = 0;
}

// Open a chapter and load all at once 
int open_chapter(int chapter_num) {
    // BYEEEEE previous chapter 
    free_lines();

    if (open_slot != 0) {
        ti_Close(open_slot);
        open_slot = 0;
    }

    char filename[8];
    build_filename(chapter_num, filename);

    open_slot = ti_Open(filename, "r");
    if (open_slot == 0) return 0;

    // Skip the 2-byte length prefix in AppVar data
    uint16_t skip;
    ti_Read(&skip, 2, 1, open_slot);

    // Single pass: grow the pointer array with realloc as we read each line.
    // total_lines is incremented only after a line is successfully stored,
    // so it can never exceed the number of lines actually read.
    total_lines = 0;
    char tempbuf[LINE_WIDTH + 1];

    while (read_line(tempbuf, LINE_WIDTH + 1)) {
        char **tmp = (char **)realloc(lines, (total_lines + 1) * sizeof(char *));
        if (tmp == NULL) break;  // out of memory — keep what we have
        lines = tmp;

        int len = strlen(tempbuf);
        lines[total_lines] = (char *)malloc(len + 1);
        if (lines[total_lines] == NULL) break;  // out of memory — keep what we have
        memcpy(lines[total_lines], tempbuf, len + 1);
        total_lines++;
    }

    ti_Close(open_slot);
    open_slot = 0;

    return 1;
}

// Draw the current scroll position
void draw_screen(int scroll) {
    gfx_SetDrawBuffer();
    gfx_FillScreen(0);
    gfx_SetTextFGColor(254);

    for (int i = 0; i < LINES_ON_SCREEN; i++) {
        int line_idx = scroll + i;
        if (line_idx < total_lines && lines[line_idx] != NULL) {
            gfx_PrintStringXY(lines[line_idx], 2, i * LINE_HEIGHT);
        }
    }

    // Line position indicator top right
    gfx_SetTextXY(230, 0);
    gfx_PrintInt(scroll + 1, 4);
    gfx_PrintString("/");
    gfx_PrintInt(total_lines, 4);

    gfx_BlitBuffer();
}

// Chapter selection screen
int select_chapter(void) {
    int chapter = 0;

    while (1) {
        gfx_SetDrawBuffer();
        gfx_FillScreen(0);
        gfx_SetTextFGColor(254);

        gfx_PrintStringXY("AO3 Reader", 100, 80);
        gfx_PrintStringXY("Enter chapter:", 80, 110);
        gfx_PrintStringXY("Ch", 130, 130);
        gfx_PrintInt(chapter, 1);
        gfx_PrintStringXY("Clear = quit", 85, 160);
        gfx_PrintStringXY("Enter = open", 85, 175);

        gfx_BlitBuffer();

        kb_Scan();

        if (kb_IsDown(kb_Key0) && chapter < 99) chapter = chapter * 10 + 0;
        if (kb_IsDown(kb_Key1) && chapter < 99) chapter = chapter * 10 + 1;
        if (kb_IsDown(kb_Key2) && chapter < 99) chapter = chapter * 10 + 2;
        if (kb_IsDown(kb_Key3) && chapter < 99) chapter = chapter * 10 + 3;
        if (kb_IsDown(kb_Key4) && chapter < 99) chapter = chapter * 10 + 4;
        if (kb_IsDown(kb_Key5) && chapter < 99) chapter = chapter * 10 + 5;
        if (kb_IsDown(kb_Key6) && chapter < 99) chapter = chapter * 10 + 6;
        if (kb_IsDown(kb_Key7) && chapter < 99) chapter = chapter * 10 + 7;
        if (kb_IsDown(kb_Key8) && chapter < 99) chapter = chapter * 10 + 8;
        if (kb_IsDown(kb_Key9) && chapter < 99) chapter = chapter * 10 + 9;

        if (kb_IsDown(kb_KeyDel)) chapter = chapter / 10;
        if (kb_IsDown(kb_KeyClear)) return 0;
        if (kb_IsDown(kb_KeyEnter) && chapter > 0) return chapter;

        while (kb_AnyKey()) kb_Scan();
    }
}

// Debug mode: show raw bytes from file
void run_debug(void) {
    ti_var_t slot = ti_Open("Ch1", "r");

    gfx_SetDrawBuffer();
    gfx_FillScreen(0);
    gfx_SetTextFGColor(254);

    if (slot == 0) {
        gfx_PrintStringXY("File not found!", 10, 10);
        gfx_BlitBuffer();
        while (!kb_IsDown(kb_KeyClear)) kb_Scan();
        return;
    }

    uint16_t skip;
    ti_Read(&skip, 2, 1, slot);

    uint8_t c;
    int row = 0;

    while (row < 20) {
        if (ti_Read(&c, 1, 1, slot) != 1) break;
        gfx_SetTextXY(0, row * 10);
        gfx_PrintInt(row, 2);
        gfx_PrintString(":");
        gfx_PrintInt(c, 3);
        row++;
    }

    ti_Close(slot);
    gfx_BlitBuffer();
    while (!kb_IsDown(kb_KeyClear)) kb_Scan();
}

// Main
int main(void) {
    gfx_Begin();

#if DEBUG_MODE
    run_debug();
    gfx_End();
    return 0;
#endif

    while (1) {
        int chapter = select_chapter();
        if (chapter == 0) break;

        gfx_SetDrawBuffer();
        gfx_FillScreen(0);
        gfx_SetTextFGColor(254);
        gfx_PrintStringXY("Loading...", 110, 110);
        gfx_BlitBuffer();

        if (!open_chapter(chapter)) {
            gfx_SetDrawBuffer();
            gfx_FillScreen(0);
            gfx_SetTextFGColor(254);
            gfx_PrintStringXY("Ch not found!", 80, 110);
            gfx_PrintStringXY("Press any key", 80, 130);
            gfx_BlitBuffer();
            while (!kb_AnyKey()) kb_Scan();
            continue;
        }

        int scroll = 0;
        int max_scroll = total_lines - LINES_ON_SCREEN + SCROLL_BUFFER;
        if (max_scroll < 0) max_scroll = 0;

        while (1) {
            draw_screen(scroll);
            kb_Scan();

            if (kb_IsDown(kb_KeyUp)) {
                if (scroll > 0) scroll--;
            }

            if (kb_IsDown(kb_KeyDown)) {
                if (scroll < max_scroll) scroll++;
            }

            if (kb_IsDown(kb_Key2nd) || kb_IsDown(kb_KeyClear)) {
                if (kb_IsDown(kb_KeyClear)) {
                    gfx_End();
                    return 0;
                }
                break;  // 2nd goes back to the future (chapter select)
            }

            for (int i = 0; i < 300; i++);
        }
    }

    free_lines();
    gfx_End();
    return 0;
}


//why are you here? you shouldn't be here you know...