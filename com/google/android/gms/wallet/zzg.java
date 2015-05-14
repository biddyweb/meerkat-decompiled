package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzg
  implements Parcelable.Creator<FullWalletRequest>
{
  static void zza(FullWalletRequest paramFullWalletRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramFullWalletRequest.getVersionCode());
    zzb.zza(paramParcel, 2, paramFullWalletRequest.zzaCY, false);
    zzb.zza(paramParcel, 3, paramFullWalletRequest.zzaCZ, false);
    zzb.zza(paramParcel, 4, paramFullWalletRequest.zzaDi, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public FullWalletRequest zzeT(Parcel paramParcel)
  {
    Cart localCart = null;
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
        localCart = (Cart)zza.zza(paramParcel, k, Cart.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new FullWalletRequest(j, str2, str1, localCart);
  }

  public FullWalletRequest[] zzhq(int paramInt)
  {
    return new FullWalletRequest[paramInt];
  }
}