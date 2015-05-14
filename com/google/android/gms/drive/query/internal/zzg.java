package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzg
  implements Parcelable.Creator<FullTextSearchFilter>
{
  static void zza(FullTextSearchFilter paramFullTextSearchFilter, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1000, paramFullTextSearchFilter.zzFG);
    zzb.zza(paramParcel, 1, paramFullTextSearchFilter.mValue, false);
    zzb.zzH(paramParcel, i);
  }

  public FullTextSearchFilter zzbn(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str = null;
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
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new FullTextSearchFilter(j, str);
  }

  public FullTextSearchFilter[] zzcG(int paramInt)
  {
    return new FullTextSearchFilter[paramInt];
  }
}