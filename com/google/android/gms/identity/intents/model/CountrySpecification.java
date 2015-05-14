package com.google.android.gms.identity.intents.model;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class CountrySpecification
  implements SafeParcelable
{
  public static final Parcelable.Creator<CountrySpecification> CREATOR = new zza();
  private final int zzFG;
  String zzyc;

  CountrySpecification(int paramInt, String paramString)
  {
    this.zzFG = paramInt;
    this.zzyc = paramString;
  }

  public CountrySpecification(String paramString)
  {
    this.zzFG = 1;
    this.zzyc = paramString;
  }

  public int describeContents()
  {
    return 0;
  }

  public String getCountryCode()
  {
    return this.zzyc;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
}