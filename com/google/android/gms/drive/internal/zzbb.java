package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.StorageStats;

public class zzbb
  implements Parcelable.Creator<OnStorageStatsResponse>
{
  static void zza(OnStorageStatsResponse paramOnStorageStatsResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramOnStorageStatsResponse.zzFG);
    zzb.zza(paramParcel, 2, paramOnStorageStatsResponse.zzVa, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public OnStorageStatsResponse zzaO(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    StorageStats localStorageStats = null;
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
        localStorageStats = (StorageStats)zza.zza(paramParcel, k, StorageStats.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new OnStorageStatsResponse(j, localStorageStats);
  }

  public OnStorageStatsResponse[] zzch(int paramInt)
  {
    return new OnStorageStatsResponse[paramInt];
  }
}