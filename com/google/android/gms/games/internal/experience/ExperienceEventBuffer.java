package com.google.android.gms.games.internal.experience;

import com.google.android.gms.common.data.AbstractDataBuffer;
import com.google.android.gms.common.data.DataHolder;

public final class ExperienceEventBuffer extends AbstractDataBuffer<ExperienceEvent>
{
  public ExperienceEventBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  public ExperienceEvent zzeK(int paramInt)
  {
    return new ExperienceEventRef(this.zzMd, paramInt);
  }
}