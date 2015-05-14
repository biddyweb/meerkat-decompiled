package com.google.android.gms.identity.intents.model;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<CountrySpecification>
{
  static void zza(CountrySpecification paramCountrySpecification, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramCountrySpecification.getVersionCode());
    zzb.zza(paramParcel, 2, paramCountrySpecification.zzyc, false);
    zzb.zzH(paramParcel, i);
  }

  public CountrySpecification zzdl(Parcel paramParcel)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    int j = 0;
    String str = null;
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
        str = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new CountrySpecification(j, str);
  }

  public CountrySpecification[] zzfd(int paramInt)
  {
    return new CountrySpecification[paramInt];
  }
}