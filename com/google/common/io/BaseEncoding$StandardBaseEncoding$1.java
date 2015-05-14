package com.google.common.io;

import java.io.IOException;

class BaseEncoding$StandardBaseEncoding$1
  implements GwtWorkarounds.ByteOutput
{
  int bitBuffer = 0;
  int bitBufferLength = 0;
  int writtenChars = 0;

  BaseEncoding$StandardBaseEncoding$1(BaseEncoding.StandardBaseEncoding paramStandardBaseEncoding, GwtWorkarounds.CharOutput paramCharOutput)
  {
  }

  public void close()
    throws IOException
  {
    if (this.bitBufferLength > 0)
    {
      int i = this.bitBuffer << BaseEncoding.StandardBaseEncoding.access$000(this.this$0).bitsPerChar - this.bitBufferLength & BaseEncoding.StandardBaseEncoding.access$000(this.this$0).mask;
      this.val$out.write(BaseEncoding.StandardBaseEncoding.access$000(this.this$0).encode(i));
      this.writtenChars = (1 + this.writtenChars);
      if (BaseEncoding.StandardBaseEncoding.access$100(this.this$0) != null)
        while (this.writtenChars % BaseEncoding.StandardBaseEncoding.access$000(this.this$0).charsPerChunk != 0)
        {
          this.val$out.write(BaseEncoding.StandardBaseEncoding.access$100(this.this$0).charValue());
          this.writtenChars = (1 + this.writtenChars);
        }
    }
    this.val$out.close();
  }

  public void flush()
    throws IOException
  {
    this.val$out.flush();
  }

  public void write(byte paramByte)
    throws IOException
  {
    this.bitBuffer <<= 8;
    this.bitBuffer |= paramByte & 0xFF;
    for (this.bitBufferLength = (8 + this.bitBufferLength); this.bitBufferLength >= BaseEncoding.StandardBaseEncoding.access$000(this.this$0).bitsPerChar; this.bitBufferLength -= BaseEncoding.StandardBaseEncoding.access$000(this.this$0).bitsPerChar)
    {
      int i = this.bitBuffer >> this.bitBufferLength - BaseEncoding.StandardBaseEncoding.access$000(this.this$0).bitsPerChar & BaseEncoding.StandardBaseEncoding.access$000(this.this$0).mask;
      this.val$out.write(BaseEncoding.StandardBaseEncoding.access$000(this.this$0).encode(i));
      this.writtenChars = (1 + this.writtenChars);
    }
  }
}