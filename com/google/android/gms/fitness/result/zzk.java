package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzk
  implements Parcelable.Creator<zzj>
{
  static void zza(zzj paramzzj, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzj.zzms(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzj.getVersionCode());
    zzb.zzH(paramParcel, i);
  }

  public zzj zzcK(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    DataHolder localDataHolder = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localDataHolder = (DataHolder)zza.zza(paramParcel, k, DataHolder.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzj(j, localDataHolder);
  }

  public zzj[] zzej(int paramInt)
  {
    return new zzj[paramInt];
  }
}