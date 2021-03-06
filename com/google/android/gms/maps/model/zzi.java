package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzi
  implements Parcelable.Creator<LatLng>
{
  static void zza(LatLng paramLatLng, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramLatLng.getVersionCode());
    zzb.zza(paramParcel, 2, paramLatLng.latitude);
    zzb.zza(paramParcel, 3, paramLatLng.longitude);
    zzb.zzH(paramParcel, i);
  }

  public LatLng zzdW(Parcel paramParcel)
  {
    double d1 = 0.0D;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    double d2 = d1;
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
        d2 = zza.zzm(paramParcel, k);
        break;
      case 3:
        d1 = zza.zzm(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new LatLng(j, d2, d1);
  }

  public LatLng[] zzfZ(int paramInt)
  {
    return new LatLng[paramInt];
  }
}