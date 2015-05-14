package com.google.android.exoplayer.hls.parser;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.upstream.BufferPool;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.io.IOException;

public class AdtsExtractor extends HlsExtractor
{
  private static final int MAX_PACKET_SIZE = 200;
  private final AdtsReader adtsReader;
  private boolean firstPacket;
  private final long firstSampleTimestamp;
  private final ParsableByteArray packetBuffer;
  private volatile boolean prepared;

  public AdtsExtractor(boolean paramBoolean, long paramLong, BufferPool paramBufferPool)
  {
    super(paramBoolean);
    this.firstSampleTimestamp = paramLong;
    this.packetBuffer = new ParsableByteArray(200);
    this.adtsReader = new AdtsReader(paramBufferPool);
    this.firstPacket = true;
  }

  public void discardUntil(int paramInt, long paramLong)
  {
    Assertions.checkState(this.prepared);
    if (paramInt == 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.adtsReader.discardUntil(paramLong);
      return;
    }
  }

  public MediaFormat getFormat(int paramInt)
  {
    Assertions.checkState(this.prepared);
    return this.adtsReader.getMediaFormat();
  }

  public long getLargestSampleTimestamp()
  {
    return this.adtsReader.getLargestParsedTimestampUs();
  }

  public boolean getSample(int paramInt, SampleHolder paramSampleHolder)
  {
    Assertions.checkState(this.prepared);
    if (paramInt == 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      return this.adtsReader.getSample(paramSampleHolder);
    }
  }

  protected SampleQueue getSampleQueue(int paramInt)
  {
    if (paramInt == 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      return this.adtsReader;
    }
  }

  public int getTrackCount()
  {
    Assertions.checkState(this.prepared);
    return 1;
  }

  public boolean hasSamples(int paramInt)
  {
    Assertions.checkState(this.prepared);
    if (paramInt == 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      if (this.adtsReader.isEmpty())
        break;
      return true;
    }
    return false;
  }

  public boolean isPrepared()
  {
    return this.prepared;
  }

  public int read(DataSource paramDataSource)
    throws IOException
  {
    int i = paramDataSource.read(this.packetBuffer.data, 0, 200);
    if (i == -1)
      i = -1;
    do
    {
      return i;
      this.packetBuffer.setPosition(0);
      this.packetBuffer.setLimit(i);
      this.adtsReader.consume(this.packetBuffer, this.firstSampleTimestamp, this.firstPacket);
      this.firstPacket = false;
    }
    while (this.prepared);
    this.prepared = this.adtsReader.hasMediaFormat();
    return i;
  }

  public void release()
  {
    this.adtsReader.release();
  }
}