package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzrx
  implements Parcelable.Creator<zzrw>
{
  static void zza(zzrw paramzzrw, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzrw.zzati, paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzrw.versionCode);
    zzb.zzH(paramParcel, i);
  }

  public zzrw zzen(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    zzro localzzro = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localzzro = (zzro)zza.zza(paramParcel, k, zzro.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzrw(j, localzzro);
  }

  public zzrw[] zzgz(int paramInt)
  {
    return new zzrw[paramInt];
  }
}