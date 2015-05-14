package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

@Deprecated
public final class Address
  implements SafeParcelable
{
  public static final Parcelable.Creator<Address> CREATOR = new zza();
  String name;
  private final int zzFG;
  String zzaCP;
  String zzaCQ;
  String zzalB;
  String zzalD;
  boolean zzalE;
  String zzalF;
  String zzalu;
  String zzalv;
  String zzalw;
  String zzyc;

  Address()
  {
    this.zzFG = 1;
  }

  Address(int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7, String paramString8, String paramString9, boolean paramBoolean, String paramString10)
  {
    this.zzFG = paramInt;
    this.name = paramString1;
    this.zzalu = paramString2;
    this.zzalv = paramString3;
    this.zzalw = paramString4;
    this.zzyc = paramString5;
    this.zzaCP = paramString6;
    this.zzaCQ = paramString7;
    this.zzalB = paramString8;
    this.zzalD = paramString9;
    this.zzalE = paramBoolean;
    this.zzalF = paramString10;
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

  public String getCity()
  {
    return this.zzaCP;
  }

  public String getCompanyName()
  {
    return this.zzalF;
  }

  public String getCountryCode()
  {
    return this.zzyc;
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

  public String getState()
  {
    return this.zzaCQ;
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
    zza.zza(this, paramParcel, paramInt);
  }
}