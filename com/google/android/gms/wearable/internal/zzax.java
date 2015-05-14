package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzax
  implements Parcelable.Creator<zzaw>
{
  static void zza(zzaw paramzzaw, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzaw.versionCode);
    zzb.zzc(paramParcel, 2, paramzzaw.statusCode);
    zzb.zzc(paramParcel, 3, paramzzaw.zzaGD);
    zzb.zzH(paramParcel, i);
  }

  public zzaw zzfK(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    int k = 0;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        k = zza.zzg(paramParcel, n);
        break;
      case 3:
        i = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzaw(m, k, i);
  }

  public zzaw[] zzik(int paramInt)
  {
    return new zzaw[paramInt];
  }
}