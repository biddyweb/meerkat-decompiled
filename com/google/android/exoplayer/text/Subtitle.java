package com.google.android.exoplayer.text;

public abstract interface Subtitle
{
  public abstract long getEventTime(int paramInt);

  public abstract int getEventTimeCount();

  public abstract long getLastEventTime();

  public abstract int getNextEventTimeIndex(long paramLong);

  public abstract long getStartTime();

  public abstract String getText(long paramLong);
}