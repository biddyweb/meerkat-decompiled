package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.FitnessActivities;

public final class Value
  implements SafeParcelable
{
  public static final Parcelable.Creator<Value> CREATOR = new zzu();
  private final int zzFG;
  private final int zzZE;
  private boolean zzZS;
  private float zzZT;

  public Value(int paramInt)
  {
    this(1, paramInt, false, 0.0F);
  }

  Value(int paramInt1, int paramInt2, boolean paramBoolean, float paramFloat)
  {
    this.zzFG = paramInt1;
    this.zzZE = paramInt2;
    this.zzZS = paramBoolean;
    this.zzZT = paramFloat;
  }

  private boolean zza(Value paramValue)
  {
    if ((this.zzZE == paramValue.zzZE) && (this.zzZS == paramValue.zzZS))
    {
      switch (this.zzZE)
      {
      default:
        if (this.zzZT != paramValue.zzZT)
          break;
      case 1:
      case 2:
        do
        {
          do
            return true;
          while (asInt() == paramValue.asInt());
          return false;
        }
        while (asFloat() == paramValue.asFloat());
        return false;
      }
      return false;
    }
    return false;
  }

  public String asActivity()
  {
    return FitnessActivities.getName(asInt());
  }

  public float asFloat()
  {
    if (this.zzZE == 2);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zza(bool, "Value is not in float format");
      return this.zzZT;
    }
  }

  public int asInt()
  {
    int i = 1;
    if (this.zzZE == i);
    while (true)
    {
      zzx.zza(i, "Value is not in int format");
      return Float.floatToRawIntBits(this.zzZT);
      int j = 0;
    }
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof Value)) && (zza((Value)paramObject)));
  }

  public int getFormat()
  {
    return this.zzZE;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Float.valueOf(this.zzZT);
    arrayOfObject[1] = Integer.valueOf(this.zzZE);
    arrayOfObject[2] = Boolean.valueOf(this.zzZS);
    return zzw.hashCode(arrayOfObject);
  }

  public boolean isSet()
  {
    return this.zzZS;
  }

  public void setActivity(String paramString)
  {
    setInt(FitnessActivities.zzbG(paramString));
  }

  public void setFloat(float paramFloat)
  {
    if (this.zzZE == 2);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zza(bool, "Attempting to set an float value to a field that is not in FLOAT format.  Please check the data type definition and use the right format.");
      this.zzZS = true;
      this.zzZT = paramFloat;
      return;
    }
  }

  public void setInt(int paramInt)
  {
    if (this.zzZE == 1);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zza(bool, "Attempting to set an int value to a field that is not in INT32 format.  Please check the data type definition and use the right format.");
      this.zzZS = true;
      this.zzZT = Float.intBitsToFloat(paramInt);
      return;
    }
  }

  public String toString()
  {
    if (!this.zzZS)
      return "unset";
    switch (this.zzZE)
    {
    default:
      return "unknown";
    case 1:
      return Integer.toString(asInt());
    case 2:
    }
    return Float.toString(asFloat());
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzu.zza(this, paramParcel, paramInt);
  }

  float zzlL()
  {
    return this.zzZT;
  }
}