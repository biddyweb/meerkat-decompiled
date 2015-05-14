package com.google.android.exoplayer.dash;

import com.google.android.exoplayer.dash.mpd.RangedUri;

public abstract interface DashSegmentIndex
{
  public static final int INDEX_UNBOUNDED = -1;

  public abstract long getDurationUs(int paramInt);

  public abstract int getFirstSegmentNum();

  public abstract int getLastSegmentNum();

  public abstract int getSegmentNum(long paramLong);

  public abstract RangedUri getSegmentUrl(int paramInt);

  public abstract long getTimeUs(int paramInt);

  public abstract boolean isExplicit();
}