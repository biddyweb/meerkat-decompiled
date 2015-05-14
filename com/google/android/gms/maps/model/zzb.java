package com.google.android.gms.maps.model;

import android.os.Parcel;

public class zzb
{
  static void zza(CameraPosition paramCameraPosition, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzK(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, paramCameraPosition.getVersionCode());
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, paramCameraPosition.target, paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 3, paramCameraPosition.zoom);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 4, paramCameraPosition.tilt);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 5, paramCameraPosition.bearing);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }
}