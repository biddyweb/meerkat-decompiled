package com.google.android.gms.internal;

import android.location.Location;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzay
  implements Parcelable.Creator<zzax>
{
  static void zza(zzax paramzzax, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzax.versionCode);
    zzb.zza(paramParcel, 2, paramzzax.zzoL);
    zzb.zza(paramParcel, 3, paramzzax.extras, false);
    zzb.zzc(paramParcel, 4, paramzzax.zzoM);
    zzb.zzb(paramParcel, 5, paramzzax.zzoN, false);
    zzb.zza(paramParcel, 6, paramzzax.zzoO);
    zzb.zzc(paramParcel, 7, paramzzax.zzoP);
    zzb.zza(paramParcel, 8, paramzzax.zzoQ);
    zzb.zza(paramParcel, 9, paramzzax.zzoR, false);
    zzb.zza(paramParcel, 10, paramzzax.zzoS, paramInt, false);
    zzb.zza(paramParcel, 11, paramzzax.zzoT, paramInt, false);
    zzb.zza(paramParcel, 12, paramzzax.zzoU, false);
    zzb.zza(paramParcel, 13, paramzzax.zzoV, false);
    zzb.zza(paramParcel, 14, paramzzax.zzoW, false);
    zzb.zzb(paramParcel, 15, paramzzax.zzoX, false);
    zzb.zza(paramParcel, 16, paramzzax.zzoY, false);
    zzb.zzH(paramParcel, i);
  }

  public zzax zzb(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    long l = 0L;
    Bundle localBundle1 = null;
    int k = 0;
    ArrayList localArrayList1 = null;
    boolean bool1 = false;
    int m = 0;
    boolean bool2 = false;
    String str1 = null;
    zzbs localzzbs = null;
    Location localLocation = null;
    String str2 = null;
    Bundle localBundle2 = null;
    Bundle localBundle3 = null;
    ArrayList localArrayList2 = null;
    String str3 = null;
    while (paramParcel.dataPosition() < i)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        j = zza.zzg(paramParcel, n);
        break;
      case 2:
        l = zza.zzi(paramParcel, n);
        break;
      case 3:
        localBundle1 = zza.zzq(paramParcel, n);
        break;
      case 4:
        k = zza.zzg(paramParcel, n);
        break;
      case 5:
        localArrayList1 = zza.zzC(paramParcel, n);
        break;
      case 6:
        bool1 = zza.zzc(paramParcel, n);
        break;
      case 7:
        m = zza.zzg(paramParcel, n);
        break;
      case 8:
        bool2 = zza.zzc(paramParcel, n);
        break;
      case 9:
        str1 = zza.zzo(paramParcel, n);
        break;
      case 10:
        localzzbs = (zzbs)zza.zza(paramParcel, n, zzbs.CREATOR);
        break;
      case 11:
        localLocation = (Location)zza.zza(paramParcel, n, Location.CREATOR);
        break;
      case 12:
        str2 = zza.zzo(paramParcel, n);
        break;
      case 13:
        localBundle2 = zza.zzq(paramParcel, n);
        break;
      case 14:
        localBundle3 = zza.zzq(paramParcel, n);
        break;
      case 15:
        localArrayList2 = zza.zzC(paramParcel, n);
        break;
      case 16:
        str3 = zza.zzo(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzax(j, l, localBundle1, k, localArrayList1, bool1, m, bool2, str1, localzzbs, localLocation, str2, localBundle2, localBundle3, localArrayList2, str3);
  }

  public zzax[] zzf(int paramInt)
  {
    return new zzax[paramInt];
  }
}