package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;

public class zzc
  implements Parcelable.Creator<zzb>
{
  static void zza(zzb paramzzb, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzK(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, paramzzb.getVersionCode());
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, paramzzb.label, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 3, paramzzb.value, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }

  public zzb zzfj(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str2 = null;
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
        str2 = zza.zzo(paramParcel, k);
        break;
      case 3:
        str1 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzb(j, str2, str1);
  }

  public zzb[] zzhJ(int paramInt)
  {
    return new zzb[paramInt];
  }
}