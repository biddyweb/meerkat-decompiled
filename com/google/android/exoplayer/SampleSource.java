package com.google.android.exoplayer;

import java.io.IOException;

public abstract interface SampleSource
{
  public static final int DISCONTINUITY_READ = -5;
  public static final int END_OF_STREAM = -1;
  public static final int FORMAT_READ = -4;
  public static final int NOTHING_READ = -2;
  public static final int SAMPLE_READ = -3;

  public abstract boolean continueBuffering(long paramLong)
    throws IOException;

  public abstract void disable(int paramInt);

  public abstract void enable(int paramInt, long paramLong);

  public abstract long getBufferedPositionUs();

  public abstract int getTrackCount();

  public abstract TrackInfo getTrackInfo(int paramInt);

  public abstract boolean prepare()
    throws IOException;

  public abstract int readData(int paramInt, long paramLong, MediaFormatHolder paramMediaFormatHolder, SampleHolder paramSampleHolder, boolean paramBoolean)
    throws IOException;

  public abstract void release();

  public abstract void seekToUs(long paramLong);
}