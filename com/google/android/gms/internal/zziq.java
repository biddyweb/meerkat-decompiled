package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zziq
  implements Parcelable.Creator<zzip>
{
  static void zza(zzip paramzzip, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzip.zzFO, false);
    zzb.zzc(paramParcel, 1000, paramzzip.zzFG);
    zzb.zza(paramParcel, 2, paramzzip.zzFP, false);
    zzb.zza(paramParcel, 3, paramzzip.zzFQ, false);
    zzb.zzH(paramParcel, i);
  }

  public zzip[] zzQ(int paramInt)
  {
    return new zzip[paramInt];
  }

  public zzip zzm(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str2 = null;
    String str3 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 1000:
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
    return new zzip(j, str3, str2, str1);
  }
}