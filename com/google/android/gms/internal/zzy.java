package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzy
  implements Parcelable.Creator<zzx>
{
  static void zza(zzx paramzzx, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzx.versionCode);
    zzb.zza(paramParcel, 2, paramzzx.zzml);
    zzb.zza(paramParcel, 3, paramzzx.zzmy);
    zzb.zzH(paramParcel, i);
  }

  public zzx zza(Parcel paramParcel)
  {
    boolean bool1 = false;
    int i = zza.zzJ(paramParcel);
    boolean bool2 = false;
    int j = 0;
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
        bool2 = zza.zzc(paramParcel, k);
        break;
      case 3:
        bool1 = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzx(j, bool2, bool1);
  }

  public zzx[] zzb(int paramInt)
  {
    return new zzx[paramInt];
  }
}