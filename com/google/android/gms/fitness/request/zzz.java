package com.google.android.gms.fitness.request;

import android.os.IBinder;
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
    zzb.zza(paramParcel, 1, paramzzy.zzlQ(), false);
    zzb.zzc(paramParcel, 1000, paramzzy.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzy.getPackageName(), false);
    zzb.zzc(paramParcel, 3, paramzzy.zzma(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzy zzco(Parcel paramParcel)
  {
    ArrayList localArrayList = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str = null;
    IBinder localIBinder = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localIBinder = zza.zzp(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str = zza.zzo(paramParcel, k);
        break;
      case 3:
        localArrayList = zza.zzc(paramParcel, k, zzh.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzy(j, localIBinder, str, localArrayList);
  }

  public zzy[] zzdM(int paramInt)
  {
    return new zzy[paramInt];
  }
}