package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.fitness.data.Session;
import java.util.ArrayList;

public class zzd
  implements Parcelable.Creator<DataDeleteRequest>
{
  static void zza(DataDeleteRequest paramDataDeleteRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramDataDeleteRequest.zzlp());
    zzb.zzc(paramParcel, 1000, paramDataDeleteRequest.getVersionCode());
    zzb.zza(paramParcel, 2, paramDataDeleteRequest.zzlq());
    zzb.zzc(paramParcel, 3, paramDataDeleteRequest.getDataSources(), false);
    zzb.zzc(paramParcel, 4, paramDataDeleteRequest.getDataTypes(), false);
    zzb.zzc(paramParcel, 5, paramDataDeleteRequest.getSessions(), false);
    zzb.zza(paramParcel, 6, paramDataDeleteRequest.zzlR());
    zzb.zza(paramParcel, 7, paramDataDeleteRequest.zzlS());
    zzb.zza(paramParcel, 8, paramDataDeleteRequest.zzlQ(), false);
    zzb.zza(paramParcel, 9, paramDataDeleteRequest.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public DataDeleteRequest zzcc(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    long l1 = 0L;
    long l2 = 0L;
    ArrayList localArrayList1 = null;
    ArrayList localArrayList2 = null;
    ArrayList localArrayList3 = null;
    boolean bool1 = false;
    boolean bool2 = false;
    IBinder localIBinder = null;
    String str = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        l1 = zza.zzi(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        l2 = zza.zzi(paramParcel, k);
        break;
      case 3:
        localArrayList1 = zza.zzc(paramParcel, k, DataSource.CREATOR);
        break;
      case 4:
        localArrayList2 = zza.zzc(paramParcel, k, DataType.CREATOR);
        break;
      case 5:
        localArrayList3 = zza.zzc(paramParcel, k, Session.CREATOR);
        break;
      case 6:
        bool1 = zza.zzc(paramParcel, k);
        break;
      case 7:
        bool2 = zza.zzc(paramParcel, k);
        break;
      case 8:
        localIBinder = zza.zzp(paramParcel, k);
        break;
      case 9:
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new DataDeleteRequest(j, l1, l2, localArrayList1, localArrayList2, localArrayList3, bool1, bool2, localIBinder, str);
  }

  public DataDeleteRequest[] zzdA(int paramInt)
  {
    return new DataDeleteRequest[paramInt];
  }
}