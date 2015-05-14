package com.google.android.exoplayer.source;

import com.google.android.exoplayer.MediaFormatHolder;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.SampleSource;
import com.google.android.exoplayer.TrackInfo;
import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;

public final class DefaultSampleSource
  implements SampleSource
{
  private static final int TRACK_STATE_DISABLED = 0;
  private static final int TRACK_STATE_ENABLED = 1;
  private static final int TRACK_STATE_FORMAT_SENT = 2;
  private boolean[] pendingDiscontinuities;
  private boolean prepared;
  private int remainingReleaseCount;
  private final SampleExtractor sampleExtractor;
  private long seekPositionUs;
  private TrackInfo[] trackInfos;
  private int[] trackStates;

  public DefaultSampleSource(SampleExtractor paramSampleExtractor, int paramInt)
  {
    this.sampleExtractor = ((SampleExtractor)Assertions.checkNotNull(paramSampleExtractor));
    this.remainingReleaseCount = paramInt;
  }

  private void seekToUsInternal(long paramLong, boolean paramBoolean)
  {
    if ((paramBoolean) || (this.seekPositionUs != paramLong))
    {
      this.seekPositionUs = paramLong;
      this.sampleExtractor.seekTo(paramLong);
      for (int i = 0; i < this.trackStates.length; i++)
        if (this.trackStates[i] != 0)
          this.pendingDiscontinuities[i] = true;
    }
  }

  public boolean continueBuffering(long paramLong)
    throws IOException
  {
    return true;
  }

  public void disable(int paramInt)
  {
    Assertions.checkState(this.prepared);
    if (this.trackStates[paramInt] != 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.sampleExtractor.deselectTrack(paramInt);
      this.pendingDiscontinuities[paramInt] = false;
      this.trackStates[paramInt] = 0;
      return;
    }
  }

  public void enable(int paramInt, long paramLong)
  {
    boolean bool1 = true;
    Assertions.checkState(this.prepared);
    boolean bool2;
    if (this.trackStates[paramInt] == 0)
    {
      bool2 = bool1;
      Assertions.checkState(bool2);
      this.trackStates[paramInt] = bool1;
      this.sampleExtractor.selectTrack(paramInt);
      if (paramLong == 0L)
        break label66;
    }
    while (true)
    {
      seekToUsInternal(paramLong, bool1);
      return;
      bool2 = false;
      break;
      label66: bool1 = false;
    }
  }

  public long getBufferedPositionUs()
  {
    Assertions.checkState(this.prepared);
    return this.sampleExtractor.getBufferedPositionUs();
  }

  public int getTrackCount()
  {
    Assertions.checkState(this.prepared);
    return this.trackInfos.length;
  }

  public TrackInfo getTrackInfo(int paramInt)
  {
    Assertions.checkState(this.prepared);
    return this.trackInfos[paramInt];
  }

  public boolean prepare()
    throws IOException
  {
    if (this.prepared)
      return true;
    if (this.sampleExtractor.prepare())
    {
      this.prepared = true;
      this.trackInfos = this.sampleExtractor.getTrackInfos();
      this.trackStates = new int[this.trackInfos.length];
      this.pendingDiscontinuities = new boolean[this.trackInfos.length];
    }
    return this.prepared;
  }

  public int readData(int paramInt, long paramLong, MediaFormatHolder paramMediaFormatHolder, SampleHolder paramSampleHolder, boolean paramBoolean)
    throws IOException
  {
    Assertions.checkState(this.prepared);
    if (this.trackStates[paramInt] != 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      if (this.pendingDiscontinuities[paramInt] == 0)
        break;
      this.pendingDiscontinuities[paramInt] = false;
      return -5;
    }
    if (paramBoolean)
      return -2;
    if (this.trackStates[paramInt] != 2)
    {
      this.sampleExtractor.getTrackMediaFormat(paramInt, paramMediaFormatHolder);
      this.trackStates[paramInt] = 2;
      return -4;
    }
    this.seekPositionUs = -1L;
    return this.sampleExtractor.readSample(paramInt, paramSampleHolder);
  }

  public void release()
  {
    if (this.remainingReleaseCount > 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      int i = -1 + this.remainingReleaseCount;
      this.remainingReleaseCount = i;
      if (i == 0)
        this.sampleExtractor.release();
      return;
    }
  }

  public void seekToUs(long paramLong)
  {
    Assertions.checkState(this.prepared);
    seekToUsInternal(paramLong, false);
  }
}