package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzo
  implements Parcelable.Creator<PolylineOptions>
{
  static void zza(PolylineOptions paramPolylineOptions, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramPolylineOptions.getVersionCode());
    zzb.zzc(paramParcel, 2, paramPolylineOptions.getPoints(), false);
    zzb.zza(paramParcel, 3, paramPolylineOptions.getWidth());
    zzb.zzc(paramParcel, 4, paramPolylineOptions.getColor());
    zzb.zza(paramParcel, 5, paramPolylineOptions.getZIndex());
    zzb.zza(paramParcel, 6, paramPolylineOptions.isVisible());
    zzb.zza(paramParcel, 7, paramPolylineOptions.isGeodesic());
    zzb.zzH(paramParcel, i);
  }

  public PolylineOptions zzdZ(Parcel paramParcel)
  {
    float f1 = 0.0F;
    boolean bool1 = false;
    int i = zza.zzJ(paramParcel);
    ArrayList localArrayList = null;
    boolean bool2 = false;
    int j = 0;
    float f2 = 0.0F;
    int k = 0;
    while (paramParcel.dataPosition() < i)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        localArrayList = zza.zzc(paramParcel, m, LatLng.CREATOR);
        break;
      case 3:
        f2 = zza.zzl(paramParcel, m);
        break;
      case 4:
        j = zza.zzg(paramParcel, m);
        break;
      case 5:
        f1 = zza.zzl(paramParcel, m);
        break;
      case 6:
        bool2 = zza.zzc(paramParcel, m);
        break;
      case 7:
        bool1 = zza.zzc(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new PolylineOptions(k, localArrayList, f2, j, f1, bool2, bool1);
  }

  public PolylineOptions[] zzgc(int paramInt)
  {
    return new PolylineOptions[paramInt];
  }
}