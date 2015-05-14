package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzh
  implements Parcelable.Creator<MetadataBundle>
{
  static void zza(MetadataBundle paramMetadataBundle, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramMetadataBundle.zzFG);
    zzb.zza(paramParcel, 2, paramMetadataBundle.zzVq, false);
    zzb.zzH(paramParcel, i);
  }

  public MetadataBundle zzbe(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Bundle localBundle = null;
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
        localBundle = zza.zzq(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new MetadataBundle(j, localBundle);
  }

  public MetadataBundle[] zzcx(int paramInt)
  {
    return new MetadataBundle[paramInt];
  }
}