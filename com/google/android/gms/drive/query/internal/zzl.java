package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzl
  implements Parcelable.Creator<NotFilter>
{
  static void zza(NotFilter paramNotFilter, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1000, paramNotFilter.zzFG);
    zzb.zza(paramParcel, 1, paramNotFilter.zzWL, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public NotFilter zzbs(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    FilterHolder localFilterHolder = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 1:
        localFilterHolder = (FilterHolder)zza.zza(paramParcel, k, FilterHolder.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new NotFilter(j, localFilterHolder);
  }

  public NotFilter[] zzcL(int paramInt)
  {
    return new NotFilter[paramInt];
  }
}