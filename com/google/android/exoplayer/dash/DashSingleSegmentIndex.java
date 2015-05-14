package com.google.android.exoplayer.dash;

import com.google.android.exoplayer.dash.mpd.RangedUri;

public class DashSingleSegmentIndex
  implements DashSegmentIndex
{
  private final long durationUs;
  private final long startTimeUs;
  private final RangedUri uri;

  public DashSingleSegmentIndex(long paramLong1, long paramLong2, RangedUri paramRangedUri)
  {
    this.startTimeUs = paramLong1;
    this.durationUs = paramLong2;
    this.uri = paramRangedUri;
  }

  public long getDurationUs(int paramInt)
  {
    return this.durationUs;
  }

  public int getFirstSegmentNum()
  {
    return 0;
  }

  public int getLastSegmentNum()
  {
    return 0;
  }

  public int getSegmentNum(long paramLong)
  {
    return 0;
  }

  public RangedUri getSegmentUrl(int paramInt)
  {
    return this.uri;
  }

  public long getTimeUs(int paramInt)
  {
    return this.startTimeUs;
  }

  public boolean isExplicit()
  {
    return true;
  }
}