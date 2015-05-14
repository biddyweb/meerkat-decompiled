package com.google.android.exoplayer.text.webvtt;

import com.google.android.exoplayer.text.Subtitle;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.util.Arrays;

public class WebvttSubtitle
  implements Subtitle
{
  private final String[] cueText;
  private final long[] cueTimesUs;
  private final long[] sortedCueTimesUs;
  private final long startTimeUs;

  public WebvttSubtitle(String[] paramArrayOfString, long paramLong, long[] paramArrayOfLong)
  {
    this.cueText = paramArrayOfString;
    this.startTimeUs = paramLong;
    this.cueTimesUs = paramArrayOfLong;
    this.sortedCueTimesUs = Arrays.copyOf(paramArrayOfLong, paramArrayOfLong.length);
    Arrays.sort(this.sortedCueTimesUs);
  }

  public long getEventTime(int paramInt)
  {
    boolean bool1 = true;
    boolean bool2;
    if (paramInt >= 0)
    {
      bool2 = bool1;
      Assertions.checkArgument(bool2);
      if (paramInt >= this.sortedCueTimesUs.length)
        break label37;
    }
    while (true)
    {
      Assertions.checkArgument(bool1);
      return this.sortedCueTimesUs[paramInt];
      bool2 = false;
      break;
      label37: bool1 = false;
    }
  }

  public int getEventTimeCount()
  {
    return this.sortedCueTimesUs.length;
  }

  public long getLastEventTime()
  {
    if (getEventTimeCount() == 0)
      return -1L;
    return this.sortedCueTimesUs[(-1 + this.sortedCueTimesUs.length)];
  }

  public int getNextEventTimeIndex(long paramLong)
  {
    if (paramLong >= 0L);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkArgument(bool);
      int i = Util.binarySearchCeil(this.sortedCueTimesUs, paramLong, false, false);
      if (i >= this.sortedCueTimesUs.length)
        break;
      return i;
    }
    return -1;
  }

  public long getStartTime()
  {
    return this.startTimeUs;
  }

  public String getText(long paramLong)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    for (int i = 0; i < this.cueTimesUs.length; i += 2)
      if ((this.cueTimesUs[i] <= paramLong) && (paramLong < this.cueTimesUs[(i + 1)]))
        localStringBuilder.append(this.cueText[(i / 2)]);
    int j = localStringBuilder.length();
    if ((j > 0) && (localStringBuilder.charAt(j - 1) == '\n'))
      j--;
    if (j == 0)
      return null;
    return localStringBuilder.substring(0, j);
  }
}