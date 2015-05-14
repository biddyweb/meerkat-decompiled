package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.identity.intents.model.UserAddress;

public final class MaskedWallet
  implements SafeParcelable
{
  public static final Parcelable.Creator<MaskedWallet> CREATOR = new zzl();
  private final int zzFG;
  String zzaCY;
  String zzaCZ;
  LoyaltyWalletObject[] zzaDQ;
  OfferWalletObject[] zzaDR;
  String zzaDb;
  Address zzaDc;
  Address zzaDd;
  String[] zzaDe;
  UserAddress zzaDf;
  UserAddress zzaDg;
  InstrumentInfo[] zzaDh;

  private MaskedWallet()
  {
    this.zzFG = 2;
  }

  MaskedWallet(int paramInt, String paramString1, String paramString2, String[] paramArrayOfString, String paramString3, Address paramAddress1, Address paramAddress2, LoyaltyWalletObject[] paramArrayOfLoyaltyWalletObject, OfferWalletObject[] paramArrayOfOfferWalletObject, UserAddress paramUserAddress1, UserAddress paramUserAddress2, InstrumentInfo[] paramArrayOfInstrumentInfo)
  {
    this.zzFG = paramInt;
    this.zzaCY = paramString1;
    this.zzaCZ = paramString2;
    this.zzaDe = paramArrayOfString;
    this.zzaDb = paramString3;
    this.zzaDc = paramAddress1;
    this.zzaDd = paramAddress2;
    this.zzaDQ = paramArrayOfLoyaltyWalletObject;
    this.zzaDR = paramArrayOfOfferWalletObject;
    this.zzaDf = paramUserAddress1;
    this.zzaDg = paramUserAddress2;
    this.zzaDh = paramArrayOfInstrumentInfo;
  }

  public static Builder newBuilderFrom(MaskedWallet paramMaskedWallet)
  {
    zzx.zzl(paramMaskedWallet);
    return zzuR().setGoogleTransactionId(paramMaskedWallet.getGoogleTransactionId()).setMerchantTransactionId(paramMaskedWallet.getMerchantTransactionId()).setPaymentDescriptions(paramMaskedWallet.getPaymentDescriptions()).setInstrumentInfos(paramMaskedWallet.getInstrumentInfos()).setEmail(paramMaskedWallet.getEmail()).setLoyaltyWalletObjects(paramMaskedWallet.getLoyaltyWalletObjects()).setOfferWalletObjects(paramMaskedWallet.getOfferWalletObjects()).setBuyerBillingAddress(paramMaskedWallet.getBuyerBillingAddress()).setBuyerShippingAddress(paramMaskedWallet.getBuyerShippingAddress());
  }

  public static Builder zzuR()
  {
    MaskedWallet localMaskedWallet = new MaskedWallet();
    localMaskedWallet.getClass();
    return new Builder(null);
  }

  public int describeContents()
  {
    return 0;
  }

  @Deprecated
  public Address getBillingAddress()
  {
    return this.zzaDc;
  }

  public UserAddress getBuyerBillingAddress()
  {
    return this.zzaDf;
  }

  public UserAddress getBuyerShippingAddress()
  {
    return this.zzaDg;
  }

  public String getEmail()
  {
    return this.zzaDb;
  }

  public String getGoogleTransactionId()
  {
    return this.zzaCY;
  }

  public InstrumentInfo[] getInstrumentInfos()
  {
    return this.zzaDh;
  }

  public LoyaltyWalletObject[] getLoyaltyWalletObjects()
  {
    return this.zzaDQ;
  }

  public String getMerchantTransactionId()
  {
    return this.zzaCZ;
  }

  public OfferWalletObject[] getOfferWalletObjects()
  {
    return this.zzaDR;
  }

  public String[] getPaymentDescriptions()
  {
    return this.zzaDe;
  }

  @Deprecated
  public Address getShippingAddress()
  {
    return this.zzaDd;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzl.zza(this, paramParcel, paramInt);
  }

  public final class Builder
  {
    private Builder()
    {
    }

    public MaskedWallet build()
    {
      return MaskedWallet.this;
    }

    public Builder setBillingAddress(Address paramAddress)
    {
      MaskedWallet.this.zzaDc = paramAddress;
      return this;
    }

    public Builder setBuyerBillingAddress(UserAddress paramUserAddress)
    {
      MaskedWallet.this.zzaDf = paramUserAddress;
      return this;
    }

    public Builder setBuyerShippingAddress(UserAddress paramUserAddress)
    {
      MaskedWallet.this.zzaDg = paramUserAddress;
      return this;
    }

    public Builder setEmail(String paramString)
    {
      MaskedWallet.this.zzaDb = paramString;
      return this;
    }

    public Builder setGoogleTransactionId(String paramString)
    {
      MaskedWallet.this.zzaCY = paramString;
      return this;
    }

    public Builder setInstrumentInfos(InstrumentInfo[] paramArrayOfInstrumentInfo)
    {
      MaskedWallet.this.zzaDh = paramArrayOfInstrumentInfo;
      return this;
    }

    public Builder setLoyaltyWalletObjects(LoyaltyWalletObject[] paramArrayOfLoyaltyWalletObject)
    {
      MaskedWallet.this.zzaDQ = paramArrayOfLoyaltyWalletObject;
      return this;
    }

    public Builder setMerchantTransactionId(String paramString)
    {
      MaskedWallet.this.zzaCZ = paramString;
      return this;
    }

    public Builder setOfferWalletObjects(OfferWalletObject[] paramArrayOfOfferWalletObject)
    {
      MaskedWallet.this.zzaDR = paramArrayOfOfferWalletObject;
      return this;
    }

    public Builder setPaymentDescriptions(String[] paramArrayOfString)
    {
      MaskedWallet.this.zzaDe = paramArrayOfString;
      return this;
    }

    public Builder setShippingAddress(Address paramAddress)
    {
      MaskedWallet.this.zzaDd = paramAddress;
      return this;
    }
  }
}