package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzz
  implements Parcelable.Creator<zzy>
{
  static void zza(zzy paramzzy, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzy.versionCode);
    zzb.zzc(paramParcel, 2, paramzzy.statusCode);
    zzb.zzc(paramParcel, 3, paramzzy.zzaGk, false);
    zzb.zzH(paramParcel, i);
  }

  public zzy zzfB(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    ArrayList localArrayList = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
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
        i = zza.zzg(paramParcel, m);
        break;
      case 3:
        localArrayList = zza.zzc(paramParcel, m, zzao.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzy(k, i, localArrayList);
  }

  public zzy[] zzib(int paramInt)
  {
    return new zzy[paramInt];
  }
}