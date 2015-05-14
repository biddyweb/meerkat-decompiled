package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzi
  implements Parcelable.Creator<zzf>
{
  static void zza(zzf paramzzf, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzf.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzf.label, false);
    zzb.zza(paramParcel, 3, paramzzf.zzaFf, paramInt, false);
    zzb.zza(paramParcel, 4, paramzzf.type, false);
    zzb.zza(paramParcel, 5, paramzzf.zzaDG, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzf zzfm(Parcel paramParcel)
  {
    zzl localzzl = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    zzg localzzg = null;
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
        localzzg = (zzg)zza.zza(paramParcel, k, zzg.CREATOR);
        break;
      case 4:
        str1 = zza.zzo(paramParcel, k);
        break;
      case 5:
        localzzl = (zzl)zza.zza(paramParcel, k, zzl.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzf(j, str2, localzzg, str1, localzzl);
  }

  public zzf[] zzhM(int paramInt)
  {
    return new zzf[paramInt];
  }
}