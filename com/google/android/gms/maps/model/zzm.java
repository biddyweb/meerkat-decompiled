package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzm
  implements Parcelable.Creator<PolygonOptions>
{
  static void zza(PolygonOptions paramPolygonOptions, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramPolygonOptions.getVersionCode());
    zzb.zzc(paramParcel, 2, paramPolygonOptions.getPoints(), false);
    zzb.zzd(paramParcel, 3, paramPolygonOptions.zzqJ(), false);
    zzb.zza(paramParcel, 4, paramPolygonOptions.getStrokeWidth());
    zzb.zzc(paramParcel, 5, paramPolygonOptions.getStrokeColor());
    zzb.zzc(paramParcel, 6, paramPolygonOptions.getFillColor());
    zzb.zza(paramParcel, 7, paramPolygonOptions.getZIndex());
    zzb.zza(paramParcel, 8, paramPolygonOptions.isVisible());
    zzb.zza(paramParcel, 9, paramPolygonOptions.isGeodesic());
    zzb.zzH(paramParcel, i);
  }

  public PolygonOptions zzdY(Parcel paramParcel)
  {
    float f1 = 0.0F;
    boolean bool1 = false;
    int i = zza.zzJ(paramParcel);
    ArrayList localArrayList1 = null;
    ArrayList localArrayList2 = new ArrayList();
    boolean bool2 = false;
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
        localArrayList1 = zza.zzc(paramParcel, n, LatLng.CREATOR);
        break;
      case 3:
        zza.zza(paramParcel, n, localArrayList2, getClass().getClassLoader());
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
        bool2 = zza.zzc(paramParcel, n);
        break;
      case 9:
        bool1 = zza.zzc(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new PolygonOptions(m, localArrayList1, localArrayList2, f2, k, j, f1, bool2, bool1);
  }

  public PolygonOptions[] zzgb(int paramInt)
  {
    return new PolygonOptions[paramInt];
  }
}