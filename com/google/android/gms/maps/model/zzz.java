package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzz
{
  static void zza(VisibleRegion paramVisibleRegion, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramVisibleRegion.getVersionCode());
    zzb.zza(paramParcel, 2, paramVisibleRegion.nearLeft, paramInt, false);
    zzb.zza(paramParcel, 3, paramVisibleRegion.nearRight, paramInt, false);
    zzb.zza(paramParcel, 4, paramVisibleRegion.farLeft, paramInt, false);
    zzb.zza(paramParcel, 5, paramVisibleRegion.farRight, paramInt, false);
    zzb.zza(paramParcel, 6, paramVisibleRegion.latLngBounds, paramInt, false);
    zzb.zzH(paramParcel, i);
  }
}