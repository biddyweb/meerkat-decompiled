package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzax
  implements Parcelable.Creator<OnListParentsResponse>
{
  static void zza(OnListParentsResponse paramOnListParentsResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramOnListParentsResponse.zzFG);
    zzb.zza(paramParcel, 2, paramOnListParentsResponse.zzUZ, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public OnListParentsResponse zzaK(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    DataHolder localDataHolder = null;
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
        localDataHolder = (DataHolder)zza.zza(paramParcel, k, DataHolder.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new OnListParentsResponse(j, localDataHolder);
  }

  public OnListParentsResponse[] zzcd(int paramInt)
  {
    return new OnListParentsResponse[paramInt];
  }
}