package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzln
  implements Parcelable.Creator<zzlm>
{
  static void zza(zzlm paramzzlm, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzlm.zzFG);
    zzb.zza(paramParcel, 2, paramzzlm.getTimeMillis());
    zzb.zza(paramParcel, 3, paramzzlm.zzjT(), false);
    zzb.zza(paramParcel, 4, paramzzlm.zzjU(), false);
    zzb.zza(paramParcel, 5, paramzzlm.zzjV(), false);
    zzb.zza(paramParcel, 6, paramzzlm.zzjW(), false);
    zzb.zza(paramParcel, 7, paramzzlm.zzjX(), false);
    zzb.zza(paramParcel, 8, paramzzlm.zzjY(), false);
    zzb.zza(paramParcel, 9, paramzzlm.zzjZ());
    zzb.zzH(paramParcel, i);
  }

  public zzlm zzU(Parcel paramParcel)
  {
    long l1 = 0L;
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    String str6 = null;
    long l2 = l1;
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
        l2 = zza.zzi(paramParcel, k);
        break;
      case 3:
        str6 = zza.zzo(paramParcel, k);
        break;
      case 4:
        str5 = zza.zzo(paramParcel, k);
        break;
      case 5:
        str4 = zza.zzo(paramParcel, k);
        break;
      case 6:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 7:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 8:
        str1 = zza.zzo(paramParcel, k);
        break;
      case 9:
        l1 = zza.zzi(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzlm(j, l2, str6, str5, str4, str3, str2, str1, l1);
  }

  public zzlm[] zzba(int paramInt)
  {
    return new zzlm[paramInt];
  }
}