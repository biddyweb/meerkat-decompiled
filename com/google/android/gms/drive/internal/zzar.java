package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzar
  implements Parcelable.Creator<OnDownloadProgressResponse>
{
  static void zza(OnDownloadProgressResponse paramOnDownloadProgressResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramOnDownloadProgressResponse.zzFG);
    zzb.zza(paramParcel, 2, paramOnDownloadProgressResponse.zzUR);
    zzb.zza(paramParcel, 3, paramOnDownloadProgressResponse.zzUS);
    zzb.zzH(paramParcel, i);
  }

  public OnDownloadProgressResponse zzaE(Parcel paramParcel)
  {
    long l1 = 0L;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    long l2 = l1;
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
        l2 = zza.zzi(paramParcel, k);
        break;
      case 3:
        l1 = zza.zzi(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new OnDownloadProgressResponse(j, l2, l1);
  }

  public OnDownloadProgressResponse[] zzbX(int paramInt)
  {
    return new OnDownloadProgressResponse[paramInt];
  }
}