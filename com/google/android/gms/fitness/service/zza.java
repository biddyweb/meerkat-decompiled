package com.google.android.gms.fitness.service;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataSource;

public class zza
  implements Parcelable.Creator<FitnessSensorServiceRequest>
{
  static void zza(FitnessSensorServiceRequest paramFitnessSensorServiceRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramFitnessSensorServiceRequest.getDataSource(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramFitnessSensorServiceRequest.getVersionCode());
    zzb.zza(paramParcel, 2, paramFitnessSensorServiceRequest.zzmg(), false);
    zzb.zza(paramParcel, 3, paramFitnessSensorServiceRequest.zzlI());
    zzb.zza(paramParcel, 4, paramFitnessSensorServiceRequest.zzmw());
    zzb.zzH(paramParcel, i);
  }

  public FitnessSensorServiceRequest zzcO(Parcel paramParcel)
  {
    long l1 = 0L;
    IBinder localIBinder = null;
    int i = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    int j = 0;
    long l2 = l1;
    DataSource localDataSource = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = com.google.android.gms.common.internal.safeparcel.zza.zzI(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzaP(k))
      {
      default:
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, k);
        break;
      case 1:
        localDataSource = (DataSource)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, k, DataSource.CREATOR);
        break;
      case 1000:
        j = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, k);
        break;
      case 2:
        localIBinder = com.google.android.gms.common.internal.safeparcel.zza.zzp(paramParcel, k);
        break;
      case 3:
        l2 = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, k);
        break;
      case 4:
        l1 = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new FitnessSensorServiceRequest(j, localDataSource, localIBinder, l2, l1);
  }

  public FitnessSensorServiceRequest[] zzen(int paramInt)
  {
    return new FitnessSensorServiceRequest[paramInt];
  }
}