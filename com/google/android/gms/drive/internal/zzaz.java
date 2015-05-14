package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzaz
  implements Parcelable.Creator<OnLoadRealtimeResponse>
{
  static void zza(OnLoadRealtimeResponse paramOnLoadRealtimeResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramOnLoadRealtimeResponse.zzFG);
    zzb.zza(paramParcel, 2, paramOnLoadRealtimeResponse.zzmE);
    zzb.zzH(paramParcel, i);
  }

  public OnLoadRealtimeResponse zzaM(Parcel paramParcel)
  {
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    int j = 0;
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
        bool = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new OnLoadRealtimeResponse(j, bool);
  }

  public OnLoadRealtimeResponse[] zzcf(int paramInt)
  {
    return new OnLoadRealtimeResponse[paramInt];
  }
}