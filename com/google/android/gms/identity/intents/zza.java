package com.google.android.gms.identity.intents;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.identity.intents.model.CountrySpecification;
import java.util.ArrayList;

public class zza
  implements Parcelable.Creator<UserAddressRequest>
{
  static void zza(UserAddressRequest paramUserAddressRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramUserAddressRequest.getVersionCode());
    zzb.zzc(paramParcel, 2, paramUserAddressRequest.zzalr, false);
    zzb.zzH(paramParcel, i);
  }

  public UserAddressRequest zzdk(Parcel paramParcel)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = com.google.android.gms.common.internal.safeparcel.zza.zzI(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzaP(k))
      {
      default:
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, k);
        break;
      case 1:
        j = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, k);
        break;
      case 2:
        localArrayList = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, k, CountrySpecification.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new UserAddressRequest(j, localArrayList);
  }

  public UserAddressRequest[] zzfc(int paramInt)
  {
    return new UserAddressRequest[paramInt];
  }
}