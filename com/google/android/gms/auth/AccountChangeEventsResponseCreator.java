package com.google.android.gms.auth;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class AccountChangeEventsResponseCreator
  implements Parcelable.Creator<AccountChangeEventsResponse>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(AccountChangeEventsResponse paramAccountChangeEventsResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramAccountChangeEventsResponse.zzHe);
    zzb.zzc(paramParcel, 2, paramAccountChangeEventsResponse.zzmv, false);
    zzb.zzH(paramParcel, i);
  }

  public AccountChangeEventsResponse createFromParcel(Parcel paramParcel)
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
        localArrayList = zza.zzc(paramParcel, k, AccountChangeEvent.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new AccountChangeEventsResponse(j, localArrayList);
  }

  public AccountChangeEventsResponse[] newArray(int paramInt)
  {
    return new AccountChangeEventsResponse[paramInt];
  }
}