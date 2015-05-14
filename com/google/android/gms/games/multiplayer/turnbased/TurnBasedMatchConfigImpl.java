package com.google.android.gms.games.multiplayer.turnbased;

import android.os.Bundle;
import java.util.ArrayList;

public final class TurnBasedMatchConfigImpl extends TurnBasedMatchConfig
{
  private final int zzajA;
  private final Bundle zzajQ;
  private final String[] zzajR;
  private final int zzajZ;

  TurnBasedMatchConfigImpl(TurnBasedMatchConfig.Builder paramBuilder)
  {
    this.zzajA = paramBuilder.zzajA;
    this.zzajZ = paramBuilder.zzajZ;
    this.zzajQ = paramBuilder.zzajQ;
    int i = paramBuilder.zzajP.size();
    this.zzajR = ((String[])paramBuilder.zzajP.toArray(new String[i]));
  }

  public Bundle getAutoMatchCriteria()
  {
    return this.zzajQ;
  }

  public String[] getInvitedPlayerIds()
  {
    return this.zzajR;
  }

  public int getVariant()
  {
    return this.zzajA;
  }

  public int zzoX()
  {
    return this.zzajZ;
  }
}