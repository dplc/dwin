/**
 * The Regular Expression module in D based on the PCRE lib.
 * iceeLyne, 2006.
 */


// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        Version:        Initial release: Jan 2008

        Authors:        ported to with Tango by yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )
        
        pcre.lib version: 8.02
        
        how to build pcre.lib:

        download pcred.zip : http://icube.freezope.org/pcred/pcred.zip unpack to \pcred\
        download the PCRE 7.0 src distribution from PCRE.ORG, unpack to \pcre-7.0-src\
        copy the files (config.h, makefile) in the \pcred\pcre_c_src\pcre-7.0\ to the \pcre-7.0-src\src\pcre\7.0\pcre-7.0-src\
        replace the original files (pcre.h, pcre_globals.c) in the \pcre-7.0-src\src\pcre\7.0\pcre-7.0-src\ with the files in the \pcred\pcre_c_src\pcre-7.0\, if you need some extra functions.
        run "make LIBALL", then copy pcre.lib to the \tango\lib\ directory.

        modified:
        writefln to Stdout.formatln
        ulong to uint
        //atoi to to!(int)(char[])
        isdigit to isDigit

        Example:
        ---

        //expand
		RegTemplate tmp = new RegTemplate(r"\0||\1\2||\g(0),\g<num>\0\0\0");
		m1 = regex1.execute(str1);
        assert(m1, "m1");
        assert( m1.expand(tmp) == "Sample:1||Sample1||Sample:1,1Sample:1Sample:1Sample:1", "expand");


        // back reference
		// Some more complex PCRE pattern samples:
		// NOTE:
		// These patterns are NOT for general HTML parsing,
		// just some attempts to match some particular cases.
		scope regex2 = new RegExp(r"<(?P<name>\w+)>.*?</(?i:(?P=name))>");
		char[] str2 = "<br/><br/><p><pre>char[] str2 = "";</pRe></p><div><div></div></div>";
		RegIter iter2 = regex2.iterate(str2);
		foreach(RegMatch m; iter2)
        {
			//Stdout.formatln("PCRE BACKREF: {}", m.group());
		}

            //<p><pre>char[] str2 = ;</pRe></p>
            //<div><div></div>


		scope regex3 = new RegExp(r"<(?P<name>\w+)(?P<closed>/)?>(?(closed)|[^<>]*?</(?i:(?P=name))>)");
		char[] str3 = "<br/><br/><p><pre>char[] str2 = "";</pRe></p><div><div></div></div>";
		RegIter iter3 = regex3.iterate(str3);
		foreach(RegMatch m; iter3)
        {
			//Stdout.formatln("PCRE CONDITION: {}" , m.group());
		}

            //PCRE CONDITION: <br/>
            //PCRE CONDITION: <br/>
            //PCRE CONDITION: <pre>char[] str2 = ;</pRe>
            //PCRE CONDITION: <div></div>


        //RECURSIVE PATTERNS
		scope Regex4 = new RegExp(r"<(?P<name>\w+)>(?>[^<>]*(?R)?[^<>]*)*</(?i:(?P=name))>");
		char[] str4 = "<p>Test</p>XI<br/>XII<br/>"
			"<p><span>Test <pre>char[] str2 = "";</pRe> Something Else</span> Else<span> Else</span></p>"
			"<div>PART I<div>PART II</div>PART III</div>"
			"<p></p>";
		auto iter4 = Regex4.iterate(str4);
		foreach(RegMatch m; iter4) {
			Stdout.formatln("PCRE RECURSION: {}", m.group());
		}

        //RegDfaMatch
		scope Regex7 = new RegExp(r"Sample(:\d{1,3})?(:Z)?");
		char[] str7 = "Test DFA, Sample:275:Z, Test DFA, Sample:22:Z.";
		foreach(RegDfaMatch m; Regex7.dfaIterate(str7)) {
			foreach(char[] s; m) {
				Stdout.formatln("DFA Possible Match: {}", s);
			}

		}

        ---


*******************************************************************************/


module dwin.text.pcre.RegExp;

version(Win32)
    pragma(lib, "pcre.lib");

public import   dwin.text.pcre.Capi;
public import   dwin.text.pcre.Util;

//private import  dwin.sys.win32.CodePage : toMbsz;
private import  Utf = dwin.text.convert.Utf;

private import  tango.text.Unicode,
                tango.util.Convert,
                tango.text.convert.Format;

/// tango.util.log.Trace has problesm to works with DWT
debug private import tango.io.Stdout;

//private import tango.stdc.string : strlen;
//private import tango.stdc.ctype : isdigit, tolower;
//private import tango.stdc.stdlib: atoi;



/**
 * General Module Exception Class.
 */
public class RegException : Exception
{
	this(char[] msg)
    {
		super(msg);
	}
}

/**
 * Compile-Time Exception Class.
 */
public class CompileTimeException : RegException
{
	int _code;
	/// Return: RegExp compile error code.
	int code()
    {
		return _code;
	}
	int _offset;
	/// Return: Error offset.
	int offset()
    {
		return _offset;
	}
	this(int errcode, char[] errmsg, int erroffset)
    {
		super(errmsg);
		_code = errcode;
		_offset = erroffset;
	}
}

/**
 * Execute-Time Exception Class.
 */
public class ExecuteTimeException : RegException
{
	int _code;
	/// Return: RegExp execute error code.
	int code()
    {
		return _code;
	}
	this(int errcode, char[] errmsg)
    {
		super(errmsg);
		_code = errcode;
	}
}

/**
 * Options for RegExp compile method.
 */
public enum CompileTimeOption
{

	ANCHORED            = PCRE_ANCHORED,        // Force pattern anchoring
	AUTO_CALLOUT        = PCRE_AUTO_CALLOUT,    // Compile automatic callouts
	CASELESS            = PCRE_CASELESS,        // Do caseless matching
	ENDONLY             = PCRE_DOLLAR_ENDONLY,  // $ not to match newline at end
	DOTALL              = PCRE_DOTALL,          // . matches anything including NL
	EXTENDED            = PCRE_EXTENDED,        // Ignore whitespace and # comments
	EXTRA               = PCRE_EXTRA,           // PCRE extra features (not much use currently)
	FIRSTLINE           = PCRE_FIRSTLINE,       // Force matching to be before newline
	MULTILINE           = PCRE_MULTILINE,       // ^ and $ match newlines within data
	NO_AUTO_CAPTURE     = PCRE_NO_AUTO_CAPTURE, // Disable numbered capturing parentheses (named ones available)
	UNGREEDY            = PCRE_UNGREEDY,        // Invert greediness of quantifiers
	UTF8                = PCRE_UTF8,            // Run in UTF-8 mode
	NO_UTF8_CHECK       = PCRE_NO_UTF8_CHECK,   // Do not check the pattern for UTF-8 validity (only relevant if PCRE_UTF8 is set)
	DUPNAMES            = PCRE_DUPNAMES,        // Allow duplicate names for subpatterns
	NEWLINE_CR          = PCRE_NEWLINE_CR,      // Set CR as the newline sequence
	NEWLINE_LF          = PCRE_NEWLINE_LF,      // Set LF as the newline sequence
	NEWLINE_CRLF        = PCRE_NEWLINE_CRLF,    // Set CRLF as the newline sequence
	NEWLINE_ANY        = PCRE_NEWLINE_ANY,    // Recognize any Unicode newline sequence

};
public alias CompileTimeOption CTO;

/**
 * Options for RegExp execute method.
 */
public enum ExecuteTimeOption
{

	ANCHORED            = PCRE_ANCHORED,        // Match only at the first position
	NOTBOL              = PCRE_NOTBOL,          // Subject is not the beginning of a line
	NOTEOL              = PCRE_NOTEOL,          // Subject is not the end of a line
	NOTEMPTY            = PCRE_NOTEMPTY,        // An empty string is not a valid match
	NO_UTF8_CHECK       = PCRE_NO_UTF8_CHECK,   // Do not check the subject for UTF-8 validity (only relevant if PCRE_UTF8 was set at compile time)
	PARTIAL             = PCRE_PARTIAL,         // Return PCRE_ERROR_PARTIAL for a partial match

	// New in PCRE 6.7:
	NEWLINE_CR          = PCRE_NEWLINE_CR,      // Set CR as the newline sequence
	NEWLINE_LF          = PCRE_NEWLINE_LF,      // Set LF as the newline sequence
	NEWLINE_CRLF        = PCRE_NEWLINE_CRLF,    // Set CRLF as the newline sequence
	// New in PCRE 7.0:
	NEWLINE_ANY         = PCRE_NEWLINE_ANY,     // Recognize any Unicode newline sequence

};
public alias ExecuteTimeOption ETO;

public enum DfaExtraOption
{
	SHORTEST        = PCRE_DFA_SHORTEST,    // Return only the shortest match
	RESTART         = PCRE_DFA_RESTART,     // This is a restart after a partial match
};
public alias DfaExtraOption DEO;

/// !Workspace size for the DFA execute:
const DFAWSSIZE = 1000;

/**
 * Error codes for ExecuteTimeException.
 */
public enum ExecuteTimeError
{

	NOMATCH             = PCRE_ERROR_NOMATCH,
	ERROR_NULL          = PCRE_ERROR_NULL,
	BADOPTION           = PCRE_ERROR_BADOPTION,
	BADMAGIC            = PCRE_ERROR_BADMAGIC,
	UNKNOWN_NODE        = PCRE_ERROR_UNKNOWN_NODE,
	NOMEMORY            = PCRE_ERROR_NOMEMORY,
	NOSUBSTRING         = PCRE_ERROR_NOSUBSTRING,
	MATCHLIMIT          = PCRE_ERROR_MATCHLIMIT,
	CALLOUT             = PCRE_ERROR_CALLOUT, // Never used by PCRE itself
	BADUTF8             = PCRE_ERROR_BADUTF8,
	BADUTF8_OFFSET      = PCRE_ERROR_BADUTF8_OFFSET,
	PARTIAL             = PCRE_ERROR_PARTIAL,
	BADPARTIAL          = PCRE_ERROR_BADPARTIAL,
	INTERNAL            = PCRE_ERROR_INTERNAL,
	BADCOUNT            = PCRE_ERROR_BADCOUNT,
	DFA_UITEM           = PCRE_ERROR_DFA_UITEM,
	DFA_UCOND           = PCRE_ERROR_DFA_UCOND,
	DFA_UMLIMIT         = PCRE_ERROR_DFA_UMLIMIT,
	DFA_WSSIZE          = PCRE_ERROR_DFA_WSSIZE,
	DFA_RECURSE         = PCRE_ERROR_DFA_RECURSE,
	RECURSIONLIMIT      = PCRE_ERROR_RECURSIONLIMIT,
	NULLWSLIMIT         = PCRE_ERROR_NULLWSLIMIT,
	BADNEWLINE          = PCRE_ERROR_BADNEWLINE,

};

/**
 * RegExp Class.
 */
public class RegExp
{

	private pcre* _ppcre; // = null
	private pcre_extra* _ppcrex; // = null

	private char[] _pattern;
	/// Return: Pattern string pass to RegExp compile.
	public char[] pattern()
    {
		return _pattern.dup;
	}

	private int _options;
	/// Return: Options passed to RegExp compile.
	public int options()
    {
		return _options;
	}

	private int _captureCount;
	/// Return: Captured group count, group 0 not included.
	public int captureCount()
    {
		return _captureCount;
	}

	/// Empty constructor.
	public this()
    {
		debug(UnitTest) Stdout.formatln("debug: {}" , this.classinfo.name);
	}
	/// Construct RegExp instance with the specified pattern and options.
	/// Params:
	///   pattern = Pattern string.
	///   options = Compile-time options.
	/// Throws: CompileTimeException.
	public this(char[] pattern, int options = 0)
    {
		this();
		compile(pattern, options);
	}

    static RegExp opCall(char[] pattern, int options = 0)
    {
        return new RegExp(pattern, options);
    }

	~this()
    {
		debug Stdout.formatln("debug: ~this {}", this.classinfo.name);

		if(_ppcre !is null)
        {
			// pcre_free_substring as pcre_free:
			pcre_free_substring(cast(char*)_ppcre);
		}
		if(_ppcrex !is null)
        {
			pcre_free_substring(cast(char*)_ppcrex);
		}
	}

	/// Compile a RegExp.
	/// Params:
	///   pattern = Pattern string.
	///   options = Compile-time options.
	/// Throws: CompileTimeException.
	public void compile(char[] pattern, int options = 0)
    {
		if(_ppcre !is null)
        {
			// can compile only once?,
			// don't break the RegMatch / RegIter instances which hold a ref to this.
			throw new RegException("Can compile only once");
		}
		int errcode;
		char* errmsg;
		int erroffset;
        // not use toMbsz here, cause not match chinese word e.g. 中国
		_ppcre = pcre_compile2( (pattern ~ "\0").ptr, options, &errcode, &errmsg, &erroffset, null);
		//_ppcre = pcre_compile2(toMbsz(pattern), options, &errcode, &errmsg, &erroffset, null);
		if(_ppcre is null)
        {
			assert(errmsg !is null);
			//throw new CompileTimeException(errcode, errmsg[0 .. strlen(errmsg)], erroffset);
			throw new CompileTimeException(errcode, Utf.toString(errmsg), erroffset);
		}
		_pattern = pattern.dup;
		pcre_fullinfo(_ppcre, _ppcrex, PCRE_INFO_CAPTURECOUNT, &_captureCount);
	}

	/// Study RegExp (For a faster execute later).
	public void study()
    {
		char* errmsg;
		_ppcrex = pcre_study(_ppcre, 0, &errmsg);
		if(errmsg !is null) {
			//throw new CompileTimeException(-1, errmsg[0 .. strlen(errmsg)], -1);
			throw new CompileTimeException(-1, Utf.toString(errmsg), -1);
		}
	}

	/// Get group index by name.
	/// Params:
	///   gname = Group name.
	/// Return: Group index.
	public int groupIndex(char[] gname)
    {
		// Note:
		// pcre_get_stringnumber is a util function,
		// wrap around the pcre_fullinfo with:
		// PCRE_INFO_NAMECOUNT
		// PCRE_INFO_NAMEENTRYSIZE
		// PCRE_INFO_NAMETABLE
		return pcre_get_stringnumber(_ppcre, (gname~"\0").ptr);
		//return pcre_get_stringnumber(_ppcre, toMbsz(gname));
	}

	/// Execute a RegExp on subject string.
	/// NOTE:
	/// The execute, findAll, iterate, and split method assume the subject as const,
	/// and return RegMatch or RegIter objects which hold and use a reference to the subject,
	/// The behaver of modifying the subject before these objects gone useless is undefined.
	/// Params:
	///   subject = Pattern string.
	///   start = Start offset of subject.
	///   end = End offset of subject.
	/// Return: RegMatch object.
	/// Throws: ExecuteTimeException.
	public RegMatch execute(char[] subject, int start = 0, int end = -1, int options = 0)
    {
		auto slen = subject.length;
		if(end >= 0 && end < slen) slen = end;
		//assert(start >= 0 && start <= slen);
		RegMatch m = new RegMatch(this, subject, start, slen, options);
        // not use toMbsz here, cause not match chinese word e.g. 中国
		int gcount = pcre_exec(_ppcre, _ppcrex, subject.ptr,
		//int gcount = pcre_exec(_ppcre, _ppcrex, toMbsz(subject),
			slen, start,
			options, m._vec.ptr, m._vec.length);
		assert(gcount <= _captureCount+1);
		assert(gcount != 0); // vec size not enough.
		if(gcount == -1)
        { // PCRE_ERROR_NOMATCH
			return null;
		}
        else if(gcount < -1)
        {
			throw new ExecuteTimeException(gcount, "PCRE Execute Time Exception");
		}
		return m;
	}

	/// Find all matchs of RegExp in subject.
	/// Params:
	///   subject = Subject string.
	///   options = Execute-time options.
	/// Return: Array of RegMatch objects.
	/// Throws: ExecuteTimeException.
	public RegMatch[] findAll(char[] subject, int options = 0)
    {
		RegMatch[] ms = new RegMatch[32];
		int lng = 0;
		RegMatch m;
		int substart = 0;
		while((m = execute(subject, substart, -1, options)) !is null) {
			if(lng >= ms.length) ms.length = lng * 2; // expand size
			ms[lng++] = m;
			substart = m.end();
		}
        ms.length = lng;    //added by yidabu Jan 19, 2008
		return ms;
	}

	/// Iterate through the subject.
	/// Params:
	///   subject = Subject string.
	///   start = Start offset of subject.
	///   end = End offset of subject.
	///   options = Execute-time options.
	/// Return: RegIter object.
	/// Throws: ExecuteTimeException.
	public RegIter iterate(char[] subject, int start = 0, int end = -1, int options = 0)
    {
		auto slen = subject.length;
		if(end > 0 && end < slen) slen = end;
		//assert(start >= 0 && start <= slen);
		return new RegIter(this, subject, start, slen, options);
	}

	/// Split the subject by RegExp.
	/// If the RegExp object contain one or more captured groups,
	/// those groups are also included.
	/// Params:
	///   subject = Subject string.
	///   options = Execute-time options.
	/// Return: Parts of subject, if captured groups, they are included.
	/// Throws: ExecuteTimeException.
	public char[][] split(char[] subject, int options = 0)
    {
		char[][] ss = new char[][32];
		int lng = 0;
		int cpn = _captureCount;
		RegMatch m;
		int substart = 0;
		while((m = execute(subject, substart, -1, options)) !is null)
        {
			if(lng >= ss.length) ss.length = lng * 2; // expand size
			ss[lng++] = subject[substart .. m.start()];

			for(size_t i= 1; i <= cpn; i++) {
				if(lng >= ss.length) ss.length = lng * 2; // expand size
				ss[lng++] = m.group(i);
			}

			substart = m.end();
		}
		ss.length = lng + 1; // expand size
		ss[$-1] = subject[substart .. $];
		return ss;
	}

	/// Replace all matchs of RegExp in subject with template expanded.
	/// Params:
	///   subject = Subject string.
	///   dgExpand = Delegate for expanding the matchs.
	///   options = Execute-time options.
	/// Return: Replaced subject.
	/// Throws: ExecuteTimeException.
	public char[] replace(char[] subject, char[] delegate(RegMatch) dgExpand, int options = 0)
    {
		char[] s = new char[subject.length];
		int lng = 0;
		RegMatch m;
		int substart = 0;
		char[] sa;
		int lngnew = lng;
		while((m = execute(subject, substart, -1, options)) !is null) {
			sa = subject[substart .. m.start()];
			lngnew += sa.length;
			if(lngnew > s.length) s.length = lngnew * 2; // expand size
			s[lng .. lngnew] = sa[0 .. $];
			lng = lngnew;

			sa = dgExpand(m);
			lngnew += sa.length;
			if(lngnew > s.length) s.length = lngnew * 2; // expand size
			s[lng .. lngnew] = sa[0 .. $];
			lng = lngnew;

			substart = m.end();
		}
        //if(m)
        //{
            sa = subject[substart .. $];
            lngnew += sa.length;
            if(lngnew > s.length) s.length = lngnew * 2; // expand size
            s[lng .. lngnew] = sa[0 .. $];
            lng = lngnew;
            return s[0 .. lng];
       //}
        //else
           // return subject;
	}

	/// Replace all matchs of RegExp in subject with template expanded.
	/// Params:
	///   subject = Subject string.
	///   tmp = RegTemplate to replace by.
	///   options = Execute-time options.
	/// Return: Replaced subject.
	/// Throws: ExecuteTimeException.
	public char[] replace(char[] subject, RegTemplate tmp, int options = 0) {
		return replace(subject, &tmp.expand, options);
	}
	/// Replace all matchs of RegExp in subject with template expanded.
	/// Params:
	///   subject = Subject string.
	///   tmp = Template string to replace by.
	///   options = Execute-time options.
	/// Return: Replaced subject.
	/// Throws: ExecuteTimeException.
	public char[] replace(char[] subject, char[] ts, int options = 0) {
		return replace(subject, new RegTemplate(ts), options);
	}
	//alias replace substitute;

	version(NO_PCRE_DFA) {}
    else
    {

        public RegDfaMatch dfaExecute(char[] subject, int max = 100, int start = 0, int end = -1, int options = 0, bool silent = true)
        {
            auto slen = subject.length;
            if(end >= 0 && end < slen) slen = end;
            //assert(start >= 0 && start <= slen);
            int[DFAWSSIZE] ws;
            RegDfaMatch m = new RegDfaMatch(max, this, subject, start, slen, options);
            int mcount = pcre_dfa_exec(_ppcre, null, subject.ptr,
                slen, start,
                options,
                m._vec.ptr, m._vec.length,
                ws.ptr, ws.length);
            if(mcount > 0)
            {
                m._length = mcount;
            }
            else if(mcount == 0)
            { // _vec overflow
                if(!silent) throw new ExecuteTimeException(0, "DFA Match List Overflow");
            }
            else if(mcount == -1)
            { // PCRE_ERROR_NOMATCH
                return null;
            }
            else if(mcount < -1)
            {
                throw new ExecuteTimeException(mcount, "PCRE DFA Exception");
            }
            return m;
        }

        public RegDfaIter dfaIterate(char[] subject, int max = 100, int start = 0, int end = -1, int options = 0)
        {
            auto slen = subject.length;
            if(end > 0 && end < slen) slen = end;
            //assert(start >= 0 && start <= slen);
            return new RegDfaIter(this, subject, max, start, slen, options);
        }

	}

}

/**
 * RegMatch Class.
 */
public class RegMatch {

	private RegExp _regExp;
	/// Return: The RegExp object used to construct this RegIter object.
	public RegExp regExp() {
		return _regExp;
	}
	private int _captureCount; // _groupCount = _captureCount + 1

	private int _options;
	/// Return: Options passed to RegExp execute.
	public int options() {
		return _options;
	}

	private char[] _subject;
	/// Return: The subject string.
	public char[] subject() { // const? dup?
		return _subject;
	}
	private int _subjectStart;
	/// ...
	public int subjectStart() {
		return _subjectStart;
	}
	private int _subjectEnd;
	/// ...
	public int subjectEnd() {
		return _subjectEnd;
	}

	private int[] _vec;

	private this(RegExp regExp, char[] subject, int start, int end, int options) {
		_regExp = regExp;
		_captureCount = regExp._captureCount;
		_vec = new int[(_captureCount+1)*3];
		_subject = subject;
		_options = options;
		_subjectStart = start;
		_subjectEnd = end;
	}

	/// Get a captured group.
	/// Params:
	///   gindex = Index of group, default to 0.
	/// Return: The captured group.
	/// Throws: RegException.
	public char[] group(uint gindex = 0) {
		if(gindex > _captureCount) {
			throw new RegException("Group index out of range");
            //return null;
		}
        if(!this)
            return null;
		uint i = gindex * 2;
		if(_vec[i] < 0) { // (-1, -1)
			return null;
		}
		// Note:
		// _vec[i] is relative to the subject[0], not the start offset.
		return _subject[_vec[i].._vec[i+1]];
	}
	/// Get a captured group.
	/// Params:
	///   gname = Name of group.
	/// Return: The captured group.
	/// Throws: RegException.
	public char[] group(char[] gname) {
		int gi = _regExp.groupIndex(gname);
		if(gi < 0) { // PCRE_ERROR_NOSUBSTRING(-7)
			//throw new RegException("Error group name");
            return null;
		}
		return group(gi);
	}
	public char[] opIndex(uint i) {
		return group(i);
	}

	/// Get the start position of a captured group.
	/// Params:
	///   gindex = Index of group, default to 0.
	/// Return: Start position of the captured group.
	/// Throws: RegException.
	public int start(uint gindex = 0) {
		if(gindex > _captureCount) {
			throw new RegException("Group index out of range");
		}
		return _vec[gindex * 2];
	}
	/// Get the start position of a captured group.
	/// Params:
	///   gname = Name of group.
	/// Return: Start position of the captured group.
	/// Throws: RegException.
	public int start(char[] gname) {
		int gi = _regExp.groupIndex(gname);
		if(gi < 0) { // PCRE_ERROR_NOSUBSTRING(-7)
			throw new RegException("Error group name");
		}
		return start(gi);
	}
	/// Get the end position of a captured group.
	/// Params:
	///   gindex = Index of group, default to 0.
	/// Return: End position of the captured group.
	/// Throws: RegException.
	public int end(uint gindex = 0) {
		if(gindex > _captureCount) {
			throw new RegException("Group index out of range");
		}
		return _vec[gindex * 2 + 1];
	}
	/// Get the end position of a captured group.
	/// Params:
	///   gname = Name of group.
	/// Return: End position of the captured group.
	/// Throws: RegException.
	public int end(char[] gname) {
		int gi = _regExp.groupIndex(gname);
		if(gi < 0) { // PCRE_ERROR_NOSUBSTRING(-7)
			throw new RegException("Error group name");
		}
		return end(gi);
	}

	/// Expand template on the match.
	/// Params:
	///   tmp = Compiled RegTemplate instance.
	/// Return: The expanded string.
	/// Throws: RegException.
	public char[] expand(RegTemplate tmp) {
		return tmp.expand(this);
	}
	/// Expand template on the match.
	/// Params:
	///   ts = Template string.
	/// Return: The expanded string.
	/// Throws: RegException.
	public char[] expand(char[] ts) {
		RegTemplate tmp = new RegTemplate(ts);
		return tmp.expand(this);
	}

}

/**
 * RegIter Class.
 */
public class RegIter {

	private RegExp _regExp;
	/// Return: The RegExp object used to construct this RegIter object.
	public RegExp regExp() {
		return _regExp;
	}

	private int _options;
	/// Return: Options passed to RegExp execute.
	public int options() {
		return _options;
	}

	private char[] _subject;
	/// Return: The subject string.
	public char[] subject() { // const? dup?
		return _subject;
	}
	private int _subjectStart;
	/// ...
	public int subjectStart() {
		return _subjectStart;
	}
	private int _subjectEnd;
	/// ...
	public int subjectEnd() {
		return _subjectEnd;
	}

	private int _start;

	private this(RegExp regExp, char[] subject, int start, int end, int options) {
		_regExp = regExp;
		_subject = subject;
		_options = options;
		_start = _subjectStart = start;
		_subjectEnd = end;
	}

	/// Reset to first match.
	public void reset() {
		_start = _subjectStart;
	}

	/// Get the next match.
	public RegMatch next() {
		RegMatch m = _regExp.execute(_subject, _start, _subjectEnd, _options);
		if(m !is null) {
			// check unlimited iteration?:
			if(_start == m.end) throw new RegException("Unlimited iteration");
			_start = m.end;
		} else {
			_start = _subjectEnd;
		}
		return m;
	}

	/// Overloaded opApply for the D foreach support.
	int opApply(int delegate(inout RegMatch m) dg) {
		int r = 0;
		RegMatch m;
		reset();
		while((m = next()) !is null) {
			r = dg(m);
			if(r) break;
		}
		return r;
	}

}

version(NO_PCRE_DFA) {
} else {

/**
 * RegDfaMatch Class, for the PCRE DFA algorithm.
 */
public class RegDfaMatch {

	private RegExp _regExp;
	/// Return: The RegExp object used to construct this RegIter object.
	public RegExp regExp() {
		return _regExp;
	}

	private int _options;
	/// Return: Options passed to RegExp execute.
	public int options() {
		return _options;
	}

	private char[] _subject;
	/// Return: The subject string.
	public char[] subject() { // const? dup?
		return _subject;
	}
	private int _subjectStart;
	/// ...
	public int subjectStart() {
		return _subjectStart;
	}
	private int _subjectEnd;
	/// ...
	public int subjectEnd() {
		return _subjectEnd;
	}

	private int[] _vec;
	private int _capacity = 0;
	public int capacity() {
		return _capacity;
	}
	private int _length = 0;
	public int length() {
		return _length;
	}

	private this(int capacity, RegExp regExp, char[] subject, int start, int end, int options) {
		_length = _capacity = capacity;
		_regExp = regExp;
		_vec = new int[_capacity*2];
		_subject = subject;
		_options = options;
		_subjectStart = start;
		_subjectEnd = end;
	}

	/// Get a possible match.
	/// Params:
	///   index = Index of match, default to 0, the longest.
	/// Return: The possible matched sub string.
	/// Throws: RegException.
	public char[] match(uint index = 0) {
		if(index >= _length) {
			throw new RegException("Match index out of range");
		}
		uint i = index * 2;
		// Note:
		// _vec[i] is relative to the subject[0], not the start offset.
		return _subject[_vec[i].._vec[i+1]];
	}
	public char[] opIndex(uint i) {
		return match(i);
	}

	/// Get the start position of a possible match.
	/// Params:
	///   index = Index of match, default to 0, the longest.
	/// Return: The start position.
	/// Throws: RegException.
	public int start(uint index = 0) {
		if(index >= _length) {
			throw new RegException("Match index out of range");
		}
		return _vec[index * 2];
	}

	/// Get the end position of a possible match.
	/// Params:
	///   index = Index of match, default to 0, the longest.
	/// Return: The end position.
	/// Throws: RegException.
	public int end(uint index = 0) {
		if(index >= _length) {
			throw new RegException("Match index out of range");
		}
		return _vec[index * 2 + 1];
	}

	/// Overloaded opApply for the D foreach support.
	int opApply(int delegate(inout char[] m) dg) {
		int r = 0;
		char[] m;
		for(size_t i= 0; i < _length; i++) {
			m = match(i);
			r = dg(m);
			if(r) break;
		}
		return r;
	}

}

/**
 * RegDfaIter Class, for the PCRE DFA algorithm.
 */
public class RegDfaIter {

	private RegExp _regExp;
	/// Return: The RegExp object used to construct this RegIter object.
	public RegExp regExp() {
		return _regExp;
	}

	private int _options;
	/// Return: Options passed to RegExp execute.
	public int options() {
		return _options;
	}

	private char[] _subject;
	/// Return: The subject string.
	public char[] subject() { // const? dup?
		return _subject;
	}
	private int _subjectStart;
	/// ...
	public int subjectStart() {
		return _subjectStart;
	}
	private int _subjectEnd;
	/// ...
	public int subjectEnd() {
		return _subjectEnd;
	}

	private int _dfaMax;

	private int _start;

	private this(RegExp regExp, char[] subject, int max, int start, int end, int options) {
		_regExp = regExp;
		_subject = subject;
		_options = options;
		_dfaMax = max;
		_start = _subjectStart = start;
		_subjectEnd = end;
	}

	/// Reset to first match.
	public void reset() {
		_start = _subjectStart;
	}

	/// Get the next match.
	public RegDfaMatch next() {
		RegDfaMatch m = _regExp.dfaExecute(_subject, _dfaMax, _start, _subjectEnd, _options);
		if(m !is null) {
			// check unlimited iteration?:
			if(_start == m.end) throw new RegException("Unlimited iteration");
			_start = m.end;
		} else {
			_start = _subjectEnd;
		}
		return m;
	}

	/// Overloaded opApply for the D foreach support.
	int opApply(int delegate(inout RegDfaMatch m) dg) {
		int r = 0;
		RegDfaMatch m;
		reset();
		while((m = next()) !is null) {
			r = dg(m);
			if(r) break;
		}
		return r;
	}

}

}

// RegTemplate instruction code:
private enum RegTInstCode {TS, GI, GN};

// RegTemplate instruction:
private struct RegTInst {
	RegTInstCode code;
	union {
		char[] ts;
		int gi;
		char[] gn;
	}
}

// for parsing escaped chr code:
private int _parseInt(char[] s, bool shex = false) {
	int r = 0;
	if(!shex) {
		foreach(char c; s) {
			if(c > 0x2F && c < 0x3A) {
				r = r*10 + c-0x30;
			} else {
				return r;
			}
		}
	} else {
		foreach(char c; s) {
			if(c > 0x2F && c < 0x3A) {
				r = (r<<4) | (c-0x30);
			} else if(c > 0x40 && c < 0x47) {
				r = (r<<4) | (c-0x37);
			} else if(c > 0x60 && c < 0x67) {
				r = (r<<4) | (c-0x57);
			} else {
				return r;
			}
		}
	}
	return r;
}

private char[] _chrAscii(int code) {
	char[1] s;
	if(code < 0xFF) {
		s[0] = cast(char)code;
	}
	return s[0..1].dup;
}

private char[] _chrUtf8(int code) {
	char[6] s;
	if(code < 0x80) {
		s[0] = cast(char)code;
		return s[0..1].dup;
	} else if(code < 0x7FF) {
		s[0] = 0xC0 | (code & 0x7C0)>>6;
		s[1] = 0x80 | (code & 0x3F);
		return s[0..2].dup;
	} else if(code < 0xFFFF) {
		s[0] = 0xE0 | (code & 0xF000)>>12;
		s[1] = 0x80 | (code & 0xFC0)>>6;
		s[2] = 0x80 | (code & 0x3F);
		return s[0..3].dup;
	} else if(code < 0x1FFFF) {
		s[0] = 0xF0 | (code & 0x1C0000)>>18;
		s[1] = 0x80 | (code & 0x3F000)>>12;
		s[2] = 0x80 | (code & 0xFC0)>>6;
		s[3] = 0x80 | (code & 0x3F);
		return s[0..4].dup;
	} else if(code < 0x3FFFFFF) { // UTF-8 in D is up to 0x1FFFF, (4 bytes max).
		s[0] = 0xF8 | (code & 0x3000000)>>24;
		s[1] = 0x80 | (code & 0xFC0000)>>18;
		s[2] = 0x80 | (code & 0x3F000)>>12;
		s[3] = 0x80 | (code & 0xFC0)>>6;
		s[4] = 0x80 | (code & 0x3F);
		return s[0..5].dup;
	} else { // < 0x7F000000
		s[0] = cast(char) (0xFC | (code & 0x80000000)>>30);
		s[1] = 0x80 | (code & 0x3F000000)>>24;
		s[2] = 0x80 | (code & 0xFC0000)>>18;
		s[3] = 0x80 | (code & 0x3F000)>>12;
		s[4] = 0x80 | (code & 0xFC0)>>6;
		s[5] = 0x80 | (code & 0x3F);
		return s[0..6].dup;
	}
}

/**
 * RegTemplate Class.
 */
public class RegTemplate {

	private static RegExp _rxp;

	private static char[char] _escapeChrs;

	/// Use UTF-8 (or ASCII) encoding for template string, default true.
	public bool utf8 = true;

	static this() {
		_rxp = new RegExp(r"\\g<(?P<gn>\w+)>|" // group name
			r"\\g\((?P<gi>\d+)\)|" // group index
			r"\\x\{(?P<hex>[0-9a-fA-F]{1,8})\}|" // hex escaped
			r"\\x(?P<hex2>[0-9a-fA-F]{1,2})|" // hex escaped short
			r"\\(?P<gi2>\d{1,2})|" // group index short
			r"\\c(?P<ctl>[a-zA-Z])|" // ctl-X chr
			r"\\(?P<chr>.)" // any chr
			, CTO.UTF8
			);

		_escapeChrs['a'] = '\a';
		_escapeChrs['b'] = '\b';
		_escapeChrs['t'] = '\t';
		_escapeChrs['v'] = '\v';
		_escapeChrs['f'] = '\f';
		_escapeChrs['n'] = '\n';
		_escapeChrs['r'] = '\r';
		_escapeChrs['e'] = '\x1B'; // ESC, 1B (PCRE)
	}

	private RegTInst[] _instq;

	/// Empty constructor.
	public this() {
		_instq = new RegTInst[0];
	}
	/// Construct RegTemplate with the template string.
	/// Params:
	///   tmp = The template string.
	/// Throws: RegException.
	public this(char[] tmp) {
		this();
		compile(tmp);
	}

	public void pushInstTS(char[] ts) {
		RegTInst inst;
		inst.code = RegTInstCode.TS;
		inst.ts = ts;
		_instq ~= inst;
	}

	public void pushInstGI(int gi) {
		RegTInst inst;
		inst.code = RegTInstCode.GI;
		inst.gi = gi;
		_instq ~= inst;
	}

	public void pushInstGN(char[] gn) {
		RegTInst inst;
		inst.code = RegTInstCode.GN;
		inst.gn = gn;
		_instq ~= inst;
	}

	public void reset() {
		_instq = new RegTInst[0];
	}

	/// Expand template on the match.
	/// Params:
	///   m = The RegMatch instance.
	/// Return: The expanded string.
	public char[] expand(RegMatch m) {
		char[] s = new char[128]; // guess
		int lng = 0;
		foreach(RegTInst inst; _instq) {
			char[] sa;
			switch(inst.code) {
				case RegTInstCode.TS:
					sa = inst.ts;
					break;
				case RegTInstCode.GI:
					sa = m.group(inst.gi);
					break;
				case RegTInstCode.GN:
					sa = m.group(inst.gn);
					break;
				default:
					throw new RegException("Error template instruction");
			}
			int lngnew = lng + sa.length;
			if(lngnew > s.length) s.length = lngnew * 2; // expand size
			s[lng .. lngnew] = sa[0 .. $];
			lng = lngnew;
		}
		return s[0 .. lng];
	}

	/// Compile template.
	/// Params:
	///   tmp = The template string, ASCII or UTF-8.
	/// Throws: RegException.
	public void compile(char[] tmp) {
		RegMatch m;
		int start = 0;
		char[] sg;
		while((m = _rxp.execute(tmp, start)) !is null) {
			if(start < m.start()) {
				pushInstTS(tmp[start .. m.start()].dup);
			}

			if((sg = m.group("gn")) !is null) { // group name
				pushInstGN(sg.dup);
			} else if((sg = m.group("gi")) !is null) { // group index
				pushInstGI(_parseInt(sg));
			} else if((sg = m.group("gi2")) !is null) { // group index short
				pushInstGI(_parseInt(sg));
			} else if((sg = m.group("chr")) !is null) { // any chr
				char c = sg[0];
				if(c in _escapeChrs) {
					c = _escapeChrs[c];
				}
				pushInstTS(""~c);
			} else if((sg = m.group("ctl")) !is null) { // ctl-X chr
				char c = sg[0];
				if(c > 0x40 && c < 0x5B) { // A-Z
					c = c & ~0x40;
				} else if(c > 0x60 && c < 0x7B) { // a-z
					c = (c-0x20) && ~0x40;
				}
				pushInstTS(""~c);
			} else if((sg = m.group("hex")) !is null) { // hex escaped
				if(utf8) {
					pushInstTS(_chrUtf8(_parseInt(sg, true)));
				} else {
					pushInstTS(_chrAscii(_parseInt(sg, true)));
				}
			} else if((sg = m.group("hex2")) !is null) { // hex escaped short
				if(utf8) {
					pushInstTS(_chrUtf8(_parseInt(sg, true)));
				} else {
					pushInstTS(_chrAscii(_parseInt(sg, true)));
				}
			}

			start = m.end();
		}
		if(start < tmp.length) {
			pushInstTS(tmp[start .. $].dup);
		}
	}
	public void compile_(char[] tmp) {
		auto lng = tmp.length;
		int i;

		char[] buf = new char[lng];
		int ib = 0;

		enum {PUSH_TS, PUSH_GI, PUSH_GN, PUSH_GIX};
		int state = PUSH_TS;

		void pushinst() {
			if(state == PUSH_TS) {
				if(ib > 0) {
					pushInstTS(buf[0..ib].dup);
					ib = 0;
				}
			} else if(state == PUSH_GI) {
				if(ib == 0) {
					debug {
						Stdout.formatln("GI Empty:\n%s" ~ tmp[0..i+1]);
						writeErrPos(i+1);
					}
					throw new RegException("Invalid GI");
				}
				//pushInstGI( atoi((buf[0..ib]~"\0").ptr) );
				pushInstGI( to!(int)(buf[0..ib]) );
				ib = 0;
			} else if(state == PUSH_GN) {
				if(ib == 0) {
					debug {
						Stdout.formatln("GN Empty:\n%s" ~ tmp[0..i+1]);
						writeErrPos(i+1);
					}
					throw new RegException("Invalid GN");
				}
				pushInstGN(buf[0..ib].dup);
				ib = 0;
			} else if(state == PUSH_GIX) {
				//pushInstGI(atoi((buf[0..ib]~"\0").ptr));
				pushInstGI( to!(int)(buf[0..ib]) );
				ib = 0;
			}
		}

		for(i = 0; i < lng; i++) {
			char x = tmp[i];
			if(x == '\\') {
				if(!(i+1 < lng)) throw new RegException("Corrupt Template String");
				char xnx = tmp[++i];
				if(xnx == 'g') {
					if(!(i+1 < lng)) throw new RegException("Corrupt Template String");
					pushinst();
					xnx = tmp[++i];
					if(xnx == '<') {
						if(!(i+1 < lng)) throw new RegException("Corrupt Template String");
						state = PUSH_GN;
						x = /+xnx = +/tmp[++i];
					} else if(xnx == '(') {
						if(!(i+1 < lng)) throw new RegException("Corrupt Template String");
						state = PUSH_GI;
						x = /+xnx = +/tmp[++i];
					} else {
						debug {
							Stdout.formatln("Invalid Group Instruction:\n%s " ~ tmp[0..i+1]);
							writeErrPos(i+1);
						}
						throw new RegException("Invalid Group Instruction");
					}
				}
                //else if(isdigit(xnx))
                else if(isDigit(xnx))
                {
					pushinst();
					state = PUSH_GIX;
					x = xnx;
				} else if(xnx in _escapeChrs) {
					x = _escapeChrs[xnx];
				} else {
					x = xnx;
				}
			}

			if(state == PUSH_TS) {
				buf[ib++] = x;
			} else if(state == PUSH_GI) {
				if(x == ')') {
					pushinst();
					state = PUSH_TS;
				}
                //else if(isdigit(x))
                else if(isDigit(x))
                {
					buf[ib++] = x;
				} else {
					debug {
						Stdout.formatln("GI Not A Digit:\n%s " ~ tmp[0..i+1]);
						writeErrPos(i+1);
					}
					throw new RegException("Invalid GI");
				}
			} else if(state == PUSH_GN) {
				if(x == '>') {
					pushinst();
					state = PUSH_TS;
				} else {
					buf[ib++] = x;
				}
			}
            else if(state == PUSH_GIX)
            {
				//if(!isdigit(x) || ib > 1)
				if(!isDigit(x) || ib > 1)
                {
					pushinst();
					buf[ib++] = x;
					state = PUSH_TS;
				} else {
					buf[ib++] = x;
				}
			}
		}

		// tail:
		pushinst();

		delete buf;
	}

	debug char[] dumpInstQ() {
		char[] s = "Dump Instruction Queue:\n";
		foreach(RegTInst inst; _instq) {
			switch(inst.code) {
				case RegTInstCode.TS:
					s ~= Format("TS:\t\"{}\"\n", inst.ts);
					break;
				case RegTInstCode.GI:
					s ~= Format("GI:\t({})\n", inst.gi);
					break;
				case RegTInstCode.GN:
					s ~= Format("GN:\t<{}>\n", inst.gn);
					break;
				default:
			}
		}
		return s;
	}

	debug void writeErrPos(int i) {
		for(size_t j= 0; j < i-1; j++)
            Stdout.format("-");
		Stdout.formatln("^");
	}

	debug unittest {

		RegTemplate tmp1 = new RegTemplate(
			r"TXI\\X\sTXI\x{6587}\x{5b57}\x30\g<num>TXII\g<sym>TXIII\g(22)\g(15)TXIV");
		Stdout.formatln(tmp1.dumpInstQ());

		RegTemplate tmp2 = new RegTemplate(
			r"\g<num>\g(55)\g<num>\g<sym>TXI\t\f\g(5)\g(7)TXII\g<sym>TXIII\g(42)\g(15)");
		Stdout.formatln(tmp2.dumpInstQ());

		RegTemplate tmp3 = new RegTemplate(
			r"\g(60)\g(28)\g<num>\g<1019>TXI\g<_ms>TXII\g<sym>TXIII\g(22)\g<num>");
		Stdout.formatln(tmp3.dumpInstQ());

		RegTemplate tmp4 = new RegTemplate(
			r"\5\1547\g<num>TXI\33TXII\g<sym>TXIII\22\g<num>\45");
		Stdout.formatln(tmp4.dumpInstQ());

		try {new RegTemplate(r"TXI\");} catch(RegException e) {Stdout.formatln(e.msg);}
		try {new RegTemplate(r"TXI\g");} catch(RegException e) {Stdout.formatln(e.msg);}
		try {new RegTemplate(r"TXI\g<");} catch(RegException e) {Stdout.formatln(e.msg);}

		try {new RegTemplate(r"TXI\g<>TXII");} catch(RegException e) {Stdout.formatln(e.msg);}

		try {new RegTemplate(r"TXI\g()TXII");} catch(RegException e) {Stdout.formatln(e.msg);}

		try {new RegTemplate(r"TXI\g(16x)TXII");} catch(RegException e) {Stdout.formatln(e.msg);}

		try {new RegTemplate(r"TXI\gxTXII");} catch(RegException e) {Stdout.formatln(e.msg);}

	}

}


//debug private import std.string;

// C99:
//private int _strlen(char* s) {
//	char* p; int lng;
//	for(p = s, lng = 0; *p != 0; p++, lng++) {}
//	return lng;
//}

//private int _isdigit(int c) {
//	return c > '0'-1 && c < '9'+1;
//}

//private int _atoi(char* s) {
//	int r = 0;
//	char c;
//	while((c = *s) != 0) {
//		if(c > 0x2F && c < 0x3A) {
//			r = r*10 + c-0x30;
//		} else {
//			return r;
//		}
//		s++;
//	}
//	return r;
//}

/*
private extern(C)
{
	int strlen(char* s);
	int isdigit(int c);
	int atoi(char* s);
}
*/


debug( UnitTest ) unittest
{
     /// unittest
        //group
		RegExp regex = new RegExp(r"(Sample):(?P<num>[0-9]{1,2})");
		//,CompileTimeOption.MULTILINE|CompileTimeOption.NEWLINE_CRLF);
		//regex1.study();
		char[] str1 = "Now Sample:1 Ok, Sample:99 Yes. Sample:22 and Sample:48 is important.";

		RegMatch m1 = regex.execute(str1);
        assert( m1.group() == "Sample:1", "m1.group" );
        assert( m1.group(1) == "Sample", "m1.group(1)" );
        assert( m1.group(2) == "1", "m1.group(2)" );

        //iterate
		RegIter iter1 = regex.iterate(str1, 0); //str, start, end
		//while((m = iter1.next()) !is null) {
		foreach(RegMatch m; iter1)
        {
			//Stdout.formatln(m.group());
            /*
                Sample:1
                Sample:99
                Sample:22
                Sample:48
            */
		}
		assert(iter1.next() is null);

        //split
		char[][] ch = regex.split(str1);
		foreach(char[] c; ch)
        {
            //Stdout.format(c);
        }
        /*
            Now Sample1 Ok, Sample99 Yes. Sample22 and Sample48 is important.
        */

        delete regex;

        /*
        PCRE_ANCHORED
        If this bit is set, the pattern is forced to be "anchored", that is, it is constrained to match only at the first matching point in the string that is being searched (the "subject string"). This effect can also be achieved by appropriate constructs in the pattern itself, which is the only way to do it in Perl.
        */
        regex = new RegExp(r"(a)", PCRE_ANCHORED);
        char[] str = "aca";

        auto iter = regex.iterate(str);
        auto m = iter.next;
        assert (m && m[0] == "a");
        assert(iter.next is null);

        delete regex;

        regex = new RegExp(r"(a)");
        iter = regex.iterate(str);
        m = iter.next;
        assert (m && m[0] == "a");
        m = iter.next;
        assert(m && m[0] == "a");

        delete regex;

        /*
        PCRE_DOTALL
        If this bit is set, a dot metacharater in the pattern matches all characters, including those that indicate newline. Without it, a dot does not match when the current position is at a newline. This option is equivalent to Perl's /s option, and it can be changed within a pattern by a (?s) option setting. A negative class such as [^a] always matches newline characters, independent of the setting of this option.

        PCRE_DOLLAR_ENDONLY
        If this bit is set, a dollar metacharacter in the pattern matches only at the end of the subject string. Without this option, a dollar also matches immediately before a newline at the end of the string (but not before any other newlines). The PCRE_DOLLAR_ENDONLY option is ignored if PCRE_MULTILINE is set. There is no equivalent to this option in Perl, and no way to set it within a pattern.
        */
        regex = new RegExp("(?s).+?$");
        m = regex.execute("a\r\n\r\n");
        assert(m && m.group.length == 4 && m.group[3] == '\r');

        delete regex;

        regex = new RegExp(".+?$", PCRE_DOTALL | PCRE_DOLLAR_ENDONLY);
        m = regex.execute("a\r\n\r\n");
        assert(m && m.group.length == 5);

        delete regex;

        /*
        PCRE_EXTENDED
        If this bit is set, whitespace data characters in the pattern are totally ignored except when escaped or inside a character class. Whitespace does not include the VT character (code 11). In addition, characters between an unescaped # outside a character class and the next newline, inclusive, are also ignored. This is equivalent to Perl's /x option, and it can be changed within a pattern by a (?x) option setting.
        This option makes it possible to include comments inside complicated patterns. Note, however, that this applies only to data characters. Whitespace characters may never appear within special character sequences in a pattern, for example within the sequence (?( which introduces a conditional subpattern.
        */
        regex = new RegExp("(?x)
        (a | # fist comment
        b)+  # second comment
        ");
        m = regex.execute("ababab");
        assert(m && m.group == "ababab");

        delete regex;

        // match chinese word
        //to match utf string, e.g. options must contains PCRE_UTF8, otherwise, cause character value in \x{...} sequence is too large
        regex = new RegExp(r"[\x{4e00}-\x{9fa5}]+", PCRE_UTF8);
        m = regex.execute("hello中国"c);
        assert(m.group == "中国"c, "中国");

        //findAll
        auto ms = regex.findAll("中国hello,人,world");
        assert (ms.length == 2 && ms[0].group == "中国" && ms[1].group == "人");

        delete regex;


        //replace
        regex = new RegExp(r"([\x{4e00}-\x{9fa5}]+)(\w+)([\x{4e00}-\x{9fa5}]+)(\w+)", PCRE_UTF8);
        str = regex.replace("中国人Tomm在北京king",
                delegate char[](RegMatch match)
                {
                    return "外国人" ~ match[2] ~ "在东京" ~ match[4];
                }
             );
        assert( str == "外国人Tomm在东京king" );
        str = regex.replace("中国人Tomm在北京king", r"外国人\2在东京\4");
        assert( str == "外国人Tomm在东京king" );

        delete regex;

        //PCRE does support the \Q...\E escape for quoting substrings. Characters in between are treated as literals. This is slightly different from Perl in that $ and @ are also handled as literals inside the quotes.
        regex = new RegExp(r"\Q.\E+");
        assert( regex.execute("a...b")[0] == "..." );
        delete regex;
        regex = new RegExp(".+");
        assert( regex.execute("a...b")[0] == "a...b" );
        delete regex;


        /*
        When PCRE is built with Unicode character property support, three additional escape sequences to match character properties are available when UTF-8 mode is selected. They are:

          \p{xx}   a character with the xx property
          \P{xx}   a character without the xx property
          \X       an extended Unicode sequence
        */
        //Letter
        regex = RegExp(r"\p{L}+", PCRE_UTF8);
        assert( regex.execute("abcDEF")[0] == "abcDEF" );
        delete regex;

        //The special property L& is also supported: it matches a character that has the Lu, Ll, or Lt property, in other words, a letter that is not classified as a modifier or "other".
        regex = RegExp(r"\p{L&}+", PCRE_UTF8);
        assert( regex.execute("abcDEF")[0] == "abcDEF" );
        delete regex;

        //Lower case letter
        regex = RegExp(r"\p{Ll}+", PCRE_UTF8);
        assert( regex.execute("abcDEF")[0] == "abc" );
        delete regex;

        //Uper case letter
        regex = RegExp(r"\p{Lu}+", PCRE_UTF8);
        assert( regex.execute("abcDEF")[0] == "DEF" );
        delete regex;

        /*
        Lookahead assertions
        Lookahead assertions start with (?= for positive assertions and (?! for negative assertions. For example,
          \w+(?=;)
          matches a word followed by a semicolon, but does not include the semicolon in the match,
        */

        str = `<input id="mins_use"  type="text"  size="5"  maxlength="3"  value="35" />`;
        char[] pattern =
            `(?i)(?>)(?=<[^<>]+?id *= *["']` ~ r"\w+" ~ `["'][^<>]+>)`
            `(<[^<>]+?value=["'])([0-9]+)(["'])`;
        regex = RegExp(pattern, PCRE_UTF8);
        str = regex.replace(str, r"\g(1)" ~ "40" ~ r"\g(3)");
        assert( str == `<input id="mins_use"  type="text"  size="5"  maxlength="3"  value="40" />`);
        delete regex;

}//debug


