package com.google.android.exoplayer.text.ttml;

import com.google.android.exoplayer.text.Subtitle;
import com.google.android.exoplayer.util.Util;

public final class TtmlSubtitle
  implements Subtitle
{
  private final long[] eventTimesUs;
  private final TtmlNode root;
  private final long startTimeUs;

  public TtmlSubtitle(TtmlNode paramTtmlNode, long paramLong)
  {
    this.root = paramTtmlNode;
    this.startTimeUs = paramLong;
    this.eventTimesUs = paramTtmlNode.getEventTimesUs();
  }

  public long getEventTime(int paramInt)
  {
    return this.eventTimesUs[paramInt] + this.startTimeUs;
  }

  public int getEventTimeCount()
  {
    return this.eventTimesUs.length;
  }

  public long getLastEventTime()
  {
    if (this.eventTimesUs.length == 0);
    for (long l = -1L; ; l = this.eventTimesUs[(-1 + this.eventTimesUs.length)])
      return l + this.startTimeUs;
  }

  public int getNextEventTimeIndex(long paramLong)
  {
    int i = Util.binarySearchCeil(this.eventTimesUs, paramLong - this.startTimeUs, false, false);
    if (i < this.eventTimesUs.length)
      return i;
    return -1;
  }

  public long getStartTime()
  {
    return this.startTimeUs;
  }

  public String getText(long paramLong)
  {
    return this.root.getText(paramLong - this.startTimeUs);
  }
}