package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzav
  implements Parcelable.Creator<OnFetchThumbnailResponse>
{
  static void zza(OnFetchThumbnailResponse paramOnFetchThumbnailResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramOnFetchThumbnailResponse.zzFG);
    zzb.zza(paramParcel, 2, paramOnFetchThumbnailResponse.zzUX, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public OnFetchThumbnailResponse zzaI(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ParcelFileDescriptor localParcelFileDescriptor = null;
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
        localParcelFileDescriptor = (ParcelFileDescriptor)zza.zza(paramParcel, k, ParcelFileDescriptor.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new OnFetchThumbnailResponse(j, localParcelFileDescriptor);
  }

  public OnFetchThumbnailResponse[] zzcb(int paramInt)
  {
    return new OnFetchThumbnailResponse[paramInt];
  }
}