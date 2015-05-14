package com.google.common.io;

import com.google.common.base.CharMatcher;
import java.io.IOException;

class BaseEncoding$StandardBaseEncoding$2
  implements GwtWorkarounds.ByteInput
{
  int bitBuffer = 0;
  int bitBufferLength = 0;
  boolean hitPadding = false;
  final CharMatcher paddingMatcher = this.this$0.padding();
  int readChars = 0;

  BaseEncoding$StandardBaseEncoding$2(BaseEncoding.StandardBaseEncoding paramStandardBaseEncoding, GwtWorkarounds.CharInput paramCharInput)
  {
  }

  public void close()
    throws IOException
  {
    this.val$reader.close();
  }

  public int read()
    throws IOException
  {
    int i = -1;
    do
    {
      char c;
      while (true)
      {
        int j = this.val$reader.read();
        if (j == i)
        {
          if ((this.hitPadding) || (BaseEncoding.StandardBaseEncoding.access$000(this.this$0).isValidPaddingStartPosition(this.readChars)))
            break label323;
          int n = this.readChars;
          throw new BaseEncoding.DecodingException(32 + "Invalid input length " + n);
        }
        this.readChars = (1 + this.readChars);
        c = (char)j;
        if (!this.paddingMatcher.matches(c))
          break;
        if ((!this.hitPadding) && ((this.readChars == 1) || (!BaseEncoding.StandardBaseEncoding.access$000(this.this$0).isValidPaddingStartPosition(-1 + this.readChars))))
        {
          int m = this.readChars;
          throw new BaseEncoding.DecodingException(41 + "Padding cannot start at index " + m);
        }
        this.hitPadding = true;
      }
      if (this.hitPadding)
      {
        int k = this.readChars;
        throw new BaseEncoding.DecodingException(61 + "Expected padding character but found '" + c + "' at index " + k);
      }
      this.bitBuffer <<= BaseEncoding.StandardBaseEncoding.access$000(this.this$0).bitsPerChar;
      this.bitBuffer |= BaseEncoding.StandardBaseEncoding.access$000(this.this$0).decode(c);
      this.bitBufferLength += BaseEncoding.StandardBaseEncoding.access$000(this.this$0).bitsPerChar;
    }
    while (this.bitBufferLength < 8);
    this.bitBufferLength = (-8 + this.bitBufferLength);
    i = 0xFF & this.bitBuffer >> this.bitBufferLength;
    label323: return i;
  }
}