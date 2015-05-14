package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.wallet.wobs.CommonWalletObject;

public class zzo
  implements Parcelable.Creator<OfferWalletObject>
{
  static void zza(OfferWalletObject paramOfferWalletObject, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramOfferWalletObject.getVersionCode());
    zzb.zza(paramParcel, 2, paramOfferWalletObject.zzfl, false);
    zzb.zza(paramParcel, 3, paramOfferWalletObject.zzaEh, false);
    zzb.zza(paramParcel, 4, paramOfferWalletObject.zzaDk, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public OfferWalletObject zzfb(Parcel paramParcel)
  {
    CommonWalletObject localCommonWalletObject = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
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
        str2 = zza.zzo(paramParcel, k);
        break;
      case 3:
        str1 = zza.zzo(paramParcel, k);
        break;
      case 4:
        localCommonWalletObject = (CommonWalletObject)zza.zza(paramParcel, k, CommonWalletObject.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new OfferWalletObject(j, str2, str1, localCommonWalletObject);
  }

  public OfferWalletObject[] zzhy(int paramInt)
  {
    return new OfferWalletObject[paramInt];
  }
}