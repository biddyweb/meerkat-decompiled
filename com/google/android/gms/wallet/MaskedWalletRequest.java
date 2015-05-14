package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.Collection;

public final class MaskedWalletRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<MaskedWalletRequest> CREATOR = new zzm();
  private final int zzFG;
  String zzaCS;
  String zzaCZ;
  boolean zzaDT;
  boolean zzaDU;
  boolean zzaDV;
  String zzaDW;
  String zzaDX;
  boolean zzaDY;
  boolean zzaDZ;
  Cart zzaDi;
  CountrySpecification[] zzaEa;
  boolean zzaEb;
  boolean zzaEc;
  ArrayList<com.google.android.gms.identity.intents.model.CountrySpecification> zzaEd;

  MaskedWalletRequest()
  {
    this.zzFG = 3;
    this.zzaEb = true;
    this.zzaEc = true;
  }

  MaskedWalletRequest(int paramInt, String paramString1, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, String paramString2, String paramString3, String paramString4, Cart paramCart, boolean paramBoolean4, boolean paramBoolean5, CountrySpecification[] paramArrayOfCountrySpecification, boolean paramBoolean6, boolean paramBoolean7, ArrayList<com.google.android.gms.identity.intents.model.CountrySpecification> paramArrayList)
  {
    this.zzFG = paramInt;
    this.zzaCZ = paramString1;
    this.zzaDT = paramBoolean1;
    this.zzaDU = paramBoolean2;
    this.zzaDV = paramBoolean3;
    this.zzaDW = paramString2;
    this.zzaCS = paramString3;
    this.zzaDX = paramString4;
    this.zzaDi = paramCart;
    this.zzaDY = paramBoolean4;
    this.zzaDZ = paramBoolean5;
    this.zzaEa = paramArrayOfCountrySpecification;
    this.zzaEb = paramBoolean6;
    this.zzaEc = paramBoolean7;
    this.zzaEd = paramArrayList;
  }

  public static Builder newBuilder()
  {
    MaskedWalletRequest localMaskedWalletRequest = new MaskedWalletRequest();
    localMaskedWalletRequest.getClass();
    return new Builder(null);
  }

  public boolean allowDebitCard()
  {
    return this.zzaEc;
  }

  public boolean allowPrepaidCard()
  {
    return this.zzaEb;
  }

  public int describeContents()
  {
    return 0;
  }

  public ArrayList<com.google.android.gms.identity.intents.model.CountrySpecification> getAllowedCountrySpecificationsForShipping()
  {
    return this.zzaEd;
  }

  public CountrySpecification[] getAllowedShippingCountrySpecifications()
  {
    return this.zzaEa;
  }

  public Cart getCart()
  {
    return this.zzaDi;
  }

  public String getCurrencyCode()
  {
    return this.zzaCS;
  }

  public String getEstimatedTotalPrice()
  {
    return this.zzaDW;
  }

  public String getMerchantName()
  {
    return this.zzaDX;
  }

  public String getMerchantTransactionId()
  {
    return this.zzaCZ;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public boolean isBillingAgreement()
  {
    return this.zzaDZ;
  }

  public boolean isPhoneNumberRequired()
  {
    return this.zzaDT;
  }

  public boolean isShippingAddressRequired()
  {
    return this.zzaDU;
  }

  public boolean shouldRetrieveWalletObjects()
  {
    return this.zzaDY;
  }

  public boolean useMinimalBillingAddress()
  {
    return this.zzaDV;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzm.zza(this, paramParcel, paramInt);
  }

  public final class Builder
  {
    private Builder()
    {
    }

    public Builder addAllowedCountrySpecificationForShipping(com.google.android.gms.identity.intents.model.CountrySpecification paramCountrySpecification)
    {
      if (MaskedWalletRequest.this.zzaEd == null)
        MaskedWalletRequest.this.zzaEd = new ArrayList();
      MaskedWalletRequest.this.zzaEd.add(paramCountrySpecification);
      return this;
    }

    public Builder addAllowedCountrySpecificationsForShipping(Collection<com.google.android.gms.identity.intents.model.CountrySpecification> paramCollection)
    {
      if (paramCollection != null)
      {
        if (MaskedWalletRequest.this.zzaEd == null)
          MaskedWalletRequest.this.zzaEd = new ArrayList();
        MaskedWalletRequest.this.zzaEd.addAll(paramCollection);
      }
      return this;
    }

    public MaskedWalletRequest build()
    {
      return MaskedWalletRequest.this;
    }

    public Builder setAllowDebitCard(boolean paramBoolean)
    {
      MaskedWalletRequest.this.zzaEc = paramBoolean;
      return this;
    }

    public Builder setAllowPrepaidCard(boolean paramBoolean)
    {
      MaskedWalletRequest.this.zzaEb = paramBoolean;
      return this;
    }

    public Builder setCart(Cart paramCart)
    {
      MaskedWalletRequest.this.zzaDi = paramCart;
      return this;
    }

    public Builder setCurrencyCode(String paramString)
    {
      MaskedWalletRequest.this.zzaCS = paramString;
      return this;
    }

    public Builder setEstimatedTotalPrice(String paramString)
    {
      MaskedWalletRequest.this.zzaDW = paramString;
      return this;
    }

    public Builder setIsBillingAgreement(boolean paramBoolean)
    {
      MaskedWalletRequest.this.zzaDZ = paramBoolean;
      return this;
    }

    public Builder setMerchantName(String paramString)
    {
      MaskedWalletRequest.this.zzaDX = paramString;
      return this;
    }

    public Builder setMerchantTransactionId(String paramString)
    {
      MaskedWalletRequest.this.zzaCZ = paramString;
      return this;
    }

    public Builder setPhoneNumberRequired(boolean paramBoolean)
    {
      MaskedWalletRequest.this.zzaDT = paramBoolean;
      return this;
    }

    public Builder setShippingAddressRequired(boolean paramBoolean)
    {
      MaskedWalletRequest.this.zzaDU = paramBoolean;
      return this;
    }

    public Builder setShouldRetrieveWalletObjects(boolean paramBoolean)
    {
      MaskedWalletRequest.this.zzaDY = paramBoolean;
      return this;
    }

    public Builder setUseMinimalBillingAddress(boolean paramBoolean)
    {
      MaskedWalletRequest.this.zzaDV = paramBoolean;
      return this;
    }
  }
}