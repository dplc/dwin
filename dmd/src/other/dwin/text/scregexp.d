// scregexp
// Statically compiled /Compile-time regular expression Perl-compatible parser, version 1.0
// Author: Marton Papp, borrowing heavily from the regexp 2.0 parser written by Don Clugston.
// This version uses CTFE for simplicity, flexibility, higher performance and easy debugging
//
// It is a top/down recursive descent regexp parser with backtracking.
// The license is bsd-like, see the end of this file.
//
// 
// Terminology:
// a regex "sequence" is a set of consecutive "term"s, 
// each of which consists of a "naked term", optionally followed by
// a "quantifier" (*,+,?, {m}, {m,} or {m,n}).
// A "naked term" is either a "sequence" or an "atom".

/*
Regular expression formats:
"/regex/options" e.g. "/.+/s"
"regex/options" e.g. ".+/s"
"/regex/" e.g. "/.+/"
"regex" e.g. ".+"
possible options: m s x i (they behave as in Perl)
x is not implemented fully. # does not comment out a lines

Features currently supported:
   it matches as if /../sm were used in Perl.
   * match previous expression 0 or more times
   + match previous expression 1 or more times
   ? match previous expression 0 or 1 times
   {m,n}  match previous expression between m and n times
   {m,} match previous expression m or more times
   {,n} match previous expression between 0 and m times
   {n} match previous expression exactly n times.
   . match any character if s option is used.
   . match any non-\n character if s is not set.
   other characters match themselves
   a|b   match regular expression a or b
   (?: ) uncaptured grouping 
   ( ) captured grouping 
   (?>) independent subexpression
   ^  anchor,start of line if m option is used
   ^  anchor,start of string if no option is used
   $  anchor,end of line (at \n and the end of string) if m option is used
   $  anchor,the end of string or before \n at the end of string if no m is used
   \A start of string
   \z end of string
   [abc]  match any character in character class abc
   [^abc] match any character not in character class abc
   @n  match string variables passed into the functions as extra parameters. (this is a non-standard extension).
   escape characters
   \d,\s,\w
   [\d\s\w] in character classes too
   All matches are greedy except if an additional ? used.
   Use ? to make matches non-greedy/lazy.
   \1..\9 to match previously captured subsequences
   These characters have to be escaped to match them: ()[]?*+.{}^$|@
   / needs to escaped if it is used at the start or at the end of regex
   
Compile time error handling:
   redundant ) is found 
   redundant ] is found
   Regexp must not end with \\
   Unmatched parenthesis
   unsupported quantifier
   unmatched { in regular expression
   if \1..\9 references a group not accessable or not defined
   use of + or {m,n} on any and this capturing group is not supported
   use of * or {0,} on any and this capturing group is not supported
   start of range of a character range is bigger than ending range
   
Run time error handling:
   if \1..\9 references a group not captured
   
Limits:
   length of input string : max of int
   number of groups: max of int
   regular expression size: limited by char[] size and stack
   number of backreferences : 9 (\1..\9)
   
Functions:

   bool test!(char[] regexp)(char[] stringtosearch)
   short form: t
   returns true if regexp matches the beginning of stringtosearch  

   char[] search!(char[] regexp)(char[] stringtosearch)
   short form: s
   finds the first match of regexp
   returns the substring found
   returns null if nothing found
   
   int index!(char[] regexp)(char[] stringtosearch, int indextostartat)
   short form: i
   finds the first match of regexp
   returns its starting index in stringtosearch
   returns -1 if nothing found
   
   indexrec index2!(char[] regexp)(char[] stringtosearch, int indextostartat)
   short form: i2
   finds the first match of regexp
   returns its start and end (last char+1) in stringtosearch
   returns indexrec(-1,-1) if nothing found
   
   indexrec[] indexall!(char[] regexp)(char[] stringtosearch, int indextostartat,..)
   short form: ia
   finds all occurances of the regexp in stringtosearch from left to right
   Matches follow each other. No overlaps are possible. in Perl:/ /g
   returns the start and end (last char+1) of found strings in stringtosearch
   returns an an empty array if nothing found
   
   char[][] searchall!(char[] regexp)(char[] stringtosearch,..)
   short form: sa
   finds all occurances of the regexp in stringtosearch from left to right
   Matches follow each other. No overlaps are possible. It is similar to Perl:/ /g
   returns found strings 
   returns an an empty array if nothing found
   
   grouprec [] indexgroups!(char[] regexp)(char[] stringtosearch,..)
   short form: ig
   finds the first match of regexp, the captured groups are returned
   returns the start/end indexes of captured groups and the whole string matched(at index 0)
   returns null if nothing found
   grouprec(something,-1) means that given group was not captured
   
   grouprec [][] indexgroupsall!(char[] regexp)(char[] stringtosearch,..)
   short form: iga
   finds all occurances of the regexp in stringtosearch from left to right
   Matches follow each other. No overlaps are possible. in Perl:/ /g
   returns the start and end (last char+1) of found groups of all matches
   returns an an empty array if nothing found
   
   char [] group(char[] stringtosearch,grouprec g,int groupno)
   can be used to have access to the results of searchgroups in an easier way 
   g should come from searchgroups
   returns groupno-th captured group
   if groupno is 0, returns the whole match 
   returns []/null if no match for given group
   
   void searchgroupstest(char[]reg)(char[]input)
   for testing, prints found matches,groups 
   reg regular expression to use
   input input string to parse
   
   void searchgroupsalltest(char[]reg)(char[]input)
   for testing,prints all solutions found
   reg regular expression to use
   input input string to parse
   
   void searchgroupstest2(char[]reg)(char[]input, char[][] target)
   for testing,compares found matches with target, it stops the program in case of failure
   reg regular expression to use
   input input string to parse
   target expected matches/groups
   
   void printcode(char[] reg)
   prints the generated D code from reg

Class:
  screg - another way to search in strings
  bool match(char[] searchstrin); - match searchstrin , returns true if match is found
                                    if it is called again, it finds the next match
  char[] _(int groupno) - returns given group matched (_(0) returns the whole string matched
  int pos() - return current position from where matching is attempted (as in Perl)   
  void pos(int pin) - set current position where matching is attempted
  void restart() - restart, set position to 0 
Example:
  auto reg1=new screg!("/ab/"); // regular expression to use
  while (reg1.match("abxabxab"))
  {
    writefln(reg1._(0));
  }   
*/

// Points of interest:
// * The parser is able to treat all 'quantifier's in a single mixin function, while still applying
//   optimisations (eg, there's absolutely no difference between {1,} and "+").
// * There is absolutely no parameter passing inside the regexp engine. Even functions which
//   can't be inlined will have very low calling cost.
// * Consequently, the speed is excellent. The main unnecessary operations are the checks to see whether we
//   are at the end of the string.
//   This could be greatly improved by precalculating the minimum length required for a match,
//   at least for subsequences of fixed length.
// * Since each mixin can be given access to any desired runtime or compile-time parameters,
//   the scheme is extremely flexible.

// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: June 2008

        Authors:        modified by yidabu to works with Tango( D Programming Language China : http://www.d-programming-language-china.org/ )
        
        pcre is powerful, but will increase the exeutable size, Tango Regex is not powerful and has some bugs. 
        sometimes, we need scregexp to match text;

*******************************************************************************/



module dwin.text.scregexp;
//import std.metastrings;
version(Phobos)
    import std.string;
else
{
    import tango.text.Ascii;
    alias toUpper toupper;
    alias toLower tolower;
    import tango.util.log.Trace;
}
//---------------------------------------------------------------------
// Part 0 : Functions from the meta library
//---------------------------------------------------------------------

/******************************************************
 *  ulong atoui!(char [] s);
 *
 *  Converts an ASCII string to an uint.
 */
uint atoui(char [] s, size_t result = 0, int indx = 0)
{
  if (s.length == indx)
    return result;
  else if (s[indx]<'0' || s[indx]>'9')
      return result;
    else 
      return atoui(s, result * 10 + s[indx] - '0', indx + 1);
}
char[] tostring(uint i)
{
  size_t i2 = i / 10;
  size_t digit = i - i2 * 10;
  if (i >= 10)
  {
    char[] s;
    s = tostring(i2)~cast(char)(digit + 48);
    return s;
  } 
  else
  {
    char[] s;
    s = ""~cast(char)(digit + 48);
    return s;
  } 
} 

//---------------------------------------------------------------------
// Part I : Functions for parsing a regular expression string literal.
//---------------------------------------------------------------------
// None of these generate any code.

// retuns index of first char in regstr which equals ch, or -1 if not found
// escaped chars are ignored
int unescapedFindFirst(char [] regstr, char ch, int indx = 0)
{
  if (regstr.length <= indx)
    return - 1; // not found
  else if (regstr[indx] == ch) return indx;
    else if (regstr[indx] == '\\')
        // if it's escaped, prevent it from matching.
        return unescapedFindFirst(regstr, ch, indx + 2);
      else return unescapedFindFirst(regstr, ch, indx + 1);
}

// Returns the number of chars at the start of regstr which are made up by
// a repetition expression (+, *, ?, {,} )
int quantifierConsumed(char [] regstr)
{
  if (regstr.length == 0) return 0;
  else if (regstr[0] == '+' || regstr[0] == '*' || regstr[0] == '?') return 1; 
    else if (regstr[0] == '{') {
        if (unescapedFindFirst(regstr, '}') ==  - 1) {
          assert(0, "\nError: unmatched { in regular expression");
            //writefln("Error: unmatched { in regular expression");
            //assert(0);
        } else return 1 + unescapedFindFirst(regstr, '}');
      } else return 0;
}

int quantifiergreedinessConsumed(char [] regstr)
{
  if (regstr.length == 0) return 0;
  else if (regstr[0] == '?') return 1; 
    else return 0;
}

// The minimum allowable number of repetitions for this quantifier
uint quantifierMin(char [] regstr)
{
  if (regstr[0] == '*' || regstr[0] == '?') return 0;
  else if (regstr[0] == '+') return 1;
    else { 
      assert (regstr[0] == '{') ;
      return atoui(regstr[1..$]);
  }
}

// The maximum allowable number of repetitions for this quantifier
uint quantifierMax(char [] regstr)
{
  if (regstr[0] == '*' || regstr[0] == '+') return uint.max;
  else if (regstr[0] == '?') return 1;
    else if (regstr[0] == '{') {
        if (unescapedFindFirst(regstr, ',') ==  - 1) // "{n}"
          return quantifierMin(regstr);
        else if (regstr[$ - 2] == ',') // "{n,}"
            return uint.max;
          else // "{n,m}" 
            return atoui(regstr[ 1 + unescapedFindFirst(regstr, ',') .. $]);
      } else {
        assert(0, "\nError: unsupported quantifier " ~ regstr);
        
  }
}

bool quantifierGreediness(char [] regstr)
{
  if (regstr.length == 0) { 
    return true; 
  }
  else if (regstr[0] == '?') {
      return false; 
    } else {
      return true; 
  }
}

// find the index of the first |, or -1 if not found.
// ignores escaped items, and anything in parentheses.
int findUnion(char [] regstr, int indx = 0, int numopenparens = 0)
{
  int findUnionc;
  if (indx >= regstr.length)
    findUnionc =  - 1;
  else if (numopenparens == 0 && regstr[indx] == '|')
      findUnionc = indx;
    else if (regstr[indx] == ')')
        findUnionc = findUnion(regstr, indx + 1, numopenparens - 1);
      else if (indx + 2<regstr.length && regstr[indx..indx + 3] == "(?:")
          findUnionc = findUnion(regstr, indx + 3, numopenparens + 1);
        else if (indx + 2<regstr.length && regstr[indx..indx + 3] == "(?>")
            findUnionc = findUnion(regstr, indx + 3, numopenparens + 1);
          else if (regstr[indx] == '(')
              findUnionc = findUnion(regstr, indx + 1, numopenparens + 1);
            else if (regstr[indx] == '\\') // skip the escaped character
                findUnionc = findUnion(regstr, indx + 2, numopenparens);
              else 
                findUnionc = findUnion(regstr, indx + 1, numopenparens);
  return findUnionc;
}

// keeps going until the number of ) parens equals the number of ( parens.
// All escaped characters are ignored.
// BUG: what about inside [-] ?
int parenConsumed(char [] regstr, int numopenparens = 0)
{
  if (regstr.length == 0) {
       // pragma(msg, "Unmatched parenthesis");
    assert(0,"\nUnmatched parenthesis");
       // assert(0);
  } else if (regstr[0] == ')') {
      if (numopenparens == 1) return 1; // finished!
      else return 1 + parenConsumed(regstr[1..$], numopenparens - 1);
    } else if (regstr.length>2 && regstr[0..3] == "(?:") {
        return 3 + parenConsumed(regstr[3..$], numopenparens + 1);
      } else if (regstr.length>2 && regstr[0..3] == "(?>") {
          return 3 + parenConsumed(regstr[3..$], numopenparens + 1);
        } else if (regstr[0] == '(') {
            return 1 + parenConsumed(regstr[1..$], numopenparens + 1);
          } else if (regstr[0] == '\\' && regstr.length>1)
        // ignore \(, \).
              return 2 + parenConsumed(regstr[2..$], numopenparens);
            else 
              return 1 + parenConsumed(regstr[1..$], numopenparens); 
}

// the naked term, with no quantifier. Either an atom, or a subsequence.
int atomConsumed(char [] regstr)
{
  int atomConsumedc;
   //pragma(msg,"atom consumed " ~ regstr);
  if (regstr.length>2 && regstr[0..3] == "(?:") atomConsumedc = parenConsumed(regstr);
  else if (regstr.length>2 && regstr[0..3] == "(?>") atomConsumedc = parenConsumed(regstr);
    else if (regstr[0] == '(') atomConsumedc = parenConsumed(regstr);
      else if (regstr[0] == '[') atomConsumedc = 1 + unescapedFindFirst(regstr, ']');
        else if (regstr[0] == ')') {assert(0, "\nError: ) encountered without an opening ( ");}
          else if (regstr[0] == ']') {assert(0, "\nError: ] encountered without an opening [ ");}
            else if (regstr[0] == '\\') { // escape character
                if (regstr.length>1) {
                  atomConsumedc = 2;
                } else {
                  assert(0, "\nError: Regexp must not end with \\ ");
           // writefln("Error: Regexp must not end with \\ ");
           // assert(0);
                }
              } else if (regstr[0] == '@') { // NONSTANDARD: referenced parameter
                  atomConsumedc = 2;
                } else atomConsumedc = 1; // match single char
  return atomConsumedc;
}

int atomCharacterConsumed(char [] regstr, out int whitespaceno)
{
  int atomConsumedc;
 // if (options["x"])
 // {
  whitespaceno = 0;
  if (regstr[0] ==' ' || regstr[0] == '\t' || regstr[0] == '\n')
  {
    whitespaceno = 1;
  } 
 // } 
   //pragma(msg,"atom consumed " ~ regstr);
  if (regstr[0] == '\\') { // escape character
    if (regstr.length>1) {
      if (!((regstr[1] >= '0' && regstr[1] <= '9') || regstr[1] == 's'
            || regstr[1] == 'd' || regstr[1] == 'w' || regstr[1] == 'A' || regstr[1] == 'z' ))
        atomConsumedc = 2;
      else
        atomConsumedc = 0;
    } else {
      assert(0, "\nError: Regexp must not end with \\ ");
           // writefln("Error: Regexp must not end with \\ ");
           // assert(0);
    }
  } else if (regstr[0] == '@' || regstr[0] == '$' || regstr[0] == '^' 
             || regstr[0] == '.' || regstr[0] == '[' || regstr[0] == '(' ) { // NONSTANDARD: referenced parameter
      atomConsumedc = 0;
    } else 
      atomConsumedc = 1; // match single char
  return atomConsumedc;
}

// parses a term from the front of regstr (which must not be empty).
// consisting of an atom, optionally followed by a quantifier.
int termConsumed(char [] regstr)
{
 /*   int atomC = atomConsumed(regstr);
    int quantifierC= quantifierConsumed(regstr[atomC..$]);
    int quantifiergreedinessC=quantifiergreedinessConsumed(regstr[atomC + quantifierC ..$]);
    int termConsumed = atomC + quantifierC+quantifiergreedinessC;
    return termConsumed;*/
  return atomConsumed(regstr) +
  quantifierConsumed(regstr[atomConsumed(regstr)..$]) +
  quantifiergreedinessConsumed(regstr[atomConsumed(regstr) + quantifierConsumed(regstr[atomConsumed(regstr)..$]) ..$]);
}

//parses a character sequence without quantifiers
int characterSequenceConsumed(char []regstr, bool [char[]] options, out int realchars)
{
  realchars = 0;
  if (regstr.length == 0)
  {
    return 0; 
  } 
  int whitespaceno;
  int atomC = atomCharacterConsumed(regstr, whitespaceno);
  if (atomC>0)
  {
    int quantifierC = quantifierConsumed(regstr[atomC..$]);
    if (quantifierC == 0)
    {
      if (options["x"] && whitespaceno>0)
      {
      } 
      else
      {
        realchars = 1; 
      } 
      int crealchars;
      atomC += characterSequenceConsumed(regstr[atomC..$], options, crealchars);
      realchars += crealchars; 
    }
    else
    {
      atomC = 0;
    }
  }
  return atomC;
}

//---------------------------------------------------------------------
// Part II: mixins which generate the final code
//---------------------------------------------------------------------
// Unlike most regexp engines, which turn the pattern string into a table-based state machine,
// this one generates a binary tree of nested functions. Each node in the tree corresponds to
// a D template, and is generated as a mixin.

// At compile time, each ctfe is passed a subset of a regexp string.
// It generates a member function bool aname(), which updates a pointer p,
// and returns true if a match was found.

// Each ctfe has access to the following values:
// At compile time: 
//     fullpattern -- the complete, unparsed regular expression string
// At run time:
//     searchstr (read only) -- the string being searched
//     p --- the first character in searchstr which is not yet matched.
//     param[0..8] -- the quasi-static parameter strings @1..@9 to match.

// Additional variables or constants can be added as desired.

// Most of the complexity in the regexp engine comes from the optional quantifiers.
// In general, they can only determine how far to match by testing if the entire remainder
// of the pattern can be matched.
//
// Each ctfe also recieves a function 'next'. This has a member bool fn() which
// returns true if the remainder of the regexp match is successful.
// All regexps must ensure that next is called.

// Note that unless p is reset to 0, it will automatically behave as a global search,
// continuing from the last place it left off.


int findOptions(char [] pattern)
{
  for (int i = 0;i<pattern.length;i++)
  {
    if (pattern[pattern.length - 1 - i..pattern.length - i] == "/" )
    {
      if (pattern.length - 2 - i >= 0 && pattern[pattern.length - 2 - i] == '\\')
      {
        return pattern.length;
      }
      return pattern.length - i - 1;
    }
  }
  return pattern.length;
}


char[] parseRegexp(char [] pattern)
{
  char[] endSequence = alwaysTrue() ;
  int groupno = 0; 
  char[] pattern2;
  if (pattern.length>0 && pattern[0] == '/' )
  {
    pattern2 = pattern[1..$];
  } 
  else
  {
    pattern2 = pattern;
  } 
  int opt = findOptions(pattern2);
  bool [char[]] options = ["i":false, "x":false, "s":false, "m":false];
   // options["i"]=false;
  if (opt != pattern2.length)
  {
    foreach(c;pattern2[opt + 1..$])
    {
      options[""~c] = true;
    } 
    //opt--;
//      assert(0,pattern~tostring(opt));
  } 
  int globalfuncno;
  char[] code = "//Regexp:"~toLiteralString(pattern2)~ "\n"~endSequence~regSequence("engine",
                                                                                    groupno, pattern2[0..opt], options, "next", globalfuncno);
  char[] decl;
  for (int i = 1;i <= groupno;i++)
  {
    decl~="int bracketend"~tostring(i)~"=-1;\n";
  } 
  return decl~code;
}

char[] alwaysTrue() // used to mark the end of a sequence
{
  return "bool next () { return true; }\n";
}
private struct retSequence
{
  char[] code; 
  int groupno; 
} 
// regstr is a sequence of productions, possibly containing a union
char[] regSequence(char fnname[], ref int groupno, char [] regstr, bool[char[]] options, char[] next, ref int globalfuncno)
{
  char [] code = "";
  if (findUnion(regstr) ==  - 1) {
        // No unions to worry about
    
    code = regNoUnions(fnname, groupno, regstr, options, next, globalfuncno);
  } else {
    code ="
        bool "~ fnname~ "() { //regSequence
            // Both halves of the union have the same next, inherited from the parent
          " ~regSequence("a", groupno, regstr[0..findUnion(regstr)], options, next, globalfuncno) ~"
          " ~ regSequence("b", groupno, regstr[findUnion(regstr) + 1..$], options, next, globalfuncno) ~" 
            int oldp = p;
            if (a()) return true;
            p = oldp;
            group.length="~tostring(groupno + 1)~";
           // writefln(\"regSequence\",~"~toLiteralString(regstr)~");
            return b();
        }";
  }
  return code;
}

int countGroups(char [] regstr)
{
  if (regstr.length == 0)
  {
    return 0;
  } 
  else if (regstr.length >2 && regstr[0..3] == "(?:")
    {
      return 0;
    }
    else if (regstr.length >2 && regstr[0..3] == "(?>")
      {
        return 0;
      }
      else if (regstr[0] == '(')
        {
          return 1; 
        }
        else
        {
          return 0; 
  }
}

int findLastLetter(char[] fnname)
{
  int i = 0; 
  foreach (c;fnname)
  {
    if (!((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')))
    {
      return i; 
    } 
    i++;
  } 
  return i;
} 

// regstr is a sequence of terms, all of which must be matched
// Does not contain any unions
char[] regNoUnions(char[] fnname, ref int groupno, char [] regstr, bool [char []] options, char[] next, ref int globalfuncno)
{
  char[] code;
  int skipcs;
  int skip;
   // assert(0,"no way "~regstr);
  //  writefln("regNoUnions "~regstr);
  //if (regstr.length>0)
 // {
  code =
  "//regNoUnions "~toLiteralString(regstr[0..termConsumed(regstr)]) ~"\n";
 // }
  if (options["x"])
  {
    int i = 0;
    while (i<regstr.length && (regstr[i] ==' ' || regstr[i] == '\t' || regstr[i] == '\n'))
    {
      i += 1; 
    }
    if (i>0)
    {
      if (i<regstr.length)
      {
        return regNoUnions(fnname, groupno, regstr[i..$], options, next, globalfuncno);
      }
      else
      {
        return "bool "~fnname~"(){ return "~next~"();}";
      }
    } 
  } 
 //assert((regstr.length ==0),"regstr.length cannot be zero " ~ regstr );
  if (regstr.length == termConsumed(regstr)) {
        // there's only a single item (possibly including a quantifier)
    code~= regTerm(fnname, groupno, regstr, options, next, globalfuncno);
  } else {
    int realskipcs;
    skipcs = characterSequenceConsumed(regstr, options, realskipcs);
    if (regstr.length == skipcs)
    {
      code~= regCharacterSequence(fnname, groupno, regstr, options, next);
    } 
    else
    {
   // writefln(skipcs);
    //int skip;
      char[] second;
      if (realskipcs>1)
      {
        skip = skipcs;
        
      }
      else
      {
        skip = termConsumed(regstr);
      }
//    int g=groupno+countGroups(regstr);
      int g = groupno;
      char[] newnextname = "next"~tostring(globalfuncno);
      globalfuncno++;
      if (realskipcs>1)
      {
    //   assert(0,"hi"~tostring(skip)~regstr);
        second = regSequence(newnextname, groupno, regstr[skip..$], options, next, globalfuncno);
        code~= "bool "~fnname~"() {  
                      
            "~second~regCharacterSequence("first", g, regstr[0..skip], options, newnextname)~" // regTerm 
            return first();
        }
      ";
      }
      else 
      { 
        int oldgroupno = groupno;
        int glfno = 0;
        regTerm("", groupno, regstr[0..skip], options, "", glfno); //just to get groupno
        second = regSequence(newnextname, groupno, regstr[skip..$], options, next, globalfuncno);
        code~="
        bool "~fnname~"() {            
            "~second~regTerm("first", oldgroupno, regstr[0..skip], options, newnextname, globalfuncno)~" // regTerm 
            return first();
        }
      ";
      }
    }
  }
  return code;
}
char[] regStop(char[] fnname, int groupno, char[] next)
{ 
  return "
     bool "~fnname~"() { //regStop
     ""bracketend"~tostring(groupno)~"=p;
     return "~next~"();   
     }";
}

char[] regCharacterSequence(char[] fnname, int groupno, char [] regstr, bool [char []] options, char[] next)
{
  int i = 0;
  int matchsize = 0;
  char [] match = "";
  char[] code;
  while (i<regstr.length)
  {
    if (regstr.length + i>1 && regstr[i] == '\\') { 
      match~=toLiteralString(regstr[i + 1]);
      i += 2;
      matchsize++; 
    } else {
      if (options["x"] && (regstr[i] ==' ' || regstr[i] == '\t' || regstr[i] == '\n'))
      {
      } 
      else
      {
        match~=toLiteralString(regstr[i]);
        matchsize++; 
      } 
      i++;
        // match single character
    }
    
  }
  if (!options["i"])
  {
  // writefln("match "~match);
    code ="bool "~fnname~"() {              
                if (p+"~tostring(matchsize)~">searchstr.length || searchstr[p..p+"~tostring(matchsize)~"]!=\""~match~"\") return false;
                p+="~tostring(matchsize)~";
                return "~next~"();
            }
          ";
  }
  else
  {
    code ="bool "~fnname~"() {
                if (p+"~tostring(matchsize)~">searchstr.length || icmp(searchstr[p..p+"~tostring(matchsize)~"],\""~match~"\")!=0) return false;
                p+="~tostring(matchsize)~";
                return "~next~"();
            }
          "; 
  } 
  return code;
}


// the term without a quantifier. Here we deal with embedded subsequences.
char[] regSingleTerm(char[] fnname, ref int groupno, char [] regstr, bool [char []] options,
                     char[] next, int globalfuncno)
{
  char[] code;
  
  if (regstr.length>2 && regstr[0..3] == "(?:") {
            // A sequence always calls next.
    code = regSequence(fnname, groupno, regstr[3..$ - 1], options, next, globalfuncno);
  } 
  else if (regstr.length>2 && regstr[0..3] == "(?>") {
            // A sequence always calls next.
      code = regSequence("independent", groupno, regstr[3..$ - 1], options, "next", globalfuncno);
      code ="bool "~fnname~"() {\n"~code ;
      code~="return independent() && "~next~"();}\n"; 
    } 
    else if (regstr[0] == '(') {
            // A sequence always calls next.
        groupno++;
        char[] stop = regStop("stop"~tostring(groupno), groupno, next);
        char[] bracketvar = "bracketend"~tostring(groupno);
        int cgroupno = groupno;
        code =" //single term
            bool "~fnname~"() { // (
             "~stop~"
              //int "~bracketvar~";
            "~regSequence("a", groupno, regstr[1..$ - 1], options, "stop"~tostring(groupno), globalfuncno)~ "
              int oldp=p; 
              if (group.length<="~tostring(cgroupno)~")
              {
                 group.length="~tostring(cgroupno + 1)~";
              }           
              group["~tostring(cgroupno)~"]=grouprec(oldp,-1);  
              bool r=a();
              if (r)  
              {             
              group["~tostring(cgroupno)~"]=grouprec(oldp,"~bracketvar~");
           //   writefln(\"grouprec1 \",oldp,\" \",p);
              }
              else
              {
              group.length="~tostring(cgroupno)~";  
              }  
             return r;
              }
            ";
      } else {
            // A simple atom doesn't call next, so we need to do it here.
        code ="bool "~fnname~"() {
                "~regAtom(groupno, regstr, options) ~ "
                return fn() && "~next~"();
            }
          ";
  }
  return code;
}

// Evaluate one term (without quantifier).
// This helper class has two purposes:
// (1) to restore the 'p' pointer when we return.
// (2) ensure that at least one character was consumed
char[] regSequenceDontUpdateP(char[] fnname, int groupno, char [] regstr, bool [char [] ] options, ref int globalfuncno)
{
  //int globalfuncno=0;
  return "bool "~fnname~"() { //regSequenceDontUpdateP
        " ~regSequence("x", groupno, regstr, options, "next", globalfuncno)~"
        // It's only a successful match if _something_ was consumed
        if (p==theinitialp) return false;      
        int oldp = p;
        if (!x()) return false;
        p = oldp;  
        return true;                
    }
  ";
}

//  Calls the naked term twice, but only updates 'p' after the first one.
// Evaluate the term, knowing that what comes after will be the same as this.
char[] regTermTwice(char[] fnname, int groupno, char [] regstr, bool [char[]] options, int t, ref int globalfuncno)
{
  char[] code;
  if (regstr.length>2 && (regstr[0..3] == "(?:" || regstr[0..3] == "(?>")) {
    char [] suddendeath = regSequenceDontUpdateP("suddendeath", groupno, regstr[3..t - 1], options, globalfuncno); //groupno may be incorrect but does not matter
    
    code ="
        bool "~fnname~"()
        {
            // While evaluating this first sequence, if this is a sequence
            // that potentially has zero length (ie, everything is a *, ? or {m,} term),
            // each term should attempt to consume at least one character if possible.
            int theinitialp = p;  
         " ~suddendeath ~regSequence("a", groupno, regstr[3..t - 1], options, "suddendeath", globalfuncno)~
    "return a();
       }
       ";
  } 
  else if (regstr[0] == '(') {
      char []suddendeath = regSequenceDontUpdateP("suddendeath", groupno + 1, regstr[1..t - 1], options, globalfuncno);
      int g = groupno + 1;
      code ="
        bool "~fnname~"()
        {
            // While evaluating this first sequence, if this is a sequence
            // that potentially has zero length (ie, everything is a *, ? or {m,} term),
            // each term should attempt to consume at least one character if possible.
            int theinitialp = p;
           "~suddendeath~ regSequence("a", g, regstr[1..t - 1], options, "suddendeath", globalfuncno)~ "
             int oldp=p;              
              bool r=a();
              if (group.length<="~tostring(groupno + 1)~")
              {
                 group.length="~tostring(groupno + 2)~";
              }
              group["~tostring(groupno + 1)~"]=grouprec(oldp,-1);
              if (r)
              {
          //    writefln(\"grouprec \",oldp,\" \",p);
              }
              else
              {
              group.length="~tostring(groupno + 1)~";  
              }
             return r;
            //return a.fn();
       }
       ";
    } else {
      code ="
            bool "~fnname~"() {
                // It's easy with atoms, because we know they always eat something.
                // BUG: Maybe this will fail when null @n strings are passed in?                
                "~regAtom(groupno, regstr, options)~"
                return fn();
            } 
    "; 
  }
  return code;
}


// the atom, optionally followed by a quantifier.
// Here we deal with all kinds of repitition,
// but we make different optimisations depending on the allowable repeats.
char[] regTerm(char[] fnname, ref int groupno, char [] regstr, bool [char []] options, char[] next, ref int globalfuncno)
{
  char [] code;
  if (atomConsumed(regstr) == regstr.length) {
    
            // there is no quantifier, just use the naked term
    code = regSingleTerm(fnname, groupno, regstr, options, next, globalfuncno);
  } else {
    int t = atomConsumed(regstr);
    size_t qc = quantifierConsumed(regstr[t..$]);
    size_t repmin = quantifierMin(regstr[t..$]);
    size_t repmax = quantifierMax(regstr[t..$]);
    size_t greedy = quantifierGreediness(regstr[t + qc..$]);
    size_t cg = countGroups(regstr);
    
    code ="
        bool "~fnname~"(){
           
            
            // HORRENDOUSLY inefficient! In some cases, we generate the quantified term THREE TIMES!
            // The first one contains the rest of the search tree.
            // This is used when we think we can do (atom).(next) for an early exit
            "~regTerm("atomAndNext", groupno, regstr[0..t], options, next, globalfuncno) ~ "

        //    debug writefln(fullpattern, \" Quantifier \",regstr ,  \" starting at \", searchstr[p..$]);
            ";
    if (repmin == 0 && repmax == 1) { 
      code~="
                // \"?\", or \"{0,1}\". Worth optimising seperately
                int oldp = p;
                ";
      if (!greedy)
      {
        code~="if ("~next~"()) { return true; }
                p = oldp;
                return atomAndNext();
                }";
      }
      else //greedy
      {
        code~=" // pragma(msg, \"?greedy\");
                if (atomAndNext())
                  {
                    return true;
                  } 
                p = oldp;
                if ("~next~"())
                {
                  return true;       
                }  
                p = oldp;
                return false;  
                }
              ";
      }
    } else {
      code~="
                // Here's where we generate the redundant term.
                // If we can't do (atom).(next), we must be able to do
                // (atom).(atom) to stay in the game.                       
                  "~regTermTwice("atomonly", groupno, regstr[0..t], options, t, globalfuncno) ;
      if (repmin == 0 && repmax == uint.max) {
                    // optimise for \"*\", \"{0,}\"
        if (cg>0)
        {
          assert(0,"\nError:use of * or {0,} on any and this capturing group "~regstr[0..t]~" is not supported"); 
        } 
        if (!greedy) 
        {
          code~=" // optimise for non-greedy\"*\", \"{0,}\"
                    int oldp=p;
                    if ("~next~"()) return true; // We can finish right now.
                    p=oldp;
                    do {
                      // Can we do (atom).(next) ?
                      oldp = p;
                      if (atomAndNext()) { return true; }
                      p = oldp;
                      // We need to do (atom).(atom) to have any chance of continuing.                  
                      // also, it must have consumed at least one character, or there is no hope.                 
                    } while (atomonly() && p != oldp);
                    return false;
                    }
                     ";
        }
        else // optimise for greedy\"*\", \"{0,}\"
        {
          code~=" // greedy
                     int oldp;
                     int veryoldp=p;    
                     grouprec [] savegroups;  
                     int newp=-1;            
                   // p=oldp;
                    do {
                      // Can we do (atom).(next) ?
                      oldp = p;
                      if (atomAndNext()) 
                      { newp=p;
                        int sl=group.length-("~tostring(groupno + 1)~");
                        if (sl>0)
                        {
                        savegroups.length=sl;  
                        savegroups[0..$]=group["~tostring(groupno + 1)~"..$];
                        }    
                        group.length="~tostring(groupno + 1)~";  
                      }
                      p = oldp;
                      // We need to do (atom).(atom) to have any chance of continuing.                  
                      // also, it must have consumed at least one character, or there is no hope.                 
                    } while (atomonly() && p != oldp);
                     if (newp!=-1)
                     {
                      p=newp;
                      group.length="~tostring(groupno + 1)~"+savegroups.length;
                      if (savegroups.length>0)
                      {
                        group["~tostring(groupno + 1)~"..$]=savegroups[0..$];
                      }  
                             
                      return true;
                     }
                    p = veryoldp;
                    group.length="~tostring(groupno + 1)~";
                    if ("~next~"()) return true; // success but we want longer ones
                    return false;
                    }";
        }
      } else { // \"+\", or \"{m,n}\"
        if (cg>0)
        {
          assert(0,"\nError:use of + or {m,n} on any and this capturing group "~regstr[0..t]~" is not supported"); 
        } 
        if (!greedy) 
        {
          code~="// non-greedy\"+\", or \"{m,n}\"
                    int numreps=0; // how many repeats have we found?
                    int oldp;\n";
          if (repmin == 0)
          {
            code~="
                    oldp=p;
                    if ("~next~"()) return true;
                    p = oldp;
                    "; 
          } 
          code~="
                    do {
                        oldp = p;
                        numreps++;
                        if (numreps>="~tostring(repmin)~" && atomAndNext()) return true;
                        p = oldp;
                    ";
          if (repmax<uint.max) {
            code~=" // optimise for \"+\", \"{n,}\"
                            if (numreps == "~tostring(repmax)~") return false;
                            ";
          }
          code~="
                     } while (atomonly() && p!=oldp);
                    return false;
                    }
";
        }
        else // greedy
        {
          code~="//greedy\"+\", or \"{m,n}\"
                    int numreps=0; // how many repeats have we found?
                    int oldp;
                    int newp=-1;
                    grouprec [] savegroups;\n";
          if (repmin == 0)
          {
            code~="
                    oldp=p;
                    if ("~next~"()) 
                    {
                      newp=p;                     
                        int sl=group.length-"~tostring(groupno + 1)~";
                        if (sl>0)
                        {
                        savegroups.length=sl;
                        savegroups[0..$]=group["~tostring(groupno + 1)~"..$];
                        }  
                        group.length="~tostring(groupno + 1)~";            
                    }
                    p = oldp;
                    "; 
          }
          code~="
                    do {
                        oldp = p;
                        numreps++;
                        if (numreps>="~tostring(repmin)~" && atomAndNext()) {
                          newp=p;
                         
                        int sl=group.length-("~tostring(groupno + 1)~");
                        if (sl>0)
                        {
                        savegroups.length=sl;
                        savegroups[0..$]=group["~tostring(groupno + 1)~"..$];
                        }  
                        group.length="~tostring(groupno + 1)~";       
                        }
                        p = oldp;
                        ";
          if (repmax<uint.max) {
            code~=" // optimise for \"+\", \"{n,}\"
                            if (numreps == "~tostring(repmax)~") break;
                            ";
          }
          code~="
                     } while (atomonly() && p!=oldp);
                     if (newp!=-1)
                     {
                      p=newp;
                      group.length="~tostring(groupno + 1)~"+savegroups.length;
                      if (savegroups.length>0)
                      {
                        group["~tostring(groupno + 1)~"..$]=savegroups[0..$];
                      } 
                      return true;
                     }
                    return false;
                  }
                ";
        }
      }
    }
    
  }
  return code;
}

// generate a parser for an atom
// IN: regstr is a valid atom, without a repeat
// OUT: if atom is matched, return true, and update p.
//      if atom is not matched, return false, and leave p unchanged.
char[] regAtom(int groupno, char [] regstr, bool[char[]] options)
{ 
  if (regstr[0] == '[') {
    if (regstr[1] == '^')
    { 
      return "
        bool fn() { // inverse character class  
              if (p<searchstr.length && (!"~charMatches(regstr[2..$ - 1], "searchstr[p]", options)~"))
                {
                  p++; 
                  return true;
                }  
                return false;
         } "; 
    } else {
      return "
        bool fn() { // character class
                if (p<searchstr.length && ("~charMatches(regstr[1..$ - 1], "searchstr[p]", options)~"))
                {
                  p++; 
                  return true;
                }  
                return false;
            }
          ";
    } 
  } else if (regstr[0] == '.') { // match any
      if (options["s"])
      {
        return "
        bool fn() { //.
            if (p==searchstr.length) return false;
            p++;
            return true;
        }
      ";
      } 
      else
      {
        return "
        bool fn() { //.
            if (p==searchstr.length || searchstr[p]=='\\n' ) return false;
            p++;
            return true;
        }
      ";
        
      }
    } else if (regstr.length>1 && regstr[0..2] == "\\w") { // match a word letter
        bool [char[]] toptions = ["i":false];
        return "
       bool fn() {   
             if (p<searchstr.length && ("~charMatches("\\w", "searchstr[p]", toptions)~"))
               {
                 p++;
                 return true;
                }
             return false; 
            }
          ";
      }
      else if (regstr.length>1 && regstr[0..2] == "\\s") { // match whitespace
          return "
       bool fn() {    
       if (p<searchstr.length && ("~charMatches("\\s", "searchstr[p]", options)~"))
               {
                 p++;
                 return true;
                }
             return false; 
            }
          ";
        }
        else if (regstr.length>1 && regstr[0..2] == "\\d") { // match numbers
            return "
       bool fn() {   
       if (p<searchstr.length && ("~charMatches("\\d", "searchstr[p]", options)~"))
               {
                 p++;
                 return true;
                }
             return false; 
            } 
          ";
          } else if (regstr.length>1 && regstr[0] == '\\' && (regstr[1] >= '1' && regstr[1] <= '9' )) {
              if (atoui(""~regstr[1])>groupno)
              {
                assert(0,"\nmax group number at this point:"~tostring(groupno) ~ " bad \\"~regstr[1]~ ":group "~regstr[1]~" cannot be referenced as it is not available at this point"); 
              } 
       // assert(0,"bad \\"~regstr[1]~ ":group "~regstr[1]~" cannot be referenced as it is not captured"); 
              
              return " bool fn() {   
       int gs=group["~regstr[1]~"].start;
       int ge=bracketend"~regstr[1]~";
       int gsize=ge-gs;
      //   writefln(`group `,gs,\" \",ge,`searchstr `,\" \",p,\" \",p+gsize);
     //  writefln(`group `,searchstr[gs..ge],`searchstr `,searchstr[p..p+gsize]);
       if (gsize<0)
       {
           assert(0,\"\nbad \\\\"~regstr[1]~ ":group "~regstr[1]~" cannot be referenced as it is not captured\"); 
      }
       if (p+gsize<=searchstr.length && searchstr[gs..ge]==searchstr[p..p+gsize])
               {
                 p+=gsize;
                 return true;
                }
             return false; 
            } 
          ";
            }
            else if (regstr[0] == '@') { // NONSTANDARD: referenced parameter
                return regParameter(atoui(regstr[1..$]) - 1, options);
              } else if (regstr[0] == '^') { // start of line
                  if (options["m"])
                  {
                    return "
        bool fn() {
            return (p==0 || searchstr[p-1]=='\\n');
        } 
        ";
                  }
                  else
                  {
                    return "
        bool fn() {
            return (p==0);
        } 
        "; 
                  } 
                } else if (regstr[0] == '$') { // end of line
                    if (options["m"])
                    {
                      return "
        bool fn() {
            return (p==searchstr.length || searchstr[p+1]=='\\n');
        }    
        ";
                    }
                    else
                    {
                      return "
        bool fn() {
            return (p==searchstr.length || (p==searchstr.length-1 && searchstr[p]=='\\n'));
        }    
        ";
                    } 
                  } else if (regstr.length>1 && regstr[0] == '\\' && regstr[1] == 'A') { // end of line
                      return "
        bool fn() {
            return (p==0);
        }    
        ";
                    } else if (regstr.length>1 && regstr[0] == '\\' && regstr[1] == 'z') { // end of line
                        return "
        bool fn() {
            return (p==searchstr.length);
        }    
        ";
                      } else if (regstr.length>1 && regstr[0] == '\\') { // escaped char
                          char[] regstr1 = toLiteralChar(regstr[1]);
                          if (!options["i"])
                          {
                            return "
         bool fn() {
            if (p==searchstr.length || searchstr[p]!="~regstr1~") return false;
            p++;
            return true;
        }
      ";
                          }
                          else
                          {
                            return "
         bool fn() {
            if (p==searchstr.length || icmp([searchstr[p]],["~regstr1~"])!=0) return false;
            p++;
            return true;
        }
      ";
                            
                            
                          } 
                        } else {
        // match single character
                          char[] regstr0 = toLiteralChar(regstr[0]);
                          if (!options["i"])
                          {
                            return "
        bool fn() {
            if (p==searchstr.length || searchstr[p]!="~regstr0~") return false;
            p++;
            return true;
        }
      ";
                          }
                          else
                          {
                            return "
         bool fn() {
            if (p==searchstr.length || icmp([searchstr[p]],["~regstr0~"])!=0) return false;
            p++;
            return true;
        }
      ";
                          } 
  }
}

// match a variable string, which will be passed as a parameter.
char[] regParameter(int parmnum, bool [char[]]options)
{
  if (!options["i"])
  {
    return "
    bool fn() {
        if (p + param["~tostring(parmnum)~"].length > searchstr.length) return false;
        if (searchstr[p..p+param["~tostring(parmnum)~"].length] != param["~tostring(parmnum)~"]) return false;
        p+=param["~tostring(parmnum)~"].length;
        return true;
    }
  ";
  }
  else
  {
    return "
    bool fn() {
        if (p + param["~tostring(parmnum)~"].length > searchstr.length) return false;
        if (icmp(searchstr[p..p+param["~tostring(parmnum)~"].length],param["~tostring(parmnum)~"])!=0) return false;
        p+=param["~tostring(parmnum)~"].length;
        return true;
    }
  ";
    
  }
}

//"a-zA-Z0-9_"

char[] toLiteralString(char[] s)
{
  char[] sout;
  foreach(c;s)
  {
    sout~=toLiteralString(c);
  } 
  return sout; 
}

char[] toLiteralString(char c)
{
  if (c == '\'')
  {
    return "\\\'"; 
  } 
  else if (c == '\\')
    {
      return "\\\\"; 
    }
    else if (c == '\n')
      {
        return "\\n"; 
      }
     else if (c == '\r')
      {
        return "\\r"; 
      }
     else if (c == '\t')
      {
        return "\\t"; 
      }
      else
      {
        return ""~c; 
  } 
}


char[] toLiteralChar(char c)
{
  return "\'"~toLiteralString(c)~"\'"; 
  
}
// ps1<=pe1 and ps2<=pe2
bool intersectPeriods(int ps1, int pe1, int ps2, int pe2, out int is1, out int ie1)
{
  if (pe1<ps2) 
  {
    return false;
  } 
  if (pe2<ps1) 
  {
    return false;
  } 
  if (pe1 <= pe2)
  {
    if (ps1 <= ps2)
    {
      is1 = ps2;
      ie1 = pe1; 
      return true; 
    } 
    else
    {
      is1 = ps1;
      ie1 = pe1; 
      return true; 
    } 
  } 
  else
  {
    if (ps1 <= ps2)
    {
      is1 = ps2;
      ie1 = pe2; 
      return true; 
    } 
    else
    {
      is1 = ps1;
      ie1 = pe2; 
      return true; 
    } 
    
  } 
}


// return true if char ch is matched by the character class regstr.
char[] charMatches(char [] regstr, char []ch, bool [char[]] options)
{
  char[] code; 
  if (regstr.length == 0) return "false";
  else if (regstr.length >= 3 && regstr[1] == '-') {
      if (regstr[0]>regstr[2])
      {
        assert(0, "Error:>"~regstr[0..3]~"< start of range of a character range is bigger than ending range"); 
      } 
      if (!options["i"])
      { 
        char[] regstr0 = toLiteralChar(regstr[0]);
        char[] regstr2 = toLiteralChar(regstr[2]);
        return "("~ch~">="~regstr0~" && "~ch~"<="~regstr2~") || "~charMatches(regstr[3..$], ch, options);
      }
      else
      {
        int is1, ie1;
        char is2, ie2;
        bool i1, i2;
        char[] code1, code2;
        i1 = intersectPeriods('a', 'z', regstr[0], regstr[2], is1, ie1);
        if (i1)
        {
          int isi, iei;
          char uis, uie;
          uis = toupper([is1])[0] ; uie = toupper([ie1])[0] ;
          code1 = "("~ch~">="~toLiteralChar(uis)~" && "~ch~"<="~toLiteralChar(uie)~") || ";
          if (intersectPeriods(uis, uie, regstr[0], regstr[2], isi, iei))
          {
            if (isi == uis && iei == uie) //UPPER-UPPER is in regstr[0]-regstr[2]
            {
              code1 = "";
            } 
          } 
        } 
        i1 = intersectPeriods('A', 'Z', regstr[0], regstr[2], is1, ie1);
        if (i1)
        {
          int isi, iei;
          char lis, lie;
          lis = tolower([is1])[0] ; lie = tolower([ie1])[0] ;
          code2 = "("~ch~">="~toLiteralChar(lis)~" && "~ch~"<="~toLiteralChar(lie)~") || ";
          if (intersectPeriods(lis, lie, regstr[0], regstr[2], isi, iei))
          {
            if (isi == lis && iei == lie) //UPPER-UPPER is in regstr[0]-regstr[2]
            {
              code2 = "";
            } 
          } 
        }
        char[] regstr0 = toLiteralChar(regstr[0]);
        char[] regstr2 = toLiteralChar(regstr[2]);
        return code1~ code2~ "("~ch~">="~regstr0~" && "~ch~"<="~regstr2~") || "~charMatches(regstr[3..$], ch, options); 
      } 
    } 
    else if (regstr.length >= 2 && regstr[0..2] == "\\w") {
        return charMatches("a-zA-Z0-9_", ch, options) ~ " || "~charMatches(regstr[2..$], ch, options);
      }
      else if (regstr.length >= 2 && regstr[0..2] == "\\d") { 
          return charMatches("0-9", ch, options)~" || "~charMatches(regstr[2..$], ch, options); 
        }
      else if (regstr.length >= 2 && regstr[0..2] == "\\s") { 
          return charMatches(" \t\n\r", ch, options)~" || "~charMatches(regstr[2..$], ch, options); 
        }
        else { 
          char[] regstr0 = toLiteralChar(regstr[0]);
          return "("~ch~"=="~regstr0~") || "~charMatches(regstr[1..$], ch, options);}
}


//---------------------------------------------------------------------
// Part III: the public interface of the regexp engine
//---------------------------------------------------------------------

// Does the regexp match the pattern?
template test(char [] fullpattern)
{
  bool test(char [] searchstr, char [][] param...) {
    int p = 0; // start at the beginning of the string
    mixin (parseRegexp(fullpattern));
    return engine();
  }
}

class screg(char [] fullpattern)
{
  private:
  int p; // next index to test
        //int groupno=0;
  int x;
  grouprec [] group;
  char[] searchstr;
  public:
  this()
  {  
    p = 0;  
  } 
  mixin (parseRegexp(fullpattern));
  bool match(char[] searchstrin)
  {
    group.length=0;
    searchstr=searchstrin;
    for (int x = p; x<searchstr.length;++x) {
      p = x; 
      if (engine()) {
        if (group.length == 0)
        {
          group.length = 1;
        } 
        group[0] = grouprec(x, p);
        return true;
      }
    }
    return false;
  }
  char[] _(int groupno)
  {
    return .group(searchstr, group,groupno); 
  }
  int pos()
  {
   return p;
  }   
  void pos(int pin)
{
   p=pin;
} 
  void restart()
 {
   p=0;
 } 
}

/// Return first substring which matches the pattern.
/// Note that some patterns will return an empty string as a valid result.
//template search
//{
char [] search(char [] fullpattern)(char [] searchstr, char [][] param...) {
  int p; // next index to test
        //int groupno=0;
  grouprec [] group;
  //pragma(msg,parseRegexp(fullpattern));
  mixin (parseRegexp(fullpattern));
  for (int x = 0; x<searchstr.length;++x) {
    p = x;
    if (engine()) return searchstr[x..p];
  }
  return null; // no match
}
//}



//template searchgroups(char [] fullpattern)
//{
grouprec [] indexgroups(char [] fullpattern)(char [] searchstr, char [][] param...) {
  int p; // next index to test
        //int groupno=0;
  grouprec [] group;
         // pragma(msg,"here 3");
  mixin (parseRegexp(fullpattern));// engine;
  
  for (int x = 0; x<searchstr.length;++x) {
    p = x; 
    if (engine()) {
      if (group.length == 0)
      {
        group.length = 1;
      } 
      group[0] = grouprec(x, p);
      return group;
    }
  }
  return null; // no match
}
//}
grouprec [][] indexgroupsall(char [] fullpattern)(char [] searchstr, int startindex = 0, char [][] param = []) {
  int p; // next index to test
  grouprec [] group;
  mixin (parseRegexp(fullpattern));
  grouprec [][] solutions;
  int soli = 0;
  for (int x = startindex; x<searchstr.length;++x) {
    p = x;
    if (engine()) 
    { 
      if (group.length == 0)
      {
        group.length = 1;
      } 
      group[0] = grouprec(x, p);
      solutions.length = soli + 1;
      solutions[soli] = group;
      soli++;
      x = p - 1;
    }
  }
  return solutions; // return all
}

char [] group(char[] str, grouprec [] g, int groupno)
{
  if (g[groupno].end ==  - 1)
  {
    return []; 
  } 
  return str[g[groupno].start..g[groupno].end]; 
} 



template index(char [] fullpattern)
{
  int index(char [] searchstr, int startindex, char [][] param...) {
    int p; // next index to test
    grouprec [] group;
    int rp;
    mixin (parseRegexp(fullpattern));
    for (int x = startindex; x<searchstr.length;++x) {
      p = x;
      rp = 0;
      if (engine()) return x;
    }
    return - 1; // no match
  }
}

struct indexrec
{
  int start;
  int end; //as for array slices, last char + 1
}

struct grouprec
{
  int start;
  int end =  - 1; //as for array slices, last char + 1
}

template index2(char [] fullpattern)
{
  indexrec index2(char [] searchstr, int startindex, char [][] param...) {
    int p; // next index to test
    int rp;
    grouprec [] group;
    mixin (parseRegexp(fullpattern));
    for (int x = startindex; x<searchstr.length;++x) {
      p = x;
      rp = 0;
      if (engine()) return indexrec(x, p);
    }
    return indexrec( - 1, - 1); // no match
  }
}

template indexall(char [] fullpattern)
{
  indexrec[] indexall(char [] searchstr, int startindex = 0, char [][] param = []) {
    int p; // next index to test
    grouprec [] group;
    mixin (parseRegexp(fullpattern));
    indexrec[] solutions;
    int soli = 0;
    for (int x = startindex; x<searchstr.length;++x) {
      p = x;
      if (engine()) 
      { 
        solutions.length = soli + 1;
        solutions[soli] = indexrec(x, p);
        soli++;
        x = p - 1;
      }
    }
    return solutions; // return all
  }
}

template indexalloverlapping(char [] fullpattern)
{
  indexrec[] indexalloverlapping(char [] searchstr, int startindex = 0, char [][] param = []) {
    int p; // next index to test
    grouprec [] group;
    mixin (parseRegexp(fullpattern));
    indexrec[] solutions;
    int soli = 0;
    for (int x = startindex; x<searchstr.length;++x) {
      p = x;
      if (engine()) 
      { 
        solutions.length = soli + 1;
        solutions[soli] = indexrec(x, p);
        soli++;
      }
    }
    return solutions; // return all
  }
}




template searchall(char [] fullpattern)
{
  char[][] searchall(char [] searchstr, char [][] param...) {
    int p; // next index to test
    grouprec [] group;
       //  pragma(msg, "here"~parseRegexp(fullpattern));
    mixin (parseRegexp(fullpattern));
    char[][] solutions;
    int soli = 0;
    for (int x = 0; x<searchstr.length;++x) {
      p = x;
            //writefln("starting ",x);
      if (engine()) 
      { 
        solutions.length = soli + 1;
        solutions[soli] = searchstr[x..p];
              //writefln(">>", searchstr[x..p], "<<");
        soli++;
        x = p - 1;
      }
    }
    return solutions; // return them
  }
}

template searchalloverlapping(char [] fullpattern)
{
  char[][] searchalloverlapping(char [] searchstr, char [][] param...) {
    int p; // next index to test
    grouprec [] group;
       //  pragma(msg, "here"~parseRegexp(fullpattern));
    mixin (parseRegexp(fullpattern));
    char[][] solutions;
    int soli = 0;
    for (int x = 0; x<searchstr.length;++x) {
      p = x;
            //writefln("starting ",x);
      if (engine()) 
      { 
        solutions.length = soli + 1;
        solutions[soli] = searchstr[x..p];
              //writefln(">>", searchstr[x..p], "<<");
        soli++;
      }
    }
    return solutions; // return them
  }
}
version(none)
//version(shortscregexpfuncnames)
{
  alias test t;
  alias index i;
  alias index2 i2;
  alias search s;
  alias searchall sa;
  alias indexall ia;
  alias indexgroups ig;
  alias indexgroupsall iga;
}



//---------------------------------------------------------------------
//                         EXAMPLE
//---------------------------------------------------------------------
version(Phobos):

private import std.stdio;
version(test)
{
  void main()
  {
    //writefln("BEGINNING UNIT TESTS\n");
    Trace.formatln("BEGINNING UNIT TESTS\n");
    assert(search!("ab")("aaab") == "ab"); 
    
    
    assert(search!("a*b")("aaab") == "aaab"); 
    assert(search!("a*(b)")("aaab") == "aaab"); 
    
    assert(search!("((a*b))")("aaab") == "aaab"); 
    assert(search!("(a*)b")("aaab") == "aaab"); 
    
    assert(search!("(?:b*a*)*b")("aaab") == "aaab"); 
    
    assert(search!("b+cd")("acdbbcabbcdaaab") == "bbcd");
    
    assert(search!("b?cd")("abcacbacdb") == "cd");
    
    assert(search!("(ab)?abc")("aababcab") == "ababc");
    assert(search!("(?:ab)*abc")("aababcab") == "ababc");
    assert(search!("((?:a)*|xyz)b")("aaab") == "aaab"); 
    
    assert(search!("(?:ab)*(abb)")("bababb") == "ababb"); 
    assert(search!("e?(?:ab)*b+?")("eaaababbbbaac") == "ababb");
    assert(search!("(?:ab*)*c")("bbbababbaaabaaaabbbbc") == "ababbaaabaaaabbbbc");
    char [] quasistatic = "m";
    assert(search!("(@1.*?@1)")("they said D can't do metaprogramming?", quasistatic) == "metaprogram");
    assert(search!("[h-za]*g")("metaprogramming") == "taprog");
    assert(search!("(?:a*)*b")("cacaaab") == "aaab");
    assert(search!("(?:a*b*)*c")("dababdaabababbaaabbbcab") == "aabababbaaabbbc");
    assert(search!("(?:(?:a*b*)|da)*b")("fasdaaab") == "daaab");
    assert(search!("aaab??")("aaabbb") == "aaa");
    assert(search!("aaab?")("aaabbb") == "aaab");
    //assert(search!("aaa?")("aa") == "aa");
    
    char [] qq;
    writefln("=========");
    
    qq = search!("(?:(?:a*b*)|da)*b")("fasdaaab");
    writefln("Result: ----", qq, "---");
    writefln("=========");
    
  }
}

//-------------------------------------------------------------------------------
/+

// NOT CURRENTLY USED

// Finds the number of instances of 'ch' in str which aren't preceded by a backslash
// ch must not be a backslash.
template unescapedCount(char [] str, char ch)
{
    static if (str.length==0) const int unescapedCount = 0;
    else static if (str[0]=='\\' && str.length>1) const int unescapedCount = unescapedCount!(str[2..$], ch);
    else static if (str[0]==ch) const int unescapedCount = 1 + unescapedCount!(str[1..$], ch);
    else const int unescapedCount = unescapedCount!(str[1..$], ch);
}

+/
void searchgroupstest(char[]reg)(char[]input)
{
  writefln("reg:%s", reg," input:%s", input);
  int groupno=0;
  foreach(e;indexgroups!(reg)(input))
  {
    if (e.start <= e.end)
    {
      writefln("group %d:>>%s<<", groupno,input[e.start..e.end]);
    }
    else
      {
      writefln("group %d:", groupno,"[",e.start,",", e.end,"]");
    } 
    groupno++;
  } 
  writefln("-------------------"); 
} 
void searchgroupsalltest(char[]reg)(char[]input)
{
  int sno = 0;
  writefln("reg:%s", reg," input:%s", input);
  foreach(s;indexgroupsall!(reg)(input))
  {
    writefln("solution ", sno++);
    foreach(e;s)
    {
      if (e.start <= e.end)
      {
        writefln("group %s", input[e.start..e.end]);
      }
      else
        {
        writefln("group %s", e.start," ", e.end);
      } 
    }
  } 
  writefln("-------------------"); 
} 
void searchgroupstest2(char[]reg)(char[]input, char[][] target)
{
  writefln("reg:%s", reg," input:%s", input);
  pragma(msg,"searchgroupstest2 "~reg);
  int i = 0;
  int oi = 0;
  int failed = 0;
  foreach(e;indexgroups!(reg)(input)) {
    bool compare = true;
    if (e.start <= e.end)
    {
      writef("group", i," %s", input[e.start..e.end]);
    }
    else
      {
      writef("group", i," ","not matched [", e.start," ", e.end, "]");
    } 
    if (i >= target.length)
    {
      //writefln("\nnumber of groups failed");
      failed++; 
      //writefln("\n");
      compare = false;
    } 
 //   writefln(">range ",e.start," ",e.end);
    if (e.start>e.end )
    {
   //   writefln(">range ",e.start," ",e.end);
      if (target[i] is null)
        writefln(" passed");
      else
        {
        writefln(" failed");
        failed++;
      }
    } 
    else if (compare && input[e.start..e.end] == target[i])
      {
        writefln(" passed"); 
      } 
      else
        {
        writefln(" failed expected %s",target[i]); 
        failed++;
    }
    oi++;
    i++;
  } 
  if (oi != target.length)
  {
    writefln("number of groups failed"); 
    failed++;
  }
  writefln("-------------------");
  if (failed>0)
  {
    writefln("test failed"); 
    assert(0);
  } 
} 

void printcode(char[] reg)
{
 writefln("%s", parseRegexp(reg));
}

//-------------
// unit tests
//-------------

version (testmeta) {
  static assert(quantifierConsumed("{456}345") == 5);
  static assert(parenConsumed("(45(6)4)5") == 8);
  static assert(parenConsumed(`(45\(6)45`) == 7);
}

/*
Copyright (c) 2006 Walter Bright
Copyright (c) 2007 Marton Papp
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. The name of the author may not be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
