package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzqi
  implements Parcelable.Creator<zzqh>
{
  static void zza(zzqh paramzzqh, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzqh.zzapb, false);
    zzb.zzc(paramParcel, 1000, paramzzqh.versionCode);
    zzb.zza(paramParcel, 2, paramzzqh.zzapc, false);
    zzb.zza(paramParcel, 3, paramzzqh.zzapd, false);
    zzb.zza(paramParcel, 4, paramzzqh.zzaob, false);
    zzb.zza(paramParcel, 5, paramzzqh.zzape, false);
    zzb.zzH(paramParcel, i);
  }

  public zzqh zzdI(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        str5 = zza.zzo(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str4 = zza.zzo(paramParcel, k);
        break;
      case 3:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 4:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 5:
        str1 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzqh(j, str5, str4, str3, str2, str1);
  }

  public zzqh[] zzfL(int paramInt)
  {
    return new zzqh[paramInt];
  }
}