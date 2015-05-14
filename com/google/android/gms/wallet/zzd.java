package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzd
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzd> CREATOR = new zze();
  private final int zzFG;
  LoyaltyWalletObject zzaCV;
  OfferWalletObject zzaCW;
  GiftCardWalletObject zzaCX;

  zzd()
  {
    this.zzFG = 3;
  }

  zzd(int paramInt, LoyaltyWalletObject paramLoyaltyWalletObject, OfferWalletObject paramOfferWalletObject, GiftCardWalletObject paramGiftCardWalletObject)
  {
    this.zzFG = paramInt;
    this.zzaCV = paramLoyaltyWalletObject;
    this.zzaCW = paramOfferWalletObject;
    this.zzaCX = paramGiftCardWalletObject;
  }

  public int describeContents()
  {
    return 0;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zze.zza(this, paramParcel, paramInt);
  }
}