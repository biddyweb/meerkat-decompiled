package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataType;
import java.util.ArrayList;

public class zzaq
  implements Parcelable.Creator<StartBleScanRequest>
{
  static void zza(StartBleScanRequest paramStartBleScanRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramStartBleScanRequest.getDataTypes(), false);
    zzb.zzc(paramParcel, 1000, paramStartBleScanRequest.getVersionCode());
    zzb.zza(paramParcel, 2, paramStartBleScanRequest.zzmk(), false);
    zzb.zzc(paramParcel, 3, paramStartBleScanRequest.getTimeoutSecs());
    zzb.zza(paramParcel, 4, paramStartBleScanRequest.zzlQ(), false);
    zzb.zza(paramParcel, 5, paramStartBleScanRequest.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public StartBleScanRequest zzcy(Parcel paramParcel)
  {
    int i = 0;
    String str = null;
    int j = zza.zzJ(paramParcel);
    IBinder localIBinder1 = null;
    IBinder localIBinder2 = null;
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
        localArrayList = zza.zzc(paramParcel, m, DataType.CREATOR);
        break;
      case 1000:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        localIBinder2 = zza.zzp(paramParcel, m);
        break;
      case 3:
        i = zza.zzg(paramParcel, m);
        break;
      case 4:
        localIBinder1 = zza.zzp(paramParcel, m);
        break;
      case 5:
        str = zza.zzo(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new StartBleScanRequest(k, localArrayList, localIBinder2, i, localIBinder1, str);
  }

  public StartBleScanRequest[] zzdX(int paramInt)
  {
    return new StartBleScanRequest[paramInt];
  }
}