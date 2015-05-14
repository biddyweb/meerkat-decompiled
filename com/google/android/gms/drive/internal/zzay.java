package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class zzay
  implements Parcelable.Creator<OnMetadataResponse>
{
  static void zza(OnMetadataResponse paramOnMetadataResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramOnMetadataResponse.zzFG);
    zzb.zza(paramParcel, 2, paramOnMetadataResponse.zzTp, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public OnMetadataResponse zzaL(Parcel paramParcel)
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
      case 1:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localMetadataBundle = (MetadataBundle)zza.zza(paramParcel, k, MetadataBundle.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new OnMetadataResponse(j, localMetadataBundle);
  }

  public OnMetadataResponse[] zzce(int paramInt)
  {
    return new OnMetadataResponse[paramInt];
  }
}