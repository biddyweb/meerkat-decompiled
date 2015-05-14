package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzi
  implements Parcelable.Creator<StorageStats>
{
  static void zza(StorageStats paramStorageStats, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramStorageStats.zzFG);
    zzb.zza(paramParcel, 2, paramStorageStats.zzSD);
    zzb.zza(paramParcel, 3, paramStorageStats.zzSE);
    zzb.zza(paramParcel, 4, paramStorageStats.zzSF);
    zzb.zza(paramParcel, 5, paramStorageStats.zzSG);
    zzb.zzc(paramParcel, 6, paramStorageStats.zzSH);
    zzb.zzH(paramParcel, i);
  }

  public StorageStats zzab(Parcel paramParcel)
  {
    int i = 0;
    long l1 = 0L;
    int j = zza.zzJ(paramParcel);
    long l2 = l1;
    long l3 = l1;
    long l4 = l1;
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
        l4 = zza.zzi(paramParcel, m);
        break;
      case 3:
        l3 = zza.zzi(paramParcel, m);
        break;
      case 4:
        l2 = zza.zzi(paramParcel, m);
        break;
      case 5:
        l1 = zza.zzi(paramParcel, m);
        break;
      case 6:
        i = zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new StorageStats(k, l4, l3, l2, l1, i);
  }

  public StorageStats[] zzbo(int paramInt)
  {
    return new StorageStats[paramInt];
  }
}