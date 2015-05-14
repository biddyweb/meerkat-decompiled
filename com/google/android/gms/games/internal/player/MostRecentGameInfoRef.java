package com.google.android.gms.games.internal.player;

import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;

public final class MostRecentGameInfoRef extends zzd
  implements MostRecentGameInfo
{
  private final PlayerColumnNames zzacW;

  public MostRecentGameInfoRef(DataHolder paramDataHolder, int paramInt, PlayerColumnNames paramPlayerColumnNames)
  {
    super(paramDataHolder, paramInt);
    this.zzacW = paramPlayerColumnNames;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return MostRecentGameInfoEntity.zza(this, paramObject);
  }

  public int hashCode()
  {
    return MostRecentGameInfoEntity.zza(this);
  }

  public String toString()
  {
    return MostRecentGameInfoEntity.zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((MostRecentGameInfoEntity)zzoL()).writeToParcel(paramParcel, paramInt);
  }

  public String zzoF()
  {
    return getString(this.zzacW.zzaiH);
  }

  public String zzoG()
  {
    return getString(this.zzacW.zzaiI);
  }

  public long zzoH()
  {
    return getLong(this.zzacW.zzaiJ);
  }

  public Uri zzoI()
  {
    return zzbb(this.zzacW.zzaiK);
  }

  public Uri zzoJ()
  {
    return zzbb(this.zzacW.zzaiL);
  }

  public Uri zzoK()
  {
    return zzbb(this.zzacW.zzaiM);
  }

  public MostRecentGameInfo zzoL()
  {
    return new MostRecentGameInfoEntity(this);
  }
}