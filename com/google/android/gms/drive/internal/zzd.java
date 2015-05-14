package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzd
  implements Parcelable.Creator<CancelPendingActionsRequest>
{
  static void zza(CancelPendingActionsRequest paramCancelPendingActionsRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramCancelPendingActionsRequest.zzFG);
    zzb.zzb(paramParcel, 2, paramCancelPendingActionsRequest.zzSS, false);
    zzb.zzH(paramParcel, i);
  }

  public CancelPendingActionsRequest zzak(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList = null;
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
        localArrayList = zza.zzC(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new CancelPendingActionsRequest(j, localArrayList);
  }

  public CancelPendingActionsRequest[] zzby(int paramInt)
  {
    return new CancelPendingActionsRequest[paramInt];
  }
}