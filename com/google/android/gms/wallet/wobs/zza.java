package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.internal.zzls;
import com.google.android.gms.maps.model.LatLng;
import java.util.ArrayList;

public class zza
  implements Parcelable.Creator<CommonWalletObject>
{
  static void zza(CommonWalletObject paramCommonWalletObject, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramCommonWalletObject.getVersionCode());
    zzb.zza(paramParcel, 2, paramCommonWalletObject.zzfl, false);
    zzb.zza(paramParcel, 3, paramCommonWalletObject.zzaDE, false);
    zzb.zza(paramParcel, 4, paramCommonWalletObject.name, false);
    zzb.zza(paramParcel, 5, paramCommonWalletObject.zzaDy, false);
    zzb.zza(paramParcel, 6, paramCommonWalletObject.zzaDA, false);
    zzb.zza(paramParcel, 7, paramCommonWalletObject.zzaDB, false);
    zzb.zza(paramParcel, 8, paramCommonWalletObject.zzaDC, false);
    zzb.zza(paramParcel, 9, paramCommonWalletObject.zzaDD, false);
    zzb.zzc(paramParcel, 10, paramCommonWalletObject.state);
    zzb.zzc(paramParcel, 11, paramCommonWalletObject.zzaDF, false);
    zzb.zza(paramParcel, 12, paramCommonWalletObject.zzaDG, paramInt, false);
    zzb.zzc(paramParcel, 13, paramCommonWalletObject.zzaDH, false);
    zzb.zza(paramParcel, 14, paramCommonWalletObject.zzaDI, false);
    zzb.zza(paramParcel, 15, paramCommonWalletObject.zzaDJ, false);
    zzb.zza(paramParcel, 17, paramCommonWalletObject.zzaDL);
    zzb.zzc(paramParcel, 16, paramCommonWalletObject.zzaDK, false);
    zzb.zzc(paramParcel, 19, paramCommonWalletObject.zzaDN, false);
    zzb.zzc(paramParcel, 18, paramCommonWalletObject.zzaDM, false);
    zzb.zzc(paramParcel, 20, paramCommonWalletObject.zzaDO, false);
    zzb.zzH(paramParcel, i);
  }

  public CommonWalletObject zzfi(Parcel paramParcel)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    String str6 = null;
    String str7 = null;
    String str8 = null;
    int k = 0;
    ArrayList localArrayList1 = zzls.zzkb();
    zzl localzzl = null;
    ArrayList localArrayList2 = zzls.zzkb();
    String str9 = null;
    String str10 = null;
    ArrayList localArrayList3 = zzls.zzkb();
    boolean bool = false;
    ArrayList localArrayList4 = zzls.zzkb();
    ArrayList localArrayList5 = zzls.zzkb();
    ArrayList localArrayList6 = zzls.zzkb();
    while (paramParcel.dataPosition() < i)
    {
      int m = com.google.android.gms.common.internal.safeparcel.zza.zzI(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzaP(m))
      {
      default:
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, m);
        break;
      case 1:
        j = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
        break;
      case 2:
        str1 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 3:
        str2 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 4:
        str3 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 5:
        str4 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 6:
        str5 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 7:
        str6 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 8:
        str7 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 9:
        str8 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 10:
        k = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
        break;
      case 11:
        localArrayList1 = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, m, zzp.CREATOR);
        break;
      case 12:
        localzzl = (zzl)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, m, zzl.CREATOR);
        break;
      case 13:
        localArrayList2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, m, LatLng.CREATOR);
        break;
      case 14:
        str9 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 15:
        str10 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 17:
        bool = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, m);
        break;
      case 16:
        localArrayList3 = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, m, zzd.CREATOR);
        break;
      case 19:
        localArrayList5 = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, m, zzj.CREATOR);
        break;
      case 18:
        localArrayList4 = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, m, zzn.CREATOR);
        break;
      case 20:
        localArrayList6 = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, m, zzn.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new CommonWalletObject(j, str1, str2, str3, str4, str5, str6, str7, str8, k, localArrayList1, localzzl, localArrayList2, str9, str10, localArrayList3, bool, localArrayList4, localArrayList5, localArrayList6);
  }

  public CommonWalletObject[] zzhI(int paramInt)
  {
    return new CommonWalletObject[paramInt];
  }
}