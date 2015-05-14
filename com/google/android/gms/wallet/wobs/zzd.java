package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzls;
import java.util.ArrayList;

public final class zzd
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzd> CREATOR = new zze();
  private final int zzFG;
  String zzaFc;
  String zzaFd;
  ArrayList<zzb> zzaFe;

  zzd()
  {
    this.zzFG = 1;
    this.zzaFe = zzls.zzkb();
  }

  zzd(int paramInt, String paramString1, String paramString2, ArrayList<zzb> paramArrayList)
  {
    this.zzFG = paramInt;
    this.zzaFc = paramString1;
    this.zzaFd = paramString2;
    this.zzaFe = paramArrayList;
  }

  public int describeContents()
  {
    return 0;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zze.zza(this, paramParcel, paramInt);
  }
}