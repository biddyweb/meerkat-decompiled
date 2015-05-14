package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class zzb
  implements Parcelable.Creator<FieldOnlyFilter>
{
  static void zza(FieldOnlyFilter paramFieldOnlyFilter, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzK(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1000, paramFieldOnlyFilter.zzFG);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 1, paramFieldOnlyFilter.zzWx, paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }

  public FieldOnlyFilter zzbk(Parcel paramParcel)
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
    return new FieldOnlyFilter(j, localMetadataBundle);
  }

  public FieldOnlyFilter[] zzcD(int paramInt)
  {
    return new FieldOnlyFilter[paramInt];
  }
}