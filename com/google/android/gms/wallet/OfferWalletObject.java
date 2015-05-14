package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.wallet.wobs.CommonWalletObject;
import com.google.android.gms.wallet.wobs.CommonWalletObject.zza;

public final class OfferWalletObject
  implements SafeParcelable
{
  public static final Parcelable.Creator<OfferWalletObject> CREATOR = new zzo();
  private final int zzFG;
  CommonWalletObject zzaDk;
  String zzaEh;
  String zzfl;

  OfferWalletObject()
  {
    this.zzFG = 3;
  }

  OfferWalletObject(int paramInt, String paramString1, String paramString2, CommonWalletObject paramCommonWalletObject)
  {
    this.zzFG = paramInt;
    this.zzaEh = paramString2;
    if (paramInt < 3)
    {
      this.zzaDk = CommonWalletObject.zzuV().zzdJ(paramString1).zzuW();
      return;
    }
    this.zzaDk = paramCommonWalletObject;
  }

  public int describeContents()
  {
    return 0;
  }

  public String getId()
  {
    return this.zzaDk.getId();
  }

  public String getRedemptionCode()
  {
    return this.zzaEh;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzo.zza(this, paramParcel, paramInt);
  }
}