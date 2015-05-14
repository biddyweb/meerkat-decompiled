package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzat
  implements Parcelable.Creator<zzas>
{
  static void zza(zzas paramzzas, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzas.versionCode);
    zzb.zzc(paramParcel, 2, paramzzas.statusCode);
    zzb.zza(paramParcel, 3, paramzzas.zzaGl, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzas zzfI(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    zzp localzzp = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        i = zza.zzg(paramParcel, m);
        break;
      case 3:
        localzzp = (zzp)zza.zza(paramParcel, m, zzp.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzas(k, i, localzzp);
  }

  public zzas[] zzii(int paramInt)
  {
    return new zzas[paramInt];
  }
}