package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class zzts
  implements Parcelable.Creator<zztr>
{
  static void zza(zztr paramzztr, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    Set localSet = paramzztr.zzauX;
    if (localSet.contains(Integer.valueOf(1)))
      zzb.zzc(paramParcel, 1, paramzztr.zzFG);
    if (localSet.contains(Integer.valueOf(2)))
      zzb.zza(paramParcel, 2, paramzztr.zzauY, paramInt, true);
    if (localSet.contains(Integer.valueOf(3)))
      zzb.zzb(paramParcel, 3, paramzztr.zzauZ, true);
    if (localSet.contains(Integer.valueOf(4)))
      zzb.zza(paramParcel, 4, paramzztr.zzava, paramInt, true);
    if (localSet.contains(Integer.valueOf(5)))
      zzb.zza(paramParcel, 5, paramzztr.zzavb, true);
    if (localSet.contains(Integer.valueOf(6)))
      zzb.zza(paramParcel, 6, paramzztr.zzavc, true);
    if (localSet.contains(Integer.valueOf(7)))
      zzb.zza(paramParcel, 7, paramzztr.zzavd, true);
    if (localSet.contains(Integer.valueOf(8)))
      zzb.zzc(paramParcel, 8, paramzztr.zzave, true);
    if (localSet.contains(Integer.valueOf(9)))
      zzb.zzc(paramParcel, 9, paramzztr.zzavf);
    if (localSet.contains(Integer.valueOf(10)))
      zzb.zzc(paramParcel, 10, paramzztr.zzavg, true);
    if (localSet.contains(Integer.valueOf(11)))
      zzb.zza(paramParcel, 11, paramzztr.zzavh, paramInt, true);
    if (localSet.contains(Integer.valueOf(12)))
      zzb.zzc(paramParcel, 12, paramzztr.zzavi, true);
    if (localSet.contains(Integer.valueOf(13)))
      zzb.zza(paramParcel, 13, paramzztr.zzavj, true);
    if (localSet.contains(Integer.valueOf(14)))
      zzb.zza(paramParcel, 14, paramzztr.zzavk, true);
    if (localSet.contains(Integer.valueOf(15)))
      zzb.zza(paramParcel, 15, paramzztr.zzavl, paramInt, true);
    if (localSet.contains(Integer.valueOf(17)))
      zzb.zza(paramParcel, 17, paramzztr.zzavn, true);
    if (localSet.contains(Integer.valueOf(16)))
      zzb.zza(paramParcel, 16, paramzztr.zzavm, true);
    if (localSet.contains(Integer.valueOf(19)))
      zzb.zzc(paramParcel, 19, paramzztr.zzavo, true);
    if (localSet.contains(Integer.valueOf(18)))
      zzb.zza(paramParcel, 18, paramzztr.zzpn, true);
    if (localSet.contains(Integer.valueOf(21)))
      zzb.zza(paramParcel, 21, paramzztr.zzavq, true);
    if (localSet.contains(Integer.valueOf(20)))
      zzb.zza(paramParcel, 20, paramzztr.zzavp, true);
    if (localSet.contains(Integer.valueOf(23)))
      zzb.zza(paramParcel, 23, paramzztr.zzZO, true);
    if (localSet.contains(Integer.valueOf(22)))
      zzb.zza(paramParcel, 22, paramzztr.zzavr, true);
    if (localSet.contains(Integer.valueOf(25)))
      zzb.zza(paramParcel, 25, paramzztr.zzavt, true);
    if (localSet.contains(Integer.valueOf(24)))
      zzb.zza(paramParcel, 24, paramzztr.zzavs, true);
    if (localSet.contains(Integer.valueOf(27)))
      zzb.zza(paramParcel, 27, paramzztr.zzavv, true);
    if (localSet.contains(Integer.valueOf(26)))
      zzb.zza(paramParcel, 26, paramzztr.zzavu, true);
    if (localSet.contains(Integer.valueOf(29)))
      zzb.zza(paramParcel, 29, paramzztr.zzavx, paramInt, true);
    if (localSet.contains(Integer.valueOf(28)))
      zzb.zza(paramParcel, 28, paramzztr.zzavw, true);
    if (localSet.contains(Integer.valueOf(31)))
      zzb.zza(paramParcel, 31, paramzztr.zzavz, true);
    if (localSet.contains(Integer.valueOf(30)))
      zzb.zza(paramParcel, 30, paramzztr.zzavy, true);
    if (localSet.contains(Integer.valueOf(34)))
      zzb.zza(paramParcel, 34, paramzztr.zzavB, paramInt, true);
    if (localSet.contains(Integer.valueOf(32)))
      zzb.zza(paramParcel, 32, paramzztr.zzFA, true);
    if (localSet.contains(Integer.valueOf(33)))
      zzb.zza(paramParcel, 33, paramzztr.zzavA, true);
    if (localSet.contains(Integer.valueOf(38)))
      zzb.zza(paramParcel, 38, paramzztr.zzalR);
    if (localSet.contains(Integer.valueOf(39)))
      zzb.zza(paramParcel, 39, paramzztr.mName, true);
    if (localSet.contains(Integer.valueOf(36)))
      zzb.zza(paramParcel, 36, paramzztr.zzalQ);
    if (localSet.contains(Integer.valueOf(37)))
      zzb.zza(paramParcel, 37, paramzztr.zzavC, paramInt, true);
    if (localSet.contains(Integer.valueOf(42)))
      zzb.zza(paramParcel, 42, paramzztr.zzavF, true);
    if (localSet.contains(Integer.valueOf(43)))
      zzb.zza(paramParcel, 43, paramzztr.zzavG, true);
    if (localSet.contains(Integer.valueOf(40)))
      zzb.zza(paramParcel, 40, paramzztr.zzavD, paramInt, true);
    if (localSet.contains(Integer.valueOf(41)))
      zzb.zzc(paramParcel, 41, paramzztr.zzavE, true);
    if (localSet.contains(Integer.valueOf(46)))
      zzb.zza(paramParcel, 46, paramzztr.zzavJ, paramInt, true);
    if (localSet.contains(Integer.valueOf(47)))
      zzb.zza(paramParcel, 47, paramzztr.zzavK, true);
    if (localSet.contains(Integer.valueOf(44)))
      zzb.zza(paramParcel, 44, paramzztr.zzavH, true);
    if (localSet.contains(Integer.valueOf(45)))
      zzb.zza(paramParcel, 45, paramzztr.zzavI, true);
    if (localSet.contains(Integer.valueOf(51)))
      zzb.zza(paramParcel, 51, paramzztr.zzavO, true);
    if (localSet.contains(Integer.valueOf(50)))
      zzb.zza(paramParcel, 50, paramzztr.zzavN, paramInt, true);
    if (localSet.contains(Integer.valueOf(49)))
      zzb.zza(paramParcel, 49, paramzztr.zzavM, true);
    if (localSet.contains(Integer.valueOf(48)))
      zzb.zza(paramParcel, 48, paramzztr.zzavL, true);
    if (localSet.contains(Integer.valueOf(55)))
      zzb.zza(paramParcel, 55, paramzztr.zzavQ, true);
    if (localSet.contains(Integer.valueOf(54)))
      zzb.zza(paramParcel, 54, paramzztr.zzxX, true);
    if (localSet.contains(Integer.valueOf(53)))
      zzb.zza(paramParcel, 53, paramzztr.zzxV, true);
    if (localSet.contains(Integer.valueOf(52)))
      zzb.zza(paramParcel, 52, paramzztr.zzavP, true);
    if (localSet.contains(Integer.valueOf(56)))
      zzb.zza(paramParcel, 56, paramzztr.zzavR, true);
    zzb.zzH(paramParcel, i);
  }

  public zztr zzez(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    HashSet localHashSet = new HashSet();
    int j = 0;
    Object localObject1 = null;
    ArrayList localArrayList1 = null;
    Object localObject2 = null;
    String str1 = null;
    String str2 = null;
    String str3 = null;
    ArrayList localArrayList2 = null;
    int k = 0;
    ArrayList localArrayList3 = null;
    Object localObject3 = null;
    ArrayList localArrayList4 = null;
    String str4 = null;
    String str5 = null;
    Object localObject4 = null;
    String str6 = null;
    String str7 = null;
    String str8 = null;
    ArrayList localArrayList5 = null;
    String str9 = null;
    String str10 = null;
    String str11 = null;
    String str12 = null;
    String str13 = null;
    String str14 = null;
    String str15 = null;
    String str16 = null;
    String str17 = null;
    Object localObject5 = null;
    String str18 = null;
    String str19 = null;
    String str20 = null;
    String str21 = null;
    Object localObject6 = null;
    double d1 = 0.0D;
    Object localObject7 = null;
    double d2 = 0.0D;
    String str22 = null;
    Object localObject8 = null;
    ArrayList localArrayList6 = null;
    String str23 = null;
    String str24 = null;
    String str25 = null;
    String str26 = null;
    Object localObject9 = null;
    String str27 = null;
    String str28 = null;
    String str29 = null;
    Object localObject10 = null;
    String str30 = null;
    String str31 = null;
    String str32 = null;
    String str33 = null;
    String str34 = null;
    String str35 = null;
    while (paramParcel.dataPosition() < i)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      case 35:
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        j = zza.zzg(paramParcel, m);
        localHashSet.add(Integer.valueOf(1));
        break;
      case 2:
        zztr localzztr10 = (zztr)zza.zza(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(2));
        localObject1 = localzztr10;
        break;
      case 3:
        localArrayList1 = zza.zzC(paramParcel, m);
        localHashSet.add(Integer.valueOf(3));
        break;
      case 4:
        zztr localzztr9 = (zztr)zza.zza(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(4));
        localObject2 = localzztr9;
        break;
      case 5:
        str1 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(5));
        break;
      case 6:
        str2 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(6));
        break;
      case 7:
        str3 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(7));
        break;
      case 8:
        localArrayList2 = zza.zzc(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(8));
        break;
      case 9:
        k = zza.zzg(paramParcel, m);
        localHashSet.add(Integer.valueOf(9));
        break;
      case 10:
        localArrayList3 = zza.zzc(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(10));
        break;
      case 11:
        zztr localzztr8 = (zztr)zza.zza(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(11));
        localObject3 = localzztr8;
        break;
      case 12:
        localArrayList4 = zza.zzc(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(12));
        break;
      case 13:
        str4 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(13));
        break;
      case 14:
        str5 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(14));
        break;
      case 15:
        zztr localzztr7 = (zztr)zza.zza(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(15));
        localObject4 = localzztr7;
        break;
      case 17:
        str7 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(17));
        break;
      case 16:
        str6 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(16));
        break;
      case 19:
        localArrayList5 = zza.zzc(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(19));
        break;
      case 18:
        str8 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(18));
        break;
      case 21:
        str10 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(21));
        break;
      case 20:
        str9 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(20));
        break;
      case 23:
        str12 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(23));
        break;
      case 22:
        str11 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(22));
        break;
      case 25:
        str14 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(25));
        break;
      case 24:
        str13 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(24));
        break;
      case 27:
        str16 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(27));
        break;
      case 26:
        str15 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(26));
        break;
      case 29:
        zztr localzztr6 = (zztr)zza.zza(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(29));
        localObject5 = localzztr6;
        break;
      case 28:
        str17 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(28));
        break;
      case 31:
        str19 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(31));
        break;
      case 30:
        str18 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(30));
        break;
      case 34:
        zztr localzztr5 = (zztr)zza.zza(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(34));
        localObject6 = localzztr5;
        break;
      case 32:
        str20 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(32));
        break;
      case 33:
        str21 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(33));
        break;
      case 38:
        d2 = zza.zzm(paramParcel, m);
        localHashSet.add(Integer.valueOf(38));
        break;
      case 39:
        str22 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(39));
        break;
      case 36:
        d1 = zza.zzm(paramParcel, m);
        localHashSet.add(Integer.valueOf(36));
        break;
      case 37:
        zztr localzztr4 = (zztr)zza.zza(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(37));
        localObject7 = localzztr4;
        break;
      case 42:
        str23 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(42));
        break;
      case 43:
        str24 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(43));
        break;
      case 40:
        zztr localzztr3 = (zztr)zza.zza(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(40));
        localObject8 = localzztr3;
        break;
      case 41:
        localArrayList6 = zza.zzc(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(41));
        break;
      case 46:
        zztr localzztr2 = (zztr)zza.zza(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(46));
        localObject9 = localzztr2;
        break;
      case 47:
        str27 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(47));
        break;
      case 44:
        str25 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(44));
        break;
      case 45:
        str26 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(45));
        break;
      case 51:
        str30 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(51));
        break;
      case 50:
        zztr localzztr1 = (zztr)zza.zza(paramParcel, m, zztr.CREATOR);
        localHashSet.add(Integer.valueOf(50));
        localObject10 = localzztr1;
        break;
      case 49:
        str29 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(49));
        break;
      case 48:
        str28 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(48));
        break;
      case 55:
        str34 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(55));
        break;
      case 54:
        str33 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(54));
        break;
      case 53:
        str32 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(53));
        break;
      case 52:
        str31 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(52));
        break;
      case 56:
        str35 = zza.zzo(paramParcel, m);
        localHashSet.add(Integer.valueOf(56));
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zztr(localHashSet, j, localObject1, localArrayList1, localObject2, str1, str2, str3, localArrayList2, k, localArrayList3, localObject3, localArrayList4, str4, str5, localObject4, str6, str7, str8, localArrayList5, str9, str10, str11, str12, str13, str14, str15, str16, str17, localObject5, str18, str19, str20, str21, localObject6, d1, localObject7, d2, str22, localObject8, localArrayList6, str23, str24, str25, str26, localObject9, str27, str28, str29, localObject10, str30, str31, str32, str33, str34, str35);
  }

  public zztr[] zzgM(int paramInt)
  {
    return new zztr[paramInt];
  }
}