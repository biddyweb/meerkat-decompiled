package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzam
  implements Parcelable.Creator<zzal>
{
  static void zza(zzal paramzzal, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzal.zzFG);
    zzb.zzc(paramParcel, 2, paramzzal.getRequestId());
    zzb.zza(paramParcel, 3, paramzzal.getPath(), false);
    zzb.zza(paramParcel, 4, paramzzal.getData(), false);
    zzb.zza(paramParcel, 5, paramzzal.getSourceNodeId(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzal zzfF(Parcel paramParcel)
  {
    int i = 0;
    String str1 = null;
    int j = zza.zzJ(paramParcel);
    byte[] arrayOfByte = null;
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
        i = zza.zzg(paramParcel, m);
        break;
      case 3:
        str2 = zza.zzo(paramParcel, m);
        break;
      case 4:
        arrayOfByte = zza.zzr(paramParcel, m);
        break;
      case 5:
        str1 = zza.zzo(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzal(k, i, str2, arrayOfByte, str1);
  }

  public zzal[] zzif(int paramInt)
  {
    return new zzal[paramInt];
  }
}