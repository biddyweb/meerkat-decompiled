package com.google.android.gms.maps.internal;

import android.graphics.Point;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzz
  implements Parcelable.Creator<zzy>
{
  static void zza(zzy paramzzy, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzy.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzy.zzqE(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzy zzdR(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Point localPoint = null;
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
        localPoint = (Point)zza.zza(paramParcel, k, Point.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzy(j, localPoint);
  }

  public zzy[] zzfU(int paramInt)
  {
    return new zzy[paramInt];
  }
}