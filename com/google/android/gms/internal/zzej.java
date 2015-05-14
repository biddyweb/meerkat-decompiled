package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzej
  implements Parcelable.Creator<zzek>
{
  static void zza(zzek paramzzek, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzek.versionCode);
    zzb.zza(paramParcel, 2, paramzzek.zztQ, false);
    zzb.zza(paramParcel, 3, paramzzek.zztR, false);
    zzb.zza(paramParcel, 4, paramzzek.mimeType, false);
    zzb.zza(paramParcel, 5, paramzzek.packageName, false);
    zzb.zza(paramParcel, 6, paramzzek.zztS, false);
    zzb.zza(paramParcel, 7, paramzzek.zztT, false);
    zzb.zza(paramParcel, 8, paramzzek.zztU, false);
    zzb.zzH(paramParcel, i);
  }

  public zzek zze(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    String str6 = null;
    String str7 = null;
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
        str7 = zza.zzo(paramParcel, k);
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
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzek(j, str7, str6, str5, str4, str3, str2, str1);
  }

  public zzek[] zzo(int paramInt)
  {
    return new zzek[paramInt];
  }
}