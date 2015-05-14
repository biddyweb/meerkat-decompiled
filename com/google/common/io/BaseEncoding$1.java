package com.google.common.io;

import java.io.IOException;
import java.io.OutputStream;

class BaseEncoding$1 extends ByteSink
{
  BaseEncoding$1(BaseEncoding paramBaseEncoding, CharSink paramCharSink)
  {
  }

  public OutputStream openStream()
    throws IOException
  {
    return this.this$0.encodingStream(this.val$encodedSink.openStream());
  }
}