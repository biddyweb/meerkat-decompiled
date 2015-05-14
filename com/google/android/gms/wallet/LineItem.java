package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class LineItem
  implements SafeParcelable
{
  public static final Parcelable.Creator<LineItem> CREATOR = new zzj();
  String description;
  private final int zzFG;
  String zzaCR;
  String zzaCS;
  String zzaDt;
  String zzaDu;
  int zzaDv;

  LineItem()
  {
    this.zzFG = 1;
    this.zzaDv = 0;
  }

  LineItem(int paramInt1, String paramString1, String paramString2, String paramString3, String paramString4, int paramInt2, String paramString5)
  {
    this.zzFG = paramInt1;
    this.description = paramString1;
    this.zzaDt = paramString2;
    this.zzaDu = paramString3;
    this.zzaCR = paramString4;
    this.zzaDv = paramInt2;
    this.zzaCS = paramString5;
  }

  public static Builder newBuilder()
  {
    LineItem localLineItem = new LineItem();
    localLineItem.getClass();
    return new Builder(null);
  }

  public int describeContents()
  {
    return 0;
  }

  public String getCurrencyCode()
  {
    return this.zzaCS;
  }

  public String getDescription()
  {
    return this.description;
  }

  public String getQuantity()
  {
    return this.zzaDt;
  }

  public int getRole()
  {
    return this.zzaDv;
  }

  public String getTotalPrice()
  {
    return this.zzaCR;
  }

  public String getUnitPrice()
  {
    return this.zzaDu;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzj.zza(this, paramParcel, paramInt);
  }

  public final class Builder
  {
    private Builder()
    {
    }

    public LineItem build()
    {
      return LineItem.this;
    }

    public Builder setCurrencyCode(String paramString)
    {
      LineItem.this.zzaCS = paramString;
      return this;
    }

    public Builder setDescription(String paramString)
    {
      LineItem.this.description = paramString;
      return this;
    }

    public Builder setQuantity(String paramString)
    {
      LineItem.this.zzaDt = paramString;
      return this;
    }

    public Builder setRole(int paramInt)
    {
      LineItem.this.zzaDv = paramInt;
      return this;
    }

    public Builder setTotalPrice(String paramString)
    {
      LineItem.this.zzaCR = paramString;
      return this;
    }

    public Builder setUnitPrice(String paramString)
    {
      LineItem.this.zzaDu = paramString;
      return this;
    }
  }

  public static abstract interface Role
  {
    public static final int REGULAR = 0;
    public static final int SHIPPING = 2;
    public static final int TAX = 1;
  }
}