package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzq
  implements Parcelable.Creator<zzp>
{
  static void zza(zzp paramzzp, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzp.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzp.zzaFl, false);
    zzb.zza(paramParcel, 3, paramzzp.zzwG, false);
    zzb.zza(paramParcel, 4, paramzzp.zzaFo, paramInt, false);
    zzb.zza(paramParcel, 5, paramzzp.zzaFp, paramInt, false);
    zzb.zza(paramParcel, 6, paramzzp.zzaFq, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzp zzfq(Parcel paramParcel)
  {
    zzn localzzn1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    zzn localzzn2 = null;
    zzl localzzl = null;
    String str1 = null;
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
        break;
      case 4:
        localzzl = (zzl)zza.zza(paramParcel, k, zzl.CREATOR);
        break;
      case 5:
        localzzn2 = (zzn)zza.zza(paramParcel, k, zzn.CREATOR);
        break;
      case 6:
        localzzn1 = (zzn)zza.zza(paramParcel, k, zzn.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzp(j, str2, str1, localzzl, localzzn2, localzzn1);
  }

  public zzp[] zzhQ(int paramInt)
  {
    return new zzp[paramInt];
  }
}