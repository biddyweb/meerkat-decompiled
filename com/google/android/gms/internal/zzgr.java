package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzgr
  implements Parcelable.Creator<zzgq>
{
  static void zza(zzgq paramzzgq, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzgq.versionCode);
    zzb.zza(paramParcel, 2, paramzzgq.zzus, false);
    zzb.zza(paramParcel, 3, paramzzgq.zzwG, false);
    zzb.zzb(paramParcel, 4, paramzzgq.zzst, false);
    zzb.zzc(paramParcel, 5, paramzzgq.errorCode);
    zzb.zzb(paramParcel, 6, paramzzgq.zzsu, false);
    zzb.zza(paramParcel, 7, paramzzgq.zzwH);
    zzb.zza(paramParcel, 8, paramzzgq.zzwI);
    zzb.zza(paramParcel, 9, paramzzgq.zzwJ);
    zzb.zzb(paramParcel, 10, paramzzgq.zzwK, false);
    zzb.zza(paramParcel, 11, paramzzgq.zzsx);
    zzb.zzc(paramParcel, 12, paramzzgq.orientation);
    zzb.zza(paramParcel, 13, paramzzgq.zzwL, false);
    zzb.zza(paramParcel, 14, paramzzgq.zzwM);
    zzb.zza(paramParcel, 15, paramzzgq.zzwN, false);
    zzb.zza(paramParcel, 19, paramzzgq.zzwP, false);
    zzb.zza(paramParcel, 18, paramzzgq.zzwO);
    zzb.zza(paramParcel, 21, paramzzgq.zzwQ, false);
    zzb.zza(paramParcel, 23, paramzzgq.zzwS);
    zzb.zza(paramParcel, 22, paramzzgq.zzwR);
    zzb.zza(paramParcel, 25, paramzzgq.zzwT);
    zzb.zza(paramParcel, 24, paramzzgq.zzwv);
    zzb.zza(paramParcel, 26, paramzzgq.zzwU);
    zzb.zzH(paramParcel, i);
  }

  public zzgq zzi(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    ArrayList localArrayList1 = null;
    int k = 0;
    ArrayList localArrayList2 = null;
    long l1 = 0L;
    boolean bool1 = false;
    long l2 = 0L;
    ArrayList localArrayList3 = null;
    long l3 = 0L;
    int m = 0;
    String str3 = null;
    long l4 = 0L;
    String str4 = null;
    boolean bool2 = false;
    String str5 = null;
    String str6 = null;
    boolean bool3 = false;
    boolean bool4 = false;
    boolean bool5 = false;
    boolean bool6 = false;
    boolean bool7 = false;
    while (paramParcel.dataPosition() < i)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      case 16:
      case 17:
      case 20:
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        j = zza.zzg(paramParcel, n);
        break;
      case 2:
        str1 = zza.zzo(paramParcel, n);
        break;
      case 3:
        str2 = zza.zzo(paramParcel, n);
        break;
      case 4:
        localArrayList1 = zza.zzC(paramParcel, n);
        break;
      case 5:
        k = zza.zzg(paramParcel, n);
        break;
      case 6:
        localArrayList2 = zza.zzC(paramParcel, n);
        break;
      case 7:
        l1 = zza.zzi(paramParcel, n);
        break;
      case 8:
        bool1 = zza.zzc(paramParcel, n);
        break;
      case 9:
        l2 = zza.zzi(paramParcel, n);
        break;
      case 10:
        localArrayList3 = zza.zzC(paramParcel, n);
        break;
      case 11:
        l3 = zza.zzi(paramParcel, n);
        break;
      case 12:
        m = zza.zzg(paramParcel, n);
        break;
      case 13:
        str3 = zza.zzo(paramParcel, n);
        break;
      case 14:
        l4 = zza.zzi(paramParcel, n);
        break;
      case 15:
        str4 = zza.zzo(paramParcel, n);
        break;
      case 19:
        str5 = zza.zzo(paramParcel, n);
        break;
      case 18:
        bool2 = zza.zzc(paramParcel, n);
        break;
      case 21:
        str6 = zza.zzo(paramParcel, n);
        break;
      case 23:
        bool4 = zza.zzc(paramParcel, n);
        break;
      case 22:
        bool3 = zza.zzc(paramParcel, n);
        break;
      case 25:
        bool6 = zza.zzc(paramParcel, n);
        break;
      case 24:
        bool5 = zza.zzc(paramParcel, n);
        break;
      case 26:
        bool7 = zza.zzc(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzgq(j, str1, str2, localArrayList1, k, localArrayList2, l1, bool1, l2, localArrayList3, l3, m, str3, l4, str4, bool2, str5, str6, bool3, bool4, bool5, bool6, bool7);
  }

  public zzgq[] zzw(int paramInt)
  {
    return new zzgq[paramInt];
  }
}