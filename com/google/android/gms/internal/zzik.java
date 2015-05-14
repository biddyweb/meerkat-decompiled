package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class zzik
  implements Parcelable
{

  @Deprecated
  public static final Parcelable.Creator<zzik> CREATOR = new Parcelable.Creator()
  {
    @Deprecated
    public zzik[] zzO(int paramAnonymousInt)
    {
      return new zzik[paramAnonymousInt];
    }

    @Deprecated
    public zzik zzk(Parcel paramAnonymousParcel)
    {
      return new zzik(paramAnonymousParcel);
    }
  };
  private String mValue;
  private String zzFA;
  private String zzFB;

  @Deprecated
  public zzik()
  {
  }

  @Deprecated
  zzik(Parcel paramParcel)
  {
    readFromParcel(paramParcel);
  }

  public zzik(String paramString1, String paramString2, String paramString3)
  {
    this.zzFA = paramString1;
    this.zzFB = paramString2;
    this.mValue = paramString3;
  }

  @Deprecated
  private void readFromParcel(Parcel paramParcel)
  {
    this.zzFA = paramParcel.readString();
    this.zzFB = paramParcel.readString();
    this.mValue = paramParcel.readString();
  }

  @Deprecated
  public int describeContents()
  {
    return 0;
  }

  public String getId()
  {
    return this.zzFA;
  }

  public String getValue()
  {
    return this.mValue;
  }

  @Deprecated
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.zzFA);
    paramParcel.writeString(this.zzFB);
    paramParcel.writeString(this.mValue);
  }
}