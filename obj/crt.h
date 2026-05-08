/* generated from: obj/debug.o */
#define HAS_INIT_ARRAY 0
#define HAS_FINI_ARRAY 0
#define HAS_CLOCK 0
#define HAS_ABORT 0
#define HAS_EXIT 0
#define HAS_C99__EXIT 0
#define HAS_RUN_PRGM 0
#define HAS_MAIN_ARGC_ARGV 0
#define HAS_ATEXIT 0
#ifdef __ASSEMBLER__
.macro LIBLOAD_LIBS
	.global __libload_library_FILEIOC
	.type __libload_library_FILEIOC, @object
__libload_library_FILEIOC:
	.db 0xC0, "FILEIOC", 0, 8
	.global _ti_Open
	.type _ti_Open, @function
_ti_Open:
	jp 3
	.global _ti_Close
	.type _ti_Close, @function
_ti_Close:
	jp 9
	.global _ti_Read
	.type _ti_Read, @function
_ti_Read:
	jp 15
	.global __libload_library_GRAPHX
	.type __libload_library_GRAPHX, @object
__libload_library_GRAPHX:
	.db 0xC0, "GRAPHX", 0, 14
	.global _gfx_Begin
	.type _gfx_Begin, @function
_gfx_Begin:
	jp 0
	.global _gfx_End
	.type _gfx_End, @function
_gfx_End:
	jp 3
	.global _gfx_FillScreen
	.type _gfx_FillScreen, @function
_gfx_FillScreen:
	jp 15
	.global _gfx_SetDraw
	.type _gfx_SetDraw, @function
_gfx_SetDraw:
	jp 27
	.global _gfx_Blit
	.type _gfx_Blit, @function
_gfx_Blit:
	jp 33
	.global _gfx_PrintInt
	.type _gfx_PrintInt, @function
_gfx_PrintInt:
	jp 45
	.global _gfx_PrintString
	.type _gfx_PrintString, @function
_gfx_PrintString:
	jp 51
	.global _gfx_PrintStringXY
	.type _gfx_PrintStringXY, @function
_gfx_PrintStringXY:
	jp 54
	.global _gfx_SetTextXY
	.type _gfx_SetTextXY, @function
_gfx_SetTextXY:
	jp 57
	.global _gfx_SetTextFGColor
	.type _gfx_SetTextFGColor, @function
_gfx_SetTextFGColor:
	jp 63
	.global __libload_library_KEYPADC
	.type __libload_library_KEYPADC, @object
__libload_library_KEYPADC:
	.db 0xC0, "KEYPADC", 0, 2
	.global _kb_Scan
	.type _kb_Scan, @function
_kb_Scan:
	jp 0
.endm
#endif
#define HAS_LIBLOAD 1
