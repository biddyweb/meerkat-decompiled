package com.google.android.exoplayer;

public final class TrackInfo
{
  public final long durationUs;
  public final String mimeType;

  public TrackInfo(String paramString, long paramLong)
  {
    this.mimeType = paramString;
    this.durationUs = paramLong;
  }
}