package com.google.android.gms.games.multiplayer.realtime;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzg;

public final class RoomBuffer extends zzg<Room>
{
  public RoomBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  protected String zziB()
  {
    return "external_match_id";
  }

  protected Room zzq(int paramInt1, int paramInt2)
  {
    return new RoomRef(this.zzMd, paramInt1, paramInt2);
  }
}