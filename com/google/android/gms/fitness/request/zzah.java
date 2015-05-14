package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import java.util.ArrayList;

public class zzah
  implements Parcelable.Creator<SessionReadRequest>
{
  static void zza(SessionReadRequest paramSessionReadRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramSessionReadRequest.getSessionName(), false);
    zzb.zzc(paramParcel, 1000, paramSessionReadRequest.getVersionCode());
    zzb.zza(paramParcel, 2, paramSessionReadRequest.getSessionId(), false);
    zzb.zza(paramParcel, 3, paramSessionReadRequest.zzlp());
    zzb.zza(paramParcel, 4, paramSessionReadRequest.zzlq());
    zzb.zzc(paramParcel, 5, paramSessionReadRequest.getDataTypes(), false);
    zzb.zzc(paramParcel, 6, paramSessionReadRequest.getDataSources(), false);
    zzb.zza(paramParcel, 7, paramSessionReadRequest.zzmj());
    zzb.zza(paramParcel, 8, paramSessionReadRequest.zzlV());
    zzb.zzb(paramParcel, 9, paramSessionReadRequest.getExcludedPackages(), false);
    zzb.zza(paramParcel, 10, paramSessionReadRequest.zzlQ(), false);
    zzb.zza(paramParcel, 11, paramSessionReadRequest.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public SessionReadRequest zzct(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    long l1 = 0L;
    long l2 = 0L;
    ArrayList localArrayList1 = null;
    ArrayList localArrayList2 = null;
    boolean bool1 = false;
    boolean bool2 = false;
    ArrayList localArrayList3 = null;
    IBinder localIBinder = null;
    String str3 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        str1 = zza.zzo(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 3:
        l1 = zza.zzi(paramParcel, k);
        break;
      case 4:
        l2 = zza.zzi(paramParcel, k);
        break;
      case 5:
        localArrayList1 = zza.zzc(paramParcel, k, DataType.CREATOR);
        break;
      case 6:
        localArrayList2 = zza.zzc(paramParcel, k, DataSource.CREATOR);
        break;
      case 7:
        bool1 = zza.zzc(paramParcel, k);
        break;
      case 8:
        bool2 = zza.zzc(paramParcel, k);
        break;
      case 9:
        localArrayList3 = zza.zzC(paramParcel, k);
        break;
      case 10:
        localIBinder = zza.zzp(paramParcel, k);
        break;
      case 11:
        str3 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new SessionReadRequest(j, str1, str2, l1, l2, localArrayList1, localArrayList2, bool1, bool2, localArrayList3, localIBinder, str3);
  }

  public SessionReadRequest[] zzdS(int paramInt)
  {
    return new SessionReadRequest[paramInt];
  }
}