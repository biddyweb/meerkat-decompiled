package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzlc
  implements Parcelable.Creator<zzla.zza>
{
  static void zza(zzla.zza paramzza, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzza.versionCode);
    zzb.zza(paramParcel, 2, paramzza.zzQN, false);
    zzb.zzc(paramParcel, 3, paramzza.zzQO);
    zzb.zzH(paramParcel, i);
  }

  public zzla.zza zzO(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    String str = null;
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
        str = zza.zzo(paramParcel, m);
        break;
      case 3:
        i = zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzla.zza(k, str, i);
  }

  public zzla.zza[] zzaU(int paramInt)
  {
    return new zzla.zza[paramInt];
  }
}