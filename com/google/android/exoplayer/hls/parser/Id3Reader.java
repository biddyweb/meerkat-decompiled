package com.google.android.exoplayer.hls.parser;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.upstream.BufferPool;
import com.google.android.exoplayer.util.ParsableByteArray;

class Id3Reader extends ElementaryStreamReader
{
  public Id3Reader(BufferPool paramBufferPool)
  {
    super(paramBufferPool);
    setMediaFormat(MediaFormat.createId3Format());
  }

  public void consume(ParsableByteArray paramParsableByteArray, long paramLong, boolean paramBoolean)
  {
    if (paramBoolean)
      startSample(paramLong);
    if (writingSample())
      appendData(paramParsableByteArray, paramParsableByteArray.bytesLeft());
  }

  public void packetFinished()
  {
    commitSample(true);
  }
}