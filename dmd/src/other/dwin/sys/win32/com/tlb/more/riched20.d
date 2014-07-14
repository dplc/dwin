// Version 1.0

/*[uuid("8cc497c9-a1df-11ce-8098-00aa0047be5d")]*/
//module dwin.sys.win32.com.tlb.more.tom;
module dwin.sys.win32.com.tlb.more.riched20;

/*[importlib("stdole32.tlb")]*/
private import dwin.sys.win32.com.Core;

// Enums

enum tomConstants {
  tomFalse = 0x00000000,
  tomTrue = 0xFFFFFFFF,
  tomUndefined = 0xFF676981,
  tomToggle = 0xFF676982,
  tomAutoColor = 0xFF676983,
  tomDefault = 0xFF676984,
  tomBackward = 0xC0000001,
  tomForward = 0x3FFFFFFF,
  tomMove = 0x00000000,
  tomExtend = 0x00000001,
  tomNoSelection = 0x00000000,
  tomSelectionIP = 0x00000001,
  tomSelectionNormal = 0x00000002,
  tomSelectionFrame = 0x00000003,
  tomSelectionColumn = 0x00000004,
  tomSelectionRow = 0x00000005,
  tomSelectionBlock = 0x00000006,
  tomSelectionInlineShape = 0x00000007,
  tomSelectionShape = 0x00000008,
  tomSelStartActive = 0x00000001,
  tomSelAtEOL = 0x00000002,
  tomSelOvertype = 0x00000004,
  tomSelActive = 0x00000008,
  tomSelReplace = 0x00000010,
  tomEnd = 0x00000000,
  tomStart = 0x00000020,
  tomCollapseEnd = 0x00000000,
  tomCollapseStart = 0x00000001,
  tomNone = 0x00000000,
  tomSingle = 0x00000001,
  tomWords = 0x00000002,
  tomDouble = 0x00000003,
  tomDotted = 0x00000004,
  tomLineSpaceSingle = 0x00000000,
  tomLineSpace1pt5 = 0x00000001,
  tomLineSpaceDouble = 0x00000002,
  tomLineSpaceAtLeast = 0x00000003,
  tomLineSpaceExactly = 0x00000004,
  tomLineSpaceMultiple = 0x00000005,
  tomAlignLeft = 0x00000000,
  tomAlignCenter = 0x00000001,
  tomAlignRight = 0x00000002,
  tomAlignJustify = 0x00000003,
  tomAlignDecimal = 0x00000003,
  tomAlignBar = 0x00000004,
  tomSpaces = 0x00000000,
  tomDots = 0x00000001,
  tomDashes = 0x00000002,
  tomLines = 0x00000003,
  tomTabBack = 0xFFFFFFFD,
  tomTabNext = 0xFFFFFFFE,
  tomTabHere = 0xFFFFFFFF,
  tomListNone = 0x00000000,
  tomListBullet = 0x00000001,
  tomListNumberAsArabic = 0x00000002,
  tomListNumberAsLCLetter = 0x00000003,
  tomListNumberAsUCLetter = 0x00000004,
  tomListNumberAsLCRoman = 0x00000005,
  tomListNumberAsUCRoman = 0x00000006,
  tomListNumberAsSequence = 0x00000007,
  tomListParentheses = 0x00010000,
  tomListPeriod = 0x00020000,
  tomListPlain = 0x00030000,
  tomCharacter = 0x00000001,
  tomWord = 0x00000002,
  tomSentence = 0x00000003,
  tomParagraph = 0x00000004,
  tomLine = 0x00000005,
  tomStory = 0x00000006,
  tomScreen = 0x00000007,
  tomSection = 0x00000008,
  tomColumn = 0x00000009,
  tomRow = 0x0000000A,
  tomWindow = 0x0000000B,
  tomCell = 0x0000000C,
  tomCharFormat = 0x0000000D,
  tomParaFormat = 0x0000000E,
  tomTable = 0x0000000F,
  tomObject = 0x00000010,
  tomMatchWord = 0x00000002,
  tomMatchCase = 0x00000004,
  tomMatchPattern = 0x00000008,
  tomUnknownStory = 0x00000000,
  tomMainTextStory = 0x00000001,
  tomFootnotesStory = 0x00000002,
  tomEndnotesStory = 0x00000003,
  tomCommentsStory = 0x00000004,
  tomTextFrameStory = 0x00000005,
  tomEvenPagesHeaderStory = 0x00000006,
  tomPrimaryHeaderStory = 0x00000007,
  tomEvenPagesFooterStory = 0x00000008,
  tomPrimaryFooterStory = 0x00000009,
  tomFirstPageHeaderStory = 0x0000000A,
  tomFirstPageFooterStory = 0x0000000B,
  tomNoAnimation = 0x00000000,
  tomLasVegasLights = 0x00000001,
  tomBlinkingBackground = 0x00000002,
  tomSparkleText = 0x00000003,
  tomMarchingBlackAnts = 0x00000004,
  tomMarchingRedAnts = 0x00000005,
  tomShimmer = 0x00000006,
  tomWipeDown = 0x00000007,
  tomWipeRight = 0x00000008,
  tomAnimationMax = 0x00000008,
  tomLowerCase = 0x00000000,
  tomUpperCase = 0x00000001,
  tomTitleCase = 0x00000002,
  tomSentenceCase = 0x00000004,
  tomToggleCase = 0x00000005,
  tomReadOnly = 0x00000100,
  tomShareDenyRead = 0x00000200,
  tomShareDenyWrite = 0x00000400,
  tomPasteFile = 0x00001000,
  tomCreateNew = 0x00000010,
  tomCreateAlways = 0x00000020,
  tomOpenExisting = 0x00000030,
  tomOpenAlways = 0x00000040,
  tomTruncateExisting = 0x00000050,
  tomRTF = 0x00000001,
  tomText = 0x00000002,
  tomHTML = 0x00000003,
  tomWordDocument = 0x00000004,
}

// Interfaces

interface ITextDocument : IDispatch {
  mixin(uuid("8cc497c0-a1df-11ce-8098-00aa0047be5d"));
  // static DWINGUID IID = { 0x8cc497c0, 0xa1df, 0x11ce, 0x80, 0x98, 0x00, 0xaa, 0x00, 0x47, 0xbe, 0x5d };
  /*[id(0x00000000)]*/ int get_Name(out wchar* pName);
  /*[id(0x00000001)]*/ int get_Selection(out ITextSelection ppSel);
  /*[id(0x00000002)]*/ int get_StoryCount(out int pCount);
  /*[id(0x00000003)]*/ int get_StoryRanges(out ITextStoryRanges ppStories);
  /*[id(0x00000004)]*/ int get_Saved(out int pValue);
  /*[id(0x00000004)]*/ int set_Saved(int pValue);
  /*[id(0x00000005)]*/ int get_DefaultTabStop(out float pValue);
  /*[id(0x00000005)]*/ int set_DefaultTabStop(float pValue);
  /*[id(0x00000006)]*/ int New();
  /*[id(0x00000007)]*/ int Open(DWINVARIANT* pVar, int Flags, int CodePage);
  /*[id(0x00000008)]*/ int Save(DWINVARIANT* pVar, int Flags, int CodePage);
  /*[id(0x00000009)]*/ int Freeze(out int pCount);
  /*[id(0x0000000A)]*/ int Unfreeze(out int pCount);
  /*[id(0x0000000B)]*/ int BeginEditCollection();
  /*[id(0x0000000C)]*/ int EndEditCollection();
  /*[id(0x0000000D)]*/ int Undo(int Count, out int prop);
  /*[id(0x0000000E)]*/ int Redo(int Count, out int prop);
  /*[id(0x0000000F)]*/ int Range(int cp1, int cp2, out ITextRange ppRange);
  /*[id(0x00000010)]*/ int RangeFromPoint(int x, int y, out ITextRange ppRange);
}

interface ITextRange : IDispatch {
  mixin(uuid("8cc497c2-a1df-11ce-8098-00aa0047be5d"));
  // static DWINGUID IID = { 0x8cc497c2, 0xa1df, 0x11ce, 0x80, 0x98, 0x00, 0xaa, 0x00, 0x47, 0xbe, 0x5d };
  /*[id(0x00000000)]*/ int get_Text(out wchar* pbstr);
  /*[id(0x00000000)]*/ int set_Text(wchar* pbstr);
  /*[id(0x00000201)]*/ int get_Char(out int pch);
  /*[id(0x00000201)]*/ int set_Char(int pch);
  /*[id(0x00000202)]*/ int get_Duplicate(out ITextRange ppRange);
  /*[id(0x00000203)]*/ int get_FormattedText(out ITextRange ppRange);
  /*[id(0x00000203)]*/ int set_FormattedText(ITextRange ppRange);
  /*[id(0x00000204)]*/ int get_Start(out int pcpFirst);
  /*[id(0x00000204)]*/ int set_Start(int pcpFirst);
  /*[id(0x00000205)]*/ int get_End(out int pcpLim);
  /*[id(0x00000205)]*/ int set_End(int pcpLim);
  /*[id(0x00000206)]*/ int get_Font(out ITextFont pFont);
  /*[id(0x00000206)]*/ int set_Font(ITextFont pFont);
  /*[id(0x00000207)]*/ int get_Para(out ITextPara pPara);
  /*[id(0x00000207)]*/ int set_Para(ITextPara pPara);
  /*[id(0x00000208)]*/ int get_StoryLength(out int pcch);
  /*[id(0x00000209)]*/ int get_StoryType(out int pValue);
  /*[id(0x00000210)]*/ int Collapse(int bStart);
  /*[id(0x00000211)]*/ int Expand(int Unit, out int pDelta);
  /*[id(0x00000212)]*/ int GetIndex(int Unit, out int pIndex);
  /*[id(0x00000213)]*/ int SetIndex(int Unit, int Index, int Extend);
  /*[id(0x00000214)]*/ int SetRange(int cpActive, int cpOther);
  /*[id(0x00000215)]*/ int InRange(ITextRange pRange, out int pb);
  /*[id(0x00000216)]*/ int InStory(ITextRange pRange, out int pb);
  /*[id(0x00000217)]*/ int IsEqual(ITextRange pRange, out int pb);
  /*[id(0x00000218)]*/ int Select();
  /*[id(0x00000219)]*/ int StartOf(int Unit, int Extend, out int pDelta);
  /*[id(0x00000220)]*/ int EndOf(int Unit, int Extend, out int pDelta);
  /*[id(0x00000221)]*/ int Move(int Unit, int Count, out int pDelta);
  /*[id(0x00000222)]*/ int MoveStart(int Unit, int Count, out int pDelta);
  /*[id(0x00000223)]*/ int MoveEnd(int Unit, int Count, out int pDelta);
  /*[id(0x00000224)]*/ int MoveWhile(DWINVARIANT* Cset, int Count, out int pDelta);
  /*[id(0x00000225)]*/ int MoveStartWhile(DWINVARIANT* Cset, int Count, out int pDelta);
  /*[id(0x00000226)]*/ int MoveEndWhile(DWINVARIANT* Cset, int Count, out int pDelta);
  /*[id(0x00000227)]*/ int MoveUntil(DWINVARIANT* Cset, int Count, out int pDelta);
  /*[id(0x00000228)]*/ int MoveStartUntil(DWINVARIANT* Cset, int Count, out int pDelta);
  /*[id(0x00000229)]*/ int MoveEndUntil(DWINVARIANT* Cset, int Count, out int pDelta);
  /*[id(0x00000230)]*/ int FindText(wchar* bstring, int cch, int Flags, out int pLength);
  /*[id(0x00000231)]*/ int FindTextStart(wchar* bstring, int cch, int Flags, out int pLength);
  /*[id(0x00000232)]*/ int FindTextEnd(wchar* bstring, int cch, int Flags, out int pLength);
  /*[id(0x00000233)]*/ int Delete(int Unit, int Count, out int pDelta);
  /*[id(0x00000234)]*/ int Cut(out DWINVARIANT pVar);
  /*[id(0x00000235)]*/ int Copy(out DWINVARIANT pVar);
  /*[id(0x00000236)]*/ int Paste(DWINVARIANT* pVar, int Format);
  /*[id(0x00000237)]*/ int CanPaste(DWINVARIANT* pVar, int Format, out int pb);
  /*[id(0x00000238)]*/ int CanEdit(out int pbCanEdit);
  /*[id(0x00000239)]*/ int ChangeCase(int Type);
  /*[id(0x00000240)]*/ int GetPoint(int Type, out int px, out int py);
  /*[id(0x00000241)]*/ int SetPoint(int x, int y, int Type, int Extend);
  /*[id(0x00000242)]*/ int ScrollIntoView(int Value);
  /*[id(0x00000243)]*/ int GetEmbeddedObject(out IUnknown ppv);
}

interface ITextSelection : ITextRange {
  mixin(uuid("8cc497c1-a1df-11ce-8098-00aa0047be5d"));
  // static DWINGUID IID = { 0x8cc497c1, 0xa1df, 0x11ce, 0x80, 0x98, 0x00, 0xaa, 0x00, 0x47, 0xbe, 0x5d };
  /*[id(0x00000101)]*/ int get_Flags(out int pFlags);
  /*[id(0x00000101)]*/ int set_Flags(int pFlags);
  /*[id(0x00000102)]*/ int get_Type(out int pType);
  /*[id(0x00000103)]*/ int MoveLeft(int Unit, int Count, int Extend, out int pDelta);
  /*[id(0x00000104)]*/ int MoveRight(int Unit, int Count, int Extend, out int pDelta);
  /*[id(0x00000105)]*/ int MoveUp(int Unit, int Count, int Extend, out int pDelta);
  /*[id(0x00000106)]*/ int MoveDown(int Unit, int Count, int Extend, out int pDelta);
  /*[id(0x00000107)]*/ int HomeKey(int Unit, int Extend, out int pDelta);
  /*[id(0x00000108)]*/ int EndKey(int Unit, int Extend, out int pDelta);
  /*[id(0x00000109)]*/ int TypeText(wchar* bstring);
}

interface ITextFont : IDispatch {
  mixin(uuid("8cc497c3-a1df-11ce-8098-00aa0047be5d"));
  // static DWINGUID IID = { 0x8cc497c3, 0xa1df, 0x11ce, 0x80, 0x98, 0x00, 0xaa, 0x00, 0x47, 0xbe, 0x5d };
  /*[id(0x00000000)]*/ int get_Duplicate(out ITextFont ppFont);
  /*[id(0x00000000)]*/ int set_Duplicate(ITextFont ppFont);
  /*[id(0x00000301)]*/ int CanChange(out int pb);
  /*[id(0x00000302)]*/ int IsEqual(ITextFont pFont, out int pb);
  /*[id(0x00000303)]*/ int Reset(int Value);
  /*[id(0x00000304)]*/ int get_Style(out int pValue);
  /*[id(0x00000304)]*/ int set_Style(int pValue);
  /*[id(0x00000305)]*/ int get_AllCaps(out int pValue);
  /*[id(0x00000305)]*/ int set_AllCaps(int pValue);
  /*[id(0x00000306)]*/ int get_Animation(out int pValue);
  /*[id(0x00000306)]*/ int set_Animation(int pValue);
  /*[id(0x00000307)]*/ int get_BackColor(out int pValue);
  /*[id(0x00000307)]*/ int set_BackColor(int pValue);
  /*[id(0x00000308)]*/ int get_Bold(out int pValue);
  /*[id(0x00000308)]*/ int set_Bold(int pValue);
  /*[id(0x00000309)]*/ int get_Emboss(out int pValue);
  /*[id(0x00000309)]*/ int set_Emboss(int pValue);
  /*[id(0x00000310)]*/ int get_ForeColor(out int pValue);
  /*[id(0x00000310)]*/ int set_ForeColor(int pValue);
  /*[id(0x00000311)]*/ int get_Hidden(out int pValue);
  /*[id(0x00000311)]*/ int set_Hidden(int pValue);
  /*[id(0x00000312)]*/ int get_Engrave(out int pValue);
  /*[id(0x00000312)]*/ int set_Engrave(int pValue);
  /*[id(0x00000313)]*/ int get_Italic(out int pValue);
  /*[id(0x00000313)]*/ int set_Italic(int pValue);
  /*[id(0x00000314)]*/ int get_Kerning(out float pValue);
  /*[id(0x00000314)]*/ int set_Kerning(float pValue);
  /*[id(0x00000315)]*/ int get_LanguageID(out int pValue);
  /*[id(0x00000315)]*/ int set_LanguageID(int pValue);
  /*[id(0x00000316)]*/ int get_Name(out wchar* pbstr);
  /*[id(0x00000316)]*/ int set_Name(wchar* pbstr);
  /*[id(0x00000317)]*/ int get_Outline(out int pValue);
  /*[id(0x00000317)]*/ int set_Outline(int pValue);
  /*[id(0x00000318)]*/ int get_Position(out float pValue);
  /*[id(0x00000318)]*/ int set_Position(float pValue);
  /*[id(0x00000319)]*/ int get_Protected(out int pValue);
  /*[id(0x00000319)]*/ int set_Protected(int pValue);
  /*[id(0x00000320)]*/ int get_Shadow(out int pValue);
  /*[id(0x00000320)]*/ int set_Shadow(int pValue);
  /*[id(0x00000321)]*/ int get_Size(out float pValue);
  /*[id(0x00000321)]*/ int set_Size(float pValue);
  /*[id(0x00000322)]*/ int get_SmallCaps(out int pValue);
  /*[id(0x00000322)]*/ int set_SmallCaps(int pValue);
  /*[id(0x00000323)]*/ int get_Spacing(out float pValue);
  /*[id(0x00000323)]*/ int set_Spacing(float pValue);
  /*[id(0x00000324)]*/ int get_StrikeThrough(out int pValue);
  /*[id(0x00000324)]*/ int set_StrikeThrough(int pValue);
  /*[id(0x00000325)]*/ int get_Subscript(out int pValue);
  /*[id(0x00000325)]*/ int set_Subscript(int pValue);
  /*[id(0x00000326)]*/ int get_Superscript(out int pValue);
  /*[id(0x00000326)]*/ int set_Superscript(int pValue);
  /*[id(0x00000327)]*/ int get_Underline(out int pValue);
  /*[id(0x00000327)]*/ int set_Underline(int pValue);
  /*[id(0x00000328)]*/ int get_Weight(out int pValue);
  /*[id(0x00000328)]*/ int set_Weight(int pValue);
}

interface ITextPara : IDispatch {
  mixin(uuid("8cc497c4-a1df-11ce-8098-00aa0047be5d"));
  // static DWINGUID IID = { 0x8cc497c4, 0xa1df, 0x11ce, 0x80, 0x98, 0x00, 0xaa, 0x00, 0x47, 0xbe, 0x5d };
  /*[id(0x00000000)]*/ int get_Duplicate(out ITextPara ppPara);
  /*[id(0x00000000)]*/ int set_Duplicate(ITextPara ppPara);
  /*[id(0x00000401)]*/ int CanChange(out int pb);
  /*[id(0x00000402)]*/ int IsEqual(ITextPara pPara, out int pb);
  /*[id(0x00000403)]*/ int Reset(int Value);
  /*[id(0x00000404)]*/ int get_Style(out int pValue);
  /*[id(0x00000404)]*/ int set_Style(int pValue);
  /*[id(0x00000405)]*/ int get_Alignment(out int pValue);
  /*[id(0x00000405)]*/ int set_Alignment(int pValue);
  /*[id(0x00000406)]*/ int get_Hyphenation(out int pValue);
  /*[id(0x00000406)]*/ int set_Hyphenation(int pValue);
  /*[id(0x00000407)]*/ int get_FirstLineIndent(out float pValue);
  /*[id(0x00000408)]*/ int get_KeepTogether(out int pValue);
  /*[id(0x00000408)]*/ int set_KeepTogether(int pValue);
  /*[id(0x00000409)]*/ int get_KeepWithNext(out int pValue);
  /*[id(0x00000409)]*/ int set_KeepWithNext(int pValue);
  /*[id(0x00000410)]*/ int get_LeftIndent(out float pValue);
  /*[id(0x00000411)]*/ int get_LineSpacing(out float pValue);
  /*[id(0x00000412)]*/ int get_LineSpacingRule(out int pValue);
  /*[id(0x00000413)]*/ int get_ListAlignment(out int pValue);
  /*[id(0x00000413)]*/ int set_ListAlignment(int pValue);
  /*[id(0x00000414)]*/ int get_ListLevelIndex(out int pValue);
  /*[id(0x00000414)]*/ int set_ListLevelIndex(int pValue);
  /*[id(0x00000415)]*/ int get_ListStart(out int pValue);
  /*[id(0x00000415)]*/ int set_ListStart(int pValue);
  /*[id(0x00000416)]*/ int get_ListTab(out float pValue);
  /*[id(0x00000416)]*/ int set_ListTab(float pValue);
  /*[id(0x00000417)]*/ int get_ListType(out int pValue);
  /*[id(0x00000417)]*/ int set_ListType(int pValue);
  /*[id(0x00000418)]*/ int get_NoLineNumber(out int pValue);
  /*[id(0x00000418)]*/ int set_NoLineNumber(int pValue);
  /*[id(0x00000419)]*/ int get_PageBreakBefore(out int pValue);
  /*[id(0x00000419)]*/ int set_PageBreakBefore(int pValue);
  /*[id(0x00000420)]*/ int get_RightIndent(out float pValue);
  /*[id(0x00000420)]*/ int set_RightIndent(float pValue);
  /*[id(0x00000421)]*/ int SetIndents(float StartIndent, float LeftIndent, float RightIndent);
  /*[id(0x00000422)]*/ int SetLineSpacing(int LineSpacingRule, float LineSpacing);
  /*[id(0x00000423)]*/ int get_SpaceAfter(out float pValue);
  /*[id(0x00000423)]*/ int set_SpaceAfter(float pValue);
  /*[id(0x00000424)]*/ int get_SpaceBefore(out float pValue);
  /*[id(0x00000424)]*/ int set_SpaceBefore(float pValue);
  /*[id(0x00000425)]*/ int get_WidowControl(out int pValue);
  /*[id(0x00000425)]*/ int set_WidowControl(int pValue);
  /*[id(0x00000426)]*/ int get_TabCount(out int pCount);
  /*[id(0x00000427)]*/ int AddTab(float tbPos, int tbAlign, int tbLeader);
  /*[id(0x00000428)]*/ int ClearAllTabs();
  /*[id(0x00000429)]*/ int DeleteTab(float tbPos);
  /*[id(0x00000430)]*/ int GetTab(int iTab, out float ptbPos, out int ptbAlign, out int ptbLeader);
}

interface ITextStoryRanges : IDispatch {
  mixin(uuid("8cc497c5-a1df-11ce-8098-00aa0047be5d"));
  // static DWINGUID IID = { 0x8cc497c5, 0xa1df, 0x11ce, 0x80, 0x98, 0x00, 0xaa, 0x00, 0x47, 0xbe, 0x5d };
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown ppunkEnum);
  /*[id(0x00000000)]*/ int Item(int Index, out ITextRange ppRange);
  /*[id(0x00000002)]*/ int get_Count(out int pCount);
}
