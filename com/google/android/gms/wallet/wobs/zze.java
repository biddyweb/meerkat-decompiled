package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.internal.zzls;
import java.util.ArrayList;

public class zze
  implements Parcelable.Creator<zzd>
{
  static void zza(zzd paramzzd, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzK(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, paramzzd.getVersionCode());
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, paramzzd.zzaFc, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 3, paramzzd.zzaFd, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 4, paramzzd.zzaFe, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }

  public zzd zzfk(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList = zzls.zzkb();
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
        localArrayList = zza.zzc(paramParcel, k, zzb.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzd(j, str2, str1, localArrayList);
  }

  public zzd[] zzhK(int paramInt)
  {
    return new zzd[paramInt];
  }
}