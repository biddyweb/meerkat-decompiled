package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzth
  implements Parcelable.Creator<zztf>
{
  static void zza(zztf paramzztf, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzztf.versionCode);
    zzb.zza(paramParcel, 2, paramzztf.zzatM);
    zzb.zza(paramParcel, 3, paramzztf.tag, false);
    zzb.zza(paramParcel, 4, paramzztf.zzatN, false);
    zzb.zza(paramParcel, 5, paramzztf.zzatO, false);
    zzb.zzH(paramParcel, i);
  }

  public zztf zzev(Parcel paramParcel)
  {
    Bundle localBundle = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    long l = 0L;
    byte[] arrayOfByte = null;
    String str = null;
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
        l = zza.zzi(paramParcel, k);
        break;
      case 3:
        str = zza.zzo(paramParcel, k);
        break;
      case 4:
        arrayOfByte = zza.zzr(paramParcel, k);
        break;
      case 5:
        localBundle = zza.zzq(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zztf(j, l, str, arrayOfByte, localBundle);
  }

  public zztf[] zzgH(int paramInt)
  {
    return new zztf[paramInt];
  }
}