package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.identity.intents.model.UserAddress;

public class zzf
  implements Parcelable.Creator<FullWallet>
{
  static void zza(FullWallet paramFullWallet, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramFullWallet.getVersionCode());
    zzb.zza(paramParcel, 2, paramFullWallet.zzaCY, false);
    zzb.zza(paramParcel, 3, paramFullWallet.zzaCZ, false);
    zzb.zza(paramParcel, 4, paramFullWallet.zzaDa, paramInt, false);
    zzb.zza(paramParcel, 5, paramFullWallet.zzaDb, false);
    zzb.zza(paramParcel, 6, paramFullWallet.zzaDc, paramInt, false);
    zzb.zza(paramParcel, 7, paramFullWallet.zzaDd, paramInt, false);
    zzb.zza(paramParcel, 8, paramFullWallet.zzaDe, false);
    zzb.zza(paramParcel, 9, paramFullWallet.zzaDf, paramInt, false);
    zzb.zza(paramParcel, 10, paramFullWallet.zzaDg, paramInt, false);
    zzb.zza(paramParcel, 11, paramFullWallet.zzaDh, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public FullWallet zzeS(Parcel paramParcel)
  {
    InstrumentInfo[] arrayOfInstrumentInfo = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    UserAddress localUserAddress1 = null;
    UserAddress localUserAddress2 = null;
    String[] arrayOfString = null;
    Address localAddress1 = null;
    Address localAddress2 = null;
    String str1 = null;
    ProxyCard localProxyCard = null;
    String str2 = null;
    String str3 = null;
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
        str3 = zza.zzo(paramParcel, k);
        break;
      case 3:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 4:
        localProxyCard = (ProxyCard)zza.zza(paramParcel, k, ProxyCard.CREATOR);
        break;
      case 5:
        str1 = zza.zzo(paramParcel, k);
        break;
      case 6:
        localAddress2 = (Address)zza.zza(paramParcel, k, Address.CREATOR);
        break;
      case 7:
        localAddress1 = (Address)zza.zza(paramParcel, k, Address.CREATOR);
        break;
      case 8:
        arrayOfString = zza.zzA(paramParcel, k);
        break;
      case 9:
        localUserAddress2 = (UserAddress)zza.zza(paramParcel, k, UserAddress.CREATOR);
        break;
      case 10:
        localUserAddress1 = (UserAddress)zza.zza(paramParcel, k, UserAddress.CREATOR);
        break;
      case 11:
        arrayOfInstrumentInfo = (InstrumentInfo[])zza.zzb(paramParcel, k, InstrumentInfo.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new FullWallet(j, str3, str2, localProxyCard, str1, localAddress2, localAddress1, arrayOfString, localUserAddress2, localUserAddress1, arrayOfInstrumentInfo);
  }

  public FullWallet[] zzhp(int paramInt)
  {
    return new FullWallet[paramInt];
  }
}