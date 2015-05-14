package com.google.android.gms.maps.model.internal;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;

public class zzb
  implements Parcelable.Creator<zza>
{
  static void zza(zza paramzza, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzK(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, paramzza.getVersionCode());
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, paramzza.getType());
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 3, paramzza.zzqL(), false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 4, paramzza.getBitmap(), paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }

  public zza zzeh(Parcel paramParcel)
  {
    Bitmap localBitmap = null;
    byte b = 0;
    int i = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    Bundle localBundle = null;
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = com.google.android.gms.common.internal.safeparcel.zza.zzI(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzaP(k))
      {
      default:
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, k);
        break;
      case 1:
        j = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, k);
        break;
      case 2:
        b = com.google.android.gms.common.internal.safeparcel.zza.zze(paramParcel, k);
        break;
      case 3:
        localBundle = com.google.android.gms.common.internal.safeparcel.zza.zzq(paramParcel, k);
        break;
      case 4:
        localBitmap = (Bitmap)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, k, Bitmap.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zza(j, b, localBundle, localBitmap);
  }

  public zza[] zzgk(int paramInt)
  {
    return new zza[paramInt];
  }
}