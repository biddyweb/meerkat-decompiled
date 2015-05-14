package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.Session;
import com.google.android.gms.fitness.data.zzq;
import java.util.ArrayList;

public class zzl
  implements Parcelable.Creator<SessionReadResult>
{
  static void zza(SessionReadResult paramSessionReadResult, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramSessionReadResult.getSessions(), false);
    zzb.zzc(paramParcel, 1000, paramSessionReadResult.getVersionCode());
    zzb.zzc(paramParcel, 2, paramSessionReadResult.zzmt(), false);
    zzb.zza(paramParcel, 3, paramSessionReadResult.getStatus(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public SessionReadResult zzcL(Parcel paramParcel)
  {
    Status localStatus = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList1 = null;
    ArrayList localArrayList2 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localArrayList2 = zza.zzc(paramParcel, k, Session.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localArrayList1 = zza.zzc(paramParcel, k, zzq.CREATOR);
        break;
      case 3:
        localStatus = (Status)zza.zza(paramParcel, k, Status.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new SessionReadResult(j, localArrayList2, localArrayList1, localStatus);
  }

  public SessionReadResult[] zzek(int paramInt)
  {
    return new SessionReadResult[paramInt];
  }
}