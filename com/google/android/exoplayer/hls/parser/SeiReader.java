package com.google.android.exoplayer.hls.parser;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.text.eia608.Eia608Parser;
import com.google.android.exoplayer.upstream.BufferPool;
import com.google.android.exoplayer.util.ParsableByteArray;

class SeiReader extends SampleQueue
{
  private final ParsableByteArray seiBuffer;

  public SeiReader(BufferPool paramBufferPool)
  {
    super(paramBufferPool);
    setMediaFormat(MediaFormat.createEia608Format());
    this.seiBuffer = new ParsableByteArray();
  }

  public void read(byte[] paramArrayOfByte, int paramInt1, int paramInt2, long paramLong)
  {
    this.seiBuffer.reset(paramArrayOfByte, paramInt2);
    this.seiBuffer.setPosition(paramInt1 + 4);
    while (this.seiBuffer.bytesLeft() > 1)
    {
      int i = 0;
      int j;
      do
      {
        j = this.seiBuffer.readUnsignedByte();
        i += j;
      }
      while (j == 255);
      int k = 0;
      int m;
      do
      {
        m = this.seiBuffer.readUnsignedByte();
        k += m;
      }
      while (m == 255);
      if (Eia608Parser.inspectSeiMessage(i, k, this.seiBuffer))
      {
        startSample(paramLong);
        appendData(this.seiBuffer, k);
        commitSample(true);
      }
      else
      {
        this.seiBuffer.skip(k);
      }
    }
  }
}