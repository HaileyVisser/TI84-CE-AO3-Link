# ----------------------------
# Makefile Options
# ----------------------------

NAME = read
ICON = icon.png
DESCRIPTION = "gahh"
COMPRESSED = NO

CFLAGS = -Wall -Wextra -Oz
CXXFLAGS = -Wall -Wextra -Oz

# ----------------------------

include $(shell cedev-config --makefile)
