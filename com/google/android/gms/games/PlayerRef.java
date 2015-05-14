package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.games.internal.player.MostRecentGameInfo;
import com.google.android.gms.games.internal.player.MostRecentGameInfoRef;
import com.google.android.gms.games.internal.player.PlayerColumnNames;

public final class PlayerRef extends zzd
  implements Player
{
  private final PlayerLevelInfo zzacM;
  private final PlayerColumnNames zzacW;
  private final MostRecentGameInfoRef zzacX;

  public PlayerRef(DataHolder paramDataHolder, int paramInt)
  {
    this(paramDataHolder, paramInt, null);
  }

  public PlayerRef(DataHolder paramDataHolder, int paramInt, String paramString)
  {
    super(paramDataHolder, paramInt);
    this.zzacW = new PlayerColumnNames(paramString);
    this.zzacX = new MostRecentGameInfoRef(paramDataHolder, paramInt, this.zzacW);
    int j;
    PlayerLevel localPlayerLevel1;
    if (zzmG())
    {
      int i = getInteger(this.zzacW.zzaiy);
      j = getInteger(this.zzacW.zzaiB);
      localPlayerLevel1 = new PlayerLevel(i, getLong(this.zzacW.zzaiz), getLong(this.zzacW.zzaiA));
      if (i == j)
        break label185;
    }
    label185: for (PlayerLevel localPlayerLevel2 = new PlayerLevel(j, getLong(this.zzacW.zzaiA), getLong(this.zzacW.zzaiC)); ; localPlayerLevel2 = localPlayerLevel1)
    {
      this.zzacM = new PlayerLevelInfo(getLong(this.zzacW.zzaix), getLong(this.zzacW.zzaiD), localPlayerLevel1, localPlayerLevel2);
      return;
      this.zzacM = null;
      return;
    }
  }

  private boolean zzmG()
  {
    if (zzbc(this.zzacW.zzaix));
    while (getLong(this.zzacW.zzaix) == -1L)
      return false;
    return true;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return PlayerEntity.zza(this, paramObject);
  }

  public Player freeze()
  {
    return new PlayerEntity(this);
  }

  public String getDisplayName()
  {
    return getString(this.zzacW.zzaip);
  }

  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    zza(this.zzacW.zzaip, paramCharArrayBuffer);
  }

  public Uri getHiResImageUri()
  {
    return zzbb(this.zzacW.zzais);
  }

  public String getHiResImageUrl()
  {
    return getString(this.zzacW.zzait);
  }

  public Uri getIconImageUri()
  {
    return zzbb(this.zzacW.zzaiq);
  }

  public String getIconImageUrl()
  {
    return getString(this.zzacW.zzair);
  }

  public long getLastPlayedWithTimestamp()
  {
    if ((!zzba(this.zzacW.zzaiw)) || (zzbc(this.zzacW.zzaiw)))
      return -1L;
    return getLong(this.zzacW.zzaiw);
  }

  public PlayerLevelInfo getLevelInfo()
  {
    return this.zzacM;
  }

  public String getPlayerId()
  {
    return getString(this.zzacW.zzaio);
  }

  public long getRetrievedTimestamp()
  {
    return getLong(this.zzacW.zzaiu);
  }

  public String getTitle()
  {
    return getString(this.zzacW.zzaiE);
  }

  public void getTitle(CharArrayBuffer paramCharArrayBuffer)
  {
    zza(this.zzacW.zzaiE, paramCharArrayBuffer);
  }

  public boolean hasHiResImage()
  {
    return getHiResImageUri() != null;
  }

  public boolean hasIconImage()
  {
    return getIconImageUri() != null;
  }

  public int hashCode()
  {
    return PlayerEntity.zzb(this);
  }

  public boolean isProfileVisible()
  {
    return getBoolean(this.zzacW.zzaiG);
  }

  public String toString()
  {
    return PlayerEntity.zzc(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((PlayerEntity)freeze()).writeToParcel(paramParcel, paramInt);
  }

  public boolean zzmD()
  {
    return getBoolean(this.zzacW.zzaiN);
  }

  public int zzmE()
  {
    return getInteger(this.zzacW.zzaiv);
  }

  public MostRecentGameInfo zzmF()
  {
    if (zzbc(this.zzacW.zzaiH))
      return null;
    return this.zzacX;
  }
}