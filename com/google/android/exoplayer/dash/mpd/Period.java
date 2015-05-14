package com.google.android.exoplayer.dash.mpd;

import java.util.Collections;
import java.util.List;

public class Period
{
  public final List<AdaptationSet> adaptationSets;
  public final long durationMs;
  public final String id;
  public final long startMs;

  public Period(String paramString, long paramLong1, long paramLong2, List<AdaptationSet> paramList)
  {
    this.id = paramString;
    this.startMs = paramLong1;
    this.durationMs = paramLong2;
    this.adaptationSets = Collections.unmodifiableList(paramList);
  }

  public int getAdaptationSetIndex(int paramInt)
  {
    int i = this.adaptationSets.size();
    for (int j = 0; j < i; j++)
      if (((AdaptationSet)this.adaptationSets.get(j)).type == paramInt)
        return j;
    return -1;
  }
}