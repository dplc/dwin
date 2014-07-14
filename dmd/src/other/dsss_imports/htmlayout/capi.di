module htmlayout.capi;

import tango.sys.win32.Types;
import tango.text.convert.Utf;
import tango.stdc.stringz;
import Int=tango.text.convert.Integer;
import Float=tango.text.convert.Float;
import tango.stdc.stdlib,tango.stdc.string,tango.stdc.stddef;

extern(Windows):
/////// update 3.2.2.5

alias HDC HPLATFORMGFX;

struct graphin_graphics;
struct graphin_image;

alias graphin_graphics* HGFX;
alias graphin_image* HIMG;

alias double REAL; 

alias REAL POS;				 // position
alias REAL DIM;				 // dimension
alias REAL ANGLE;			 // angle (radians)
alias uint COLOR; 		// color

struct COLOR_STOP
{
	static HColorStop* opCall(COLOR clr,float off)
	{
		auto ret=new COLOR_STOP;
		ret.color=clr;
		ret.offset=off;
		return ret;
	}

	COLOR color; 
	float offset; // 0.0 ... 1.0
}

alias COLOR_STOP HColorStop;

enum GRAPHIN_RESULT
{
	GRAPHIN_PANIC = -1, // e.g. not enough memory
	GRAPHIN_OK = 0,
	GRAPHIN_BAD_PARAM = 1,	// bad parameter
	GRAPHIN_FAILURE = 2,		// operation failed, e.g. restore() without save()
	GRAPHIN_NOTSUPPORTED = 3 // the platform does not support requested feature
}

alias GRAPHIN_RESULT.GRAPHIN_PANIC GRAPHIN_PANIC;
alias GRAPHIN_RESULT.GRAPHIN_OK GRAPHIN_OK;
alias GRAPHIN_RESULT.GRAPHIN_BAD_PARAM GRAPHIN_BAD_PARAM;
alias GRAPHIN_RESULT.GRAPHIN_FAILURE GRAPHIN_FAILURE;
alias GRAPHIN_RESULT.GRAPHIN_NOTSUPPORTED GRAPHIN_NOTSUPPORTED;

enum DRAW_PATH_MODE
{
	FILL_ONLY,
	STROKE_ONLY,
	FILL_AND_STROKE,
	FILL_BY_LINE_COLOR
}

alias DRAW_PATH_MODE.FILL_ONLY FILL_ONLY;
alias DRAW_PATH_MODE.STROKE_ONLY STROKE_ONLY;
alias DRAW_PATH_MODE.FILL_AND_STROKE FILL_AND_STROKE;
alias DRAW_PATH_MODE.FILL_BY_LINE_COLOR FILL_BY_LINE_COLOR;

enum TEXT_ALIGNMENT
{
	TEXT_ALIGN_TOP,
	TEXT_ALIGN_BOTTOM,
	TEXT_ALIGN_CENTER,
	TEXT_ALIGN_BASELINE,
	TEXT_ALIGN_RIGHT = TEXT_ALIGN_TOP,
	TEXT_ALIGN_LEFT = TEXT_ALIGN_BOTTOM
}

alias TEXT_ALIGNMENT.TEXT_ALIGN_TOP TEXT_ALIGN_TOP;
alias TEXT_ALIGNMENT.TEXT_ALIGN_BOTTOM TEXT_ALIGN_BOTTOM;
alias TEXT_ALIGNMENT.TEXT_ALIGN_CENTER TEXT_ALIGN_CENTER;
alias TEXT_ALIGNMENT.TEXT_ALIGN_BASELINE TEXT_ALIGN_BASELINE;
alias TEXT_ALIGNMENT.TEXT_ALIGN_RIGHT TEXT_ALIGN_RIGHT;
alias TEXT_ALIGNMENT.TEXT_ALIGN_LEFT TEXT_ALIGN_LEFT;

enum LINE_JOIN_TYPE
{
	JOIN_MITER = 0,
	JOIN_MITER_REVERT = 1,
	JOIN_ROUND = 2,
	JOIN_BEVEL = 3,
	JOIN_MITER_ROUND = 4,
}

alias LINE_JOIN_TYPE.JOIN_MITER JOIN_MITER;
alias LINE_JOIN_TYPE.JOIN_MITER_REVERT JOIN_MITER_REVERT;
alias LINE_JOIN_TYPE.JOIN_ROUND JOIN_ROUND;
alias LINE_JOIN_TYPE.JOIN_BEVEL JOIN_BEVEL;
alias LINE_JOIN_TYPE.JOIN_MITER_ROUND JOIN_MITER_ROUND;

enum LINE_CAP_TYPE
{
	LINE_CAP_BUTT = 0,
	LINE_CAP_SQUARE = 1,
	LINE_CAP_ROUND = 2,
}

alias LINE_CAP_TYPE.LINE_CAP_BUTT LINE_CAP_BUTT;
alias LINE_CAP_TYPE.LINE_CAP_SQUARE LINE_CAP_SQUARE;
alias LINE_CAP_TYPE.LINE_CAP_ROUND LINE_CAP_ROUND;

alias BOOL /*GRAPHIN_CALLC*/ function(LPVOID prm, LPBYTE data, UINT data_length) image_write_function;

struct Graphin
{
// image primitives
extern(Windows):

	GRAPHIN_RESULT 
				function ( UINT width, UINT height, HIMG* poutImg ) imageCreate;

	GRAPHIN_RESULT 
				function ( HIMG himg ) imageRelease;

	GRAPHIN_RESULT
				function ( HIMG himg,
						 BYTE** data,
						 UINT* width,
						 UINT* height,
						 INT* stride,
						 UINT* pixel_format) imageGetInfo;

	GRAPHIN_RESULT
				function ( HIMG himg ) imageClear;

	GRAPHIN_RESULT 
				function ( HPLATFORMGFX dst, INT dst_x, INT dst_y,
										HIMG src, INT src_x, INT src_y,
										INT width, INT height, BOOL blend ) imageBlit;

	GRAPHIN_RESULT 
				function ( BYTE* bytes, UINT num_bytes, HIMG* pout_img ) imageLoad; // load png/jpeg/etc. image from stream of bytes

	GRAPHIN_RESULT 
				function ( HIMG himg, 
					image_write_function pfn, void* prm, /* function and its param passed "as is" */
					UINT bpp /*24,32 if alpha needed*/,	
					UINT type /* 0 - png, 1 - jpg*/,
					UINT quality /*	only for jpeg, 10 - 100 */ ) imageSave;


	// SECTION: graphics primitives and drawing operations

	// create color value
	COLOR 
				function (UINT red, UINT green, UINT blue, UINT transparency /*= 0*/) RGBT;
	// Note: transparent color (no-color value) is rgba(?, ?, ?, 0xff);

	GRAPHIN_RESULT 
				function (HIMG img, HGFX* pout_gfx ) gCreate;

	GRAPHIN_RESULT 
				function (HGFX gfx) gRelease;

// Draws line from x1,y1 to x2,y2 using current lineColor and lineGradient.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x1, POS y1, POS x2, POS y2 ) gLine;

// Draws triangle using current lineColor/lineGradient and fillColor/fillGradient.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x1, POS y1, POS x2, POS y2, POS x3, POS y3 ) gTriangle;

// Draws rectangle using current lineColor/lineGradient and fillColor/fillGradient with (optional) rounded corners.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x1, POS y1, POS x2, POS y2 ) gRectangle;

// Draws rounded rectangle using current lineColor/lineGradient and fillColor/fillGradient with (optional) rounded corners.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x1, POS y1, POS x2, POS y2, DIM* radii8 /*DIM[8] - four rx/ry pairs */) gRoundedRectangle;

// Draws circle or ellipse using current lineColor/lineGradient and fillColor/fillGradient.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x, POS y, POS rx, POS ry ) gEllipse;

// Draws closed arc using current lineColor/lineGradient and fillColor/fillGradient.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x, POS y, POS rx, POS ry, ANGLE start, ANGLE sweep ) gArc;

// Draws star.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x, POS y, POS r1, POS r2, ANGLE start, UINT rays ) gStar;

// Closed polygon.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS* xy, UINT num_points ) gPolygon;

	// Polyline.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS* xy, UINT num_points ) gPolyline;

// SECTION: Path operations

	GRAPHIN_RESULT 
				function ( HGFX hgfx ) gOpenPath;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x, POS y, BOOL relative ) gMoveTo;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x, POS y, BOOL relative ) gLineTo;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x, BOOL relative ) gHLineTo;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS y, BOOL relative ) gVLineTo;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x, POS y, ANGLE angle, POS rx, POS ry, BOOL is_large_arc, BOOL sweep_flag, BOOL relative ) gArcTo;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x, POS y, POS rx, POS ry, BOOL clockwise ) gEllipseTo;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS xc, POS yc, POS x, POS y, BOOL relative ) gQuadraticCurveTo;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS xc1, POS yc1, POS xc2, POS yc2, POS x, POS y, BOOL relative ) gBezierCurveTo;

	GRAPHIN_RESULT 
				function ( HGFX hgfx ) gClosePath;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, DRAW_PATH_MODE dpm ) gDrawPath;

// end of path opearations

// SECTION: affine tranformations:

	GRAPHIN_RESULT 
				function ( HGFX hgfx, ANGLE radians, POS* cx /*= 0*/, POS* cy /*= 0*/ ) gRotate;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS cx, POS cy ) gTranslate;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, double x, double y ) gScale;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, double dx, double dy ) gSkew;

	// all above in one shot
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS m11, POS m12, POS m21, POS m22, POS dx, POS dy ) gTransform;

// end of affine tranformations.

// SECTION: state save/restore

	GRAPHIN_RESULT 
				function ( HGFX hgfx ) gStateSave;

	GRAPHIN_RESULT 
				function ( HGFX hgfx ) gStateRestore;

// end of state save/restore

// SECTION: drawing attributes

	// set line width for subsequent drawings.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, DIM width ) gLineWidth;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, LINE_JOIN_TYPE type ) gLineJoin;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, LINE_CAP_TYPE type) gLineCap;

	//GRAPHIN_RESULT GRAPHIN_CALL
	//		(*gNoLine ( HGFX hgfx ) { gLineWidth(hgfx,0.0); }

	// color for solid lines/strokes
	GRAPHIN_RESULT 
				function ( HGFX hgfx, COLOR c) gLineColor;

	// color for solid fills
	GRAPHIN_RESULT 
				function ( HGFX hgfx, COLOR color ) gFillColor;

//inline void
//			graphics_no_fill ( HGFX hgfx ) { graphics_fill_color(hgfx, graphics_rgbt(0,0,0,0xFF)); }

	// setup parameters of linear gradient of lines.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x1, POS y1, POS x2, POS y2, COLOR_STOP* stops, UINT nstops ) gLineGradientLinear;

	// setup parameters of linear gradient of fills.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x1, POS y1, POS x2, POS y2, COLOR_STOP* stops, UINT nstops ) gFillGradientLinear;

	// setup parameters of line gradient radial fills.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x, POS y, DIM r, COLOR_STOP* stops, UINT nstops ) gLineGradientRadial;

	// setup parameters of gradient radial fills.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x, POS y, DIM r, COLOR_STOP* stops, UINT nstops ) gFillGradientRadial;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, BOOL even_odd /* false - fill_non_zero */ ) gFillMode;

// SECTION: text

	// define font attributes for all subsequent text operations.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, char* name, DIM size, BOOL bold/* = false*/, BOOL italic/* = false*/, ANGLE angle /*= 0*/) gSetFont;

	// draw text at x,y with text alignment
	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x, POS y, wchar_t* text, UINT text_length) gText;

	// calculates width of the text string
	GRAPHIN_RESULT 
				function ( HGFX hgfx, wchar_t* text, UINT text_length, DIM* out_width) gTextWidth;

	// returns height and ascent of the font.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, DIM* out_height, DIM* out_ascent ) gFontMetrics;


	// calculates width of the text string
	GRAPHIN_RESULT 
				function ( HGFX hgfx, TEXT_ALIGNMENT x, TEXT_ALIGNMENT y) gTextAlignment;

	// SECTION: image rendering

	// draws img onto the graphics surface with current transformation applied (scale, rotation).
	GRAPHIN_RESULT 
				function ( HGFX hgfx, HIMG himg, POS x, POS y,
															DIM* w /*= 0*/, DIM* h /*= 0*/, UINT* ix /*= 0*/, UINT* iy /*= 0*/, UINT* iw /*= 0*/, UINT* ih /*= 0*/ ) gDrawImage;

	// blits image bits onto underlying pixel buffer. no affine transformations.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, HIMG himg, POS x, POS y, UINT* ix /*= 0*/, UINT* iy /*= 0*/, UINT* iw /*= 0*/, UINT* ih /*= 0*/ ) gBlitImage;

	// blends image bits with bits of the buffer. no affine transformations.
	GRAPHIN_RESULT 
				function ( HGFX hgfx, HIMG himg, POS x, POS y, UINT opacity /*= 0xff*/, UINT* ix /*= 0*/, UINT* iy /*= 0*/, UINT* iw /*= 0*/, UINT* ih /*= 0*/ ) gBlendImage;

	// SECTION: coordinate space

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS* inout_x, POS* inout_y) gWorldToScreen;

	//inline GRAPHIN_RESULT
	//			graphics_world_to_screen ( HGFX hgfx, POS* length)
	//{
	//	 return graphics_world_to_screen ( hgfx, length, 0);
	//}

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS* inout_x, POS* inout_y) gScreenToWorld;

	//inline GRAPHIN_RESULT
	//			graphics_screen_to_world ( HGFX hgfx, POS* length)
	//{
	//	 return graphics_screen_to_world (hgfx, length, 0);
	//}

// SECTION: clipping

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x1, POS y1, POS x2, POS y2) gSetClipBox;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS* x1, POS* y1, POS* x2, POS* y2) gGetClipBox;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x, POS y, BOOL* yes) gPointInClipBox;

	GRAPHIN_RESULT 
				function ( HGFX hgfx, POS x1, POS y1, POS x2, POS y2, BOOL* yes) gRectInClipBox;

}

alias Graphin* PGraphin;

/** Get Graphin API
 *
 *	returns ptr to Graphin API functions.
 *	See: htmlayout_graphin.h
 *
 **/

alias PGraphin function() HTMLayoutGetGraphin_t;
HTMLayoutGetGraphin_t HTMLayoutGetGraphin;

/** Render DOM element on the image
 * \param[in] himg \b HIMG, image where to render the element.
 * \param[in] where \b POINT, location where to render, image coordinates.
 * \param[in] what \b HELEMENT, element to render.
 * \param[in] how \b UINT, flags.
 **/

// ATTN: HTMLayoutRenderElement is not implemented yet.
alias GRAPHIN_RESULT function(HIMG himg, POINT where, HELEMENT what, UINT how) HTMLayoutRenderElement_t;
HTMLayoutRenderElement_t HTMLayoutRenderElement;

/////// update 3.2.2.4

alias UINT function( LPCWSTR text, UINT textLength, UINT mode, JSON_VALUE *pVal ) HTMLayoutParseValue_t;
HTMLayoutParseValue_t HTMLayoutParseValue;

/////// update 3.2.2.1

enum HTMLAYOUT_SCROLL_FLAGS
{
	SCROLL_TO_TOP = 0x01,
	SCROLL_SMOOTH = 0x10,
};

alias HTMLAYOUT_SCROLL_FLAGS.SCROLL_TO_TOP SCROLL_TO_TOP;
alias HTMLAYOUT_SCROLL_FLAGS.SCROLL_SMOOTH SCROLL_SMOOTH;

alias HLDOM_RESULT function(HELEMENT he, UINT /*HTMLAYOUT_SCROLL_FLAGS*/ flags) HTMLayoutScrollToView_t;
HTMLayoutScrollToView_t HTMLayoutScrollToView;

/////// update 3.2.1.14

alias void function( HTMLayoutElementExpando* pexp, HELEMENT he ) ExpandoRelease;

struct HTMLayoutElementExpando
{
	ExpandoRelease finalizer; // can be either NULL or valid pointer to function
}

alias HLDOM_RESULT function( HELEMENT he, HTMLayoutElementExpando* pExpando ) HTMLayoutElementSetExpando_t;
HTMLayoutElementSetExpando_t HTMLayoutElementSetExpando;
alias HLDOM_RESULT function( HELEMENT he, HTMLayoutElementExpando** ppExpando ) HTMLayoutElementGetExpando_t;
HTMLayoutElementGetExpando_t HTMLayoutElementGetExpando;


////////////////////////////////////////////////////////////////////////////// behaviors

enum EVENT_GROUPS 
{
	HANDLE_INITIALIZATION = 0x0000,		 /** attached/detached */
	HANDLE_MOUSE = 0x0001,							/** mouse events */ 
	HANDLE_KEY = 0x0002,								/** key events */	
	HANDLE_FOCUS = 0x0004,							/** focus events, if this flag is set it also means that element it attached to is focusable */ 
	HANDLE_SCROLL = 0x0008,						 /** scroll events */ 
	HANDLE_TIMER = 0x0010,							/** timer event */ 
	HANDLE_SIZE = 0x0020,							 /** size changed event */ 
	HANDLE_DRAW = 0x0040,							 /** drawing request (event) */
	HANDLE_DATA_ARRIVED = 0x080,				/** requested data () has been delivered */
	HANDLE_BEHAVIOR_EVENT = 0x0100,		 /** secondary, synthetic events: 
										BUTTON_CLICK, HYPERLINK_CLICK, etc., 
										a.k.a. notifications from intrinsic behaviors */
	HANDLE_METHOD_CALL = 0x0200,				/** behavior specific methods */
	
	HANDLE_ALL = 0x03FF,								/** all of them */

	DISABLE_INITIALIZATION = 0x80000000 /** disable INITIALIZATION events to be sent. 
											normally engine sends
											BEHAVIOR_DETACH / BEHAVIOR_ATTACH events unconditionally,
											this flag allows to disable this behavior 
										*/
};

alias EVENT_GROUPS.HANDLE_INITIALIZATION HANDLE_INITIALIZATION;
alias EVENT_GROUPS.HANDLE_MOUSE HANDLE_MOUSE;
alias EVENT_GROUPS.HANDLE_KEY HANDLE_KEY;
alias EVENT_GROUPS.HANDLE_FOCUS HANDLE_FOCUS;
alias EVENT_GROUPS.HANDLE_SCROLL HANDLE_SCROLL;
alias EVENT_GROUPS.HANDLE_TIMER HANDLE_TIMER;
alias EVENT_GROUPS.HANDLE_SIZE HANDLE_SIZE;
alias EVENT_GROUPS.HANDLE_DRAW HANDLE_DRAW;
alias EVENT_GROUPS.HANDLE_DATA_ARRIVED HANDLE_DATA_ARRIVED;
alias EVENT_GROUPS.HANDLE_BEHAVIOR_EVENT HANDLE_BEHAVIOR_EVENT;
alias EVENT_GROUPS.HANDLE_METHOD_CALL HANDLE_METHOD_CALL;
alias EVENT_GROUPS.HANDLE_ALL HANDLE_ALL;
alias EVENT_GROUPS.DISABLE_INITIALIZATION DISABLE_INITIALIZATION;

enum PHASE_MASK 
{
	BUBBLING = 0,				// bubbling (emersion) phase
	SINKING	= 0x08000,	// capture (immersion) phase, this flag is or'ed with EVENTS codes below
	HANDLED	= 0x10000	 // event already processed.
	
// see: http://www.w3.org/TR/xml-events/Overview.html#s_intro
};

alias PHASE_MASK.BUBBLING BUBBLING;
alias PHASE_MASK.SINKING	SINKING ;
alias PHASE_MASK.HANDLED	HANDLED ;

enum MOUSE_BUTTONS 
{
	MAIN_MOUSE_BUTTON = 1, //aka left button
	PROP_MOUSE_BUTTON = 2, //aka right button
	MIDDLE_MOUSE_BUTTON = 4,
};

alias MOUSE_BUTTONS.MAIN_MOUSE_BUTTON MAIN_MOUSE_BUTTON;
alias MOUSE_BUTTONS.PROP_MOUSE_BUTTON PROP_MOUSE_BUTTON;
alias MOUSE_BUTTONS.MIDDLE_MOUSE_BUTTON MIDDLE_MOUSE_BUTTON;

enum KEYBOARD_STATES 
{
	CONTROL_KEY_PRESSED = 0x1,
	SHIFT_KEY_PRESSED = 0x2,
	ALT_KEY_PRESSED = 0x4
};

alias KEYBOARD_STATES.CONTROL_KEY_PRESSED CONTROL_KEY_PRESSED;
alias KEYBOARD_STATES.SHIFT_KEY_PRESSED SHIFT_KEY_PRESSED;
alias KEYBOARD_STATES.ALT_KEY_PRESSED ALT_KEY_PRESSED;

enum INITIALIZATION_EVENTS
{
	BEHAVIOR_DETACH = 0,
	BEHAVIOR_ATTACH = 1
};

alias INITIALIZATION_EVENTS.BEHAVIOR_DETACH BEHAVIOR_DETACH;
alias INITIALIZATION_EVENTS.BEHAVIOR_ATTACH BEHAVIOR_ATTACH;

struct INITIALIZATION_PARAMS
{
	UINT cmd; // INITIALIZATION_EVENTS
};

enum DRAGGING_TYPE
{
	NO_DRAGGING,
	DRAGGING_MOVE,
	DRAGGING_COPY,
}

alias DRAGGING_TYPE.NO_DRAGGING NO_DRAGGING;
alias DRAGGING_TYPE.DRAGGING_MOVE DRAGGING_MOVE;
alias DRAGGING_TYPE.DRAGGING_COPY DRAGGING_COPY;

enum MOUSE_EVENTS
{
	MOUSE_ENTER = 0,
	MOUSE_LEAVE,
	MOUSE_MOVE,
	MOUSE_UP,
	MOUSE_DOWN,
	MOUSE_DCLICK,
	MOUSE_WHEEL, 
	MOUSE_TICK, // mouse pressed ticks
	MOUSE_IDLE, // mouse stay idle for some time

	DROP        = 9,   // item dropped, target is that dropped item 
	DRAG_ENTER  = 0xA, // drag arrived to the target element that is one of current drop targets.  
    DRAG_LEAVE  = 0xB, // drag left one of current drop targets. target is the drop target element.  

	DRAGGING = 0x100, // This flag is 'ORed' with MOUSE_ENTER..MOUSE_DOWN codes if dragging operation is in effect.
                        // In this case 
};

alias MOUSE_EVENTS.MOUSE_ENTER MOUSE_ENTER;
alias MOUSE_EVENTS.MOUSE_LEAVE MOUSE_LEAVE;
alias MOUSE_EVENTS.MOUSE_MOVE MOUSE_MOVE;
alias MOUSE_EVENTS.MOUSE_UP MOUSE_UP;
alias MOUSE_EVENTS.MOUSE_DOWN MOUSE_DOWN;
alias MOUSE_EVENTS.MOUSE_DCLICK MOUSE_DCLICK;
alias MOUSE_EVENTS.MOUSE_WHEEL MOUSE_WHEEL;
alias MOUSE_EVENTS.MOUSE_TICK MOUSE_TICK;
alias MOUSE_EVENTS.MOUSE_IDLE MOUSE_IDLE;
alias MOUSE_EVENTS.DROP DROP;
alias MOUSE_EVENTS.DRAG_ENTER DRAG_ENTER;
alias MOUSE_EVENTS.DRAG_LEAVE DRAG_LEAVE;
alias MOUSE_EVENTS.DRAGGING DRAGGING;

struct MOUSE_PARAMS
{
	UINT		cmd;			// MOUSE_EVENTS
	HELEMENT	target;			 // target element
	POINT		pos;			// position of cursor, element relative
	POINT		pos_document; // position of cursor, document root relative
	UINT		button_state; // MOUSE_BUTTONS or MOUSE_WHEEL_DELTA
	UINT		alt_state;		// KEYBOARD_STATES 
	UINT		cursor_type;	// CURSOR_TYPE to set, see CURSOR_TYPE
	BOOL		is_on_icon;	 // mouse is over icon (foreground-image, foreground-repeat:no-repeat)

	HELEMENT  	dragging;     // element that is being dragged over, this field is not NULL if (cmd & DRAGGING) != 0
	UINT      	dragging_mode;// see DRAGGING_TYPE. 
};

enum CURSOR_TYPE
{
	CURSOR_ARROW, //0
	CURSOR_IBEAM, //1
	CURSOR_WAIT,	//2
	CURSOR_CROSS, //3
	CURSOR_UPARROW,	//4
	CURSOR_SIZENWSE, //5
	CURSOR_SIZENESW, //6
	CURSOR_SIZEWE,	 //7
	CURSOR_SIZENS,	 //8
	CURSOR_SIZEALL,	//9 
	CURSOR_NO,			 //10
	CURSOR_APPSTARTING, //11
	CURSOR_HELP,				//12
	CURSOR_HAND,				//13
	CURSOR_DRAG_MOVE,	 //14 
	CURSOR_DRAG_COPY,	 //15
};

alias CURSOR_TYPE.CURSOR_ARROW CURSOR_ARROW;
alias CURSOR_TYPE.CURSOR_IBEAM CURSOR_IBEAM;
alias CURSOR_TYPE.CURSOR_WAIT CURSOR_WAIT;
alias CURSOR_TYPE.CURSOR_CROSS CURSOR_CROSS;
alias CURSOR_TYPE.CURSOR_UPARROW CURSOR_UPARROW;
alias CURSOR_TYPE.CURSOR_SIZENWSE CURSOR_SIZENWSE;
alias CURSOR_TYPE.CURSOR_SIZENESW CURSOR_SIZENESW;
alias CURSOR_TYPE.CURSOR_SIZEWE CURSOR_SIZEWE;
alias CURSOR_TYPE.CURSOR_SIZENS CURSOR_SIZENS;
alias CURSOR_TYPE.CURSOR_SIZEALL CURSOR_SIZEALL;
alias CURSOR_TYPE.CURSOR_NO CURSOR_NO;
alias CURSOR_TYPE.CURSOR_APPSTARTING CURSOR_APPSTARTING;
alias CURSOR_TYPE.CURSOR_HELP CURSOR_HELP;
alias CURSOR_TYPE.CURSOR_HAND CURSOR_HAND;
alias CURSOR_TYPE.CURSOR_DRAG_MOVE CURSOR_DRAG_MOVE;
alias CURSOR_TYPE.CURSOR_DRAG_COPY CURSOR_DRAG_COPY;

enum KEY_EVENTS
{
	KEY_DOWN = 0,
	KEY_UP,
	KEY_CHAR
};

alias KEY_EVENTS.KEY_DOWN KEY_DOWN;
alias KEY_EVENTS.KEY_UP KEY_UP;
alias KEY_EVENTS.KEY_CHAR KEY_CHAR;

struct KEY_PARAMS
{
	UINT			cmd;					// KEY_EVENTS
	HELEMENT	target;			 // target element
	UINT			key_code;		 // key scan code, or character unicode for KEY_CHAR
	UINT			alt_state;		// KEYBOARD_STATES	 
};

enum FOCUS_EVENTS
{
	FOCUS_LOST = 0,
	FOCUS_GOT = 1,
};

alias FOCUS_EVENTS.FOCUS_LOST FOCUS_LOST;
alias FOCUS_EVENTS.FOCUS_GOT FOCUS_GOT;

struct FOCUS_PARAMS
{
	UINT			cmd;						// FOCUS_EVENTS
	HELEMENT	target;				 // target element, for FOCUS_LOST it is a handle of new focus element
							//		and for FOCUS_GOT it is a handle of old focus element, can be NULL
	BOOL			by_mouse_click; // TRUE if focus is being set by mouse click
	BOOL			cancel;				 // in FOCUS_LOST phase setting this field to TRUE will cancel transfer focus from old element to the new one.
};

enum SCROLL_EVENTS
{
	SCROLL_HOME = 0,
	SCROLL_END,
	SCROLL_STEP_PLUS,
	SCROLL_STEP_MINUS,
	SCROLL_PAGE_PLUS,
	SCROLL_PAGE_MINUS,
	SCROLL_POS
};

alias SCROLL_EVENTS.SCROLL_HOME SCROLL_HOME;
alias SCROLL_EVENTS.SCROLL_END SCROLL_END;
alias SCROLL_EVENTS.SCROLL_STEP_PLUS SCROLL_STEP_PLUS;
alias SCROLL_EVENTS.SCROLL_STEP_MINUS SCROLL_STEP_MINUS;
alias SCROLL_EVENTS.SCROLL_PAGE_PLUS SCROLL_PAGE_PLUS;
alias SCROLL_EVENTS.SCROLL_PAGE_MINUS SCROLL_PAGE_MINUS;
alias SCROLL_EVENTS.SCROLL_POS SCROLL_POS;

struct SCROLL_PARAMS
{
	UINT			cmd;					// SCROLL_EVENTS
	HELEMENT	target;			 // target element
	INT			 pos;					// scroll position if SCROLL_POS
	BOOL			vertical;		 // TRUE if from vertical scrollbar
};


enum DRAW_EVENTS
{
	DRAW_BACKGROUND = 0,
	DRAW_CONTENT = 1,
	DRAW_FOREGROUND = 2,
};

alias DRAW_EVENTS.DRAW_BACKGROUND DRAW_BACKGROUND;
alias DRAW_EVENTS.DRAW_CONTENT DRAW_CONTENT;
alias DRAW_EVENTS.DRAW_FOREGROUND DRAW_FOREGROUND;

struct DRAW_PARAMS
{
	UINT			cmd;					// DRAW_EVENTS
	HDC			 hdc;					// hdc to paint on
	RECT			area;				 // element area to paint,	
	UINT			reserved;		 //	 for DRAW_BACKGROUND/DRAW_FOREGROUND - it is a border box
							//	 for DRAW_CONTENT - it is a content box
};
// Use ::GetTextColor(hdc) to get current text color of the element

enum BEHAVIOR_EVENTS
{
	BUTTON_CLICK = 0,							// click on button
	BUTTON_PRESS = 1,							// mouse down or key down in button
	BUTTON_STATE_CHANGED = 2,			// checkbox/radio/slider changed its state/value 
	EDIT_VALUE_CHANGING = 3,			 // before text change
	EDIT_VALUE_CHANGED = 4,				// after text change
	SELECT_SELECTION_CHANGED = 5,	// selection in <select> changed
	SELECT_STATE_CHANGED = 6,			// node in select expanded/collapsed, heTarget is the node

	POPUP_REQUEST	 = 7,					 // request to show popup just received, 
								 //		 here DOM of popup element can be modifed.
	POPUP_READY		 = 8,					 // popup element has been measured and ready to be shown on screen,
								 //		 here you can use functions like ScrollToView.
	POPUP_DISMISSED = 9,					 // popup element is closed,
								 //		 here DOM of popup element can be modifed again - e.g. some items can be removed
								 //		 to free memory.

	MENU_ITEM_ACTIVE = 0xA,				// menu item activated by mouse hover or by keyboard,
	MENU_ITEM_CLICK = 0xB,				 // menu item click, 
								 //	 BEHAVIOR_EVENT_PARAMS structure layout
								 //	 BEHAVIOR_EVENT_PARAMS.cmd - MENU_ITEM_CLICK/MENU_ITEM_ACTIVE	 
								 //	 BEHAVIOR_EVENT_PARAMS.heTarget - the menu item, presumably <li> element
								 //	 BEHAVIOR_EVENT_PARAMS.reason - BY_MOUSE_CLICK | BY_KEY_CLICK

	
	CONTEXT_MENU_REQUEST = 0x10,	 // "right-click", BEHAVIOR_EVENT_PARAMS::he is current popup menu HELEMENT being processed or NULL.
								 // application can provide its own HELEMENT here (if it is NULL) or modify current menu element.
	
	VISIUAL_STATUS_CHANGED = 0x11, // broadcast notification, sent to all elements of some container being shown or hidden	 


	// "grey" event codes	- notfications from behaviors from this SDK 
	HYPERLINK_CLICK = 0x80,				// hyperlink click
	TABLE_HEADER_CLICK,						// click on some cell in table header, 
								 //		 target = the cell, 
								 //		 reason = index of the cell (column number, 0..n)
	TABLE_ROW_CLICK,							 // click on data row in the table, target is the row
								 //		 target = the row, 
								 //		 reason = index of the row (fixed_rows..n)
	TABLE_ROW_DBL_CLICK,					 // mouse dbl click on data row in the table, target is the row
								 //		 target = the row, 
								 //		 reason = index of the row (fixed_rows..n)

	ELEMENT_COLLAPSED = 0x90,			// element was collapsed, so far only behavior:tabs is sending these two to the panels
	ELEMENT_EXPANDED,							// element was expanded,

	ACTIVATE_CHILD,								// activate (select) child, 
								 // used for example by accesskeys behaviors to send activation request, e.g. tab on behavior:tabs. 

	DO_SWITCH_TAB = ACTIVATE_CHILD,// command to switch tab programmatically, handled by behavior:tabs 
								 // use it as HTMLayoutPostEvent(tabsElementOrItsChild, DO_SWITCH_TAB, tabElementToShow, 0);

	INIT_DATA_VIEW,								// request to virtual grid to initialize its view
	
	ROWS_DATA_REQUEST,						 // request from virtual grid to data source behavior to fill data in the table
								 // parameters passed throug DATA_ROWS_PARAMS structure.

	UI_STATE_CHANGED,							// ui state changed, observers shall update their visual states.
																		 // is sent for example by behavior:richtext when caret position/selection has changed.


	FIRST_APPLICATION_EVENT_CODE = 0x100 
	// all custom event codes shall be greater
	// than this number. All codes below this will be used
	// solely by application - HTMLayout will not intrepret it 
	// and will do just dispatching.
	// To send event notifications with	these codes use
	// HTMLayoutSend/PostEvent API.

};

alias BEHAVIOR_EVENTS.BUTTON_CLICK BUTTON_CLICK;
alias BEHAVIOR_EVENTS.BUTTON_PRESS BUTTON_PRESS;
alias BEHAVIOR_EVENTS.BUTTON_STATE_CHANGED BUTTON_STATE_CHANGED;
alias BEHAVIOR_EVENTS.EDIT_VALUE_CHANGING EDIT_VALUE_CHANGING;
alias BEHAVIOR_EVENTS.EDIT_VALUE_CHANGED EDIT_VALUE_CHANGED;
alias BEHAVIOR_EVENTS.SELECT_SELECTION_CHANGED SELECT_SELECTION_CHANGED;
alias BEHAVIOR_EVENTS.SELECT_STATE_CHANGED SELECT_STATE_CHANGED;
alias BEHAVIOR_EVENTS.POPUP_REQUEST POPUP_REQUEST;
alias BEHAVIOR_EVENTS.POPUP_READY POPUP_READY;
alias BEHAVIOR_EVENTS.POPUP_DISMISSED POPUP_DISMISSED;
alias BEHAVIOR_EVENTS.MENU_ITEM_ACTIVE MENU_ITEM_ACTIVE;
alias BEHAVIOR_EVENTS.MENU_ITEM_CLICK MENU_ITEM_CLICK;
alias BEHAVIOR_EVENTS.CONTEXT_MENU_REQUEST CONTEXT_MENU_REQUEST;
alias BEHAVIOR_EVENTS.VISIUAL_STATUS_CHANGED VISIUAL_STATUS_CHANGED;
alias BEHAVIOR_EVENTS.HYPERLINK_CLICK HYPERLINK_CLICK;
alias BEHAVIOR_EVENTS.TABLE_HEADER_CLICK TABLE_HEADER_CLICK;
alias BEHAVIOR_EVENTS.TABLE_ROW_CLICK TABLE_ROW_CLICK;
alias BEHAVIOR_EVENTS.TABLE_ROW_DBL_CLICK TABLE_ROW_DBL_CLICK;
alias BEHAVIOR_EVENTS.ELEMENT_COLLAPSED ELEMENT_COLLAPSED;
alias BEHAVIOR_EVENTS.ELEMENT_EXPANDED ELEMENT_EXPANDED;
alias BEHAVIOR_EVENTS.ACTIVATE_CHILD ACTIVATE_CHILD;
alias BEHAVIOR_EVENTS.DO_SWITCH_TAB DO_SWITCH_TAB;
alias BEHAVIOR_EVENTS.INIT_DATA_VIEW INIT_DATA_VIEW;
alias BEHAVIOR_EVENTS.ROWS_DATA_REQUEST ROWS_DATA_REQUEST;
alias BEHAVIOR_EVENTS.UI_STATE_CHANGED UI_STATE_CHANGED;
alias BEHAVIOR_EVENTS.FIRST_APPLICATION_EVENT_CODE FIRST_APPLICATION_EVENT_CODE;

enum EVENT_REASON
{
	BY_MOUSE_CLICK = 0,	
	BY_KEY_CLICK = 1, 
	SYNTHESIZED = 2, // synthesized, programmatically generated.
};

alias EVENT_REASON.BY_MOUSE_CLICK BY_MOUSE_CLICK;
alias EVENT_REASON.BY_KEY_CLICK BY_KEY_CLICK;
alias EVENT_REASON.SYNTHESIZED SYNTHESIZED;

enum EDIT_CHANGED_REASON
{
	BY_INS_CHAR = 3,	// single char insertion
	BY_INS_CHARS, // character range insertion, clipboard
	BY_DEL_CHAR,	// single char deletion
	BY_DEL_CHARS, // character range deletion (selection)
};

alias EDIT_CHANGED_REASON.BY_INS_CHAR BY_INS_CHAR;
alias EDIT_CHANGED_REASON.BY_INS_CHARS BY_INS_CHARS;
alias EDIT_CHANGED_REASON.BY_DEL_CHAR BY_DEL_CHAR;
alias EDIT_CHANGED_REASON.BY_DEL_CHARS BY_DEL_CHARS;

struct BEHAVIOR_EVENT_PARAMS
{
	UINT		 cmd;				// BEHAVIOR_EVENTS
	HELEMENT heTarget;	 // target element handler
	HELEMENT he;				 // source element e.g. in SELECTION_CHANGED it is new selected <option>, in MENU_ITEM_CLICK it is menu item (LI) element
	UINT		 reason;		 // EVENT_REASON or EDIT_CHANGED_REASON - UI action causing change.
						 // In case of custom event notifications this may be any 
						 // application specific value.
};

// identifiers of methods currently supported by intrinsic behaviors,
// see function HTMLayoutCallMethod 

enum BEHAVIOR_METHOD_IDENTIFIERS
{
	DO_CLICK = 0,
	GET_TEXT_VALUE = 1,
	SET_TEXT_VALUE,
		// p - TEXT_VALUE_PARAMS
	
	TEXT_EDIT_GET_SELECTION,
		// p - TEXT_EDIT_SELECTION_PARAMS
	
	TEXT_EDIT_SET_SELECTION,
		// p - TEXT_EDIT_SELECTION_PARAMS
	
	// Replace selection content or insert text at current caret position.
	// Replaced text will be selected. 
	TEXT_EDIT_REPLACE_SELECTION, 
		// p - TEXT_EDIT_REPLACE_SELECTION_PARAMS
	
	// Set value of type="vscrollbar"/"hscrollbar"
	SCROLL_BAR_GET_VALUE,
	SCROLL_BAR_SET_VALUE,
	
	// get current caret position, it returns rectangle that is relative to origin of the editing element.
	TEXT_EDIT_GET_CARET_POSITION,
		// p - TEXT_CARET_POSITION_PARAMS
	
	TEXT_EDIT_GET_SELECTION_TEXT, // p - TEXT_SELECTION_PARAMS, OutputStreamProc will receive stream of WCHARs
	TEXT_EDIT_GET_SELECTION_HTML, // p - TEXT_SELECTION_PARAMS, OutputStreamProc will receive stream of BYTEs - utf8 encoded html fragment.

	XCALL											 = 0xff, // p - XCALL_PARAMS
	
	FIRST_APPLICATION_METHOD_ID = 0x100 
};

alias BEHAVIOR_METHOD_IDENTIFIERS.DO_CLICK DO_CLICK;
alias BEHAVIOR_METHOD_IDENTIFIERS.GET_TEXT_VALUE GET_TEXT_VALUE;
alias BEHAVIOR_METHOD_IDENTIFIERS.SET_TEXT_VALUE SET_TEXT_VALUE;
alias BEHAVIOR_METHOD_IDENTIFIERS.TEXT_EDIT_GET_SELECTION TEXT_EDIT_GET_SELECTION;
alias BEHAVIOR_METHOD_IDENTIFIERS.TEXT_EDIT_SET_SELECTION TEXT_EDIT_SET_SELECTION;
alias BEHAVIOR_METHOD_IDENTIFIERS.TEXT_EDIT_REPLACE_SELECTION TEXT_EDIT_REPLACE_SELECTION;
alias BEHAVIOR_METHOD_IDENTIFIERS.SCROLL_BAR_GET_VALUE SCROLL_BAR_GET_VALUE;
alias BEHAVIOR_METHOD_IDENTIFIERS.SCROLL_BAR_SET_VALUE SCROLL_BAR_SET_VALUE;
alias BEHAVIOR_METHOD_IDENTIFIERS.TEXT_EDIT_GET_CARET_POSITION TEXT_EDIT_GET_CARET_POSITION;
alias BEHAVIOR_METHOD_IDENTIFIERS.TEXT_EDIT_GET_SELECTION_TEXT TEXT_EDIT_GET_SELECTION_TEXT;
alias BEHAVIOR_METHOD_IDENTIFIERS.TEXT_EDIT_GET_SELECTION_HTML TEXT_EDIT_GET_SELECTION_HTML;
alias BEHAVIOR_METHOD_IDENTIFIERS.XCALL XCALL;
alias BEHAVIOR_METHOD_IDENTIFIERS.FIRST_APPLICATION_METHOD_ID FIRST_APPLICATION_METHOD_ID;

struct METHOD_PARAMS 
{
	UINT methodID; // see: #BEHAVIOR_METHOD_IDENTIFIERS
};

alias METHOD_PARAMS HMethodParams;

struct XCALL_PARAMS
{
	METHOD_PARAMS methodparams;
	LPCSTR	method_name;
	UINT	argc;
	JSON_VALUE	 *argv;
	JSON_VALUE	 retval;

	METHOD_PARAMS* opCast(){return &methodparams;}

	static XCALL_PARAMS* opCall(char[] name,JSON_VALUE[] params=null)
	{
		auto r=new XCALL_PARAMS;
		r.methodparams.methodID = XCALL;
		r.method_name=toStringz(name);
		r.argv=params.ptr;
		r.argc=params.length;
		return r;
	}

	static XCALL_PARAMS* opCall(char[] name,JSON_VALUE *param=null)
	{
		auto r=new XCALL_PARAMS;
		r.methodparams.methodID = XCALL;
		r.method_name=toStringz(name);
		r.argv=param;
		r.argc=1;
		return r;
	}
};

alias XCALL_PARAMS HXcall;

struct TEXT_VALUE_PARAMS
{
	METHOD_PARAMS methodparams;
	LPCWSTR text;
	UINT		length;

	METHOD_PARAMS* opCast(){return &methodparams;}
	char[] toString(){if(length && text) return .toString(text[0..length]); else return null;}

	static TEXT_VALUE_PARAMS* opCall()
	{
		auto r=new TEXT_VALUE_PARAMS;
		r.methodparams.methodID = GET_TEXT_VALUE;
		return r;
	}

	static TEXT_VALUE_PARAMS* opCall(char[] text)
	{
		auto r=new TEXT_VALUE_PARAMS;
		r.methodparams.methodID = SET_TEXT_VALUE;
		if(text.length)
		{
			auto str=toString16(text);
			r.text=str.ptr;
			r.length=str.length;
		}
		return r;
	}
}

alias TEXT_VALUE_PARAMS HTextValue;

struct TEXT_EDIT_SELECTION_PARAMS
{
	METHOD_PARAMS methodparams;
	UINT selection_start;
	UINT selection_end;
	
	METHOD_PARAMS* opCast(){return &methodparams;}
	UINT start(){return selection_start;}
	UINT end(){return selection_end;}

	static TEXT_EDIT_SELECTION_PARAMS* opCall()
	{
		auto r=new TEXT_EDIT_SELECTION_PARAMS;
		r.methodparams.methodID = TEXT_EDIT_GET_SELECTION;
		return r;
	}

	static TEXT_EDIT_SELECTION_PARAMS* opCall(uint start,uint end)
	{
		auto r=new TEXT_EDIT_SELECTION_PARAMS;
		r.methodparams.methodID = TEXT_EDIT_SET_SELECTION;
		r.selection_start=start;
		r.selection_end=end;
		return r;
	}
}

alias TEXT_EDIT_SELECTION_PARAMS HTextEditSelection;

struct TEXT_EDIT_REPLACE_SELECTION_PARAMS
{
	METHOD_PARAMS methodparams;
	LPCWSTR text;
	UINT		text_length;

	METHOD_PARAMS* opCast(){return &methodparams;}
	char[] toString(){if(text_length && text) return .toString(text[0..text_length]); else return null;}

	static TEXT_EDIT_REPLACE_SELECTION_PARAMS* opCall(char[] text)
	{
		auto r=new TEXT_EDIT_REPLACE_SELECTION_PARAMS;
		r.methodparams.methodID = TEXT_EDIT_REPLACE_SELECTION;
		if(text.length)
		{
			auto str=toString16(text);
			r.text=str.ptr;
			r.text_length=str.length;
		}
		return r;
	}
};

alias TEXT_EDIT_REPLACE_SELECTION_PARAMS HTextEditReplaceSelection;

struct TEXT_CARET_POSITION_PARAMS
{
	METHOD_PARAMS methodparams;
	INT left;
	INT top;
	INT width;
	INT height;

	METHOD_PARAMS* opCast(){return &methodparams;}

	static TEXT_CARET_POSITION_PARAMS* opCall()
	{
		auto r=new TEXT_CARET_POSITION_PARAMS;
		r.methodparams.methodID = TEXT_EDIT_GET_CARET_POSITION;
		return r;
	}
};

alias TEXT_CARET_POSITION_PARAMS HTextCaretPosition;

struct TEXT_SELECTION_PARAMS
{
	METHOD_PARAMS methodparams;
	OutputStreamProc outs; // output stream

	bool html;
	char[] string;
	wchar[] wstring;

	METHOD_PARAMS* opCast(){return &methodparams;}
	char[] toString(){if(html) return .toString(wstring); else return string;}

	static TEXT_SELECTION_PARAMS* opCall(bool html)
	{
		auto r=new TEXT_SELECTION_PARAMS;
		r.html=html;
		r.methodparams.methodID = html? TEXT_EDIT_GET_SELECTION_HTML:TEXT_EDIT_GET_SELECTION_TEXT;
		r.outs=&output_stream_proc;
		return r;
	}

	extern(Windows) static BOOL output_stream_proc(TEXT_SELECTION_PARAMS* params, UINT data)
	{
		if(params.html) params.wstring~=cast(wchar)data;
		else params.string~=cast(char)data;
		return 1;
	}
}

alias TEXT_SELECTION_PARAMS HTextSelection;

alias BOOL function(TEXT_SELECTION_PARAMS* params, UINT data /* BYTE or WCHAR */ ) OutputStreamProc;



struct SCROLLBAR_VALUE_PARAMS
{
	METHOD_PARAMS methodparams;
	INT		 value;
	INT		 min_value;
	INT		 max_value;
	INT		 page_value; // page increment
	INT		 step_value; // step increment (arrow button click) 

	METHOD_PARAMS* opCast(){return &methodparams;}
	INT pos(){return value;}
	INT min(){return min_value;}
	INT max(){return max_value;}
	INT page(){return page_value;}
	INT step(){return step_value;}

	static SCROLLBAR_VALUE_PARAMS* opCall()
	{
		auto r=new SCROLLBAR_VALUE_PARAMS;
		r.methodparams.methodID = SCROLL_BAR_GET_VALUE;
		return r;
	}

	static SCROLLBAR_VALUE_PARAMS* opCall(INT value,INT min=0,INT max=0,INT page=0,INT step=0)
	{
		auto r=new SCROLLBAR_VALUE_PARAMS;
		r.methodparams.methodID = SCROLL_BAR_SET_VALUE;
		r.value=value;
		r.min_value=min;
		r.max_value=max;
		r.page_value=page;
		r.step_value=step;
		return r;
	}
};

alias SCROLLBAR_VALUE_PARAMS HScrollbarValue;


// see HTMLayoutRequestElementData

struct DATA_ARRIVED_PARAMS
{
	HELEMENT  initiator;    // element intiator of HTMLayoutRequestElementData request, 
	LPCBYTE   data;         // data buffer
	UINT      dataSize;     // size of data
	UINT      dataType;     // data type passed "as is" from HTMLayoutRequestElementData
	UINT      status;       // status = 0 (dataSize == 0) - unknown error. 
						  // status = 100..505 - http response status, Note: 200 - OK! 
						  // status > 12000 - wininet error code, see ERROR_INTERNET_*** in wininet.h
	LPCWSTR   uri;          // requested url 
};


// request to data source to fill the data.
// used by virtual-grid and virtual list 
struct DATA_ROWS_PARAMS
{
	UINT totalRecords;
	UINT firstRecord; // first visible record - 0..totalRecords

	UINT firstRowIdx; // idx of the first row in the table,
	UINT lastRowIdx;	// idx of the last row in the table. 
					// content of these rows has to be updated.
};

////////////////////////////////////////////////////////////////////////////// notifications

const WM_BEHAVIOR_NOTIFY =(WM_USER + 100);

//---------------------------------------------------------------------
// external behaviors, implemented in /include/behaviors/*.cpp modules
//---------------------------------------------------------------------

const MAX_URL_LENGTH =2048;

// command behavior notification (behavior_command.cpp)
const HLN_COMMAND_CLICK	 =(1);
// command behavior is using this to send its "clicks"
struct NMHL_COMMAND_CLICK
{
	NMHDR hdr;
	WCHAR[MAX_URL_LENGTH] szElementID=void;
	HELEMENT he;
};

// hyperlink behavior (behavior_hyperlink.cpp)
const HLN_HYPERLINK			 =(2);
// hyperlink behavior is using this to send its "clicks" state

struct NMHL_HYPERLINK
{
	enum type { ENTER = 1, LEAVE, CLICK };

	NMHDR hdr;
	type action; 
	WCHAR[MAX_URL_LENGTH] szHREF=void;
	WCHAR[MAX_URL_LENGTH] szTarget=void;
	HELEMENT he;
};

////////////////////////////////////////////////////////////////////////////// json

class HJson
{
	~this(){mValue.release;}

	JSON_VALUE* handle(){return mValue;}
	JSON_VALUE* opCast(){return mValue;}

	extern(D) char[] toString(){return mValue.toString;} //todo: remove this extern(D)
	//JSON_VALUE[] toArray(){return mValue.toArray;}
	HJson[] toArray()
	{
		auto a=mValue.toArray;
		HJson[] ret;
		ret.length=a.length;
		foreach(i,v;a) ret[i]=HJson(&a[i]);
		return ret;
	}
	double toFloat(){return mValue.toFloat;}
	long toInt(){return mValue.toInt;}
	bool toBool(){return mValue.toBool;}
	char[] typename(){return mValue.typename;}
	int type(){return mValue.v_type;}

	static HJson parse(char[] text,uint mode=0){return HJson(JSON_VALUE.parse(text,mode));}
	static HJson opCall(){return HJson(JSON_VALUE());}
	static HJson opCall(ubyte[] v){return HJson(JSON_VALUE(v));}
	static HJson opCall(char[] v){return HJson(JSON_VALUE(v));}
	//static HJson opCall(JSON_VALUE[] v){return HJson(JSON_VALUE(v));}
	static HJson opCall(HJson[] v)
	{
		JSON_VALUE[] vals;
		vals.length=v.length;
		foreach(i,vv;v) vals[i]=*vv.handle;
		return HJson(JSON_VALUE(vals));
	}
	static HJson opCall(bool v){return HJson(JSON_VALUE(v));}
	static HJson opCall(double v){return HJson(JSON_VALUE(v));}
	static HJson opCall(__int64 v){return HJson(JSON_VALUE(v));}
	static HJson fromAA(K,V)(V[K] v){return HJson(JSON_VALUE.fromAA(v));}
	static HJson opCall(JSON_VALUE* value){if(value is null) return null; else return new HJson(value);}

protected:
	this(JSON_VALUE* value){if(value is null) throw new Exception("Invalid JSON_VALUE!"); mValue=value;}

	JSON_VALUE* mValue;
}

enum VALUETYPE 
{ 
	V_UNDEFINED = 0,	///< empty
	V_BOOL = 1,			///< bool
	V_INT = 2,			///< int
	V_REAL = 3,			///< double
	V_STRING = 4,		///< string of wchar_t
	V_ARRAY = 5,		///< array of value elements
	V_MAP = 6,			///< map of name/value pairs - simple map
	V_BYTES = 7       	///< vector of bytes, a.k.a. blob
};

alias VALUETYPE.V_UNDEFINED V_UNDEFINED;
alias VALUETYPE.V_BOOL V_BOOL;
alias VALUETYPE.V_INT V_INT;
alias VALUETYPE.V_REAL V_REAL;
alias VALUETYPE.V_STRING V_STRING;
alias VALUETYPE.V_ARRAY V_ARRAY;
alias VALUETYPE.V_MAP V_MAP;
alias VALUETYPE.V_BYTES V_BYTES;

private extern(C) alias void function(void*) wiper_t;

align(4) struct HJsonString
{
	int refcount;
	size_t length;
	wiper_t wipe;
}

align(4) struct HJsonArray
{
	int refcount;
	size_t length;
	wiper_t wipe;
}

align(4) struct HJsonMap
{
	JSON_VALUE key;
	JSON_VALUE val;
	HJsonMap* next;
	wiper_t wipe;
	int refcount;
}

align(4) struct HJsonBytes
{
    int refcount;
    ubyte* data;
    size_t length;    // number of elements used in the buffer 
    wiper_t wipe;
}

align(4) struct JSON_VALUE
{
	VALUETYPE v_type;
	union data_slot
	{
		int i_val;
		double r_val;
		__int64 l_val;
		HJsonString* s_val;
		HJsonArray* a_val; // array data
		HJsonMap* m_val; // simple map of name/value pairs.
		HJsonBytes* b_val; // bytes data
	}
	data_slot data;

	char[] toString()
	{
		if(v_type==V_STRING)
		{
			auto str=cast(wchar_t*)(data.s_val+1);
			//todo: is this right???
			if(data.s_val.length && str[data.s_val.length-1]==0) return .toString(str[0..data.s_val.length-1]);
			return .toString(str[0..data.s_val.length]);
		}
		else if(v_type==V_BYTES) return (cast(char*)(data.b_val+1))[0..data.b_val.length];
		else if(v_type==V_UNDEFINED)
		{
			if(data.l_val!=0) return Int.toString(data.l_val);
			else return "undefined";
		}
		else if(v_type==V_INT) return Int.toString(data.i_val);
		else if(v_type==V_BOOL) return data.i_val?"true":"false";
		else if(v_type==V_REAL) return Float.toString(data.r_val);
		else throw new Exception("Don't know how to convert "~typename~" to string");
	}

	JSON_VALUE[] toArray()
	{
		if(v_type==V_ARRAY) return ((cast(JSON_VALUE*)(data.a_val+1))[0..data.a_val.length]);
		else throw new Exception("Don't know how to convert "~typename~" to string");
	}

	double toFloat()
	{
		if(v_type==V_REAL) return data.r_val;
		else if(v_type==V_UNDEFINED && data.l_val!=0) return data.l_val;
		else if(v_type==V_INT || v_type==V_BOOL) return data.i_val;
		else if(v_type==V_STRING) return Float.toFloat(toString);
		else return double.nan;//throw new Exception("Don't know how to convert "~typename~" to float");
	}

	long toInt()
	{
		if(v_type==V_UNDEFINED && data.l_val!=0) return data.l_val;
		else if(v_type==V_INT || v_type==V_BOOL) return data.i_val;
		else if(v_type==V_REAL) return cast(long)data.r_val;
		else if(v_type==V_STRING) return Int.toLong(toString);
		else throw new Exception("Don't know how to convert "~typename~" to integer");
	}

	bool toBool()
	{
		if(v_type==V_UNDEFINED)
		{
			if(data.l_val!=0) return cast(bool)data.l_val;
			else return false;
		}
		else if(v_type==V_INT || v_type==V_BOOL) return cast(bool)data.i_val;
		else if(v_type==V_REAL) return cast(bool)data.r_val;
		else if(v_type==V_STRING) return data.s_val.length>0;
		else if(v_type==V_BYTES) return data.b_val.length>0;
		else throw new Exception("Don't know how to convert "~typename~" to boolean");
	}

	char[] typename()
	{
		if(v_type==V_UNDEFINED)
		{
			if(data.l_val!=0) return "integer";
			else return "undefined";
		}
		else if(v_type==V_BOOL) return "bool";
		else if(v_type==V_INT) return "integer";
		else if(v_type==V_REAL) return "real";
		else if(v_type==V_STRING) return "string";
		else if(v_type==V_ARRAY) return "array";
		else if(v_type==V_MAP) return "map";
		else if(v_type==V_BYTES) return "bytes";
		else return null;
	}

	static JSON_VALUE* parse(char[] text,uint mode=0)
	{
		auto value=new JSON_VALUE;
		auto str16=toString16(text);
		if(HTMLayoutParseValue(str16.ptr,str16.length,mode,value)==0)
		{
			delete value;
			return null;
		}
		return value;
	}

	static JSON_VALUE* opCall()
	{
		auto value=new JSON_VALUE;
		value.v_type=V_UNDEFINED;
		value.data.l_val=0;
		return value;
	}

	static JSON_VALUE* opCall(ubyte[] v)
	{
		auto value=new JSON_VALUE;
		HJsonBytes* r = cast(HJsonBytes*)malloc(HJsonBytes.sizeof + v.length);
		r.refcount = 1;
		r.length = v.length;
		r.wipe = &free;
		r.data = cast(ubyte*)(r+1);
		value.v_type=V_BYTES;
		value.data.b_val=r;
		return value;
	}

	static JSON_VALUE* opCall(char[] v)
	{
		auto value=new JSON_VALUE;
		auto str16=toString16(v);
		HJsonString* r = cast(HJsonString*)malloc(HJsonString.sizeof + str16.length*wchar_t.sizeof);
		r.refcount = 1;
		r.length = str16.length;
		r.wipe	= &free;
		wcsncpy(cast(wchar_t*)(r + 1),str16.ptr,str16.length);
		value.v_type=V_STRING;
		value.data.s_val=r;
		return value;
	}

	static JSON_VALUE* opCall(JSON_VALUE[] v)
	{
		auto value=new JSON_VALUE;
		HJsonArray* r = cast(HJsonArray*)malloc(HJsonArray.sizeof + v.length*JSON_VALUE.sizeof);
		r.refcount = 1;
		r.length = v.length;
		r.wipe	= &free;
		auto els = cast(JSON_VALUE*)(r+1);
		foreach(i,j;v) els[i]=j;
		value.data.a_val=r;
		value.v_type=V_ARRAY;
		return value;
	}

	static JSON_VALUE* fromAA(K,V)(V[K] v)
	{
		auto value=new JSON_VALUE;
		static if((is(K : char[]) || is(K : int) || is(K : double) || is(K : __int64) || is(K : JSON_VALUE[])) &&
		(is(V : char[]) || is(V : int) || is(V : double) || is(V : __int64) || is(V : JSON_VALUE[])))
		{
			value.v_type=V_MAP;
		}
		return value;
	}

	static JSON_VALUE* opCall(bool v)
	{
		auto value=new JSON_VALUE;
		value.v_type=V_BOOL;
		value.data.i_val=v;
		return value;
	}

	static JSON_VALUE* opCall(double v)
	{
		auto value=new JSON_VALUE;
		value.v_type=V_REAL;
		value.data.r_val=v;
		return value;
	}

	static JSON_VALUE* opCall(__int64 v)
	{
		auto value=new JSON_VALUE;
		if(v<int.min || v>int.max)
		{
			value.v_type=V_UNDEFINED;
			value.data.l_val=v;
		}
		else
		{
			value.v_type=V_INT;
			value.data.i_val=v;
		}
		return value;
	}

	void release()
	{
		if(v_type==V_STRING)
		{
			 if(--data.s_val.refcount == 0) data.s_val.wipe(data.s_val);
		}
		else if(v_type==V_BYTES)
		{
			 if(--data.b_val.refcount == 0) data.b_val.wipe(data.b_val);
		}
		else if(v_type==V_ARRAY)
		{
			if(--data.a_val.refcount == 0)
			{
				auto els = cast(JSON_VALUE*)(data.a_val+1);
				for(size_t i = 0;i<data.a_val.length;++i) els[i].release();
				data.a_val.wipe(data.a_val);
			}
		}
		else if(v_type==V_MAP)
		{
			if (--data.m_val.refcount == 0) 
			{
				uint len;
				uint size;
				HJsonMap*[] map;
				auto a=data.m_val;
				while(a)
				{
					if(len==size) map.length=size=size+5;
					map[len++]=a;
					a=a.next;
				}
				for(--len;len>=0;--len) map[len].wipe(map[len]);
			}
		}
		data.l_val=0; v_type=V_UNDEFINED;
	}
} 

alias long __int64;

/*struct JSON_VALUE
{
	VALUETYPE			v_type;
	union data 
	{
		int				i_val;
		double			r_val;
		__int64			l_val;
		void*			s_val;
		void*			a_val; // array data
		void*			m_val; // simple map of name/value pairs.
		void*			b_val; // bytes_data.
	}
}*/

////////////////////////////////////////////////////////////////////////////// dom

alias int HLDOM_RESULT;
alias UINT* LPUINT;
alias BYTE* LPCBYTE;
//alias UINT* UINT_PTR;
//alias INT* INT_PTR;

const HLDOM_OK =0;
const HLDOM_INVALID_HWND =1 ;
const HLDOM_INVALID_HANDLE =2;
const HLDOM_PASSIVE_HANDLE =3;
const HLDOM_INVALID_PARAMETER =4;
const HLDOM_OPERATION_FAILED =5;
const HLDOM_OK_NOT_HANDLED =(-1);

alias LPVOID HELEMENT;

/**DOM range handle.*/
alias LPVOID HRANGE;
struct HPOSITION { HELEMENT he; INT pos; }

enum ELEMENT_AREAS 
{
	ROOT_RELATIVE = 0x01,			 // - or this flag if you want to get HTMLayout window relative coordinates,
															//	 otherwise it will use nearest windowed container e.g. popup window.
	SELF_RELATIVE = 0x02,			 // - "or" this flag if you want to get coordinates relative to the origin
															//	 of element iself.
	CONTAINER_RELATIVE = 0x03,	// - position inside immediate container.

	CONTENT_BOX = 0x00,	 // content (inner)	box
	PADDING_BOX = 0x10,	 // content + paddings
	BORDER_BOX	= 0x20,	 // content + paddings + border
	MARGIN_BOX	= 0x30,	 // content + paddings + border + margins 
	
	BACK_IMAGE_AREA = 0x40, // relative to content origin - location of background image (if it set no-repeat)
	FORE_IMAGE_AREA = 0x50, // relative to content origin - location of foreground image (if it set no-repeat)

	SCROLLABLE_AREA = 0x60,	 // scroll_area - scrollable area in content box 

};

alias ELEMENT_AREAS.ROOT_RELATIVE ROOT_RELATIVE;
alias ELEMENT_AREAS.SELF_RELATIVE SELF_RELATIVE;
alias ELEMENT_AREAS.CONTAINER_RELATIVE CONTAINER_RELATIVE;
alias ELEMENT_AREAS.CONTENT_BOX CONTENT_BOX;
alias ELEMENT_AREAS.PADDING_BOX PADDING_BOX;
alias ELEMENT_AREAS.BORDER_BOX BORDER_BOX;
alias ELEMENT_AREAS.MARGIN_BOX MARGIN_BOX;
alias ELEMENT_AREAS.BACK_IMAGE_AREA BACK_IMAGE_AREA;
alias ELEMENT_AREAS.FORE_IMAGE_AREA FORE_IMAGE_AREA;
alias ELEMENT_AREAS.SCROLLABLE_AREA SCROLLABLE_AREA;

enum UPDATE_ELEMENT_FLAGS
{
	RESET_STYLE_THIS = 0x20,	// reset styles - this may require if you have styles dependent from attributes,
	RESET_STYLE_DEEP = 0x10,	// use these flags after SetAttribute then. RESET_STYLE_THIS is faster than RESET_STYLE_DEEP.

	MEASURE_INPLACE = 0x0001, // use this flag if you do not expect any dimensional changes - this is faster than REMEASURE
	MEASURE_DEEP		= 0x0002, // use this flag if changes of some attributes/content may cause change of dimensions of the element	

	REDRAW_NOW = 0x8000,			// invoke UpdateWindow function after applying changes
};

alias UPDATE_ELEMENT_FLAGS.RESET_STYLE_THIS RESET_STYLE_THIS;
alias UPDATE_ELEMENT_FLAGS.RESET_STYLE_DEEP RESET_STYLE_DEEP;
alias UPDATE_ELEMENT_FLAGS.MEASURE_INPLACE MEASURE_INPLACE;
alias UPDATE_ELEMENT_FLAGS.MEASURE_DEEP MEASURE_DEEP;
alias UPDATE_ELEMENT_FLAGS.REDRAW_NOW REDRAW_NOW;


const SIH_REPLACE_CONTENT		 =0;
const SIH_INSERT_AT_START		 =1;
const SIH_APPEND_AFTER_LAST	 =2;

const SOH_REPLACE						 =3;
const SOH_INSERT_BEFORE			 =4;
const SOH_INSERT_AFTER				=5;

enum ELEMENT_STATE_BITS 
{
	STATE_LINK     = 0x0001, // selector :link,    any element having href attribute
    STATE_HOVER    = 0x0002, // selector :hover,   element is under the cursor, mouse hover  
    STATE_ACTIVE   = 0x0004, // selector :active,  element is activated, e.g. pressed  
    STATE_FOCUS    = 0x0008, // selector :focus,   element is in focus  
    STATE_VISITED  = 0x0010, // selector :visited, aux flag - not used internally now.
    STATE_CURRENT  = 0x0020, // selector :current, current item in collection, e.g. current <option> in <select>
    STATE_CHECKED  = 0x0040, // selector :checked, element is checked (or selected), e.g. check box or itme in multiselect
    STATE_DISABLED = 0x0080, // selector :disabled, element is disabled, behavior related flag.
    STATE_READONLY = 0x0100, // selector :read-only, element is read-only, behavior related flag.
    STATE_EXPANDED = 0x0200, // selector :expanded, element is in expanded state - nodes in tree view e.g. <options> in <select>
    STATE_COLLAPSED= 0x0400, // selector :collapsed, mutually exclusive with EXPANDED
    STATE_INCOMPLETE = 0x0800,      // selector :incomplete, element has images (back/fore/bullet) requested but not delivered.
    STATE_ANIMATING  = 0x00001000,  // selector :animating, is currently animating 
    STATE_FOCUSABLE  = 0x00002000,  // selector :focusable, shall accept focus
    STATE_ANCHOR     = 0x00004000,  // selector :anchor, first element in selection (<select miltiple>), STATE_CURRENT is the current.
    STATE_SYNTHETIC  = 0x00008000,  // selector :synthetic, synthesized DOM elements - e.g. all missed cells in tables (<td>) are getting this flag
    STATE_OWNS_POPUP = 0x00010000,  // selector :owns-popup, anchor(owner) element of visible popup. 
    STATE_TABFOCUS   = 0x00020000,  // selector :tab-focus, element got focus by tab traversal. engine set it together with :focus.
    STATE_EMPTY      = 0x00040000,  // selector :empty - element is empty. 
    STATE_BUSY       = 0x00080000,  // selector :busy, element is busy. HTMLayoutRequestElementData will set this flag if
                                    // external data was requested for the element. When data will be delivered engine will reset this flag on the element. 

    STATE_DRAG_OVER   = 0x00100000,  // drag over the block that can accept it (so is current drop target). Flag is set for the drop target block. At any given moment of time it can be only one such block.
    STATE_DROP_TARGET = 0x00200000,  // active drop target. Multiple elements can have this flag when D&D is active. 
    STATE_MOVING      = 0x00400000,  // dragging/moving - the flag is set for the moving element (copy of the drag-source).
    STATE_COPYING     = 0x00800000,  // dragging/copying - the flag is set for the copying element (copy of the drag-source).
    STATE_DRAG_SOURCE = 0x00C00000,  // is set in element that was chosen to drag.

    STATE_POPUP      = 0x40000000,    // this element is in popup state and presented to the user - out of flow now
    STATE_PRESSED    = 0x04000000,    // pressed - close to active but has wider life span - e.g. in MOUSE_UP it 
                                      // is still on, so behavior can check it in MOUSE_UP to discover CLICK condition.
    STATE_HAS_CHILDREN = 0x02000000,  // has more than one child.    
    STATE_HAS_CHILD    = 0x01000000,  // has single child.
}

alias ELEMENT_STATE_BITS.STATE_LINK STATE_LINK;
alias ELEMENT_STATE_BITS.STATE_HOVER STATE_HOVER;
alias ELEMENT_STATE_BITS.STATE_ACTIVE STATE_ACTIVE;
alias ELEMENT_STATE_BITS.STATE_FOCUS STATE_FOCUS;
alias ELEMENT_STATE_BITS.STATE_VISITED STATE_VISITED;
alias ELEMENT_STATE_BITS.STATE_CURRENT STATE_CURRENT;
alias ELEMENT_STATE_BITS.STATE_CHECKED STATE_CHECKED;
alias ELEMENT_STATE_BITS.STATE_DISABLED STATE_DISABLED;
alias ELEMENT_STATE_BITS.STATE_READONLY STATE_READONLY;
alias ELEMENT_STATE_BITS.STATE_EXPANDED STATE_EXPANDED;
alias ELEMENT_STATE_BITS.STATE_COLLAPSED STATE_COLLAPSED;
alias ELEMENT_STATE_BITS.STATE_INCOMPLETE STATE_INCOMPLETE;
alias ELEMENT_STATE_BITS.STATE_ANIMATING STATE_ANIMATING;
alias ELEMENT_STATE_BITS.STATE_FOCUSABLE STATE_FOCUSABLE;
alias ELEMENT_STATE_BITS.STATE_ANCHOR STATE_ANCHOR;
alias ELEMENT_STATE_BITS.STATE_SYNTHETIC STATE_SYNTHETIC;
alias ELEMENT_STATE_BITS.STATE_OWNS_POPUP STATE_OWNS_POPUP;
alias ELEMENT_STATE_BITS.STATE_TABFOCUS STATE_TABFOCUS;
alias ELEMENT_STATE_BITS.STATE_EMPTY STATE_EMPTY;
alias ELEMENT_STATE_BITS.STATE_BUSY STATE_BUSY;
alias ELEMENT_STATE_BITS.STATE_DRAG_OVER STATE_DRAG_OVER;
alias ELEMENT_STATE_BITS.STATE_DROP_TARGET STATE_DROP_TARGET;
alias ELEMENT_STATE_BITS.STATE_MOVING STATE_MOVING;
alias ELEMENT_STATE_BITS.STATE_COPYING STATE_COPYING;
alias ELEMENT_STATE_BITS.STATE_DRAG_SOURCE STATE_DRAG_SOURCE;
alias ELEMENT_STATE_BITS.STATE_POPUP STATE_POPUP;
alias ELEMENT_STATE_BITS.STATE_PRESSED STATE_PRESSED;
alias ELEMENT_STATE_BITS.STATE_HAS_CHILDREN STATE_HAS_CHILDREN;
alias ELEMENT_STATE_BITS.STATE_HAS_CHILD STATE_HAS_CHILD;

enum REQUEST_TYPE
{
	GET_ASYNC,	// async GET
	POST_ASYNC, // async POST
	GET_SYNC,	 // synchronous GET 
	POST_SYNC	 // synchronous POST 
};

alias REQUEST_TYPE.GET_ASYNC GET_ASYNC;
alias REQUEST_TYPE.POST_ASYNC POST_ASYNC;
alias REQUEST_TYPE.GET_SYNC GET_SYNC;
alias REQUEST_TYPE.POST_SYNC POST_SYNC;

struct REQUEST_PARAM { LPCWSTR name; LPCWSTR value; };

enum CTL_TYPE
{
		CTL_NO,							 ///< This dom element has no behavior at all.
		CTL_UNKNOWN = 1,			///< This dom element has behavior but its type is unknown.
		CTL_EDIT,						 ///< Single line edit box.
		CTL_NUMERIC,					///< Numeric input with optional spin buttons.
		CTL_BUTTON,					 ///< Command button.
		CTL_CHECKBOX,				 ///< CheckBox (button).
		CTL_RADIO,						///< OptionBox (button).
		CTL_SELECT_SINGLE,		///< Single select, ListBox or TreeView.
		CTL_SELECT_MULTIPLE,	///< Multiselectable select, ListBox or TreeView.
		CTL_DD_SELECT,				///< Dropdown single select.
		CTL_TEXTAREA,				 ///< Multiline TextBox.
		CTL_HTMLAREA,				 ///< WYSIWYG HTML editor.
		CTL_PASSWORD,				 ///< Password input element.
		CTL_PROGRESS,				 ///< Progress element.
		CTL_SLIDER,					 ///< Slider input element.	
		CTL_DECIMAL,					///< Decimal number input element.
		CTL_CURRENCY,				 ///< Currency input element.
		CTL_SCROLLBAR,
		
		CTL_HYPERLINK,
		
		CTL_MENUBAR,
		CTL_MENU,
		CTL_MENUBUTTON,

		CTL_CALENDAR,
		CTL_DATE,
		CTL_TIME,
		
		CTL_FRAME,
		CTL_FRAMESET,

		CTL_GRAPHICS,
		CTL_SPRITE,

		CTL_LIST,
		CTL_RICHTEXT,
		CTL_TOOLTIP,

		CTL_HIDDEN,
};

alias CTL_TYPE.CTL_NO CTL_NO;
alias CTL_TYPE.CTL_UNKNOWN	TL_UNKNOWN;
alias CTL_TYPE.CTL_EDIT CTL_EDIT;
alias CTL_TYPE.CTL_NUMERIC CTL_NUMERIC;
alias CTL_TYPE.CTL_BUTTON CTL_BUTTON;
alias CTL_TYPE.CTL_CHECKBOX CTL_CHECKBOX;
alias CTL_TYPE.CTL_RADIO CTL_RADIO;
alias CTL_TYPE.CTL_SELECT_SINGLE CTL_SELECT_SINGLE;
alias CTL_TYPE.CTL_SELECT_MULTIPLE CTL_SELECT_MULTIPLE;
alias CTL_TYPE.CTL_DD_SELECT CTL_DD_SELECT;
alias CTL_TYPE.CTL_TEXTAREA CTL_TEXTAREA;
alias CTL_TYPE.CTL_HTMLAREA CTL_HTMLAREA;
alias CTL_TYPE.CTL_PASSWORD CTL_PASSWORD;
alias CTL_TYPE.CTL_PROGRESS CTL_PROGRESS;
alias CTL_TYPE.CTL_SLIDER CTL_SLIDER;
alias CTL_TYPE.CTL_DECIMAL CTL_DECIMAL;
alias CTL_TYPE.CTL_CURRENCY CTL_CURRENCY;
alias CTL_TYPE.CTL_SCROLLBAR CTL_SCROLLBAR;
alias CTL_TYPE.CTL_HYPERLINK CTL_HYPERLINK;
alias CTL_TYPE.CTL_MENUBAR CTL_MENUBAR;
alias CTL_TYPE.CTL_MENU CTL_MENU;
alias CTL_TYPE.CTL_MENUBUTTON CTL_MENUBUTTON;
alias CTL_TYPE.CTL_CALENDAR CTL_CALENDAR;
alias CTL_TYPE.CTL_DATE CTL_DATE;
alias CTL_TYPE.CTL_TIME CTL_TIME;
alias CTL_TYPE.CTL_FRAME CTL_FRAME;
alias CTL_TYPE.CTL_FRAMESET CTL_FRAMESET;
alias CTL_TYPE.CTL_GRAPHICS CTL_GRAPHICS;
alias CTL_TYPE.CTL_SPRITE CTL_SPRITE;
alias CTL_TYPE.CTL_LIST CTL_LIST;
alias CTL_TYPE.CTL_RICHTEXT CTL_RICHTEXT;
alias CTL_TYPE.CTL_TOOLTIP CTL_TOOLTIP;
alias CTL_TYPE.CTL_HIDDEN CTL_HIDDEN;

struct HTMLayoutCSSRuleDef
{
	INT			rule_type;		/**< 0 - css rule, 
															1 - inline style attribute (selector is text of @style), 
															2 - element has styles defined by HTMLayoutSetStyleAttribute */
	LPCSTR	 file_url;		 /**< url of the file where this rule is defined */
	INT			file_line_no; /**< line number in the file of rule's selector, -1 if unknown */
	LPCWSTR	selector;		 /**< text of selector */
};

enum ADVANCE_TO 
{
	GO_FIRST = 0,
	GO_LAST	= 1,
	GO_NEXT	= 2,
	GO_PREV	= 3,
	GO_NEXT_CHAR	= 4,
	GO_PREV_CHAR	= 5,
};

alias ADVANCE_TO.GO_FIRST GO_FIRST;
alias ADVANCE_TO.GO_LAST GO_LAST;
alias ADVANCE_TO.GO_NEXT GO_NEXT;
alias ADVANCE_TO.GO_PREV GO_PREV;
alias ADVANCE_TO.GO_NEXT_CHAR GO_NEXT_CHAR;
alias ADVANCE_TO.GO_PREV_CHAR GO_PREV_CHAR;

alias BOOL function( HELEMENT he, LPVOID param ) HTMLayoutElementCallback;
alias BOOL function(LPVOID tag, HELEMENT he, UINT evtg, LPVOID prms ) ElementEventProc;
alias ElementEventProc LPELEMENT_EVENT_PROC;
alias INT function( HELEMENT he1, HELEMENT he2, LPVOID param ) ELEMENT_COMPARATOR;
alias BOOL function( LPVOID p, HELEMENT he, int pos, int postype, WCHAR code ) HTMLayoutEnumerationCallback;

alias HLDOM_RESULT function (HELEMENT he, LPRECT p_location, UINT areas /*ELEMENT_AREAS*/) HTMLayoutGetElementLocation_t;
HTMLayoutGetElementLocation_t HTMLayoutGetElementLocation;
alias HLDOM_RESULT function (HELEMENT he) HTMLayout_UseElement_t;
HTMLayout_UseElement_t HTMLayout_UseElement;
alias HLDOM_RESULT function (HELEMENT he) HTMLayout_UnuseElement_t;
HTMLayout_UnuseElement_t HTMLayout_UnuseElement;
alias HLDOM_RESULT function (HWND hwnd, HELEMENT *phe) HTMLayoutGetRootElement_t;
HTMLayoutGetRootElement_t HTMLayoutGetRootElement;
alias HLDOM_RESULT function (HWND hwnd, HELEMENT *phe) HTMLayoutGetFocusElement_t;
HTMLayoutGetFocusElement_t HTMLayoutGetFocusElement;
alias HLDOM_RESULT function (HWND hwnd, POINT pt, HELEMENT *phe) HTMLayoutFindElement_t;
HTMLayoutFindElement_t HTMLayoutFindElement;
alias HLDOM_RESULT function (HELEMENT he, UINT *count) HTMLayoutGetChildrenCount_t;
HTMLayoutGetChildrenCount_t HTMLayoutGetChildrenCount;
alias HLDOM_RESULT function (HELEMENT he, UINT n, HELEMENT *phe) HTMLayoutGetNthChild_t;
HTMLayoutGetNthChild_t HTMLayoutGetNthChild;
alias HLDOM_RESULT function (HELEMENT he, HELEMENT *p_parent_he) HTMLayoutGetParentElement_t;
HTMLayoutGetParentElement_t HTMLayoutGetParentElement;
alias HLDOM_RESULT function (HELEMENT he, LPWSTR characters, LPUINT length) HTMLayoutGetElementText_t;
HTMLayoutGetElementText_t HTMLayoutGetElementText;
alias HLDOM_RESULT function (HELEMENT he, LPBYTE *utf8bytes, BOOL outer) HTMLayoutGetElementHtml_t;
HTMLayoutGetElementHtml_t HTMLayoutGetElementHtml;
alias HLDOM_RESULT function (HELEMENT he, LPBYTE *utf8bytes) HTMLayoutGetElementInnerText_t;
HTMLayoutGetElementInnerText_t HTMLayoutGetElementInnerText;
alias HLDOM_RESULT function (HELEMENT he, LPCBYTE utf8bytes, UINT length) HTMLayoutSetElementInnerText_t;
HTMLayoutSetElementInnerText_t HTMLayoutSetElementInnerText;
alias HLDOM_RESULT function (HELEMENT he, LPWSTR *utf16words) HTMLayoutGetElementInnerText16_t;
HTMLayoutGetElementInnerText16_t HTMLayoutGetElementInnerText16;
alias HLDOM_RESULT function (HELEMENT he, LPCWSTR utf16words, UINT length) HTMLayoutSetElementInnerText16_t;
HTMLayoutSetElementInnerText16_t HTMLayoutSetElementInnerText16;
alias HLDOM_RESULT function (HELEMENT he, LPUINT p_count) HTMLayoutGetAttributeCount_t;
HTMLayoutGetAttributeCount_t HTMLayoutGetAttributeCount;
alias HLDOM_RESULT function (HELEMENT he, UINT n, LPCSTR *p_name, LPCWSTR *p_value) HTMLayoutGetNthAttribute_t;
HTMLayoutGetNthAttribute_t HTMLayoutGetNthAttribute;
alias HLDOM_RESULT function (HELEMENT he, LPCSTR name, LPCWSTR *p_value) HTMLayoutGetAttributeByName_t;
HTMLayoutGetAttributeByName_t HTMLayoutGetAttributeByName;
alias HLDOM_RESULT function (HELEMENT he, LPCSTR name, LPCWSTR value) HTMLayoutSetAttributeByName_t;
HTMLayoutSetAttributeByName_t HTMLayoutSetAttributeByName;
alias HLDOM_RESULT function (HELEMENT he) HTMLayoutClearAttributes_t;
HTMLayoutClearAttributes_t HTMLayoutClearAttributes;
alias HLDOM_RESULT function (HELEMENT he, LPUINT p_index) HTMLayoutGetElementIndex_t;
HTMLayoutGetElementIndex_t HTMLayoutGetElementIndex;
alias HLDOM_RESULT function (HELEMENT he, LPCSTR *p_type) HTMLayoutGetElementType_t;
HTMLayoutGetElementType_t HTMLayoutGetElementType;
alias HLDOM_RESULT function (HELEMENT he, LPCSTR name, LPCWSTR *p_value) HTMLayoutGetStyleAttribute_t;
HTMLayoutGetStyleAttribute_t HTMLayoutGetStyleAttribute;
alias HLDOM_RESULT function (HELEMENT he, LPCSTR name, LPCWSTR value) HTMLayoutSetStyleAttribute_t;
HTMLayoutSetStyleAttribute_t HTMLayoutSetStyleAttribute;
alias HLDOM_RESULT function (HELEMENT he, BOOL renderNow) HTMLayoutUpdateElement_t;
HTMLayoutUpdateElement_t HTMLayoutUpdateElement;
alias HLDOM_RESULT function (HELEMENT he, UINT flags) HTMLayoutUpdateElementEx_t;
HTMLayoutUpdateElementEx_t HTMLayoutUpdateElementEx;
alias HLDOM_RESULT function (HELEMENT he) HTMLayoutSetCapture_t;
HTMLayoutSetCapture_t HTMLayoutSetCapture;
alias HLDOM_RESULT function (HELEMENT he, HWND *p_hwnd, BOOL rootWindow) HTMLayoutGetElementHwnd_t;
HTMLayoutGetElementHwnd_t HTMLayoutGetElementHwnd;
alias HLDOM_RESULT function (HELEMENT he, LPWSTR szUrlBuffer, DWORD UrlBufferSize) HTMLayoutCombineURL_t;
HTMLayoutCombineURL_t HTMLayoutCombineURL;
alias HLDOM_RESULT function (HELEMENT he, LPCSTR tagName, LPCSTR attributeName, LPCWSTR attributeValue, HTMLayoutElementCallback callback, LPVOID param, DWORD depth) HTMLayoutVisitElements_t;
HTMLayoutVisitElements_t HTMLayoutVisitElements;
alias HLDOM_RESULT function (HELEMENT he, LPCSTR CSS_selectors, HTMLayoutElementCallback callback, LPVOID param) HTMLayoutSelectElements_t;
HTMLayoutSelectElements_t HTMLayoutSelectElements;
alias HLDOM_RESULT function (HELEMENT he, LPCSTR selector, UINT depth, HELEMENT *heFound) HTMLayoutSelectParent_t;
HTMLayoutSelectParent_t HTMLayoutSelectParent;
alias HLDOM_RESULT function (HELEMENT he, LPCBYTE html, DWORD htmlLength, UINT where) HTMLayoutSetElementHtml_t;
HTMLayoutSetElementHtml_t HTMLayoutSetElementHtml;
alias HLDOM_RESULT function (HELEMENT he) HTMLayoutDeleteElement_t;
HTMLayoutDeleteElement_t HTMLayoutDeleteElement;
alias HLDOM_RESULT function (HELEMENT he, UINT *puid) HTMLayoutGetElementUID_t;
HTMLayoutGetElementUID_t HTMLayoutGetElementUID;
alias HLDOM_RESULT function (HWND hwnd, UINT uid, HELEMENT *phe) HTMLayoutGetElementByUID_t;
HTMLayoutGetElementByUID_t HTMLayoutGetElementByUID;
alias HLDOM_RESULT function (HELEMENT hePopup, HELEMENT heAnchor, UINT placement) HTMLayoutShowPopup_t;
HTMLayoutShowPopup_t HTMLayoutShowPopup;
alias HLDOM_RESULT function (HELEMENT hePopup, POINT pos, BOOL animate) HTMLayoutShowPopupAt_t;
HTMLayoutShowPopupAt_t HTMLayoutShowPopupAt;
alias HLDOM_RESULT function (HELEMENT he) HTMLayoutHidePopup_t;
HTMLayoutHidePopup_t HTMLayoutHidePopup;
alias HLDOM_RESULT function (HELEMENT he, UINT *pstateBits) HTMLayoutGetElementState_t;
HTMLayoutGetElementState_t HTMLayoutGetElementState;
alias HLDOM_RESULT function( HELEMENT he, UINT stateBitsToSet, UINT stateBitsToClear, BOOL updateView) HTMLayoutSetElementState_t;
HTMLayoutSetElementState_t HTMLayoutSetElementState;
alias HLDOM_RESULT function (LPCSTR tagname, LPCWSTR textOrNull, HELEMENT *phe) HTMLayoutCreateElement_t;
HTMLayoutCreateElement_t HTMLayoutCreateElement;
alias HLDOM_RESULT function (HELEMENT he, HELEMENT *phe) HTMLayoutCloneElement_t;
HTMLayoutCloneElement_t HTMLayoutCloneElement;
alias HLDOM_RESULT function (HELEMENT he, HELEMENT hparent, UINT index) HTMLayoutInsertElement_t;
HTMLayoutInsertElement_t HTMLayoutInsertElement;
alias HLDOM_RESULT function (HELEMENT he) HTMLayoutDetachElement_t;
HTMLayoutDetachElement_t HTMLayoutDetachElement;
alias HLDOM_RESULT function (HELEMENT he, UINT milliseconds) HTMLayoutSetTimer_t;
HTMLayoutSetTimer_t HTMLayoutSetTimer;
alias HLDOM_RESULT function (HELEMENT he, LPELEMENT_EVENT_PROC pep, LPVOID tag) HTMLayoutAttachEventHandler_t;
HTMLayoutAttachEventHandler_t HTMLayoutAttachEventHandler;
alias HLDOM_RESULT function (HELEMENT he, LPELEMENT_EVENT_PROC pep, LPVOID tag, UINT subscription) HTMLayoutAttachEventHandlerEx_t;
HTMLayoutAttachEventHandlerEx_t HTMLayoutAttachEventHandlerEx;
alias HLDOM_RESULT function (HWND hwndLayout, LPELEMENT_EVENT_PROC pep, LPVOID tag, UINT subscription) HTMLayoutWindowAttachEventHandler_t;
HTMLayoutWindowAttachEventHandler_t HTMLayoutWindowAttachEventHandler;
alias HLDOM_RESULT function (HELEMENT he, UINT appEventCode, HELEMENT heSource, UINT_PTR reason, BOOL *handled) HTMLayoutSendEvent_t;
HTMLayoutSendEvent_t HTMLayoutSendEvent;
alias HLDOM_RESULT function (HELEMENT he, UINT appEventCode, HELEMENT heSource, UINT reason) HTMLayoutPostEvent_t;
HTMLayoutPostEvent_t HTMLayoutPostEvent;
alias HLDOM_RESULT function (HELEMENT he, METHOD_PARAMS *params) HTMLayoutCallBehaviorMethod_t;
HTMLayoutCallBehaviorMethod_t HTMLayoutCallBehaviorMethod;
alias HLDOM_RESULT function (HELEMENT he, LPCWSTR url, UINT dataType, HELEMENT initiator) HTMLayoutRequestElementData_t;
HTMLayoutRequestElementData_t HTMLayoutRequestElementData;
alias HLDOM_RESULT function (HELEMENT he, LPPOINT scrollPos, LPRECT viewRect, LPSIZE contentSize) HTMLayoutGetScrollInfo_t;
HTMLayoutGetScrollInfo_t HTMLayoutGetScrollInfo;
alias HLDOM_RESULT function (HELEMENT he, POINT scrollPos, BOOL smooth) HTMLayoutSetScrollPos_t;
HTMLayoutSetScrollPos_t HTMLayoutSetScrollPos;
alias HLDOM_RESULT function (HELEMENT he, BOOL *pVisible) HTMLayoutIsElementVisible_t;
HTMLayoutIsElementVisible_t HTMLayoutIsElementVisible;
alias HLDOM_RESULT function (HELEMENT he, BOOL *pEnabled) HTMLayoutIsElementEnabled_t;
HTMLayoutIsElementEnabled_t HTMLayoutIsElementEnabled;
alias HLDOM_RESULT function (HELEMENT he, UINT firstIndex, UINT lastIndex, ELEMENT_COMPARATOR cmpFunc, LPVOID cmpFuncParam) HTMLayoutSortElements_t;
HTMLayoutSortElements_t HTMLayoutSortElements;
alias HLDOM_RESULT function (HELEMENT he1, HELEMENT he2) HTMLayoutSwapElements_t;
HTMLayoutSwapElements_t HTMLayoutSwapElements;
alias HLDOM_RESULT function (UINT evt, LPVOID eventCtlStruct, LPBOOL bOutProcessed) HTMLayoutTraverseUIEvent_t;
HTMLayoutTraverseUIEvent_t HTMLayoutTraverseUIEvent;
alias HLDOM_RESULT function (HELEMENT he, UINT *pType) HTMLayoutControlGetType_t;
HTMLayoutControlGetType_t HTMLayoutControlGetType;
alias HLDOM_RESULT function (HELEMENT he, JSON_VALUE *pVal) HTMLayoutControlGetValue_t;
HTMLayoutControlGetValue_t HTMLayoutControlGetValue;
alias HLDOM_RESULT function (HELEMENT he, JSON_VALUE *pVal) HTMLayoutControlSetValue_t;
HTMLayoutControlSetValue_t HTMLayoutControlSetValue;
alias HLDOM_RESULT function (HELEMENT he, HTMLayoutEnumerationCallback pcb, LPVOID p, BOOL forward) HTMLayoutEnumerate_t;
HTMLayoutEnumerate_t HTMLayoutEnumerate;
alias HLDOM_RESULT function (HELEMENT he, int pos, RECT *outRect) HTMLayoutGetCharacterRect_t;
HTMLayoutGetCharacterRect_t HTMLayoutGetCharacterRect;

////////////////////////////////////////////////////////////////////////////// htmlaytout

const HLN_CREATE_CONTROL	=0xAFF + 0x01 ;
const HLN_LOAD_DATA			 =0xAFF + 0x02;
const HLN_CONTROL_CREATED =0xAFF + 0x03 ;
const HLN_DATA_LOADED		 =0xAFF + 0x04;
const HLN_DOCUMENT_COMPLETE =0xAFF + 0x05 ;
const HLN_UPDATE_UI			 =0xAFF + 0x06;
const HLN_DESTROY_CONTROL =0xAFF + 0x07;
const HLN_ATTACH_BEHAVIOR =0xAFF + 0x08;
const HLN_BEHAVIOR_CHANGED =0xAFF + 0x09;
const HLN_DIALOG_CREATED =0xAFF + 0x10;
const HLN_DIALOG_CLOSE_RQ =0xAFF + 0x11;
const HLN_DOCUMENT_LOADED =0xAFF + 0x0B;

const LOAD_OK	=0;
const LOAD_DISCARD			=1;

alias LRESULT function(UINT uMsg, WPARAM wParam, LPARAM lParam, LPVOID vParam) HTMLAYOUT_NOTIFY;
alias HTMLAYOUT_NOTIFY LPHTMLAYOUT_NOTIFY;

const HWND HWND_TRY_DEFAULT			=null;
const HWND HWND_DISCARD_CREATION =cast(HWND)1;

struct NMHL_CREATE_CONTROL
{
		NMHDR		 hdr;							/**< Default WM_NOTIFY header */

		HELEMENT	helement;				 /**< [in] DOM element.*/
		HWND			inHwndParent;		 /**< [in] HWND of the HTMLayout window.*/

		HWND			outControlHwnd;	 /**< [out] HWND of control created or #HWND_TRY_DEFAULT or HWND_DISCARD_CREATION.*/
		DWORD		 reserved1;
		DWORD		 reserved2;

}

alias NMHL_CREATE_CONTROL* LPNMHL_CREATE_CONTROL;

struct NMHL_DESTROY_CONTROL
{
	/**Default WM_NOTIFY header.
	 **/
		NMHDR		 hdr;							
	/**[in] DOM element.
	 **/
		HELEMENT	helement; 
		HWND			inoutControlHwnd; 
	/**<[in/out] HWND of child to be destroyed.*/
		DWORD		 reserved1;

}

alias NMHL_DESTROY_CONTROL* LPNMHL_DESTROY_CONTROL;

struct NMHL_LOAD_DATA
{
		NMHDR		hdr;							/**< Default WM_NOTIFY header.*/
		
		LPCWSTR	uri;							/**< [in] Zero terminated string, fully qualified uri, for example "http://server/folder/file.ext".*/
		
		LPVOID	 outData;					/**< [out] pointer to loaded data .*/
		DWORD		outDataSize;			/**< [out] loaded data size.*/
		UINT		 dataType;				 /**< [in] HTMLayoutResourceType */

		HELEMENT principal;				/**< [in] element requested download, in case of context_menu:url( menu-url )
																				 it is an element for which context menu was requested */
		HELEMENT initiator;				/**< N/A */

}

alias NMHL_LOAD_DATA* LPNMHL_LOAD_DATA;

struct NMHL_DATA_LOADED
{
		NMHDR		hdr;							/**< Default WM_NOTIFY header.*/
		
		LPCWSTR	uri;							/**< [in] zero terminated string, fully qualified uri, for example "http://server/folder/file.ext".*/
		LPCBYTE	data;						 /**< [in] pointer to loaded data.*/
		DWORD		dataSize;				 /**< [in] loaded data size (in bytes). dataSize == 0 - incompatible data type, e.g. requested image but HTML returned */
		UINT		 dataType;				 /**< [in] HTMLayoutResourceType */
		UINT		 status;					 /**< [in] 
																				 status = 0 (dataSize == 0) - unknown error. 
																				 status = 100..505 - http response status, Note: 200 - OK! 
																				 status > 12000 - wininet error code, see ERROR_INTERNET_*** in wininet.h
																 */	 

}

alias NMHL_DATA_LOADED* LPNMHL_DATA_LOADED;

struct HTMLAYOUT_BEHAVIOR;

struct NMHL_ATTACH_BEHAVIOR
{
		NMHDR		hdr;							/**< Default WM_NOTIFY header.*/
		
		HELEMENT element;					/**< [in] target DOM element handle*/
		LPCSTR	 behaviorName;		 /**< [in] zero terminated string, string appears as value of CSS behavior:"???" attribute.*/
		
		ElementEventProc elementProc;		/**< [out] pointer to ElementEventProc function.*/
		LPVOID						elementTag;		 /**< [out] tag value, passed as is into pointer ElementEventProc function.*/
		UINT							elementEvents;	/**< [out] EVENT_GROUPS bit flags, event groups elementProc subscribed to. */

}

alias NMHL_ATTACH_BEHAVIOR*	LPNMHL_ATTACH_BEHAVIOR;

struct NMHL_BEHAVIOR_CHANGED
{
		NMHDR		hdr;							/**< Default WM_NOTIFY header.*/
	 
		HELEMENT element;					/**< [in] target DOM element handle*/
		LPCSTR	 oldNames;				 /**< [in] zero terminated string, whitespace separated list of old behaviors.*/
		LPCSTR	 newNames;				 /**< [in] zero terminated string, whitespace separated list of new behaviors that the element just got.*/

}

alias NMHL_BEHAVIOR_CHANGED* LPNMHL_BEHAVIOR_CHANGED;

struct NMHL_DIALOG_CLOSE_RQ
{
		NMHDR	 hdr;							/**< Default WM_NOTIFY header.*/
		BOOL		outCancel;				/**< [out] set it to non-zero for canceling close request.*/

}

alias NMHL_DIALOG_CLOSE_RQ* LPNMHL_DIALOG_CLOSE_RQ;

enum HTMLayoutResourceType 
{ 
	HLRT_DATA_HTML = 0, 
	HLRT_DATA_IMAGE = 1, 
	HLRT_DATA_STYLE = 2, 
	HLRT_DATA_CURSOR = 3,
	HLRT_DATA_SCRIPT = 4,
};

alias HTMLayoutResourceType.HLRT_DATA_HTML HLRT_DATA_HTML;
alias HTMLayoutResourceType.HLRT_DATA_IMAGE HLRT_DATA_IMAGE;
alias HTMLayoutResourceType.HLRT_DATA_STYLE HLRT_DATA_STYLE;
alias HTMLayoutResourceType.HLRT_DATA_CURSOR HLRT_DATA_CURSOR;
alias HTMLayoutResourceType.HLRT_DATA_SCRIPT HLRT_DATA_SCRIPT;

enum HTMLayoutModes 
{
	HLM_LAYOUT_ONLY = 0,				 /**< layout manager and renderer.*/
	HLM_SHOW_SELECTION = 1,			/**< layout manager and renderer + text selection and WM_COPY.*/
};

alias HTMLayoutModes.HLM_LAYOUT_ONLY HLM_LAYOUT_ONLY;
alias HTMLayoutModes.HLM_SHOW_SELECTION HLM_SHOW_SELECTION;

alias BOOL function(LPCWSTR resourceUri, LPCSTR resourceType, LPCBYTE imageData, DWORD imageDataSize) HTMLAYOUT_CALLBACK_RES;

enum ELEMENT_MODEL
{
	DATA_ELEMENT = 0,					 // data element, invisible by default - display:none.
	INLINE_TEXT_ELEMENT = 1,		// inline text, can contain text, example: <em>. Will get style display:inline. 
	INLINE_BLOCK_ELEMENT = 2,	 // inline element, contains blocks inside, example: <select>. Will get style display:inline-block. 
	BLOCK_TEXT_ELEMENT = 3,		 // block of text, can contain text, example: <p>. Will get styles display:block; width:*. 
	BLOCK_BLOCK_ELEMENT = 4,		// block of blocks, contains blocks inside, example: <div>. Will get style display:block.; width:*.	
};

alias ELEMENT_MODEL.DATA_ELEMENT DATA_ELEMENT;
alias ELEMENT_MODEL.INLINE_TEXT_ELEMENT INLINE_TEXT_ELEMENT;
alias ELEMENT_MODEL.INLINE_BLOCK_ELEMENT INLINE_BLOCK_ELEMENT;
alias ELEMENT_MODEL.BLOCK_TEXT_ELEMENT BLOCK_TEXT_ELEMENT;
alias ELEMENT_MODEL.BLOCK_BLOCK_ELEMENT BLOCK_BLOCK_ELEMENT;

enum HTMLAYOUT_OPTIONS
{
	 HTMLAYOUT_SMOOTH_SCROLL = 1, // value:TRUE - enable, value:FALSE - disable, enabled by default
	 HTMLAYOUT_CONNECTION_TIMEOUT = 2, // value: milliseconds, connection timeout of http client
	 HTMLAYOUT_HTTPS_ERROR = 3, // value: 0 - drop connection, 1 - use builtin dialog, 2 - accept connection silently
	 HTMLAYOUT_FONT_SMOOTHING = 4, // value: 0 - system default, 1 - no smoothing, 2 - std smoothing, 3 - clear type
};

alias HTMLAYOUT_OPTIONS.HTMLAYOUT_SMOOTH_SCROLL HTMLAYOUT_SMOOTH_SCROLL;
alias HTMLAYOUT_OPTIONS.HTMLAYOUT_CONNECTION_TIMEOUT HTMLAYOUT_CONNECTION_TIMEOUT;
alias HTMLAYOUT_OPTIONS.HTMLAYOUT_HTTPS_ERROR HTMLAYOUT_HTTPS_ERROR;
alias HTMLAYOUT_OPTIONS.HTMLAYOUT_FONT_SMOOTHING HTMLAYOUT_FONT_SMOOTHING;

alias LPCSTR function () HTMLayoutClassNameA_t;
HTMLayoutClassNameA_t HTMLayoutClassNameA;
alias LPCWSTR function () HTMLayoutClassNameW_t;
HTMLayoutClassNameW_t HTMLayoutClassNameW;
alias BOOL function (HWND hwnd, LPCWSTR uri, LPBYTE data, DWORD dataLength) HTMLayoutDataReady_t;
HTMLayoutDataReady_t HTMLayoutDataReady;
alias BOOL function (HWND hwnd, LPCWSTR uri, LPBYTE data, DWORD dataLength, UINT dataType) HTMLayoutDataReadyAsync_t;
HTMLayoutDataReadyAsync_t HTMLayoutDataReadyAsync;
alias LRESULT function (HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam) HTMLayoutProc_t;
HTMLayoutProc_t HTMLayoutProc;
alias LRESULT function (HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam, BOOL *pbHandled) HTMLayoutProcND_t;
HTMLayoutProcND_t HTMLayoutProcND;
alias UINT function (HWND hWndHTMLayout) HTMLayoutGetMinWidth_t;
HTMLayoutGetMinWidth_t HTMLayoutGetMinWidth;
alias UINT function (HWND hWndHTMLayout, UINT width) HTMLayoutGetMinHeight_t;
HTMLayoutGetMinHeight_t HTMLayoutGetMinHeight;
alias BOOL function (HWND hWndHTMLayout, LPCWSTR filename) HTMLayoutLoadFile_t;
HTMLayoutLoadFile_t HTMLayoutLoadFile;
alias BOOL function (HWND hWndHTMLayout, LPCBYTE html, UINT htmlSize) HTMLayoutLoadHtml_t;
HTMLayoutLoadHtml_t HTMLayoutLoadHtml;
alias BOOL function (HWND hWndHTMLayout, LPCBYTE html, UINT htmlSize, LPCWSTR baseUrl) HTMLayoutLoadHtmlEx_t;
HTMLayoutLoadHtmlEx_t HTMLayoutLoadHtmlEx;
alias VOID function (HWND hWndHTMLayout, int HTMLayoutMode) HTMLayoutSetMode_t;
HTMLayoutSetMode_t HTMLayoutSetMode;
alias VOID function (HWND hWndHTMLayout, LPHTMLAYOUT_NOTIFY cb, LPVOID cbParam) HTMLayoutSetCallback_t;
HTMLayoutSetCallback_t HTMLayoutSetCallback;
alias BOOL function (HWND hWndHTMLayout) HTMLayoutSelectionExist_t;
HTMLayoutSelectionExist_t HTMLayoutSelectionExist;
alias LPCBYTE function (HWND hWndHTMLayout, LPUINT pSize) HTMLayoutGetSelectedHTML_t;
HTMLayoutGetSelectedHTML_t HTMLayoutGetSelectedHTML;
alias BOOL function (HWND hWndHTMLayout) HTMLayoutClipboardCopy_t;
HTMLayoutClipboardCopy_t HTMLayoutClipboardCopy;
alias UINT function (HWND hWndHTMLayout, HTMLAYOUT_CALLBACK_RES cb) HTMLayoutEnumResources_t;
HTMLayoutEnumResources_t HTMLayoutEnumResources;
alias BOOL function (LPCBYTE utf8, UINT numBytes) HTMLayoutSetMasterCSS_t;
HTMLayoutSetMasterCSS_t HTMLayoutSetMasterCSS;
alias BOOL function (LPCBYTE utf8, UINT numBytes) HTMLayoutAppendMasterCSS_t;
HTMLayoutAppendMasterCSS_t HTMLayoutAppendMasterCSS;
alias BOOL function (HWND hWndHTMLayout, LPCBYTE utf8, UINT numBytes, LPCWSTR baseUrl, LPCWSTR mediaType) HTMLayoutSetCSS_t;
HTMLayoutSetCSS_t HTMLayoutSetCSS;
alias BOOL function (HWND hWndHTMLayout, LPCWSTR mediaType) HTMLayoutSetMediaType_t;
HTMLayoutSetMediaType_t HTMLayoutSetMediaType;
alias BOOL function (HWND hWndHTMLayout, LPCSTR httpHeaders, UINT httpHeadersLength) HTMLayoutSetHttpHeaders_t;
HTMLayoutSetHttpHeaders_t HTMLayoutSetHttpHeaders;
alias BOOL function (HWND hWndHTMLayout, HBITMAP hBmp, RECT area) HTMLayoutRender_t;
HTMLayoutRender_t HTMLayoutRender;
alias INT_PTR function (HWND hWndParent, POINT position, INT alignment, UINT style, UINT styleEx, LPHTMLAYOUT_NOTIFY notificationCallback, LPELEMENT_EVENT_PROC eventsCallback, LPVOID callbackParam, LPCBYTE html, UINT htmlLength) HTMLayoutDialog_t;
HTMLayoutDialog_t HTMLayoutDialog;

////////////////////////////////////////////////////////////////////////////// htmlite

const HLN_REFRESH_AREA	 =0xAFF + 0x20;
const HLN_SET_TIMER	 =0xAFF + 0x21;
const HLN_SET_CURSOR	 =0xAFF + 0x22;

struct NMHL_REFRESH_AREA
{
		NMHDR		 hdr;							/**< Default WM_NOTIFY header, only code field is used in HTMLite */
		RECT			area;						 /**< [in] area to refresh.*/
}

alias NMHL_REFRESH_AREA* LPNMHL_REFRESH_AREA;

struct NMHL_SET_TIMER
{
		NMHDR		 hdr;							/**< Default WM_NOTIFY header, only code field is used in HTMLite */
		UINT_PTR	timerId;					/**< [in] id of the timer event.*/
		UINT			elapseTime;			 /**< [in] elapseTime of the timer event, milliseconds. 
																					If it is 0 then this timer has to be stoped. */
}

alias NMHL_SET_TIMER* LPNMHL_SET_TIMER;

struct NMHL_SET_CURSOR
{
		NMHDR		 hdr;							/**< Default WM_NOTIFY header, only code field is used in HTMLite */
		UINT			cursorId;				 /**< [in] id of the cursor, .*/
}

alias NMHL_SET_CURSOR* LPNMHL_SET_CURSOR;

alias void* HTMLITE;

enum HPRESULT
{
	HPR_OK = 0,
	HPR_INVALID_HANDLE,
	HPR_INVALID_FORMAT,
	HPR_FILE_NOT_FOUND,
	HPR_INVALID_PARAMETER,
	HPR_INVALID_STATE, // attempt to do operation on empty document
}

alias HPRESULT.HPR_OK HPR_OK;
alias HPRESULT.HPR_INVALID_HANDLE HPR_INVALID_HANDLE;
alias HPRESULT.HPR_INVALID_FORMAT HPR_INVALID_FORMAT;
alias HPRESULT.HPR_FILE_NOT_FOUND HPR_FILE_NOT_FOUND;
alias HPRESULT.HPR_INVALID_PARAMETER HPR_INVALID_PARAMETER;
alias HPRESULT.HPR_INVALID_STATE HPR_INVALID_STATE;

enum FOCUS_ADVANCE_CMD 
{
	FOCUS_NEXT = 0,
	FOCUS_PREV = 1,
	FOCUS_HOME = 2,
	FOCUS_END = 3,
};

alias FOCUS_ADVANCE_CMD.FOCUS_NEXT FOCUS_NEXT;
alias FOCUS_ADVANCE_CMD.FOCUS_PREV FOCUS_PREV;
alias FOCUS_ADVANCE_CMD.FOCUS_HOME FOCUS_HOME;
alias FOCUS_ADVANCE_CMD.FOCUS_END FOCUS_END;

alias NMHDR* LPNMHDR;

alias UINT function (HTMLITE hLite, LPNMHDR hdr) HTMLITE_CALLBACK;

alias HTMLITE function () HTMLiteCreateInstance_t;
HTMLiteCreateInstance_t HTMLiteCreateInstance;
alias HPRESULT function (HTMLITE hLite) HTMLiteDestroyInstance_t;
HTMLiteDestroyInstance_t HTMLiteDestroyInstance;
alias HPRESULT function (HTMLITE hLite, LPVOID tag) HTMLiteSetTag_t;
HTMLiteSetTag_t HTMLiteSetTag;
alias HPRESULT function (HTMLITE hLite, LPVOID *tag) HTMLiteGetTag_t;
HTMLiteGetTag_t HTMLiteGetTag;
alias HPRESULT function (HTMLITE hLite, LPCWSTR path) HTMLiteLoadHtmlFromFile_t;
HTMLiteLoadHtmlFromFile_t HTMLiteLoadHtmlFromFile;
alias HPRESULT function (HTMLITE hLite, LPCWSTR baseURI, BYTE* dataptr, DWORD datasize) HTMLiteLoadHtmlFromMemory_t;
HTMLiteLoadHtmlFromMemory_t HTMLiteLoadHtmlFromMemory;
alias HPRESULT function (HTMLITE hLite, INT viewWidth, INT viewHeight) HTMLiteMeasure_t;
HTMLiteMeasure_t HTMLiteMeasure;
alias HPRESULT function (HTMLITE hLite, HDC hdc, INT x, INT y, INT sx, INT sy) HTMLiteRender_t;
HTMLiteRender_t HTMLiteRender;
alias HPRESULT function (HTMLITE hLite, HBITMAP hbmp, INT x, INT y, INT sx, INT sy) HTMLiteRenderOnBitmap_t;
HTMLiteRenderOnBitmap_t HTMLiteRenderOnBitmap;
alias HPRESULT function (HTMLITE hLite, LPCSTR url, BYTE* data, DWORD dataSize) HTMLiteSetDataReady_t;
HTMLiteSetDataReady_t HTMLiteSetDataReady;
alias HPRESULT function (HTMLITE hLite, LPINT v) HTMLiteGetDocumentMinWidth_t;
HTMLiteGetDocumentMinWidth_t HTMLiteGetDocumentMinWidth;
alias HPRESULT function (HTMLITE hLite, LPINT v) HTMLiteGetDocumentMinHeight_t;
HTMLiteGetDocumentMinHeight_t HTMLiteGetDocumentMinHeight;
alias HPRESULT function (HTMLITE hLite, LPCSTR mediatype) HTMLiteSetMediaType_t;
HTMLiteSetMediaType_t HTMLiteSetMediaType;
alias HPRESULT function (HTMLITE hLite, HELEMENT *phe) HTMLiteGetRootElement_t;
HTMLiteGetRootElement_t HTMLiteGetRootElement;
alias HPRESULT function (HTMLITE hLite, INT x, INT y, HELEMENT *phe) HTMLiteFindElement_t;
HTMLiteFindElement_t HTMLiteFindElement;
alias HPRESULT function (HTMLITE hLite, HTMLITE_CALLBACK cb) HTMLiteSetCallback_t;
HTMLiteSetCallback_t HTMLiteSetCallback;
alias HPRESULT function(HTMLITE hLite, UINT where, BOOL* pRes ) HTMLiteAdvanceFocus_t;
HTMLiteAdvanceFocus_t HTMLiteAdvanceFocus;
alias HPRESULT function(HTMLITE hLite, UINT evt, LPVOID eventCtlStruct, LPBOOL bOutProcessed ) HTMLiteTraverseUIEvent_t;
HTMLiteTraverseUIEvent_t HTMLiteTraverseUIEvent;

alias HLDOM_RESULT function( HELEMENT he, LPELEMENT_EVENT_PROC pep, LPVOID tag ) HTMLayoutDetachEventHandler_t;
HTMLayoutDetachEventHandler_t HTMLayoutDetachEventHandler;
alias HLDOM_RESULT function( HWND hwndLayout, LPELEMENT_EVENT_PROC pep, LPVOID tag ) HTMLayoutWindowDetachEventHandler_t;
HTMLayoutWindowDetachEventHandler_t HTMLayoutWindowDetachEventHandler;
alias HLDOM_RESULT function( HELEMENT he, HRANGE* pRange, BOOL outer ) HTMLayoutRangeCreate_t;
HTMLayoutRangeCreate_t HTMLayoutRangeCreate;
alias HLDOM_RESULT function( HELEMENT he, HRANGE* pRange ) HTMLayoutRangeFromSelection_t;
HTMLayoutRangeFromSelection_t HTMLayoutRangeFromSelection;
alias HLDOM_RESULT function( HELEMENT he, HPOSITION* pStart, HPOSITION* pEnd ) HTMLayoutRangeFromPositions_t;
HTMLayoutRangeFromPositions_t HTMLayoutRangeFromPositions;
alias HLDOM_RESULT function( HRANGE range ) HTMLayoutRangeRelease_t;
HTMLayoutRangeRelease_t HTMLayoutRangeRelease;
alias HLDOM_RESULT function( HRANGE range, UINT cmd, INT* c, HPOSITION* pPos ) HTMLayoutRangeAdvancePos_t;
HTMLayoutRangeAdvancePos_t HTMLayoutRangeAdvancePos;
alias HLDOM_RESULT function( HRANGE range, LPBYTE* pHtmlUtf8Bytes, UINT* numBytes ) HTMLayoutRangeToHtml_t;
HTMLayoutRangeToHtml_t HTMLayoutRangeToHtml;
alias HLDOM_RESULT function( HRANGE range, LPBYTE htmlUtf8Bytes, UINT numBytes ) HTMLayoutRangeReplace_t;
HTMLayoutRangeReplace_t HTMLayoutRangeReplace;
alias HLDOM_RESULT function( HPOSITION* pPos, LPBYTE htmlUtf8Bytes, UINT numBytes ) HTMLayoutRangeInsertHtml_t;
HTMLayoutRangeInsertHtml_t HTMLayoutRangeInsertHtml;
alias HLDOM_RESULT function( HRANGE range, BOOL* pResult ) HTMLayoutRangeIsEmpty_t;
HTMLayoutRangeIsEmpty_t HTMLayoutRangeIsEmpty;
alias BOOL function(HWND hWndHTMLayout, UINT option, UINT value ) HTMLayoutSetOption_t;
HTMLayoutSetOption_t HTMLayoutSetOption;
alias BOOL function(LPCSTR name, UINT/*ELEMENT_MODEL*/ elementModel) HTMLayoutDeclareElementType_t;
HTMLayoutDeclareElementType_t HTMLayoutDeclareElementType;

////////////////////////////////////////////////////////////////////////////// import symbols

import flowerd.sharedlib;

bool loadHTMLayout(char[] name=null,void[] data=null)
{
	scope SharedLib dll;
	if(name is null) name="htmlayout.dll";
	if(data is null) dll=SharedLib(name);
	else dll=SharedLib(name,data);
	if(dll is null) return false;

	HTMLayout_UseElement=cast(HTMLayout_UseElement_t)dll.symbol("HTMLayout_UseElement\0");
	HTMLayout_UnuseElement=cast(HTMLayout_UnuseElement_t)dll.symbol("HTMLayout_UnuseElement\0");
	HTMLayoutGetRootElement=cast(HTMLayoutGetRootElement_t)dll.symbol("HTMLayoutGetRootElement\0");
	HTMLayoutGetFocusElement=cast(HTMLayoutGetFocusElement_t)dll.symbol("HTMLayoutGetFocusElement\0");
	HTMLayoutFindElement=cast(HTMLayoutFindElement_t)dll.symbol("HTMLayoutFindElement\0");
	HTMLayoutGetChildrenCount=cast(HTMLayoutGetChildrenCount_t)dll.symbol("HTMLayoutGetChildrenCount\0");
	HTMLayoutGetNthChild=cast(HTMLayoutGetNthChild_t)dll.symbol("HTMLayoutGetNthChild\0");
	HTMLayoutGetParentElement=cast(HTMLayoutGetParentElement_t)dll.symbol("HTMLayoutGetParentElement\0");
	HTMLayoutGetElementText=cast(HTMLayoutGetElementText_t)dll.symbol("HTMLayoutGetElementText\0");
	HTMLayoutGetElementHtml=cast(HTMLayoutGetElementHtml_t)dll.symbol("HTMLayoutGetElementHtml\0");
	HTMLayoutGetElementInnerText=cast(HTMLayoutGetElementInnerText_t)dll.symbol("HTMLayoutGetElementInnerText\0");
	HTMLayoutSetElementInnerText=cast(HTMLayoutSetElementInnerText_t)dll.symbol("HTMLayoutSetElementInnerText\0");
	HTMLayoutGetElementInnerText16=cast(HTMLayoutGetElementInnerText16_t)dll.symbol("HTMLayoutGetElementInnerText16\0");
	HTMLayoutSetElementInnerText16=cast(HTMLayoutSetElementInnerText16_t)dll.symbol("HTMLayoutSetElementInnerText16\0");
	HTMLayoutGetAttributeCount=cast(HTMLayoutGetAttributeCount_t)dll.symbol("HTMLayoutGetAttributeCount\0");
	HTMLayoutGetNthAttribute=cast(HTMLayoutGetNthAttribute_t)dll.symbol("HTMLayoutGetNthAttribute\0");
	HTMLayoutGetAttributeByName=cast(HTMLayoutGetAttributeByName_t)dll.symbol("HTMLayoutGetAttributeByName\0");
	HTMLayoutSetAttributeByName=cast(HTMLayoutSetAttributeByName_t)dll.symbol("HTMLayoutSetAttributeByName\0");
	HTMLayoutClearAttributes=cast(HTMLayoutClearAttributes_t)dll.symbol("HTMLayoutClearAttributes\0");
	HTMLayoutGetElementIndex=cast(HTMLayoutGetElementIndex_t)dll.symbol("HTMLayoutGetElementIndex\0");
	HTMLayoutGetElementType=cast(HTMLayoutGetElementType_t)dll.symbol("HTMLayoutGetElementType\0");
	HTMLayoutGetStyleAttribute=cast(HTMLayoutGetStyleAttribute_t)dll.symbol("HTMLayoutGetStyleAttribute\0");
	HTMLayoutSetStyleAttribute=cast(HTMLayoutSetStyleAttribute_t)dll.symbol("HTMLayoutSetStyleAttribute\0");
	HTMLayoutUpdateElement=cast(HTMLayoutUpdateElement_t)dll.symbol("HTMLayoutUpdateElement\0");
	HTMLayoutUpdateElementEx=cast(HTMLayoutUpdateElementEx_t)dll.symbol("HTMLayoutUpdateElementEx\0");
	HTMLayoutSetCapture=cast(HTMLayoutSetCapture_t)dll.symbol("HTMLayoutSetCapture\0");
	HTMLayoutGetElementHwnd=cast(HTMLayoutGetElementHwnd_t)dll.symbol("HTMLayoutGetElementHwnd\0");
	HTMLayoutCombineURL=cast(HTMLayoutCombineURL_t)dll.symbol("HTMLayoutCombineURL\0");
	HTMLayoutVisitElements=cast(HTMLayoutVisitElements_t)dll.symbol("HTMLayoutVisitElements\0");
	HTMLayoutSelectElements=cast(HTMLayoutSelectElements_t)dll.symbol("HTMLayoutSelectElements\0");
	HTMLayoutSelectParent=cast(HTMLayoutSelectParent_t)dll.symbol("HTMLayoutSelectParent\0");
	HTMLayoutSetElementHtml=cast(HTMLayoutSetElementHtml_t)dll.symbol("HTMLayoutSetElementHtml\0");
	HTMLayoutDeleteElement=cast(HTMLayoutDeleteElement_t)dll.symbol("HTMLayoutDeleteElement\0");
	HTMLayoutGetElementUID=cast(HTMLayoutGetElementUID_t)dll.symbol("HTMLayoutGetElementUID\0");
	HTMLayoutGetElementByUID=cast(HTMLayoutGetElementByUID_t)dll.symbol("HTMLayoutGetElementByUID\0");
	HTMLayoutShowPopup=cast(HTMLayoutShowPopup_t)dll.symbol("HTMLayoutShowPopup\0");
	HTMLayoutShowPopupAt=cast(HTMLayoutShowPopupAt_t)dll.symbol("HTMLayoutShowPopupAt\0");
	HTMLayoutHidePopup=cast(HTMLayoutHidePopup_t)dll.symbol("HTMLayoutHidePopup\0");
	HTMLayoutGetElementState=cast(HTMLayoutGetElementState_t)dll.symbol("HTMLayoutGetElementState\0");
	HTMLayoutCreateElement=cast(HTMLayoutCreateElement_t)dll.symbol("HTMLayoutCreateElement\0");
	HTMLayoutCloneElement=cast(HTMLayoutCloneElement_t)dll.symbol("HTMLayoutCloneElement\0");
	HTMLayoutInsertElement=cast(HTMLayoutInsertElement_t)dll.symbol("HTMLayoutInsertElement\0");
	HTMLayoutDetachElement=cast(HTMLayoutDetachElement_t)dll.symbol("HTMLayoutDetachElement\0");
	HTMLayoutSetTimer=cast(HTMLayoutSetTimer_t)dll.symbol("HTMLayoutSetTimer\0");
	HTMLayoutAttachEventHandler=cast(HTMLayoutAttachEventHandler_t)dll.symbol("HTMLayoutAttachEventHandler\0");
	HTMLayoutAttachEventHandlerEx=cast(HTMLayoutAttachEventHandlerEx_t)dll.symbol("HTMLayoutAttachEventHandlerEx\0");
	HTMLayoutWindowAttachEventHandler=cast(HTMLayoutWindowAttachEventHandler_t)dll.symbol("HTMLayoutWindowAttachEventHandler\0");
	HTMLayoutSendEvent=cast(HTMLayoutSendEvent_t)dll.symbol("HTMLayoutSendEvent\0");
	HTMLayoutPostEvent=cast(HTMLayoutPostEvent_t)dll.symbol("HTMLayoutPostEvent\0");
	HTMLayoutCallBehaviorMethod=cast(HTMLayoutCallBehaviorMethod_t)dll.symbol("HTMLayoutCallBehaviorMethod\0");
	HTMLayoutRequestElementData=cast(HTMLayoutRequestElementData_t)dll.symbol("HTMLayoutRequestElementData\0");
	HTMLayoutGetScrollInfo=cast(HTMLayoutGetScrollInfo_t)dll.symbol("HTMLayoutGetScrollInfo\0");
	HTMLayoutSetScrollPos=cast(HTMLayoutSetScrollPos_t)dll.symbol("HTMLayoutSetScrollPos\0");
	HTMLayoutIsElementVisible=cast(HTMLayoutIsElementVisible_t)dll.symbol("HTMLayoutIsElementVisible\0");
	HTMLayoutIsElementEnabled=cast(HTMLayoutIsElementEnabled_t)dll.symbol("HTMLayoutIsElementEnabled\0");
	HTMLayoutSortElements=cast(HTMLayoutSortElements_t)dll.symbol("HTMLayoutSortElements\0");
	HTMLayoutSwapElements=cast(HTMLayoutSwapElements_t)dll.symbol("HTMLayoutSwapElements\0");
	HTMLayoutTraverseUIEvent=cast(HTMLayoutTraverseUIEvent_t)dll.symbol("HTMLayoutTraverseUIEvent\0");
	HTMLayoutControlGetType=cast(HTMLayoutControlGetType_t)dll.symbol("HTMLayoutControlGetType\0");
	HTMLayoutControlGetValue=cast(HTMLayoutControlGetValue_t)dll.symbol("HTMLayoutControlGetValue\0");
	HTMLayoutControlSetValue=cast(HTMLayoutControlSetValue_t)dll.symbol("HTMLayoutControlSetValue\0");
	HTMLayoutEnumerate=cast(HTMLayoutEnumerate_t)dll.symbol("HTMLayoutEnumerate\0");
	HTMLayoutGetCharacterRect=cast(HTMLayoutGetCharacterRect_t)dll.symbol("HTMLayoutGetCharacterRect\0");
	HTMLayoutClassNameA=cast(HTMLayoutClassNameA_t)dll.symbol("HTMLayoutClassNameA\0");
	HTMLayoutClassNameW=cast(HTMLayoutClassNameW_t)dll.symbol("HTMLayoutClassNameW\0");
	HTMLayoutDataReady=cast(HTMLayoutDataReady_t)dll.symbol("HTMLayoutDataReady\0");
	HTMLayoutDataReadyAsync=cast(HTMLayoutDataReadyAsync_t)dll.symbol("HTMLayoutDataReadyAsync\0");
	HTMLayoutProc=cast(HTMLayoutProc_t)dll.symbol("HTMLayoutProc\0");
	HTMLayoutProcND=cast(HTMLayoutProcND_t)dll.symbol("HTMLayoutProcND\0");
	HTMLayoutGetMinWidth=cast(HTMLayoutGetMinWidth_t)dll.symbol("HTMLayoutGetMinWidth\0");
	HTMLayoutGetMinHeight=cast(HTMLayoutGetMinHeight_t)dll.symbol("HTMLayoutGetMinHeight\0");
	HTMLayoutLoadFile=cast(HTMLayoutLoadFile_t)dll.symbol("HTMLayoutLoadFile\0");
	HTMLayoutLoadHtml=cast(HTMLayoutLoadHtml_t)dll.symbol("HTMLayoutLoadHtml\0");
	HTMLayoutLoadHtmlEx=cast(HTMLayoutLoadHtmlEx_t)dll.symbol("HTMLayoutLoadHtmlEx\0");
	HTMLayoutSetMode=cast(HTMLayoutSetMode_t)dll.symbol("HTMLayoutSetMode\0");
	HTMLayoutSetCallback=cast(HTMLayoutSetCallback_t)dll.symbol("HTMLayoutSetCallback\0");
	HTMLayoutSelectionExist=cast(HTMLayoutSelectionExist_t)dll.symbol("HTMLayoutSelectionExist\0");
	HTMLayoutGetSelectedHTML=cast(HTMLayoutGetSelectedHTML_t)dll.symbol("HTMLayoutGetSelectedHTML\0");
	HTMLayoutClipboardCopy=cast(HTMLayoutClipboardCopy_t)dll.symbol("HTMLayoutClipboardCopy\0");
	HTMLayoutEnumResources=cast(HTMLayoutEnumResources_t)dll.symbol("HTMLayoutEnumResources\0");
	HTMLayoutSetMasterCSS=cast(HTMLayoutSetMasterCSS_t)dll.symbol("HTMLayoutSetMasterCSS\0");
	HTMLayoutSetCSS=cast(HTMLayoutSetCSS_t)dll.symbol("HTMLayoutSetCSS\0");
	HTMLayoutSetMediaType=cast(HTMLayoutSetMediaType_t)dll.symbol("HTMLayoutSetMediaType\0");
	HTMLayoutSetHttpHeaders=cast(HTMLayoutSetHttpHeaders_t)dll.symbol("HTMLayoutSetHttpHeaders\0");
	HTMLayoutRender=cast(HTMLayoutRender_t)dll.symbol("HTMLayoutRender\0");
	HTMLayoutDialog=cast(HTMLayoutDialog_t)dll.symbol("HTMLayoutDialog\0");
	HTMLiteCreateInstance=cast(HTMLiteCreateInstance_t)dll.symbol("HTMLiteCreateInstance\0");
	HTMLiteDestroyInstance=cast(HTMLiteDestroyInstance_t)dll.symbol("HTMLiteDestroyInstance\0");
	HTMLiteSetTag=cast(HTMLiteSetTag_t)dll.symbol("HTMLiteSetTag\0");
	HTMLiteGetTag=cast(HTMLiteGetTag_t)dll.symbol("HTMLiteGetTag\0");
	HTMLiteLoadHtmlFromFile=cast(HTMLiteLoadHtmlFromFile_t)dll.symbol("HTMLiteLoadHtmlFromFile\0");
	HTMLiteLoadHtmlFromMemory=cast(HTMLiteLoadHtmlFromMemory_t)dll.symbol("HTMLiteLoadHtmlFromMemory\0");
	HTMLiteMeasure=cast(HTMLiteMeasure_t)dll.symbol("HTMLiteMeasure\0");
	HTMLiteRender=cast(HTMLiteRender_t)dll.symbol("HTMLiteRender\0");
	HTMLiteRenderOnBitmap=cast(HTMLiteRenderOnBitmap_t)dll.symbol("HTMLiteRenderOnBitmap\0");
	HTMLiteSetDataReady=cast(HTMLiteSetDataReady_t)dll.symbol("HTMLiteSetDataReady\0");
	HTMLiteGetDocumentMinWidth=cast(HTMLiteGetDocumentMinWidth_t)dll.symbol("HTMLiteGetDocumentMinWidth\0");
	HTMLiteGetDocumentMinHeight=cast(HTMLiteGetDocumentMinHeight_t)dll.symbol("HTMLiteGetDocumentMinHeight\0");
	HTMLiteSetMediaType=cast(HTMLiteSetMediaType_t)dll.symbol("HTMLiteSetMediaType\0");
	HTMLiteGetRootElement=cast(HTMLiteGetRootElement_t)dll.symbol("HTMLiteGetRootElement\0");
	HTMLiteFindElement=cast(HTMLiteFindElement_t)dll.symbol("HTMLiteFindElement\0");
	HTMLiteSetCallback=cast(HTMLiteSetCallback_t)dll.symbol("HTMLiteSetCallback\0");
	HTMLiteAdvanceFocus=cast(HTMLiteAdvanceFocus_t)dll.symbol("HTMLiteAdvanceFocus\0");
	HTMLiteTraverseUIEvent=cast(HTMLiteTraverseUIEvent_t)dll.symbol("HTMLiteTraverseUIEvent\0");
	HTMLayoutSetElementState=cast(HTMLayoutSetElementState_t)dll.symbol("HTMLayoutSetElementState\0");
	HTMLayoutDetachEventHandler=cast(HTMLayoutDetachEventHandler_t)dll.symbol("HTMLayoutDetachEventHandler\0");
	HTMLayoutWindowDetachEventHandler=cast(HTMLayoutWindowDetachEventHandler_t)dll.symbol("HTMLayoutWindowDetachEventHandler\0");
	HTMLayoutRangeCreate=cast(HTMLayoutRangeCreate_t)dll.symbol("HTMLayoutRangeCreate\0");
	HTMLayoutRangeFromSelection=cast(HTMLayoutRangeFromSelection_t)dll.symbol("HTMLayoutRangeFromSelection\0");
	HTMLayoutRangeFromPositions=cast(HTMLayoutRangeFromPositions_t)dll.symbol("HTMLayoutRangeFromPositions\0");
	HTMLayoutRangeRelease=cast(HTMLayoutRangeRelease_t)dll.symbol("HTMLayoutRangeRelease\0");
	HTMLayoutRangeAdvancePos=cast(HTMLayoutRangeAdvancePos_t)dll.symbol("HTMLayoutRangeAdvancePos\0");
	HTMLayoutRangeToHtml=cast(HTMLayoutRangeToHtml_t)dll.symbol("HTMLayoutRangeToHtml\0");
	HTMLayoutRangeReplace=cast(HTMLayoutRangeReplace_t)dll.symbol("HTMLayoutRangeReplace\0");
	HTMLayoutRangeInsertHtml=cast(HTMLayoutRangeInsertHtml_t)dll.symbol("HTMLayoutRangeInsertHtml\0");
	HTMLayoutRangeIsEmpty=cast(HTMLayoutRangeIsEmpty_t)dll.symbol("HTMLayoutRangeIsEmpty\0");
	HTMLayoutSetOption=cast(HTMLayoutSetOption_t)dll.symbol("HTMLayoutSetOption\0");
	HTMLayoutDeclareElementType=cast(HTMLayoutDeclareElementType_t)dll.symbol("HTMLayoutDeclareElementType\0");
	HTMLayoutAppendMasterCSS=cast(HTMLayoutAppendMasterCSS_t)dll.symbol("HTMLayoutAppendMasterCSS\0");
	HTMLayoutScrollToView=cast(HTMLayoutScrollToView_t)dll.symbol("HTMLayoutScrollToView\0");
	HTMLayoutElementSetExpando=cast(HTMLayoutElementSetExpando_t)dll.symbol("HTMLayoutElementSetExpando\0");
	HTMLayoutElementGetExpando=cast(HTMLayoutElementGetExpando_t)dll.symbol("HTMLayoutElementGetExpando\0");
	HTMLayoutParseValue=cast(HTMLayoutParseValue_t)dll.symbol("HTMLayoutParseValue\0");
	HTMLayoutGetGraphin=cast(HTMLayoutGetGraphin_t)dll.symbol("HTMLayoutGetGraphin\0");
	HTMLayoutRenderElement=cast(HTMLayoutRenderElement_t)dll.symbol("HTMLayoutRenderElement\0");
	HTMLayoutGetElementLocation=cast(HTMLayoutGetElementLocation_t)dll.symbol("HTMLayoutGetElementLocation\0");

	return true;
}
version (build) {
    debug {
        pragma(link, "debug-htmlayout");
    } else {
        pragma(link, "htmlayout");
    }
}
