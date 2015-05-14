package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class zzh
  implements Parcelable.Creator<HasFilter>
{
  static void zza(HasFilter paramHasFilter, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1000, paramHasFilter.zzFG);
    zzb.zza(paramParcel, 1, paramHasFilter.zzWx, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public HasFilter zzbo(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    MetadataBundle localMetadataBundle = null;
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
        localMetadataBundle = (MetadataBundle)zza.zza(paramParcel, k, MetadataBundle.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new HasFilter(j, localMetadataBundle);
  }

  public HasFilter[] zzcH(int paramInt)
  {
    return new HasFilter[paramInt];
  }
}