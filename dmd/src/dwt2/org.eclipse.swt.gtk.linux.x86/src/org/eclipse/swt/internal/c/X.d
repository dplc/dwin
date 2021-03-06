/******************************************************************************
    Based on the generated files from the BCD tool
    modified by: Frank Benoit <keinfarbton@googlemail.com>
******************************************************************************/
module org.eclipse.swt.internal.c.X;

import java.lang.all;

extern(C):
align(4):

const int X_PROTOCOL = 11;
const int X_PROTOCOL_REVISION = 0;
const int None = 0;
const int ParentRelative = 1;
const int CopyFromParent = 0;
const int PointerWindow = 0;
const int InputFocus = 1;
const int PointerRoot = 1;
const int AnyPropertyType = 0;
const int AnyKey = 0;
const int AnyButton = 0;
const int AllTemporary = 0;
const int CurrentTime = 0;
const int NoSymbol = 0;
const int NoEventMask = 0;
const int KeyPress = 2;
const int KeyRelease = 3;
const int ButtonPress = 4;
const int ButtonRelease = 5;
const int MotionNotify = 6;
const int EnterNotify = 7;
const int LeaveNotify = 8;
const int FocusIn = 9;
const int FocusOut = 10;
const int KeymapNotify = 11;
const int Expose = 12;
const int GraphicsExpose = 13;
const int NoExpose = 14;
const int VisibilityNotify = 15;
const int CreateNotify = 16;
const int DestroyNotify = 17;
const int UnmapNotify = 18;
const int MapNotify = 19;
const int MapRequest = 20;
const int ReparentNotify = 21;
const int ConfigureNotify = 22;
const int ConfigureRequest = 23;
const int GravityNotify = 24;
const int ResizeRequest = 25;
const int CirculateNotify = 26;
const int CirculateRequest = 27;
const int PropertyNotify = 28;
const int SelectionClear = 29;
const int SelectionRequest = 30;
const int SelectionNotify = 31;
const int ColormapNotify = 32;
const int ClientMessage = 33;
const int MappingNotify = 34;
const int LASTEvent = 35;
const int ShiftMapIndex = 0;
const int LockMapIndex = 1;
const int ControlMapIndex = 2;
const int Mod1MapIndex = 3;
const int Mod2MapIndex = 4;
const int Mod3MapIndex = 5;
const int Mod4MapIndex = 6;
const int Mod5MapIndex = 7;
const int Button1 = 1;
const int Button2 = 2;
const int Button3 = 3;
const int Button4 = 4;
const int Button5 = 5;
const int NotifyNormal = 0;
const int NotifyGrab = 1;
const int NotifyUngrab = 2;
const int NotifyWhileGrabbed = 3;
const int NotifyHint = 1;
const int NotifyAncestor = 0;
const int NotifyVirtual = 1;
const int NotifyInferior = 2;
const int NotifyNonlinear = 3;
const int NotifyNonlinearVirtual = 4;
const int NotifyPointer = 5;
const int NotifyPointerRoot = 6;
const int NotifyDetailNone = 7;
const int VisibilityUnobscured = 0;
const int VisibilityPartiallyObscured = 1;
const int VisibilityFullyObscured = 2;
const int PlaceOnTop = 0;
const int PlaceOnBottom = 1;
const int FamilyInternet = 0;
const int FamilyDECnet = 1;
const int FamilyChaos = 2;
const int FamilyInternet6 = 6;
const int FamilyServerInterpreted = 5;
const int PropertyNewValue = 0;
const int PropertyDelete = 1;
const int ColormapUninstalled = 0;
const int ColormapInstalled = 1;
const int GrabModeSync = 0;
const int GrabModeAsync = 1;
const int GrabSuccess = 0;
const int AlreadyGrabbed = 1;
const int GrabInvalidTime = 2;
const int GrabNotViewable = 3;
const int GrabFrozen = 4;
const int AsyncPointer = 0;
const int SyncPointer = 1;
const int ReplayPointer = 2;
const int AsyncKeyboard = 3;
const int SyncKeyboard = 4;
const int ReplayKeyboard = 5;
const int AsyncBoth = 6;
const int SyncBoth = 7;
const int RevertToParent = 2;
const int Success = 0;
const int BadRequest = 1;
const int BadValue = 2;
const int BadWindow = 3;
const int BadPixmap = 4;
const int BadAtom = 5;
const int BadCursor = 6;
const int BadFont = 7;
const int BadMatch = 8;
const int BadDrawable = 9;
const int BadAccess = 10;
const int BadAlloc = 11;
const int BadColor = 12;
const int BadGC = 13;
const int BadIDChoice = 14;
const int BadName = 15;
const int BadLength = 16;
const int BadImplementation = 17;
const int FirstExtensionError = 128;
const int LastExtensionError = 255;
const int InputOutput = 1;
const int InputOnly = 2;
const int ForgetGravity = 0;
const int NorthWestGravity = 1;
const int NorthGravity = 2;
const int NorthEastGravity = 3;
const int WestGravity = 4;
const int CenterGravity = 5;
const int EastGravity = 6;
const int SouthWestGravity = 7;
const int SouthGravity = 8;
const int SouthEastGravity = 9;
const int StaticGravity = 10;
const int UnmapGravity = 0;
const int NotUseful = 0;
const int WhenMapped = 1;
const int Always = 2;
const int IsUnmapped = 0;
const int IsUnviewable = 1;
const int IsViewable = 2;
const int SetModeInsert = 0;
const int SetModeDelete = 1;
const int DestroyAll = 0;
const int RetainPermanent = 1;
const int RetainTemporary = 2;
const int Above = 0;
const int Below = 1;
const int TopIf = 2;
const int BottomIf = 3;
const int Opposite = 4;
const int RaiseLowest = 0;
const int LowerHighest = 1;
const int PropModeReplace = 0;
const int PropModePrepend = 1;
const int PropModeAppend = 2;
const int GXclear = 0x0;
const int GXand = 0x1;
const int GXandReverse = 0x2;
const int GXcopy = 0x3;
const int GXandInverted = 0x4;
const int GXnoop = 0x5;
const int GXxor = 0x6;
const int GXor = 0x7;
const int GXnor = 0x8;
const int GXequiv = 0x9;
const int GXinvert = 0xa;
const int GXorReverse = 0xb;
const int GXcopyInverted = 0xc;
const int GXorInverted = 0xd;
const double GXnand = 0xe;
const int GXset = 0xf;
const int LineSolid = 0;
const int LineOnOffDash = 1;
const int LineDoubleDash = 2;
const int CapNotLast = 0;
const int CapButt = 1;
const int CapRound = 2;
const int CapProjecting = 3;
const int JoinMiter = 0;
const int JoinRound = 1;
const int JoinBevel = 2;
const int FillSolid = 0;
const int FillTiled = 1;
const int FillStippled = 2;
const int FillOpaqueStippled = 3;
const int EvenOddRule = 0;
const int WindingRule = 1;
const int ClipByChildren = 0;
const int IncludeInferiors = 1;
const int Unsorted = 0;
const int YSorted = 1;
const int YXSorted = 2;
const int YXBanded = 3;
const int CoordModeOrigin = 0;
const int CoordModePrevious = 1;
const int Complex = 0;
const int Nonconvex = 1;
const int Convex = 2;
const int ArcChord = 0;
const int ArcPieSlice = 1;
const int GCLastBit = 22;
const int FontLeftToRight = 0;
const int FontRightToLeft = 1;
const int FontChange = 255;
const int XYBitmap = 0;
const int XYPixmap = 1;
const int ZPixmap = 2;
const int AllocNone = 0;
const int AllocAll = 1;
const int CursorShape = 0;
const int TileShape = 1;
const int StippleShape = 2;
const int AutoRepeatModeOff = 0;
const int AutoRepeatModeOn = 1;
const int AutoRepeatModeDefault = 2;
const int LedModeOff = 0;
const int LedModeOn = 1;
const int MappingSuccess = 0;
const int MappingBusy = 1;
const int MappingFailed = 2;
const int MappingModifier = 0;
const int MappingKeyboard = 1;
const int MappingPointer = 2;
const int DontPreferBlanking = 0;
const int PreferBlanking = 1;
const int DefaultBlanking = 2;
const int DisableScreenSaver = 0;
const int DisableScreenInterval = 0;
const int DontAllowExposures = 0;
const int AllowExposures = 1;
const int DefaultExposures = 2;
const int ScreenSaverReset = 0;
const int ScreenSaverActive = 1;
const int HostInsert = 0;
const int HostDelete = 1;
const int EnableAccess = 1;
const int DisableAccess = 0;
const int StaticGray = 0;
const int GrayScale = 1;
const int StaticColor = 2;
const int PseudoColor = 3;
const int TrueColor = 4;
const int DirectColor = 5;
const int LSBFirst = 0;
const int MSBFirst = 1;
alias char KeyCode;
alias uint XID;
alias uint KeySym;
alias uint GContext;
alias uint Colormap;
alias uint Cursor;
alias uint Pixmap;
alias uint Font;
alias uint Drawable;
alias uint Window;
alias uint Time;
alias uint VisualID;
alias uint Atom;
alias uint Mask;
