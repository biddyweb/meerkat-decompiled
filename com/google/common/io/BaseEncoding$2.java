package com.google.common.io;

import java.io.IOException;
import java.io.InputStream;

class BaseEncoding$2 extends ByteSource
{
  BaseEncoding$2(BaseEncoding paramBaseEncoding, CharSource paramCharSource)
  {
  }

  public InputStream openStream()
    throws IOException
  {
    return this.this$0.decodingStream(this.val$encodedSource.openStream());
  }
}