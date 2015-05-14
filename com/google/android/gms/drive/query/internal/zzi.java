package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class zzi
  implements Parcelable.Creator<InFilter>
{
  static void zza(InFilter paramInFilter, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1000, paramInFilter.zzFG);
    zzb.zza(paramParcel, 1, paramInFilter.zzWx, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public InFilter zzbp(Parcel paramParcel)
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
    return new InFilter(j, localMetadataBundle);
  }

  public InFilter[] zzcI(int paramInt)
  {
    return new InFilter[paramInt];
  }
}