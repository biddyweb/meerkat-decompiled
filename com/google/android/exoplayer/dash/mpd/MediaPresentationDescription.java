package com.google.android.exoplayer.dash.mpd;

import java.util.Collections;
import java.util.List;

public class MediaPresentationDescription
{
  public final long availabilityStartTime;
  public final long duration;
  public final boolean dynamic;
  public final long minBufferTime;
  public final long minUpdatePeriod;
  public final List<Period> periods;
  public final long timeShiftBufferDepth;
  public final UtcTimingElement utcTiming;

  public MediaPresentationDescription(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, long paramLong4, long paramLong5, UtcTimingElement paramUtcTimingElement, List<Period> paramList)
  {
    this.availabilityStartTime = paramLong1;
    this.duration = paramLong2;
    this.minBufferTime = paramLong3;
    this.dynamic = paramBoolean;
    this.minUpdatePeriod = paramLong4;
    this.timeShiftBufferDepth = paramLong5;
    this.utcTiming = paramUtcTimingElement;
    this.periods = Collections.unmodifiableList(paramList);
  }
}