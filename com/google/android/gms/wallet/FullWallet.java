package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.identity.intents.model.UserAddress;

public final class FullWallet
  implements SafeParcelable
{
  public static final Parcelable.Creator<FullWallet> CREATOR = new zzf();
  private final int zzFG;
  String zzaCY;
  String zzaCZ;
  ProxyCard zzaDa;
  String zzaDb;
  Address zzaDc;
  Address zzaDd;
  String[] zzaDe;
  UserAddress zzaDf;
  UserAddress zzaDg;
  InstrumentInfo[] zzaDh;

  private FullWallet()
  {
    this.zzFG = 1;
  }

  FullWallet(int paramInt, String paramString1, String paramString2, ProxyCard paramProxyCard, String paramString3, Address paramAddress1, Address paramAddress2, String[] paramArrayOfString, UserAddress paramUserAddress1, UserAddress paramUserAddress2, InstrumentInfo[] paramArrayOfInstrumentInfo)
  {
    this.zzFG = paramInt;
    this.zzaCY = paramString1;
    this.zzaCZ = paramString2;
    this.zzaDa = paramProxyCard;
    this.zzaDb = paramString3;
    this.zzaDc = paramAddress1;
    this.zzaDd = paramAddress2;
    this.zzaDe = paramArrayOfString;
    this.zzaDf = paramUserAddress1;
    this.zzaDg = paramUserAddress2;
    this.zzaDh = paramArrayOfInstrumentInfo;
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

  public String getMerchantTransactionId()
  {
    return this.zzaCZ;
  }

  public String[] getPaymentDescriptions()
  {
    return this.zzaDe;
  }

  public ProxyCard getProxyCard()
  {
    return this.zzaDa;
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
    zzf.zza(this, paramParcel, paramInt);
  }
}