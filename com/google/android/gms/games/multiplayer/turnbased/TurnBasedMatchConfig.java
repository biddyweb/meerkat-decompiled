package com.google.android.gms.games.multiplayer.turnbased;

import android.os.Bundle;
import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;

public abstract class TurnBasedMatchConfig
{
  public static Builder builder()
  {
    return new Builder(null);
  }

  public static Bundle createAutoMatchCriteria(int paramInt1, int paramInt2, long paramLong)
  {
    Bundle localBundle = new Bundle();
    localBundle.putInt("min_automatch_players", paramInt1);
    localBundle.putInt("max_automatch_players", paramInt2);
    localBundle.putLong("exclusive_bit_mask", paramLong);
    return localBundle;
  }

  public abstract Bundle getAutoMatchCriteria();

  public abstract String[] getInvitedPlayerIds();

  public abstract int getVariant();

  public abstract int zzoX();

  public static final class Builder
  {
    int zzajA = -1;
    ArrayList<String> zzajP = new ArrayList();
    Bundle zzajQ = null;
    int zzajZ = 2;

    public Builder addInvitedPlayer(String paramString)
    {
      zzx.zzl(paramString);
      this.zzajP.add(paramString);
      return this;
    }

    public Builder addInvitedPlayers(ArrayList<String> paramArrayList)
    {
      zzx.zzl(paramArrayList);
      this.zzajP.addAll(paramArrayList);
      return this;
    }

    public TurnBasedMatchConfig build()
    {
      return new TurnBasedMatchConfigImpl(this);
    }

    public Builder setAutoMatchCriteria(Bundle paramBundle)
    {
      this.zzajQ = paramBundle;
      return this;
    }

    public Builder setVariant(int paramInt)
    {
      if ((paramInt == -1) || (paramInt > 0));
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, "Variant must be a positive integer or TurnBasedMatch.MATCH_VARIANT_ANY");
        this.zzajA = paramInt;
        return this;
      }
    }
  }
}