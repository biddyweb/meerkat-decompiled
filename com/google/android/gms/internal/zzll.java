package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzll
  implements Parcelable.Creator<zzlk>
{
  static void zza(zzlk paramzzlk, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzlk.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzlk.zzjR(), false);
    zzb.zza(paramParcel, 3, paramzzlk.zzjS(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzlk zzT(Parcel paramParcel)
  {
    zzlh localzzlh = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Parcel localParcel = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localParcel = zza.zzD(paramParcel, k);
        break;
      case 3:
        localzzlh = (zzlh)zza.zza(paramParcel, k, zzlh.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzlk(j, localParcel, localzzlh);
  }

  public zzlk[] zzaZ(int paramInt)
  {
    return new zzlk[paramInt];
  }
}