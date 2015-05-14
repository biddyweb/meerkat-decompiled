package com.google.android.exoplayer.upstream;

public abstract interface BandwidthMeter
{
  public static final long NO_ESTIMATE = -1L;

  public abstract long getBitrateEstimate();
}