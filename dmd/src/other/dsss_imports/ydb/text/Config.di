module ydb.txt.Config;

// import std.stream;
// import std.string;
private import Text = tango.text.Util;
private import tango.io.device.File;

/*****
 * configSimple
 * 
 * Class to read in config data
 *
 * Authors: Stephan Sommer-Schulz
 */
 
 
class Config
{
	private char[] file;
	private char[] seperator = "=";
	private char[] comment = "#";
	private char[][char[]] params;
	private char[] defSection = "main.";
	
	
	/** cfg object constructors */
	this()
	{
		// Empty! Obj. can be filled with obj.set("key", "value")
	}
	
	
	this(char[] file)
	{
		this.file = file;
		loadFileParams();
	}
	
	
	this(char[] file, char[] seperator, char[] comment)
	{
		this.file = file;
		this.seperator = seperator;
		this.comment = comment;
		loadFileParams();
	}
	
	
	/** set and get methods for filename */
	public char[] Filename() { return this.file; }
	public void Filename(char[] file) { this.file = file; }
	
	
	/** set and get methods for seperator */
	public char[] Seperator() { return this.seperator; }
	public void Seperator(char[] seperator) { this.seperator = seperator; }
	
	
	/** set and get methods for comment */
	public char[] Comment() { return this.comment; }
	public void Comment(char[] comment) { this.comment = comment; }
	

	/** get config-value to a given key */
	public char[] get(char[] key)
	{
		if (key in this.params)
		{
			return this.params[key];
		}
		else
		{
			return "";
		}
	}
	
	
	/** set a config-pair with key and value (only in memory, do not store it to the config-file */
	public int set(char[] key, char[] value)
	{
			this.params[key] = value;
			return 0;
	}
	
	
	public int del(char[] key)
	{
		if (key in this.params)
		{
			this.params.remove(key);
			return 0;
		}
		else
		{
			return 1;
		}
	}
	
	
	public void reload()
	{
		foreach ( char [] key; this.params.keys ){
			this.params.remove(key);
		}
		loadFileParams();
	}
	
	
	public char[][char[]] getAll()
	{
		return this.params;
	}
	
	
	private void loadFileParams()
	{
		char[] section = "";
		
		//auto f = new File();
		auto content = cast(char[]) File.get(this.file);

//		f.open(this.file, FileMode.In);
//		while(!f.eof())

		foreach (char[] line; Text.lines (content))
		{
			// char[] line = chomp(f.readLine());	// no LF, CR, CRLF
			
			// delete comments
			int posComment = Text.locatePattern(line, this.comment);
			if (posComment >= 0)
			{
				line = line[0..posComment];
			}
			
			// char[][] noComments = split(line, "#");
			// if (noComments.length > 0)
			if (line.length > 0)
			{
				// no LF, CR, CRLF
				// line = chomp(noComments[0]);
				
				// parse line for sectionname or parameter
				int openBraket  = Text.locate(line, '[');
				int closeBraket = Text.locate(line, ']');
				if ((openBraket == 0) && (closeBraket > 0))
				{
					section = line[1..closeBraket] ~ ".";
					if (section == defSection)
					{
						section = "";
					}
				}
				else
				{
					/*  for safety only read lines with "param = value"
					 *  if there are more seperators in the line, all but 
					 *  the first one belong to the value!
					 */
					int firstEQ = Text.locatePattern(line, this.seperator);
					if (firstEQ > 0)
					{
						char[] param = Text.trim(line[0..firstEQ]);
						char[] value = "";
						if (param.length > 0)
						{
							if (line.length > firstEQ+this.seperator.length)
							{
								value = Text.trim(line[firstEQ+this.seperator.length..line.length]);
							}
							
							this.params[section ~ param] = value;
						}
					}
				}
			}
		}
//		f.close();
	}
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
