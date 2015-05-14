package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.Subscription;
import java.util.ArrayList;

public class zzi
  implements Parcelable.Creator<ListSubscriptionsResult>
{
  static void zza(ListSubscriptionsResult paramListSubscriptionsResult, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramListSubscriptionsResult.getSubscriptions(), false);
    zzb.zzc(paramParcel, 1000, paramListSubscriptionsResult.getVersionCode());
    zzb.zza(paramParcel, 2, paramListSubscriptionsResult.getStatus(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public ListSubscriptionsResult zzcJ(Parcel paramParcel)
  {
    Status localStatus = null;
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
        localArrayList = zza.zzc(paramParcel, k, Subscription.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localStatus = (Status)zza.zza(paramParcel, k, Status.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new ListSubscriptionsResult(j, localArrayList, localStatus);
  }

  public ListSubscriptionsResult[] zzei(int paramInt)
  {
    return new ListSubscriptionsResult[paramInt];
  }
}