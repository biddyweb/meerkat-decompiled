package com.google.android.exoplayer.hls.parser;

import com.google.android.exoplayer.upstream.BufferPool;
import com.google.android.exoplayer.util.ParsableByteArray;

abstract class ElementaryStreamReader extends SampleQueue
{
  protected ElementaryStreamReader(BufferPool paramBufferPool)
  {
    super(paramBufferPool);
  }

  public abstract void consume(ParsableByteArray paramParsableByteArray, long paramLong, boolean paramBoolean);

  public abstract void packetFinished();
}