/*
 * Copyright (c) 2001-2005
 * Pavel "EvilOne" Minayev
 *  with buffering and endian support added by Ben Hinkle
 *  with buffered readLine performance improvements by Dave Fladebo
 *  with opApply inspired by (and mostly copied from) Regan Heath
 *  with bug fixes and MemoryStream/SliceStream enhancements by Derick Eddington
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.  Author makes no representations about
 * the suitability of this software for any purpose. It is provided
 * "as is" without express or implied warranty.
 */
 
// modified by yidabu for use with tango
module dwin.io.Stream;

private import tango.core.Exception;

    
enum SeekPos {
  Set,
  Current,
  End
}

// from Phobos's Stream
// not really abstract, but its instances will do nothing useful
class Stream {

  // stream abilities
  bool readable = false;	/// Indicates whether this stream can be read from.
  bool writeable = false;	/// Indicates whether this stream can be written to.
  bool seekable = false;	/// Indicates whether this stream can be seeked within.
  protected bool isopen = true;	/// Indicates whether this stream is open.

  protected bool readEOF = false; /** Indicates whether this stream is at eof
				   * after the last read attempt.
				   */

  protected bool prevCr = false; /** For a non-seekable stream indicates that
				  * the last readLine or readLineW ended on a
				  * '\r' character. 
				  */

  this() {}

  /***
   * Read up to size bytes into the buffer and return the number of bytes
   * actually read. A return value of 0 indicates end-of-file.
   */
  abstract size_t readBlock(void* buffer, size_t size);

  // reads block of data of specified size,
  // throws ReadException on error
  void readExact(void* buffer, size_t size) {
    for(;;) {
      if (!size) return;
      size_t readsize = readBlock(buffer, size); // return 0 on eof
      if (readsize == 0) break;
      buffer += readsize;
      size -= readsize;
    }
    if (size != 0)
      throw new IOException("not enough data in stream");
  }

  // reads block of data big enough to fill the given
  // array, returns actual number of bytes read
  size_t read(ubyte[] buffer) {
    return readBlock(buffer.ptr, buffer.length);
  }

  // read a single value of desired type,
  // throw ReadException on error
  void read(out byte x) { readExact(&x, x.sizeof); }
  void read(out ubyte x) { readExact(&x, x.sizeof); }
  void read(out short x) { readExact(&x, x.sizeof); }
  void read(out ushort x) { readExact(&x, x.sizeof); }
  void read(out int x) { readExact(&x, x.sizeof); }
  void read(out size_t x) { readExact(&x, x.sizeof); }
  void read(out long x) { readExact(&x, x.sizeof); }
  void read(out ulong x) { readExact(&x, x.sizeof); }
  void read(out float x) { readExact(&x, x.sizeof); }
  void read(out double x) { readExact(&x, x.sizeof); }
  void read(out real x) { readExact(&x, x.sizeof); }
  void read(out ifloat x) { readExact(&x, x.sizeof); }
  void read(out idouble x) { readExact(&x, x.sizeof); }
  void read(out ireal x) { readExact(&x, x.sizeof); }
  void read(out cfloat x) { readExact(&x, x.sizeof); }
  void read(out cdouble x) { readExact(&x, x.sizeof); }
  void read(out creal x) { readExact(&x, x.sizeof); }
  void read(out char x) { readExact(&x, x.sizeof); }
  void read(out wchar x) { readExact(&x, x.sizeof); }
  void read(out dchar x) { readExact(&x, x.sizeof); }

  // reads a string, written earlier by write()
  void read(out char[] s) {
    size_t len;
    read(len);
    s = readString(len);
  }

  // reads a Unicode string, written earlier by write()
  void read(out wchar[] s) {
    size_t len;
    read(len);
    s = readStringW(len);
  }


  // reads a string of given length, throws
  // ReadException on error
  char[] readString(size_t length) {
    char[] result = new char[length];
    readExact(result.ptr, length);
    return result;
  }

  // reads a Unicode string of given length, throws
  // ReadException on error
  wchar[] readStringW(size_t length) {
    wchar[] result = new wchar[length];
    readExact(result.ptr, result.length * wchar.sizeof);
    return result;
  }

  // unget buffer
  private wchar[] unget;
  final bool ungetAvailable() { return unget.length > 1; }

  // returns estimated number of bytes available for immediate reading
  size_t available() { return 0; }

  /***
   * Write up to size bytes from buffer in the stream, returning the actual
   * number of bytes that were written.
   */
  abstract size_t writeBlock(void* buffer, size_t size);

  // writes block of data of specified size,
  // throws WriteException on error
  void writeExact(void* buffer, size_t size) {
    for(;;) {
      if (!size) return;
      size_t writesize = writeBlock(buffer, size);
      if (writesize == 0) break;
      buffer += writesize;
      size -= writesize;
    }
    if (size != 0)
      throw new IOException("unable to write to stream");
  }

  // writes the given array of bytes, returns
  // actual number of bytes written
  size_t write(ubyte[] buffer) {
    return writeBlock(buffer.ptr, buffer.length);
  }

  // write a single value of desired type,
  // throw WriteException on error
  void write(byte x) { writeExact(&x, x.sizeof); }
  void write(ubyte x) { writeExact(&x, x.sizeof); }
  void write(short x) { writeExact(&x, x.sizeof); }
  void write(ushort x) { writeExact(&x, x.sizeof); }
  void write(int x) { writeExact(&x, x.sizeof); }
  void write(uint x) { writeExact(&x, x.sizeof); }
  void write(long x) { writeExact(&x, x.sizeof); }
  void write(ulong x) { writeExact(&x, x.sizeof); }
  void write(float x) { writeExact(&x, x.sizeof); }
  void write(double x) { writeExact(&x, x.sizeof); }
  void write(real x) { writeExact(&x, x.sizeof); }
  void write(ifloat x) { writeExact(&x, x.sizeof); }
  void write(idouble x) { writeExact(&x, x.sizeof); }
  void write(ireal x) { writeExact(&x, x.sizeof); }
  void write(cfloat x) { writeExact(&x, x.sizeof); }
  void write(cdouble x) { writeExact(&x, x.sizeof); }
  void write(creal x) { writeExact(&x, x.sizeof); }
  void write(char x) { writeExact(&x, x.sizeof); }
  void write(wchar x) { writeExact(&x, x.sizeof); }
  void write(dchar x) { writeExact(&x, x.sizeof); }

  // writes a string, together with its length
  void write(char[] s) {
    write(s.length);
    writeString(s);
  }

  // writes a Unicode string, together with its length
  void write(wchar[] s) {
    write(s.length);
    writeStringW(s);
  }


  // writes a string, throws WriteException on error
  void writeString(char[] s) {
    writeExact(s.ptr, s.length);
  }

  // writes a Unicode string, throws WriteException on error
  void writeStringW(wchar[] s) {
    writeExact(s.ptr, s.length * wchar.sizeof);
  }

 
  /***
   * Copies all data from s into this stream.
   * This may throw ReadException or WriteException on failure.
   * This restores the file position of s so that it is unchanged.
   */
  void copyFrom(Stream s) {
    if (seekable) {
      ulong pos = s.position();
      s.position(0);
      copyFrom(s, s.size());
      s.position(pos);
    } else {
      ubyte[128] buf;
      while (!s.eof()) {
	size_t m = s.readBlock(buf.ptr, buf.length);
	writeExact(buf.ptr, m);
      }
    }
  }

  /***
   * Copy a specified number of bytes from the given stream into this one.
   * This may throw ReadException or WriteException on failure.
   * Unlike the previous form, this doesn't restore the file position of s.
   */
  void copyFrom(Stream s, ulong count) {
    ubyte[128] buf;
    while (count > 0) {
      size_t n = cast(size_t)(count<buf.length ? count : buf.length);
      s.readExact(buf.ptr, n);
      writeExact(buf.ptr, n);
      count -= n;
    }
  }

  /***
   * Change the current position of the stream. whence is either SeekPos.Set, in
   which case the offset is an absolute index from the beginning of the stream,
   SeekPos.Current, in which case the offset is a delta from the current
   position, or SeekPos.End, in which case the offset is a delta from the end of
   the stream (negative or zero offsets only make sense in that case). This
   returns the new file position.
   */
  abstract ulong seek(long offset, SeekPos whence);

  /***
   * Aliases for their normal seek counterparts.
   */
  ulong seekSet(long offset) { return seek (offset, SeekPos.Set); }
  ulong seekCur(long offset) { return seek (offset, SeekPos.Current); }	/// ditto
  ulong seekEnd(long offset) { return seek (offset, SeekPos.End); }	/// ditto

  /***
   * Sets file position. Equivalent to calling seek(pos, SeekPos.Set).
   */
  void position(ulong pos) { seek(cast(long)pos, SeekPos.Set); }

  /***
   * Returns current file position. Equivalent to seek(0, SeekPos.Current).
   */
  ulong position() { return seek(0, SeekPos.Current); }

  /***
   * Retrieve the size of the stream in bytes.
   * The stream must be seekable or a SeekException is thrown.
   */
  ulong size() {
    assertSeekable();
    ulong pos = position(), result = seek(0, SeekPos.End);
    position(pos);
    return result;
  }

  // returns true if end of stream is reached, false otherwise
  bool eof() { 
    // for unseekable streams we only know the end when we read it
    if (readEOF && !ungetAvailable())
      return true;
    else if (seekable)
      return position() == size(); 
    else
      return false;
  }

  // returns true if the stream is open
  bool isOpen() { return isopen; }

  // flush the buffer if writeable
  void flush() {
    if (unget.length > 1)
      unget.length = 1; // keep at least 1 so that data ptr stays
  }

  // close the stream somehow; the default just flushes the buffer
  void close() {
    if (isopen)
      flush();
    readEOF = prevCr = isopen = readable = writeable = seekable = false;
  }

  /***
   * Read the entire stream and return it as a string.
   * If the stream is not seekable the contents from the current position to eof
   * is read and returned.
   */
  override char[] toString() {
    if (!readable)
      return super.toString();
    size_t pos;
    size_t rdlen;
    size_t blockSize;
    char[] result;
    if (seekable) {
      ulong orig_pos = position();
      position(0);
      blockSize = cast(size_t)size();
      result = new char[blockSize];
      while (blockSize > 0) {
	rdlen = readBlock(&result[pos], blockSize);
	pos += rdlen;
	blockSize -= rdlen;
      }
      position(orig_pos);
    } else {
      blockSize = 4096;
      result = new char[blockSize];
      while ((rdlen = readBlock(&result[pos], blockSize)) > 0) {
	pos += rdlen;
	blockSize += rdlen;
	result.length = result.length + blockSize;
      }
    }
    return result[0 .. pos];
  }

 

  // helper for checking that the stream is readable
  final protected void assertReadable() {
    if (!readable)
      throw new IOException("Stream is not readable");
  }
  // helper for checking that the stream is writeable
  final protected void assertWriteable() {
    if (!writeable)
      throw new IOException("Stream is not writeable");
  }
  // helper for checking that the stream is seekable
  final protected void assertSeekable() {
    if (!seekable)
      throw new IOException("Stream is not seekable");
  }
}
//Stream



/***
 * Parameterized subclass that wraps an array-like buffer with a stream
 * interface.
 *
 * The type Buffer must support the length property, opIndex and opSlice.
 * Compile in release mode when directly instantiating a TArrayStream to avoid
 * link errors.
 */
class TArrayStream(Buffer): Stream {
  Buffer buf; // current data
  ulong len;  // current data length
  ulong cur;  // current file position

  /// Create the stream for the the buffer buf. Non-copying.
  this(Buffer buf) {
    super ();
    this.buf = buf;
    this.len = buf.length;
    readable = writeable = seekable = true;
  }

  // ensure subclasses don't violate this
  invariant {
    assert(len <= buf.length);
    assert(cur <= len);
  }

  override size_t readBlock(void* buffer, size_t size) {
    assertReadable();
    ubyte* cbuf = cast(ubyte*) buffer;
    if (len - cur < size)
      size = cast(size_t)(len - cur);
    ubyte[] ubuf = cast(ubyte[])buf[cast(size_t)cur .. cast(size_t)(cur + size)];
    cbuf[0 .. size] = ubuf[];
    cur += size;
    return size;
  }

  override size_t writeBlock(void* buffer, size_t size) {
    assertWriteable();
    ubyte* cbuf = cast(ubyte*) buffer;
    auto blen = buf.length;
    if (cur + size > blen)
      size = cast(size_t)(blen - cur);
    ubyte[] ubuf = cast(ubyte[])buf[cast(size_t)cur .. cast(size_t)(cur + size)];
    ubuf[] = cbuf[0 .. size];
    cur += size;
    if (cur > len)
      len = cur;
    return size;
  }

  override ulong seek(long offset, SeekPos rel) {
    assertSeekable();
    long scur; // signed to saturate to 0 properly

    switch (rel) {
    case SeekPos.Set: scur = offset; break;
    case SeekPos.Current: scur = cast(long)(cur + offset); break;
    case SeekPos.End: scur = cast(long)(len + offset); break;
    default:
	assert(0);
    }

    if (scur < 0)
      cur = 0;
    else if (scur > len)
      cur = len;
    else
      cur = cast(ulong)scur;

    return cur;
  }

  override size_t available () { return cast(size_t)(len - cur); }

  /// Get the current memory data in total.
  ubyte[] data() { 
    if (len > size_t.max)
      throw new IOException("Stream too big");
    void[] res = buf[0 .. cast(size_t)len];
    return cast(ubyte[])res;
  }

  override char[] toString() {
    return cast(char[]) data ();
  }
}


/// This subclass reads and constructs an array of bytes in memory.
class MemoryStream: TArrayStream!(ubyte[]) {

  /// Create the output buffer and setup for reading, writing, and seeking.
  // clear to an empty buffer.
  this() { this(cast(ubyte[]) null); }

  /***
   * Create the output buffer and setup for reading, writing, and seeking.
   * Load it with specific input data.
   */
  this(ubyte[] buf) { super (buf); }
  this(byte[] buf) { this(cast(ubyte[]) buf); }	/// ditto
  this(char[] buf) { this(cast(ubyte[]) buf); } /// ditto

  /// Ensure the stream can hold count bytes.
  void reserve(size_t count) {
    if (cur + count > buf.length)
      buf.length = cast(uint)((cur + count) * 2);
  }

  override size_t writeBlock(void* buffer, size_t size) {
    reserve(size);
    return super.writeBlock(buffer,size);
  }

}