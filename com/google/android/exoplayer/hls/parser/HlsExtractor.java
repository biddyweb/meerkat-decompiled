package com.google.android.exoplayer.hls.parser;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.upstream.DataSource;
import java.io.IOException;

public abstract class HlsExtractor
{
  private final boolean shouldSpliceIn;
  private boolean spliceConfigured;

  public HlsExtractor(boolean paramBoolean)
  {
    this.shouldSpliceIn = paramBoolean;
  }

  public final void configureSpliceTo(HlsExtractor paramHlsExtractor)
  {
    if ((this.spliceConfigured) || (!paramHlsExtractor.shouldSpliceIn) || (!paramHlsExtractor.isPrepared()))
      return;
    boolean bool = true;
    int i = getTrackCount();
    for (int j = 0; j < i; j++)
      bool &= getSampleQueue(j).configureSpliceTo(paramHlsExtractor.getSampleQueue(j));
    this.spliceConfigured = bool;
  }

  public abstract void discardUntil(int paramInt, long paramLong);

  public abstract MediaFormat getFormat(int paramInt);

  public abstract long getLargestSampleTimestamp();

  public abstract boolean getSample(int paramInt, SampleHolder paramSampleHolder);

  protected abstract SampleQueue getSampleQueue(int paramInt);

  public abstract int getTrackCount();

  public abstract boolean hasSamples(int paramInt);

  public abstract boolean isPrepared();

  public abstract int read(DataSource paramDataSource)
    throws IOException;

  public abstract void release();
}