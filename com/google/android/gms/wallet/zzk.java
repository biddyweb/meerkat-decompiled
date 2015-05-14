package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.internal.zzls;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.wallet.wobs.zzd;
import com.google.android.gms.wallet.wobs.zzf;
import com.google.android.gms.wallet.wobs.zzj;
import com.google.android.gms.wallet.wobs.zzl;
import com.google.android.gms.wallet.wobs.zzn;
import com.google.android.gms.wallet.wobs.zzp;
import java.util.ArrayList;

public class zzk
  implements Parcelable.Creator<LoyaltyWalletObject>
{
  static void zza(LoyaltyWalletObject paramLoyaltyWalletObject, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramLoyaltyWalletObject.getVersionCode());
    zzb.zza(paramParcel, 2, paramLoyaltyWalletObject.zzfl, false);
    zzb.zza(paramParcel, 3, paramLoyaltyWalletObject.zzaDx, false);
    zzb.zza(paramParcel, 4, paramLoyaltyWalletObject.zzaDy, false);
    zzb.zza(paramParcel, 5, paramLoyaltyWalletObject.zzaDz, false);
    zzb.zza(paramParcel, 6, paramLoyaltyWalletObject.zzapd, false);
    zzb.zza(paramParcel, 7, paramLoyaltyWalletObject.zzaDA, false);
    zzb.zza(paramParcel, 8, paramLoyaltyWalletObject.zzaDB, false);
    zzb.zza(paramParcel, 9, paramLoyaltyWalletObject.zzaDC, false);
    zzb.zza(paramParcel, 10, paramLoyaltyWalletObject.zzaDD, false);
    zzb.zza(paramParcel, 11, paramLoyaltyWalletObject.zzaDE, false);
    zzb.zzc(paramParcel, 12, paramLoyaltyWalletObject.state);
    zzb.zzc(paramParcel, 13, paramLoyaltyWalletObject.zzaDF, false);
    zzb.zza(paramParcel, 14, paramLoyaltyWalletObject.zzaDG, paramInt, false);
    zzb.zzc(paramParcel, 15, paramLoyaltyWalletObject.zzaDH, false);
    zzb.zza(paramParcel, 17, paramLoyaltyWalletObject.zzaDJ, false);
    zzb.zza(paramParcel, 16, paramLoyaltyWalletObject.zzaDI, false);
    zzb.zza(paramParcel, 19, paramLoyaltyWalletObject.zzaDL);
    zzb.zzc(paramParcel, 18, paramLoyaltyWalletObject.zzaDK, false);
    zzb.zzc(paramParcel, 21, paramLoyaltyWalletObject.zzaDN, false);
    zzb.zzc(paramParcel, 20, paramLoyaltyWalletObject.zzaDM, false);
    zzb.zza(paramParcel, 23, paramLoyaltyWalletObject.zzaDP, paramInt, false);
    zzb.zzc(paramParcel, 22, paramLoyaltyWalletObject.zzaDO, false);
    zzb.zzH(paramParcel, i);
  }

  public LoyaltyWalletObject zzeX(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    String str6 = null;
    String str7 = null;
    String str8 = null;
    String str9 = null;
    String str10 = null;
    int k = 0;
    ArrayList localArrayList1 = zzls.zzkb();
    zzl localzzl = null;
    ArrayList localArrayList2 = zzls.zzkb();
    String str11 = null;
    String str12 = null;
    ArrayList localArrayList3 = zzls.zzkb();
    boolean bool = false;
    ArrayList localArrayList4 = zzls.zzkb();
    ArrayList localArrayList5 = zzls.zzkb();
    ArrayList localArrayList6 = zzls.zzkb();
    zzf localzzf = null;
    while (paramParcel.dataPosition() < i)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        j = zza.zzg(paramParcel, m);
        break;
      case 2:
        str1 = zza.zzo(paramParcel, m);
        break;
      case 3:
        str2 = zza.zzo(paramParcel, m);
        break;
      case 4:
        str3 = zza.zzo(paramParcel, m);
        break;
      case 5:
        str4 = zza.zzo(paramParcel, m);
        break;
      case 6:
        str5 = zza.zzo(paramParcel, m);
        break;
      case 7:
        str6 = zza.zzo(paramParcel, m);
        break;
      case 8:
        str7 = zza.zzo(paramParcel, m);
        break;
      case 9:
        str8 = zza.zzo(paramParcel, m);
        break;
      case 10:
        str9 = zza.zzo(paramParcel, m);
        break;
      case 11:
        str10 = zza.zzo(paramParcel, m);
        break;
      case 12:
        k = zza.zzg(paramParcel, m);
        break;
      case 13:
        localArrayList1 = zza.zzc(paramParcel, m, zzp.CREATOR);
        break;
      case 14:
        localzzl = (zzl)zza.zza(paramParcel, m, zzl.CREATOR);
        break;
      case 15:
        localArrayList2 = zza.zzc(paramParcel, m, LatLng.CREATOR);
        break;
      case 17:
        str12 = zza.zzo(paramParcel, m);
        break;
      case 16:
        str11 = zza.zzo(paramParcel, m);
        break;
      case 19:
        bool = zza.zzc(paramParcel, m);
        break;
      case 18:
        localArrayList3 = zza.zzc(paramParcel, m, zzd.CREATOR);
        break;
      case 21:
        localArrayList5 = zza.zzc(paramParcel, m, zzj.CREATOR);
        break;
      case 20:
        localArrayList4 = zza.zzc(paramParcel, m, zzn.CREATOR);
        break;
      case 23:
        localzzf = (zzf)zza.zza(paramParcel, m, zzf.CREATOR);
        break;
      case 22:
        localArrayList6 = zza.zzc(paramParcel, m, zzn.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new LoyaltyWalletObject(j, str1, str2, str3, str4, str5, str6, str7, str8, str9, str10, k, localArrayList1, localzzl, localArrayList2, str11, str12, localArrayList3, bool, localArrayList4, localArrayList5, localArrayList6, localzzf);
  }

  public LoyaltyWalletObject[] zzhu(int paramInt)
  {
    return new LoyaltyWalletObject[paramInt];
  }
}