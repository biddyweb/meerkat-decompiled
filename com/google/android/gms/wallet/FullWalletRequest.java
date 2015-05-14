package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class FullWalletRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<FullWalletRequest> CREATOR = new zzg();
  private final int zzFG;
  String zzaCY;
  String zzaCZ;
  Cart zzaDi;

  FullWalletRequest()
  {
    this.zzFG = 1;
  }

  FullWalletRequest(int paramInt, String paramString1, String paramString2, Cart paramCart)
  {
    this.zzFG = paramInt;
    this.zzaCY = paramString1;
    this.zzaCZ = paramString2;
    this.zzaDi = paramCart;
  }

  public static Builder newBuilder()
  {
    FullWalletRequest localFullWalletRequest = new FullWalletRequest();
    localFullWalletRequest.getClass();
    return new Builder(null);
  }

  public int describeContents()
  {
    return 0;
  }

  public Cart getCart()
  {
    return this.zzaDi;
  }

  public String getGoogleTransactionId()
  {
    return this.zzaCY;
  }

  public String getMerchantTransactionId()
  {
    return this.zzaCZ;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzg.zza(this, paramParcel, paramInt);
  }

  public final class Builder
  {
    private Builder()
    {
    }

    public FullWalletRequest build()
    {
      return FullWalletRequest.this;
    }

    public Builder setCart(Cart paramCart)
    {
      FullWalletRequest.this.zzaDi = paramCart;
      return this;
    }

    public Builder setGoogleTransactionId(String paramString)
    {
      FullWalletRequest.this.zzaCY = paramString;
      return this;
    }

    public Builder setMerchantTransactionId(String paramString)
    {
      FullWalletRequest.this.zzaCZ = paramString;
      return this;
    }
  }
}