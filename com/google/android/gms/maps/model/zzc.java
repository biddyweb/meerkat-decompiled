package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzc
  implements Parcelable.Creator<CircleOptions>
{
  static void zza(CircleOptions paramCircleOptions, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramCircleOptions.getVersionCode());
    zzb.zza(paramParcel, 2, paramCircleOptions.getCenter(), paramInt, false);
    zzb.zza(paramParcel, 3, paramCircleOptions.getRadius());
    zzb.zza(paramParcel, 4, paramCircleOptions.getStrokeWidth());
    zzb.zzc(paramParcel, 5, paramCircleOptions.getStrokeColor());
    zzb.zzc(paramParcel, 6, paramCircleOptions.getFillColor());
    zzb.zza(paramParcel, 7, paramCircleOptions.getZIndex());
    zzb.zza(paramParcel, 8, paramCircleOptions.isVisible());
    zzb.zzH(paramParcel, i);
  }

  public CircleOptions zzdT(Parcel paramParcel)
  {
    float f1 = 0.0F;
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    LatLng localLatLng = null;
    double d = 0.0D;
    int j = 0;
    int k = 0;
    float f2 = 0.0F;
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
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        localLatLng = (LatLng)zza.zza(paramParcel, n, LatLng.CREATOR);
        break;
      case 3:
        d = zza.zzm(paramParcel, n);
        break;
      case 4:
        f2 = zza.zzl(paramParcel, n);
        break;
      case 5:
        k = zza.zzg(paramParcel, n);
        break;
      case 6:
        j = zza.zzg(paramParcel, n);
        break;
      case 7:
        f1 = zza.zzl(paramParcel, n);
        break;
      case 8:
        bool = zza.zzc(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new CircleOptions(m, localLatLng, d, f2, k, j, f1, bool);
  }

  public CircleOptions[] zzfW(int paramInt)
  {
    return new CircleOptions[paramInt];
  }
}