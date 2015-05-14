package com.google.android.gms.identity.intents.model;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class UserAddress
  implements SafeParcelable
{
  public static final Parcelable.Creator<UserAddress> CREATOR = new zzb();
  String name;
  private final int zzFG;
  String zzalA;
  String zzalB;
  String zzalC;
  String zzalD;
  boolean zzalE;
  String zzalF;
  String zzalG;
  String zzalu;
  String zzalv;
  String zzalw;
  String zzalx;
  String zzaly;
  String zzalz;
  String zzyc;

  UserAddress()
  {
    this.zzFG = 1;
  }

  UserAddress(int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7, String paramString8, String paramString9, String paramString10, String paramString11, String paramString12, boolean paramBoolean, String paramString13, String paramString14)
  {
    this.zzFG = paramInt;
    this.name = paramString1;
    this.zzalu = paramString2;
    this.zzalv = paramString3;
    this.zzalw = paramString4;
    this.zzalx = paramString5;
    this.zzaly = paramString6;
    this.zzalz = paramString7;
    this.zzalA = paramString8;
    this.zzyc = paramString9;
    this.zzalB = paramString10;
    this.zzalC = paramString11;
    this.zzalD = paramString12;
    this.zzalE = paramBoolean;
    this.zzalF = paramString13;
    this.zzalG = paramString14;
  }

  public static UserAddress fromIntent(Intent paramIntent)
  {
    if ((paramIntent == null) || (!paramIntent.hasExtra("com.google.android.gms.identity.intents.EXTRA_ADDRESS")))
      return null;
    return (UserAddress)paramIntent.getParcelableExtra("com.google.android.gms.identity.intents.EXTRA_ADDRESS");
  }

  public int describeContents()
  {
    return 0;
  }

  public String getAddress1()
  {
    return this.zzalu;
  }

  public String getAddress2()
  {
    return this.zzalv;
  }

  public String getAddress3()
  {
    return this.zzalw;
  }

  public String getAddress4()
  {
    return this.zzalx;
  }

  public String getAddress5()
  {
    return this.zzaly;
  }

  public String getAdministrativeArea()
  {
    return this.zzalz;
  }

  public String getCompanyName()
  {
    return this.zzalF;
  }

  public String getCountryCode()
  {
    return this.zzyc;
  }

  public String getEmailAddress()
  {
    return this.zzalG;
  }

  public String getLocality()
  {
    return this.zzalA;
  }

  public String getName()
  {
    return this.name;
  }

  public String getPhoneNumber()
  {
    return this.zzalD;
  }

  public String getPostalCode()
  {
    return this.zzalB;
  }

  public String getSortingCode()
  {
    return this.zzalC;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public boolean isPostBox()
  {
    return this.zzalE;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
}