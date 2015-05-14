package com.google.common.io;

import java.io.IOException;

final class BaseEncoding$4
  implements GwtWorkarounds.CharOutput
{
  int charsUntilSeparator = this.val$afterEveryChars;

  BaseEncoding$4(int paramInt, String paramString, GwtWorkarounds.CharOutput paramCharOutput)
  {
  }

  public void close()
    throws IOException
  {
    this.val$delegate.close();
  }

  public void flush()
    throws IOException
  {
    this.val$delegate.flush();
  }

  public void write(char paramChar)
    throws IOException
  {
    if (this.charsUntilSeparator == 0)
    {
      for (int i = 0; i < this.val$separator.length(); i++)
        this.val$delegate.write(this.val$separator.charAt(i));
      this.charsUntilSeparator = this.val$afterEveryChars;
    }
    this.val$delegate.write(paramChar);
    this.charsUntilSeparator = (-1 + this.charsUntilSeparator);
  }
}