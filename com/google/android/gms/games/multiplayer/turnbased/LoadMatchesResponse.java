package com.google.android.gms.games.multiplayer.turnbased;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.internal.constants.TurnBasedMatchTurnStatus;
import com.google.android.gms.games.multiplayer.InvitationBuffer;

public final class LoadMatchesResponse
{
  private final InvitationBuffer zzajV;
  private final TurnBasedMatchBuffer zzajW;
  private final TurnBasedMatchBuffer zzajX;
  private final TurnBasedMatchBuffer zzajY;

  public LoadMatchesResponse(Bundle paramBundle)
  {
    DataHolder localDataHolder1 = zza(paramBundle, 0);
    label48: DataHolder localDataHolder3;
    if (localDataHolder1 != null)
    {
      this.zzajV = new InvitationBuffer(localDataHolder1);
      DataHolder localDataHolder2 = zza(paramBundle, 1);
      if (localDataHolder2 == null)
        break label107;
      this.zzajW = new TurnBasedMatchBuffer(localDataHolder2);
      localDataHolder3 = zza(paramBundle, 2);
      if (localDataHolder3 == null)
        break label115;
    }
    label107: label115: for (this.zzajX = new TurnBasedMatchBuffer(localDataHolder3); ; this.zzajX = null)
    {
      DataHolder localDataHolder4 = zza(paramBundle, 3);
      if (localDataHolder4 == null)
        break label123;
      this.zzajY = new TurnBasedMatchBuffer(localDataHolder4);
      return;
      this.zzajV = null;
      break;
      this.zzajW = null;
      break label48;
    }
    label123: this.zzajY = null;
  }

  private static DataHolder zza(Bundle paramBundle, int paramInt)
  {
    String str = TurnBasedMatchTurnStatus.zzeJ(paramInt);
    if (!paramBundle.containsKey(str))
      return null;
    return (DataHolder)paramBundle.getParcelable(str);
  }

  @Deprecated
  public void close()
  {
    release();
  }

  public TurnBasedMatchBuffer getCompletedMatches()
  {
    return this.zzajY;
  }

  public InvitationBuffer getInvitations()
  {
    return this.zzajV;
  }

  public TurnBasedMatchBuffer getMyTurnMatches()
  {
    return this.zzajW;
  }

  public TurnBasedMatchBuffer getTheirTurnMatches()
  {
    return this.zzajX;
  }

  public boolean hasData()
  {
    if ((this.zzajV != null) && (this.zzajV.getCount() > 0));
    while (((this.zzajW != null) && (this.zzajW.getCount() > 0)) || ((this.zzajX != null) && (this.zzajX.getCount() > 0)) || ((this.zzajY != null) && (this.zzajY.getCount() > 0)))
      return true;
    return false;
  }

  public void release()
  {
    if (this.zzajV != null)
      this.zzajV.release();
    if (this.zzajW != null)
      this.zzajW.release();
    if (this.zzajX != null)
      this.zzajX.release();
    if (this.zzajY != null)
      this.zzajY.release();
  }
}