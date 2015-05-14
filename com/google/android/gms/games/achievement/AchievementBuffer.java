package com.google.android.gms.games.achievement;

import com.google.android.gms.common.data.AbstractDataBuffer;
import com.google.android.gms.common.data.DataHolder;

public final class AchievementBuffer extends AbstractDataBuffer<Achievement>
{
  public AchievementBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  public Achievement get(int paramInt)
  {
    return new AchievementRef(this.zzMd, paramInt);
  }
}