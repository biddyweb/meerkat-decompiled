package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzx
{
  static void zza(TileOverlayOptions paramTileOverlayOptions, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramTileOverlayOptions.getVersionCode());
    zzb.zza(paramParcel, 2, paramTileOverlayOptions.zzqK(), false);
    zzb.zza(paramParcel, 3, paramTileOverlayOptions.isVisible());
    zzb.zza(paramParcel, 4, paramTileOverlayOptions.getZIndex());
    zzb.zzH(paramParcel, i);
  }
}