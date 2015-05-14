package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<ChangeSequenceNumber>
{
  static void zza(ChangeSequenceNumber paramChangeSequenceNumber, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramChangeSequenceNumber.zzFG);
    zzb.zza(paramParcel, 2, paramChangeSequenceNumber.zzRR);
    zzb.zza(paramParcel, 3, paramChangeSequenceNumber.zzRS);
    zzb.zza(paramParcel, 4, paramChangeSequenceNumber.zzRT);
    zzb.zzH(paramParcel, i);
  }

  public ChangeSequenceNumber zzV(Parcel paramParcel)
  {
    long l1 = 0L;
    int i = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    int j = 0;
    long l2 = l1;
    long l3 = l1;
    while (paramParcel.dataPosition() < i)
    {
      int k = com.google.android.gms.common.internal.safeparcel.zza.zzI(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzaP(k))
      {
      default:
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, k);
        break;
      case 1:
        j = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, k);
        break;
      case 2:
        l3 = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, k);
        break;
      case 3:
        l2 = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, k);
        break;
      case 4:
        l1 = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new ChangeSequenceNumber(j, l3, l2, l1);
  }

  public ChangeSequenceNumber[] zzbg(int paramInt)
  {
    return new ChangeSequenceNumber[paramInt];
  }
}