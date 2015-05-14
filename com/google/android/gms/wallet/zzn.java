package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzn
  implements Parcelable.Creator<NotifyTransactionStatusRequest>
{
  static void zza(NotifyTransactionStatusRequest paramNotifyTransactionStatusRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramNotifyTransactionStatusRequest.zzFG);
    zzb.zza(paramParcel, 2, paramNotifyTransactionStatusRequest.zzaCY, false);
    zzb.zzc(paramParcel, 3, paramNotifyTransactionStatusRequest.status);
    zzb.zza(paramParcel, 4, paramNotifyTransactionStatusRequest.zzaEf, false);
    zzb.zzH(paramParcel, i);
  }

  public NotifyTransactionStatusRequest zzfa(Parcel paramParcel)
  {
    String str1 = null;
    int i = 0;
    int j = zza.zzJ(paramParcel);
    String str2 = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        str2 = zza.zzo(paramParcel, m);
        break;
      case 3:
        i = zza.zzg(paramParcel, m);
        break;
      case 4:
        str1 = zza.zzo(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new NotifyTransactionStatusRequest(k, str2, i, str1);
  }

  public NotifyTransactionStatusRequest[] zzhx(int paramInt)
  {
    return new NotifyTransactionStatusRequest[paramInt];
  }
}