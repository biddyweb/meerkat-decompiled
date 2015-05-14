package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzis
  implements Parcelable.Creator<zzir>
{
  static void zza(zzir paramzzir, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzir.zzFT, false);
    zzb.zzc(paramParcel, 1000, paramzzir.zzFG);
    zzb.zza(paramParcel, 3, paramzzir.zzFU, paramInt, false);
    zzb.zzc(paramParcel, 4, paramzzir.zzFV);
    zzb.zza(paramParcel, 5, paramzzir.zzFW, false);
    zzb.zzH(paramParcel, i);
  }

  public zzir[] zzR(int paramInt)
  {
    return new zzir[paramInt];
  }

  public zzir zzn(Parcel paramParcel)
  {
    byte[] arrayOfByte = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    int k = -1;
    zziz localzziz = null;
    String str = null;
    while (paramParcel.dataPosition() < i)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        str = zza.zzo(paramParcel, m);
        break;
      case 1000:
        j = zza.zzg(paramParcel, m);
        break;
      case 3:
        localzziz = (zziz)zza.zza(paramParcel, m, zziz.CREATOR);
        break;
      case 4:
        k = zza.zzg(paramParcel, m);
        break;
      case 5:
        arrayOfByte = zza.zzr(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzir(j, str, localzziz, k, arrayOfByte);
  }
}