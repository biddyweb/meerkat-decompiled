package com.google.android.gms.games.quest;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzg;

public final class QuestBuffer extends zzg<Quest>
{
  public QuestBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  protected String zziB()
  {
    return "external_quest_id";
  }

  protected Quest zzs(int paramInt1, int paramInt2)
  {
    return new QuestRef(this.zzMd, paramInt1, paramInt2);
  }
}