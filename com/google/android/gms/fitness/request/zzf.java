package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataSet;

public class zzf
  implements Parcelable.Creator<zze>
{
  static void zza(zze paramzze, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzze.zzlH(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzze.getVersionCode());
    zzb.zza(paramParcel, 2, paramzze.zzlQ(), false);
    zzb.zza(paramParcel, 3, paramzze.getPackageName(), false);
    zzb.zza(paramParcel, 4, paramzze.zzlU());
    zzb.zzH(paramParcel, i);
  }

  public zze zzcd(Parcel paramParcel)
  {
    boolean bool = false;
    String str = null;
    int i = zza.zzJ(paramParcel);
    IBinder localIBinder = null;
    DataSet localDataSet = null;
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localDataSet = (DataSet)zza.zza(paramParcel, k, DataSet.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localIBinder = zza.zzp(paramParcel, k);
        break;
      case 3:
        str = zza.zzo(paramParcel, k);
        break;
      case 4:
        bool = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zze(j, localDataSet, localIBinder, str, bool);
  }

  public zze[] zzdB(int paramInt)
  {
    return new zze[paramInt];
  }
}