package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.cast.ApplicationMetadata;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;

public class zzjw
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzjw> CREATOR = new zzjx();
  private final int zzFG;
  private double zzJm;
  private boolean zzJn;
  private ApplicationMetadata zzKD;
  private int zzKr;
  private int zzKs;

  public zzjw()
  {
    this(3, (0.0D / 0.0D), false, -1, null, -1);
  }

  zzjw(int paramInt1, double paramDouble, boolean paramBoolean, int paramInt2, ApplicationMetadata paramApplicationMetadata, int paramInt3)
  {
    this.zzFG = paramInt1;
    this.zzJm = paramDouble;
    this.zzJn = paramBoolean;
    this.zzKr = paramInt2;
    this.zzKD = paramApplicationMetadata;
    this.zzKs = paramInt3;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    zzjw localzzjw;
    do
    {
      return true;
      if (!(paramObject instanceof zzjw))
        return false;
      localzzjw = (zzjw)paramObject;
    }
    while ((this.zzJm == localzzjw.zzJm) && (this.zzJn == localzzjw.zzJn) && (this.zzKr == localzzjw.zzKr) && (zzjv.zza(this.zzKD, localzzjw.zzKD)) && (this.zzKs == localzzjw.zzKs));
    return false;
  }

  public ApplicationMetadata getApplicationMetadata()
  {
    return this.zzKD;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = Double.valueOf(this.zzJm);
    arrayOfObject[1] = Boolean.valueOf(this.zzJn);
    arrayOfObject[2] = Integer.valueOf(this.zzKr);
    arrayOfObject[3] = this.zzKD;
    arrayOfObject[4] = Integer.valueOf(this.zzKs);
    return zzw.hashCode(arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzjx.zza(this, paramParcel, paramInt);
  }

  public boolean zzhA()
  {
    return this.zzJn;
  }

  public int zzhB()
  {
    return this.zzKr;
  }

  public int zzhC()
  {
    return this.zzKs;
  }

  public double zzhs()
  {
    return this.zzJm;
  }
}