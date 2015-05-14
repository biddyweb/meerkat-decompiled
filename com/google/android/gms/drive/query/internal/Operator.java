package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class Operator
  implements SafeParcelable
{
  public static final Parcelable.Creator<Operator> CREATOR = new zzm();
  public static final Operator zzWM = new Operator("=");
  public static final Operator zzWN = new Operator("<");
  public static final Operator zzWO = new Operator("<=");
  public static final Operator zzWP = new Operator(">");
  public static final Operator zzWQ = new Operator(">=");
  public static final Operator zzWR = new Operator("and");
  public static final Operator zzWS = new Operator("or");
  public static final Operator zzWT = new Operator("not");
  public static final Operator zzWU = new Operator("contains");
  final String mTag;
  final int zzFG;

  Operator(int paramInt, String paramString)
  {
    this.zzFG = paramInt;
    this.mTag = paramString;
  }

  private Operator(String paramString)
  {
    this(1, paramString);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    Operator localOperator;
    do
    {
      do
      {
        return true;
        if (paramObject == null)
          return false;
        if (getClass() != paramObject.getClass())
          return false;
        localOperator = (Operator)paramObject;
        if (this.mTag != null)
          break;
      }
      while (localOperator.mTag == null);
      return false;
    }
    while (this.mTag.equals(localOperator.mTag));
    return false;
  }

  public String getTag()
  {
    return this.mTag;
  }

  public int hashCode()
  {
    if (this.mTag == null);
    for (int i = 0; ; i = this.mTag.hashCode())
      return i + 31;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzm.zza(this, paramParcel, paramInt);
  }
}