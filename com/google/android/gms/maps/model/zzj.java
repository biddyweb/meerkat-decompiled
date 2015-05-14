package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzj
{
  static void zza(LatLng paramLatLng, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramLatLng.getVersionCode());
    zzb.zza(paramParcel, 2, paramLatLng.latitude);
    zzb.zza(paramParcel, 3, paramLatLng.longitude);
    zzb.zzH(paramParcel, i);
  }
}