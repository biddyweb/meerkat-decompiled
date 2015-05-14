package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzqe
  implements Parcelable.Creator<zzqd>
{
  static void zza(zzqd paramzzqd, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzqd.name, false);
    zzb.zzc(paramParcel, 1000, paramzzqd.versionCode);
    zzb.zza(paramParcel, 2, paramzzqd.zzaoQ, false);
    zzb.zza(paramParcel, 3, paramzzqd.zzaoR, false);
    zzb.zza(paramParcel, 4, paramzzqd.zzaoS, false);
    zzb.zzb(paramParcel, 5, paramzzqd.zzaoT, false);
    zzb.zzH(paramParcel, i);
  }

  public zzqd zzdH(Parcel paramParcel)
  {
    ArrayList localArrayList = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        str4 = zza.zzo(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 3:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 4:
        str1 = zza.zzo(paramParcel, k);
        break;
      case 5:
        localArrayList = zza.zzC(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzqd(j, str4, str3, str2, str1, localArrayList);
  }

  public zzqd[] zzfK(int paramInt)
  {
    return new zzqd[paramInt];
  }
}