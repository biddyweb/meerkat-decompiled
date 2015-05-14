package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.events.ChangeEvent;
import com.google.android.gms.drive.events.CompletionEvent;
import com.google.android.gms.drive.events.QueryEvent;

public class zzau
  implements Parcelable.Creator<OnEventResponse>
{
  static void zza(OnEventResponse paramOnEventResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramOnEventResponse.zzFG);
    zzb.zzc(paramParcel, 2, paramOnEventResponse.zzTe);
    zzb.zza(paramParcel, 3, paramOnEventResponse.zzUU, paramInt, false);
    zzb.zza(paramParcel, 5, paramOnEventResponse.zzUV, paramInt, false);
    zzb.zza(paramParcel, 6, paramOnEventResponse.zzUW, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public OnEventResponse zzaH(Parcel paramParcel)
  {
    int i = 0;
    QueryEvent localQueryEvent = null;
    int j = zza.zzJ(paramParcel);
    CompletionEvent localCompletionEvent = null;
    ChangeEvent localChangeEvent = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      case 4:
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        i = zza.zzg(paramParcel, m);
        break;
      case 3:
        localChangeEvent = (ChangeEvent)zza.zza(paramParcel, m, ChangeEvent.CREATOR);
        break;
      case 5:
        localCompletionEvent = (CompletionEvent)zza.zza(paramParcel, m, CompletionEvent.CREATOR);
        break;
      case 6:
        localQueryEvent = (QueryEvent)zza.zza(paramParcel, m, QueryEvent.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new OnEventResponse(k, i, localChangeEvent, localCompletionEvent, localQueryEvent);
  }

  public OnEventResponse[] zzca(int paramInt)
  {
    return new OnEventResponse[paramInt];
  }
}