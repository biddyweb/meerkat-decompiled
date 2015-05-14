package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzd
  implements Parcelable.Creator<Bucket>
{
  static void zza(Bucket paramBucket, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramBucket.zzlp());
    zzb.zzc(paramParcel, 1000, paramBucket.getVersionCode());
    zzb.zza(paramParcel, 2, paramBucket.zzlq());
    zzb.zza(paramParcel, 3, paramBucket.getSession(), paramInt, false);
    zzb.zzc(paramParcel, 4, paramBucket.zzln());
    zzb.zzc(paramParcel, 5, paramBucket.getDataSets(), false);
    zzb.zzc(paramParcel, 6, paramBucket.getBucketType());
    zzb.zza(paramParcel, 7, paramBucket.zzlo());
    zzb.zzH(paramParcel, i);
  }

  public Bucket zzbL(Parcel paramParcel)
  {
    long l1 = 0L;
    ArrayList localArrayList = null;
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    int k = 0;
    Session localSession = null;
    long l2 = l1;
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
        l2 = zza.zzi(paramParcel, n);
        break;
      case 1000:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        l1 = zza.zzi(paramParcel, n);
        break;
      case 3:
        localSession = (Session)zza.zza(paramParcel, n, Session.CREATOR);
        break;
      case 4:
        k = zza.zzg(paramParcel, n);
        break;
      case 5:
        localArrayList = zza.zzc(paramParcel, n, DataSet.CREATOR);
        break;
      case 6:
        j = zza.zzg(paramParcel, n);
        break;
      case 7:
        bool = zza.zzc(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new Bucket(m, l2, l1, localSession, k, localArrayList, j, bool);
  }

  public Bucket[] zzdh(int paramInt)
  {
    return new Bucket[paramInt];
  }
}