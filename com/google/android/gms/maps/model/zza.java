package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<CameraPosition>
{
  static void zza(CameraPosition paramCameraPosition, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramCameraPosition.getVersionCode());
    zzb.zza(paramParcel, 2, paramCameraPosition.target, paramInt, false);
    zzb.zza(paramParcel, 3, paramCameraPosition.zoom);
    zzb.zza(paramParcel, 4, paramCameraPosition.tilt);
    zzb.zza(paramParcel, 5, paramCameraPosition.bearing);
    zzb.zzH(paramParcel, i);
  }

  public CameraPosition zzdS(Parcel paramParcel)
  {
    float f1 = 0.0F;
    int i = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    int j = 0;
    LatLng localLatLng = null;
    float f2 = 0.0F;
    float f3 = 0.0F;
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
        localLatLng = (LatLng)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, k, LatLng.CREATOR);
        break;
      case 3:
        f3 = com.google.android.gms.common.internal.safeparcel.zza.zzl(paramParcel, k);
        break;
      case 4:
        f2 = com.google.android.gms.common.internal.safeparcel.zza.zzl(paramParcel, k);
        break;
      case 5:
        f1 = com.google.android.gms.common.internal.safeparcel.zza.zzl(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new CameraPosition(j, localLatLng, f3, f2, f1);
  }

  public CameraPosition[] zzfV(int paramInt)
  {
    return new CameraPosition[paramInt];
  }
}