package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzbt
  implements Parcelable.Creator<zzbs>
{
  static void zza(zzbs paramzzbs, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzbs.versionCode);
    zzb.zzc(paramParcel, 2, paramzzbs.zzpN);
    zzb.zzc(paramParcel, 3, paramzzbs.backgroundColor);
    zzb.zzc(paramParcel, 4, paramzzbs.zzpO);
    zzb.zzc(paramParcel, 5, paramzzbs.zzpP);
    zzb.zzc(paramParcel, 6, paramzzbs.zzpQ);
    zzb.zzc(paramParcel, 7, paramzzbs.zzpR);
    zzb.zzc(paramParcel, 8, paramzzbs.zzpS);
    zzb.zzc(paramParcel, 9, paramzzbs.zzpT);
    zzb.zza(paramParcel, 10, paramzzbs.zzpU, false);
    zzb.zzc(paramParcel, 11, paramzzbs.zzpV);
    zzb.zza(paramParcel, 12, paramzzbs.zzpW, false);
    zzb.zzc(paramParcel, 13, paramzzbs.zzpX);
    zzb.zzc(paramParcel, 14, paramzzbs.zzpY);
    zzb.zza(paramParcel, 15, paramzzbs.zzpZ, false);
    zzb.zzH(paramParcel, i);
  }

  public zzbs zzd(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    int k = 0;
    int m = 0;
    int n = 0;
    int i1 = 0;
    int i2 = 0;
    int i3 = 0;
    int i4 = 0;
    int i5 = 0;
    String str1 = null;
    int i6 = 0;
    String str2 = null;
    int i7 = 0;
    int i8 = 0;
    String str3 = null;
    while (paramParcel.dataPosition() < i)
    {
      int i9 = zza.zzI(paramParcel);
      switch (zza.zzaP(i9))
      {
      default:
        zza.zzb(paramParcel, i9);
        break;
      case 1:
        j = zza.zzg(paramParcel, i9);
        break;
      case 2:
        k = zza.zzg(paramParcel, i9);
        break;
      case 3:
        m = zza.zzg(paramParcel, i9);
        break;
      case 4:
        n = zza.zzg(paramParcel, i9);
        break;
      case 5:
        i1 = zza.zzg(paramParcel, i9);
        break;
      case 6:
        i2 = zza.zzg(paramParcel, i9);
        break;
      case 7:
        i3 = zza.zzg(paramParcel, i9);
        break;
      case 8:
        i4 = zza.zzg(paramParcel, i9);
        break;
      case 9:
        i5 = zza.zzg(paramParcel, i9);
        break;
      case 10:
        str1 = zza.zzo(paramParcel, i9);
        break;
      case 11:
        i6 = zza.zzg(paramParcel, i9);
        break;
      case 12:
        str2 = zza.zzo(paramParcel, i9);
        break;
      case 13:
        i7 = zza.zzg(paramParcel, i9);
        break;
      case 14:
        i8 = zza.zzg(paramParcel, i9);
        break;
      case 15:
        str3 = zza.zzo(paramParcel, i9);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzbs(j, k, m, n, i1, i2, i3, i4, i5, str1, i6, str2, i7, i8, str3);
  }

  public zzbs[] zzi(int paramInt)
  {
    return new zzbs[paramInt];
  }
}