package com.google.android.gms.internal;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.Messenger;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzgp
  implements Parcelable.Creator<zzgo>
{
  static void zza(zzgo paramzzgo, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzgo.versionCode);
    zzb.zza(paramParcel, 2, paramzzgo.zzwm, false);
    zzb.zza(paramParcel, 3, paramzzgo.zzwn, paramInt, false);
    zzb.zza(paramParcel, 4, paramzzgo.zzlV, paramInt, false);
    zzb.zza(paramParcel, 5, paramzzgo.zzlM, false);
    zzb.zza(paramParcel, 6, paramzzgo.applicationInfo, paramInt, false);
    zzb.zza(paramParcel, 7, paramzzgo.zzwo, paramInt, false);
    zzb.zza(paramParcel, 8, paramzzgo.zzwp, false);
    zzb.zza(paramParcel, 9, paramzzgo.zzwq, false);
    zzb.zza(paramParcel, 10, paramzzgo.zzwr, false);
    zzb.zza(paramParcel, 11, paramzzgo.zzlP, paramInt, false);
    zzb.zza(paramParcel, 12, paramzzgo.zzws, false);
    zzb.zzc(paramParcel, 13, paramzzgo.zzwt);
    zzb.zzb(paramParcel, 14, paramzzgo.zzmf, false);
    zzb.zza(paramParcel, 15, paramzzgo.zzwu, false);
    zzb.zza(paramParcel, 17, paramzzgo.zzww, paramInt, false);
    zzb.zza(paramParcel, 16, paramzzgo.zzwv);
    zzb.zzc(paramParcel, 19, paramzzgo.zzwy);
    zzb.zzc(paramParcel, 18, paramzzgo.zzwx);
    zzb.zza(paramParcel, 21, paramzzgo.zzwA, false);
    zzb.zza(paramParcel, 20, paramzzgo.zzwz);
    zzb.zzc(paramParcel, 23, paramzzgo.zzwC);
    zzb.zza(paramParcel, 22, paramzzgo.zzwB);
    zzb.zza(paramParcel, 25, paramzzgo.zzwE);
    zzb.zza(paramParcel, 24, paramzzgo.zzwD, false);
    zzb.zza(paramParcel, 26, paramzzgo.zzwF, false);
    zzb.zzH(paramParcel, i);
  }

  public zzgo zzh(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Bundle localBundle1 = null;
    zzax localzzax = null;
    zzba localzzba = null;
    String str1 = null;
    ApplicationInfo localApplicationInfo = null;
    PackageInfo localPackageInfo = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    zzhy localzzhy = null;
    Bundle localBundle2 = null;
    int k = 0;
    ArrayList localArrayList = null;
    Bundle localBundle3 = null;
    boolean bool1 = false;
    Messenger localMessenger = null;
    int m = 0;
    int n = 0;
    float f = 0.0F;
    String str5 = null;
    boolean bool2 = false;
    int i1 = 0;
    String str6 = null;
    long l = 0L;
    String str7 = null;
    while (paramParcel.dataPosition() < i)
    {
      int i2 = zza.zzI(paramParcel);
      switch (zza.zzaP(i2))
      {
      default:
        zza.zzb(paramParcel, i2);
        break;
      case 1:
        j = zza.zzg(paramParcel, i2);
        break;
      case 2:
        localBundle1 = zza.zzq(paramParcel, i2);
        break;
      case 3:
        localzzax = (zzax)zza.zza(paramParcel, i2, zzax.CREATOR);
        break;
      case 4:
        localzzba = (zzba)zza.zza(paramParcel, i2, zzba.CREATOR);
        break;
      case 5:
        str1 = zza.zzo(paramParcel, i2);
        break;
      case 6:
        localApplicationInfo = (ApplicationInfo)zza.zza(paramParcel, i2, ApplicationInfo.CREATOR);
        break;
      case 7:
        localPackageInfo = (PackageInfo)zza.zza(paramParcel, i2, PackageInfo.CREATOR);
        break;
      case 8:
        str2 = zza.zzo(paramParcel, i2);
        break;
      case 9:
        str3 = zza.zzo(paramParcel, i2);
        break;
      case 10:
        str4 = zza.zzo(paramParcel, i2);
        break;
      case 11:
        localzzhy = (zzhy)zza.zza(paramParcel, i2, zzhy.CREATOR);
        break;
      case 12:
        localBundle2 = zza.zzq(paramParcel, i2);
        break;
      case 13:
        k = zza.zzg(paramParcel, i2);
        break;
      case 14:
        localArrayList = zza.zzC(paramParcel, i2);
        break;
      case 15:
        localBundle3 = zza.zzq(paramParcel, i2);
        break;
      case 17:
        localMessenger = (Messenger)zza.zza(paramParcel, i2, Messenger.CREATOR);
        break;
      case 16:
        bool1 = zza.zzc(paramParcel, i2);
        break;
      case 19:
        n = zza.zzg(paramParcel, i2);
        break;
      case 18:
        m = zza.zzg(paramParcel, i2);
        break;
      case 21:
        str5 = zza.zzo(paramParcel, i2);
        break;
      case 20:
        f = zza.zzl(paramParcel, i2);
        break;
      case 23:
        i1 = zza.zzg(paramParcel, i2);
        break;
      case 22:
        bool2 = zza.zzc(paramParcel, i2);
        break;
      case 25:
        l = zza.zzi(paramParcel, i2);
        break;
      case 24:
        str6 = zza.zzo(paramParcel, i2);
        break;
      case 26:
        str7 = zza.zzo(paramParcel, i2);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzgo(j, localBundle1, localzzax, localzzba, str1, localApplicationInfo, localPackageInfo, str2, str3, str4, localzzhy, localBundle2, k, localArrayList, localBundle3, bool1, localMessenger, m, n, f, str5, bool2, i1, str6, l, str7);
  }

  public zzgo[] zzv(int paramInt)
  {
    return new zzgo[paramInt];
  }
}