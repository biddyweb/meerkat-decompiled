package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.identity.intents.model.UserAddress;

public class zzl
  implements Parcelable.Creator<MaskedWallet>
{
  static void zza(MaskedWallet paramMaskedWallet, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramMaskedWallet.getVersionCode());
    zzb.zza(paramParcel, 2, paramMaskedWallet.zzaCY, false);
    zzb.zza(paramParcel, 3, paramMaskedWallet.zzaCZ, false);
    zzb.zza(paramParcel, 4, paramMaskedWallet.zzaDe, false);
    zzb.zza(paramParcel, 5, paramMaskedWallet.zzaDb, false);
    zzb.zza(paramParcel, 6, paramMaskedWallet.zzaDc, paramInt, false);
    zzb.zza(paramParcel, 7, paramMaskedWallet.zzaDd, paramInt, false);
    zzb.zza(paramParcel, 8, paramMaskedWallet.zzaDQ, paramInt, false);
    zzb.zza(paramParcel, 9, paramMaskedWallet.zzaDR, paramInt, false);
    zzb.zza(paramParcel, 10, paramMaskedWallet.zzaDf, paramInt, false);
    zzb.zza(paramParcel, 11, paramMaskedWallet.zzaDg, paramInt, false);
    zzb.zza(paramParcel, 12, paramMaskedWallet.zzaDh, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public MaskedWallet zzeY(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    String[] arrayOfString = null;
    String str3 = null;
    Address localAddress1 = null;
    Address localAddress2 = null;
    LoyaltyWalletObject[] arrayOfLoyaltyWalletObject = null;
    OfferWalletObject[] arrayOfOfferWalletObject = null;
    UserAddress localUserAddress1 = null;
    UserAddress localUserAddress2 = null;
    InstrumentInfo[] arrayOfInstrumentInfo = null;
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
        str1 = zza.zzo(paramParcel, k);
        break;
      case 3:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 4:
        arrayOfString = zza.zzA(paramParcel, k);
        break;
      case 5:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 6:
        localAddress1 = (Address)zza.zza(paramParcel, k, Address.CREATOR);
        break;
      case 7:
        localAddress2 = (Address)zza.zza(paramParcel, k, Address.CREATOR);
        break;
      case 8:
        arrayOfLoyaltyWalletObject = (LoyaltyWalletObject[])zza.zzb(paramParcel, k, LoyaltyWalletObject.CREATOR);
        break;
      case 9:
        arrayOfOfferWalletObject = (OfferWalletObject[])zza.zzb(paramParcel, k, OfferWalletObject.CREATOR);
        break;
      case 10:
        localUserAddress1 = (UserAddress)zza.zza(paramParcel, k, UserAddress.CREATOR);
        break;
      case 11:
        localUserAddress2 = (UserAddress)zza.zza(paramParcel, k, UserAddress.CREATOR);
        break;
      case 12:
        arrayOfInstrumentInfo = (InstrumentInfo[])zza.zzb(paramParcel, k, InstrumentInfo.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new MaskedWallet(j, str1, str2, arrayOfString, str3, localAddress1, localAddress2, arrayOfLoyaltyWalletObject, arrayOfOfferWalletObject, localUserAddress1, localUserAddress2, arrayOfInstrumentInfo);
  }

  public MaskedWallet[] zzhv(int paramInt)
  {
    return new MaskedWallet[paramInt];
  }
}