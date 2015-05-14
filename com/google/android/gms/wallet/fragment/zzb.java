package com.google.android.gms.wallet.fragment;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;

public class zzb
  implements Parcelable.Creator<WalletFragmentOptions>
{
  static void zza(WalletFragmentOptions paramWalletFragmentOptions, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzK(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, paramWalletFragmentOptions.zzFG);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 2, paramWalletFragmentOptions.getEnvironment());
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 3, paramWalletFragmentOptions.getTheme());
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 4, paramWalletFragmentOptions.getFragmentStyle(), paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 5, paramWalletFragmentOptions.getMode());
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }

  public WalletFragmentOptions zzfg(Parcel paramParcel)
  {
    int i = 1;
    int j = 0;
    int k = zza.zzJ(paramParcel);
    WalletFragmentStyle localWalletFragmentStyle = null;
    int m = i;
    int n = 0;
    while (paramParcel.dataPosition() < k)
    {
      int i1 = zza.zzI(paramParcel);
      switch (zza.zzaP(i1))
      {
      default:
        zza.zzb(paramParcel, i1);
        break;
      case 1:
        n = zza.zzg(paramParcel, i1);
        break;
      case 2:
        m = zza.zzg(paramParcel, i1);
        break;
      case 3:
        j = zza.zzg(paramParcel, i1);
        break;
      case 4:
        localWalletFragmentStyle = (WalletFragmentStyle)zza.zza(paramParcel, i1, WalletFragmentStyle.CREATOR);
        break;
      case 5:
        i = zza.zzg(paramParcel, i1);
      }
    }
    if (paramParcel.dataPosition() != k)
      throw new zza.zza("Overread allowed size end=" + k, paramParcel);
    return new WalletFragmentOptions(n, m, j, localWalletFragmentStyle, i);
  }

  public WalletFragmentOptions[] zzhE(int paramInt)
  {
    return new WalletFragmentOptions[paramInt];
  }
}