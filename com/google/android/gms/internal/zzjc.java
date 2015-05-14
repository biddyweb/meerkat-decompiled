package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzjc
  implements Parcelable.Creator<zzjb>
{
  static void zza(zzjb paramzzjb, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzjb.zzGw, paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzjb.zzFG);
    zzb.zza(paramParcel, 2, paramzzjb.zzGx);
    zzb.zzc(paramParcel, 3, paramzzjb.zzGy);
    zzb.zza(paramParcel, 4, paramzzjb.zzpZ, false);
    zzb.zza(paramParcel, 5, paramzzjb.zzGz, paramInt, false);
    zzb.zza(paramParcel, 6, paramzzjb.zzGA);
    zzb.zzc(paramParcel, 7, paramzzjb.zzGB);
    zzb.zzH(paramParcel, i);
  }

  public zzjb[] zzY(int paramInt)
  {
    return new zzjb[paramInt];
  }

  public zzjb zzs(Parcel paramParcel)
  {
    zzin localzzin = null;
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    long l = 0L;
    int j = -1;
    String str = null;
    int k = 0;
    zzip localzzip = null;
    int m = 0;
    while (paramParcel.dataPosition() < i)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        localzzip = (zzip)zza.zza(paramParcel, n, zzip.CREATOR);
        break;
      case 1000:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        l = zza.zzi(paramParcel, n);
        break;
      case 3:
        k = zza.zzg(paramParcel, n);
        break;
      case 4:
        str = zza.zzo(paramParcel, n);
        break;
      case 5:
        localzzin = (zzin)zza.zza(paramParcel, n, zzin.CREATOR);
        break;
      case 6:
        bool = zza.zzc(paramParcel, n);
        break;
      case 7:
        j = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzjb(m, localzzip, l, k, str, localzzin, bool, j);
  }
}