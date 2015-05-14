package com.google.android.gms.drive.execution.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<ContentTransferInfoResponse>
{
  static void zza(ContentTransferInfoResponse paramContentTransferInfoResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramContentTransferInfoResponse.zzFG);
    zzb.zzc(paramParcel, 2, paramContentTransferInfoResponse.zzJp);
    zzb.zzc(paramParcel, 3, paramContentTransferInfoResponse.zzrX);
    zzb.zza(paramParcel, 4, paramContentTransferInfoResponse.zzTc);
    zzb.zza(paramParcel, 5, paramContentTransferInfoResponse.zzTd);
    zzb.zzH(paramParcel, i);
  }

  public ContentTransferInfoResponse zzag(Parcel paramParcel)
  {
    long l1 = 0L;
    int i = 0;
    int j = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    long l2 = l1;
    int k = 0;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = com.google.android.gms.common.internal.safeparcel.zza.zzI(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzaP(n))
      {
      default:
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, n);
        break;
      case 1:
        m = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, n);
        break;
      case 2:
        k = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, n);
        break;
      case 3:
        i = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, n);
        break;
      case 4:
        l2 = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, n);
        break;
      case 5:
        l1 = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new ContentTransferInfoResponse(m, k, i, l2, l1);
  }

  public ContentTransferInfoResponse[] zzbu(int paramInt)
  {
    return new ContentTransferInfoResponse[paramInt];
  }
}