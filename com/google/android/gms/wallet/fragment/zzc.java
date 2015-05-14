package com.google.android.gms.wallet.fragment;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzc
  implements Parcelable.Creator<WalletFragmentStyle>
{
  static void zza(WalletFragmentStyle paramWalletFragmentStyle, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramWalletFragmentStyle.zzFG);
    zzb.zza(paramParcel, 2, paramWalletFragmentStyle.zzaER, false);
    zzb.zzc(paramParcel, 3, paramWalletFragmentStyle.zzaES);
    zzb.zzH(paramParcel, i);
  }

  public WalletFragmentStyle zzfh(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    Bundle localBundle = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        localBundle = zza.zzq(paramParcel, m);
        break;
      case 3:
        i = zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new WalletFragmentStyle(k, localBundle, i);
  }

  public WalletFragmentStyle[] zzhF(int paramInt)
  {
    return new WalletFragmentStyle[paramInt];
  }
}