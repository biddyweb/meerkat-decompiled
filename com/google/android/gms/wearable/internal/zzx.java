package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.wearable.zze;

public class zzx
  implements Parcelable.Creator<zzw>
{
  static void zza(zzw paramzzw, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzw.versionCode);
    zzb.zzc(paramParcel, 2, paramzzw.statusCode);
    zzb.zza(paramParcel, 3, paramzzw.zzaGj, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzw zzfA(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    zze[] arrayOfzze = null;
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
        arrayOfzze = (zze[])zza.zzb(paramParcel, m, zze.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzw(k, i, arrayOfzze);
  }

  public zzw[] zzia(int paramInt)
  {
    return new zzw[paramInt];
  }
}