package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzar
  implements Parcelable.Creator<zzaq>
{
  static void zza(zzaq paramzzaq, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzaq.versionCode);
    zzb.zza(paramParcel, 2, paramzzaq.packageName, false);
    zzb.zza(paramParcel, 3, paramzzaq.label, false);
    zzb.zza(paramParcel, 4, paramzzaq.zzaGC);
    zzb.zzH(paramParcel, i);
  }

  public zzaq zzfH(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    long l = 0L;
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
        l = zza.zzi(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzaq(j, str2, str1, l);
  }

  public zzaq[] zzih(int paramInt)
  {
    return new zzaq[paramInt];
  }
}