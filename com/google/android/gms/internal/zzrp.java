package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzrp
  implements Parcelable.Creator<zzro>
{
  static void zza(zzro paramzzro, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzro.zzro(), false);
    zzb.zzc(paramParcel, 1000, paramzzro.versionCode);
    zzb.zza(paramParcel, 2, paramzzro.getType(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzro zzel(Parcel paramParcel)
  {
    String str = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    byte[] arrayOfByte = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        arrayOfByte = zza.zzr(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzro(j, arrayOfByte, str);
  }

  public zzro[] zzgx(int paramInt)
  {
    return new zzro[paramInt];
  }
}