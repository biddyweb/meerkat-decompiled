package com.google.android.gms.plus.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzi
  implements Parcelable.Creator<zzh>
{
  static void zza(zzh paramzzh, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzh.getAccountName(), false);
    zzb.zzc(paramParcel, 1000, paramzzh.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzh.zzrS(), false);
    zzb.zza(paramParcel, 3, paramzzh.zzrT(), false);
    zzb.zza(paramParcel, 4, paramzzh.zzrU(), false);
    zzb.zza(paramParcel, 5, paramzzh.zzrV(), false);
    zzb.zza(paramParcel, 6, paramzzh.zzrW(), false);
    zzb.zza(paramParcel, 7, paramzzh.zzrX(), false);
    zzb.zza(paramParcel, 8, paramzzh.zzrY(), false);
    zzb.zza(paramParcel, 9, paramzzh.zzrZ(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzh zzey(Parcel paramParcel)
  {
    PlusCommonExtras localPlusCommonExtras = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String[] arrayOfString1 = null;
    String[] arrayOfString2 = null;
    String[] arrayOfString3 = null;
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
        arrayOfString3 = zza.zzA(paramParcel, k);
        break;
      case 3:
        arrayOfString2 = zza.zzA(paramParcel, k);
        break;
      case 4:
        arrayOfString1 = zza.zzA(paramParcel, k);
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
        localPlusCommonExtras = (PlusCommonExtras)zza.zza(paramParcel, k, PlusCommonExtras.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzh(j, str5, arrayOfString3, arrayOfString2, arrayOfString1, str4, str3, str2, str1, localPlusCommonExtras);
  }

  public zzh[] zzgL(int paramInt)
  {
    return new zzh[paramInt];
  }
}