package com.google.android.gms.wallet.fragment;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.wallet.MaskedWallet;
import com.google.android.gms.wallet.MaskedWalletRequest;

public class zza
  implements Parcelable.Creator<WalletFragmentInitParams>
{
  static void zza(WalletFragmentInitParams paramWalletFragmentInitParams, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramWalletFragmentInitParams.zzFG);
    zzb.zza(paramParcel, 2, paramWalletFragmentInitParams.getAccountName(), false);
    zzb.zza(paramParcel, 3, paramWalletFragmentInitParams.getMaskedWalletRequest(), paramInt, false);
    zzb.zzc(paramParcel, 4, paramWalletFragmentInitParams.getMaskedWalletRequestCode());
    zzb.zza(paramParcel, 5, paramWalletFragmentInitParams.getMaskedWallet(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public WalletFragmentInitParams zzff(Parcel paramParcel)
  {
    MaskedWallet localMaskedWallet = null;
    int i = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    int j = 0;
    int k = -1;
    MaskedWalletRequest localMaskedWalletRequest = null;
    String str = null;
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
        str = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 3:
        localMaskedWalletRequest = (MaskedWalletRequest)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, m, MaskedWalletRequest.CREATOR);
        break;
      case 4:
        k = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
        break;
      case 5:
        localMaskedWallet = (MaskedWallet)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, m, MaskedWallet.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new WalletFragmentInitParams(j, str, localMaskedWalletRequest, k, localMaskedWallet);
  }

  public WalletFragmentInitParams[] zzhD(int paramInt)
  {
    return new WalletFragmentInitParams[paramInt];
  }
}