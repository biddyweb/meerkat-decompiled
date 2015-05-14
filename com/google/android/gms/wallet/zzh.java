package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.wallet.wobs.CommonWalletObject;

public class zzh
  implements Parcelable.Creator<GiftCardWalletObject>
{
  static void zza(GiftCardWalletObject paramGiftCardWalletObject, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramGiftCardWalletObject.getVersionCode());
    zzb.zza(paramParcel, 2, paramGiftCardWalletObject.zzaDk, paramInt, false);
    zzb.zza(paramParcel, 3, paramGiftCardWalletObject.zzaDl, false);
    zzb.zza(paramParcel, 4, paramGiftCardWalletObject.pin, false);
    zzb.zza(paramParcel, 5, paramGiftCardWalletObject.zzaDm, false);
    zzb.zza(paramParcel, 6, paramGiftCardWalletObject.zzaDn);
    zzb.zza(paramParcel, 7, paramGiftCardWalletObject.zzaDo, false);
    zzb.zza(paramParcel, 8, paramGiftCardWalletObject.zzaDp);
    zzb.zza(paramParcel, 9, paramGiftCardWalletObject.zzaDq, false);
    zzb.zzH(paramParcel, i);
  }

  public GiftCardWalletObject zzeU(Parcel paramParcel)
  {
    long l1 = 0L;
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str2 = null;
    long l2 = l1;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    CommonWalletObject localCommonWalletObject = null;
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
        localCommonWalletObject = (CommonWalletObject)zza.zza(paramParcel, k, CommonWalletObject.CREATOR);
        break;
      case 3:
        str5 = zza.zzo(paramParcel, k);
        break;
      case 4:
        str4 = zza.zzo(paramParcel, k);
        break;
      case 5:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 6:
        l2 = zza.zzi(paramParcel, k);
        break;
      case 7:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 8:
        l1 = zza.zzi(paramParcel, k);
        break;
      case 9:
        str1 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new GiftCardWalletObject(j, localCommonWalletObject, str5, str4, str3, l2, str2, l1, str1);
  }

  public GiftCardWalletObject[] zzhr(int paramInt)
  {
    return new GiftCardWalletObject[paramInt];
  }
}