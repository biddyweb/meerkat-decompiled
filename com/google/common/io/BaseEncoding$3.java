package com.google.common.io;

import com.google.common.base.CharMatcher;
import java.io.IOException;

final class BaseEncoding$3
  implements GwtWorkarounds.CharInput
{
  BaseEncoding$3(GwtWorkarounds.CharInput paramCharInput, CharMatcher paramCharMatcher)
  {
  }

  public void close()
    throws IOException
  {
    this.val$delegate.close();
  }

  public int read()
    throws IOException
  {
    int i;
    do
      i = this.val$delegate.read();
    while ((i != -1) && (this.val$toIgnore.matches((char)i)));
    return i;
  }
}