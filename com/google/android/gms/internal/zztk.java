package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zztk
  implements Parcelable.Creator<zztj>
{
  static void zza(zztj paramzztj, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzztj.versionCode);
    zzb.zza(paramParcel, 2, paramzztj.packageName, false);
    zzb.zzc(paramParcel, 3, paramzztj.zzatW);
    zzb.zzc(paramParcel, 4, paramzztj.zzatX);
    zzb.zza(paramParcel, 5, paramzztj.zzatY, false);
    zzb.zza(paramParcel, 6, paramzztj.zzatZ, false);
    zzb.zza(paramParcel, 7, paramzztj.zzaua);
    zzb.zza(paramParcel, 8, paramzztj.zzaub, false);
    zzb.zzH(paramParcel, i);
  }

  public zztj zzew(Parcel paramParcel)
  {
    int i = 0;
    String str1 = null;
    int j = zza.zzJ(paramParcel);
    boolean bool = true;
    String str2 = null;
    String str3 = null;
    int k = 0;
    String str4 = null;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        str4 = zza.zzo(paramParcel, n);
        break;
      case 3:
        k = zza.zzg(paramParcel, n);
        break;
      case 4:
        i = zza.zzg(paramParcel, n);
        break;
      case 5:
        str3 = zza.zzo(paramParcel, n);
        break;
      case 6:
        str2 = zza.zzo(paramParcel, n);
        break;
      case 7:
        bool = zza.zzc(paramParcel, n);
        break;
      case 8:
        str1 = zza.zzo(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zztj(m, str4, k, i, str3, str2, bool, str1);
  }

  public zztj[] zzgI(int paramInt)
  {
    return new zztj[paramInt];
  }
}