package com.google.android.gms.games.multiplayer.realtime;

import android.os.Bundle;
import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;

public final class RoomConfigImpl extends RoomConfig
{
  private final String zzaek;
  private final int zzajA;
  private final RoomUpdateListener zzajL;
  private final RoomStatusUpdateListener zzajM;
  private final RealTimeMessageReceivedListener zzajN;
  private final Bundle zzajQ;
  private final String[] zzajR;

  RoomConfigImpl(RoomConfig.Builder paramBuilder)
  {
    this.zzajL = paramBuilder.zzajL;
    this.zzajM = paramBuilder.zzajM;
    this.zzajN = paramBuilder.zzajN;
    this.zzaek = paramBuilder.zzajO;
    this.zzajA = paramBuilder.zzajA;
    this.zzajQ = paramBuilder.zzajQ;
    int i = paramBuilder.zzajP.size();
    this.zzajR = ((String[])paramBuilder.zzajP.toArray(new String[i]));
    zzx.zzb(this.zzajN, "Must specify a message listener");
  }

  public Bundle getAutoMatchCriteria()
  {
    return this.zzajQ;
  }

  public String getInvitationId()
  {
    return this.zzaek;
  }

  public String[] getInvitedPlayerIds()
  {
    return this.zzajR;
  }

  public RealTimeMessageReceivedListener getMessageReceivedListener()
  {
    return this.zzajN;
  }

  public RoomStatusUpdateListener getRoomStatusUpdateListener()
  {
    return this.zzajM;
  }

  public RoomUpdateListener getRoomUpdateListener()
  {
    return this.zzajL;
  }

  public int getVariant()
  {
    return this.zzajA;
  }
}