package com.google.android.gms.fitness.request;

import android.app.PendingIntent;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.location.LocationRequest;
import java.util.ArrayList;

public class zzad
  implements Parcelable.Creator<zzac>
{
  static void zza(zzac paramzzac, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzac.getDataSource(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzac.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzac.getDataType(), paramInt, false);
    zzb.zza(paramParcel, 3, paramzzac.zzmg(), false);
    zzb.zzc(paramParcel, 4, paramzzac.zzabq);
    zzb.zzc(paramParcel, 5, paramzzac.zzabr);
    zzb.zza(paramParcel, 6, paramzzac.zzlI());
    zzb.zza(paramParcel, 7, paramzzac.zzmd());
    zzb.zza(paramParcel, 8, paramzzac.zzmb(), paramInt, false);
    zzb.zza(paramParcel, 9, paramzzac.zzmc());
    zzb.zzc(paramParcel, 10, paramzzac.getAccuracyMode());
    zzb.zzc(paramParcel, 11, paramzzac.zzme(), false);
    zzb.zza(paramParcel, 12, paramzzac.zzmf());
    zzb.zza(paramParcel, 13, paramzzac.zzlQ(), false);
    zzb.zza(paramParcel, 14, paramzzac.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzac zzcq(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    DataSource localDataSource = null;
    DataType localDataType = null;
    IBinder localIBinder1 = null;
    int k = 0;
    int m = 0;
    long l1 = 0L;
    long l2 = 0L;
    PendingIntent localPendingIntent = null;
    long l3 = 0L;
    int n = 0;
    ArrayList localArrayList = null;
    long l4 = 0L;
    IBinder localIBinder2 = null;
    String str = null;
    while (paramParcel.dataPosition() < i)
    {
      int i1 = zza.zzI(paramParcel);
      switch (zza.zzaP(i1))
      {
      default:
        zza.zzb(paramParcel, i1);
        break;
      case 1:
        localDataSource = (DataSource)zza.zza(paramParcel, i1, DataSource.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, i1);
        break;
      case 2:
        localDataType = (DataType)zza.zza(paramParcel, i1, DataType.CREATOR);
        break;
      case 3:
        localIBinder1 = zza.zzp(paramParcel, i1);
        break;
      case 4:
        k = zza.zzg(paramParcel, i1);
        break;
      case 5:
        m = zza.zzg(paramParcel, i1);
        break;
      case 6:
        l1 = zza.zzi(paramParcel, i1);
        break;
      case 7:
        l2 = zza.zzi(paramParcel, i1);
        break;
      case 8:
        localPendingIntent = (PendingIntent)zza.zza(paramParcel, i1, PendingIntent.CREATOR);
        break;
      case 9:
        l3 = zza.zzi(paramParcel, i1);
        break;
      case 10:
        n = zza.zzg(paramParcel, i1);
        break;
      case 11:
        localArrayList = zza.zzc(paramParcel, i1, LocationRequest.CREATOR);
        break;
      case 12:
        l4 = zza.zzi(paramParcel, i1);
        break;
      case 13:
        localIBinder2 = zza.zzp(paramParcel, i1);
        break;
      case 14:
        str = zza.zzo(paramParcel, i1);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzac(j, localDataSource, localDataType, localIBinder1, k, m, l1, l2, localPendingIntent, l3, n, localArrayList, l4, localIBinder2, str);
  }

  public zzac[] zzdO(int paramInt)
  {
    return new zzac[paramInt];
  }
}