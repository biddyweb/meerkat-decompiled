package com.google.android.exoplayer.source;

import com.google.android.exoplayer.MediaFormatHolder;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.TrackInfo;
import java.io.IOException;

public abstract interface SampleExtractor
{
  public abstract void deselectTrack(int paramInt);

  public abstract long getBufferedPositionUs();

  public abstract TrackInfo[] getTrackInfos();

  public abstract void getTrackMediaFormat(int paramInt, MediaFormatHolder paramMediaFormatHolder);

  public abstract boolean prepare()
    throws IOException;

  public abstract int readSample(int paramInt, SampleHolder paramSampleHolder)
    throws IOException;

  public abstract void release();

  public abstract void seekTo(long paramLong);

  public abstract void selectTrack(int paramInt);
}