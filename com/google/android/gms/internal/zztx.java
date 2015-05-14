package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class zztx
  implements Parcelable.Creator<zztw>
{
  static void zza(zztw paramzztw, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    Set localSet = paramzztw.zzauX;
    if (localSet.contains(Integer.valueOf(1)))
      zzb.zzc(paramParcel, 1, paramzztw.zzFG);
    if (localSet.contains(Integer.valueOf(2)))
      zzb.zza(paramParcel, 2, paramzztw.zzavV, true);
    if (localSet.contains(Integer.valueOf(3)))
      zzb.zza(paramParcel, 3, paramzztw.zzavW, paramInt, true);
    if (localSet.contains(Integer.valueOf(4)))
      zzb.zza(paramParcel, 4, paramzztw.zzavX, true);
    if (localSet.contains(Integer.valueOf(5)))
      zzb.zza(paramParcel, 5, paramzztw.zzavY, true);
    if (localSet.contains(Integer.valueOf(6)))
      zzb.zzc(paramParcel, 6, paramzztw.zzavZ);
    if (localSet.contains(Integer.valueOf(7)))
      zzb.zza(paramParcel, 7, paramzztw.zzawa, paramInt, true);
    if (localSet.contains(Integer.valueOf(8)))
      zzb.zza(paramParcel, 8, paramzztw.zzawb, true);
    if (localSet.contains(Integer.valueOf(9)))
      zzb.zza(paramParcel, 9, paramzztw.zzSJ, true);
    if (localSet.contains(Integer.valueOf(12)))
      zzb.zzc(paramParcel, 12, paramzztw.zzpo);
    if (localSet.contains(Integer.valueOf(14)))
      zzb.zza(paramParcel, 14, paramzztw.zzFA, true);
    if (localSet.contains(Integer.valueOf(15)))
      zzb.zza(paramParcel, 15, paramzztw.zzawc, paramInt, true);
    if (localSet.contains(Integer.valueOf(16)))
      zzb.zza(paramParcel, 16, paramzztw.zzawd);
    if (localSet.contains(Integer.valueOf(19)))
      zzb.zza(paramParcel, 19, paramzztw.zzawe, paramInt, true);
    if (localSet.contains(Integer.valueOf(18)))
      zzb.zza(paramParcel, 18, paramzztw.zzIO, true);
    if (localSet.contains(Integer.valueOf(21)))
      zzb.zzc(paramParcel, 21, paramzztw.zzawg);
    if (localSet.contains(Integer.valueOf(20)))
      zzb.zza(paramParcel, 20, paramzztw.zzawf, true);
    if (localSet.contains(Integer.valueOf(23)))
      zzb.zzc(paramParcel, 23, paramzztw.zzawi, true);
    if (localSet.contains(Integer.valueOf(22)))
      zzb.zzc(paramParcel, 22, paramzztw.zzawh, true);
    if (localSet.contains(Integer.valueOf(25)))
      zzb.zzc(paramParcel, 25, paramzztw.zzawk);
    if (localSet.contains(Integer.valueOf(24)))
      zzb.zzc(paramParcel, 24, paramzztw.zzawj);
    if (localSet.contains(Integer.valueOf(27)))
      zzb.zza(paramParcel, 27, paramzztw.zzxX, true);
    if (localSet.contains(Integer.valueOf(26)))
      zzb.zza(paramParcel, 26, paramzztw.zzawl, true);
    if (localSet.contains(Integer.valueOf(29)))
      zzb.zza(paramParcel, 29, paramzztw.zzawn);
    if (localSet.contains(Integer.valueOf(28)))
      zzb.zzc(paramParcel, 28, paramzztw.zzawm, true);
    zzb.zzH(paramParcel, i);
  }

  public zztw zzeB(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    HashSet localHashSet = new HashSet();
    int j = 0;
    String str1 = null;
    Object localObject1 = null;
    String str2 = null;
    String str3 = null;
    int k = 0;
    Object localObject2 = null;
    String str4 = null;
    String str5 = null;
    int m = 0;
    String str6 = null;
    Object localObject3 = null;
    boolean bool1 = false;
    String str7 = null;
    Object localObject4 = null;
    String str8 = null;
    int n = 0;
    ArrayList localArrayList1 = null;
    ArrayList localArrayList2 = null;
    int i1 = 0;
    int i2 = 0;
    String str9 = null;
    String str10 = null;
    ArrayList localArrayList3 = null;
    boolean bool2 = false;
    while (paramParcel.dataPosition() < i)
    {
      int i3 = zza.zzI(paramParcel);
      switch (zza.zzaP(i3))
      {
      case 10:
      case 11:
      case 13:
      case 17:
      default:
        zza.zzb(paramParcel, i3);
        break;
      case 1:
        j = zza.zzg(paramParcel, i3);
        localHashSet.add(Integer.valueOf(1));
        break;
      case 2:
        str1 = zza.zzo(paramParcel, i3);
        localHashSet.add(Integer.valueOf(2));
        break;
      case 3:
        zztw.zza localzza = (zztw.zza)zza.zza(paramParcel, i3, zztw.zza.CREATOR);
        localHashSet.add(Integer.valueOf(3));
        localObject1 = localzza;
        break;
      case 4:
        str2 = zza.zzo(paramParcel, i3);
        localHashSet.add(Integer.valueOf(4));
        break;
      case 5:
        str3 = zza.zzo(paramParcel, i3);
        localHashSet.add(Integer.valueOf(5));
        break;
      case 6:
        k = zza.zzg(paramParcel, i3);
        localHashSet.add(Integer.valueOf(6));
        break;
      case 7:
        zztw.zzb localzzb = (zztw.zzb)zza.zza(paramParcel, i3, zztw.zzb.CREATOR);
        localHashSet.add(Integer.valueOf(7));
        localObject2 = localzzb;
        break;
      case 8:
        str4 = zza.zzo(paramParcel, i3);
        localHashSet.add(Integer.valueOf(8));
        break;
      case 9:
        str5 = zza.zzo(paramParcel, i3);
        localHashSet.add(Integer.valueOf(9));
        break;
      case 12:
        m = zza.zzg(paramParcel, i3);
        localHashSet.add(Integer.valueOf(12));
        break;
      case 14:
        str6 = zza.zzo(paramParcel, i3);
        localHashSet.add(Integer.valueOf(14));
        break;
      case 15:
        zztw.zzc localzzc = (zztw.zzc)zza.zza(paramParcel, i3, zztw.zzc.CREATOR);
        localHashSet.add(Integer.valueOf(15));
        localObject3 = localzzc;
        break;
      case 16:
        bool1 = zza.zzc(paramParcel, i3);
        localHashSet.add(Integer.valueOf(16));
        break;
      case 19:
        zztw.zzd localzzd = (zztw.zzd)zza.zza(paramParcel, i3, zztw.zzd.CREATOR);
        localHashSet.add(Integer.valueOf(19));
        localObject4 = localzzd;
        break;
      case 18:
        str7 = zza.zzo(paramParcel, i3);
        localHashSet.add(Integer.valueOf(18));
        break;
      case 21:
        n = zza.zzg(paramParcel, i3);
        localHashSet.add(Integer.valueOf(21));
        break;
      case 20:
        str8 = zza.zzo(paramParcel, i3);
        localHashSet.add(Integer.valueOf(20));
        break;
      case 23:
        localArrayList2 = zza.zzc(paramParcel, i3, zztw.zzg.CREATOR);
        localHashSet.add(Integer.valueOf(23));
        break;
      case 22:
        localArrayList1 = zza.zzc(paramParcel, i3, zztw.zzf.CREATOR);
        localHashSet.add(Integer.valueOf(22));
        break;
      case 25:
        i2 = zza.zzg(paramParcel, i3);
        localHashSet.add(Integer.valueOf(25));
        break;
      case 24:
        i1 = zza.zzg(paramParcel, i3);
        localHashSet.add(Integer.valueOf(24));
        break;
      case 27:
        str10 = zza.zzo(paramParcel, i3);
        localHashSet.add(Integer.valueOf(27));
        break;
      case 26:
        str9 = zza.zzo(paramParcel, i3);
        localHashSet.add(Integer.valueOf(26));
        break;
      case 29:
        bool2 = zza.zzc(paramParcel, i3);
        localHashSet.add(Integer.valueOf(29));
        break;
      case 28:
        localArrayList3 = zza.zzc(paramParcel, i3, zztw.zzh.CREATOR);
        localHashSet.add(Integer.valueOf(28));
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zztw(localHashSet, j, str1, localObject1, str2, str3, k, localObject2, str4, str5, m, str6, localObject3, bool1, str7, localObject4, str8, n, localArrayList1, localArrayList2, i1, i2, str9, str10, localArrayList3, bool2);
  }

  public zztw[] zzgO(int paramInt)
  {
    return new zztw[paramInt];
  }
}