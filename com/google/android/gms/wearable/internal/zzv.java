package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.wearable.zze;

public class zzv
  implements Parcelable.Creator<zzu>
{
  static void zza(zzu paramzzu, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzu.versionCode);
    zzb.zzc(paramParcel, 2, paramzzu.statusCode);
    zzb.zza(paramParcel, 3, paramzzu.zzaGi, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzu zzfz(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    zze localzze = null;
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
        localzze = (zze)zza.zza(paramParcel, m, zze.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzu(k, i, localzze);
  }

  public zzu[] zzhZ(int paramInt)
  {
    return new zzu[paramInt];
  }
}