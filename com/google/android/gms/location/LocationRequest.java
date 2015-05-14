package com.google.android.gms.location;

import android.os.Parcel;
import android.os.SystemClock;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;

public final class LocationRequest
  implements SafeParcelable
{
  public static final zzg CREATOR = new zzg();
  public static final int PRIORITY_BALANCED_POWER_ACCURACY = 102;
  public static final int PRIORITY_HIGH_ACCURACY = 100;
  public static final int PRIORITY_LOW_POWER = 104;
  public static final int PRIORITY_NO_POWER = 105;
  int mPriority;
  private final int zzFG;
  boolean zzabz;
  long zzalO;
  long zzamf;
  long zzamg;
  int zzamh;
  float zzami;
  long zzamj;

  public LocationRequest()
  {
    this.zzFG = 1;
    this.mPriority = 102;
    this.zzamf = 3600000L;
    this.zzamg = 600000L;
    this.zzabz = false;
    this.zzalO = 9223372036854775807L;
    this.zzamh = 2147483647;
    this.zzami = 0.0F;
    this.zzamj = 0L;
  }

  LocationRequest(int paramInt1, int paramInt2, long paramLong1, long paramLong2, boolean paramBoolean, long paramLong3, int paramInt3, float paramFloat, long paramLong4)
  {
    this.zzFG = paramInt1;
    this.mPriority = paramInt2;
    this.zzamf = paramLong1;
    this.zzamg = paramLong2;
    this.zzabz = paramBoolean;
    this.zzalO = paramLong3;
    this.zzamh = paramInt3;
    this.zzami = paramFloat;
    this.zzamj = paramLong4;
  }

  public static LocationRequest create()
  {
    return new LocationRequest();
  }

  private static void zzA(long paramLong)
  {
    if (paramLong < 0L)
      throw new IllegalArgumentException("invalid interval: " + paramLong);
  }

  private static void zza(float paramFloat)
  {
    if (paramFloat < 0.0F)
      throw new IllegalArgumentException("invalid displacement: " + paramFloat);
  }

  private static void zzfj(int paramInt)
  {
    switch (paramInt)
    {
    case 101:
    case 103:
    default:
      throw new IllegalArgumentException("invalid quality: " + paramInt);
    case 100:
    case 102:
    case 104:
    case 105:
    }
  }

  public static String zzfk(int paramInt)
  {
    switch (paramInt)
    {
    case 101:
    case 103:
    default:
      return "???";
    case 100:
      return "PRIORITY_HIGH_ACCURACY";
    case 102:
      return "PRIORITY_BALANCED_POWER_ACCURACY";
    case 104:
      return "PRIORITY_LOW_POWER";
    case 105:
    }
    return "PRIORITY_NO_POWER";
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    LocationRequest localLocationRequest;
    do
    {
      return true;
      if (!(paramObject instanceof LocationRequest))
        return false;
      localLocationRequest = (LocationRequest)paramObject;
    }
    while ((this.mPriority == localLocationRequest.mPriority) && (this.zzamf == localLocationRequest.zzamf) && (this.zzamg == localLocationRequest.zzamg) && (this.zzabz == localLocationRequest.zzabz) && (this.zzalO == localLocationRequest.zzalO) && (this.zzamh == localLocationRequest.zzamh) && (this.zzami == localLocationRequest.zzami));
    return false;
  }

  public long getExpirationTime()
  {
    return this.zzalO;
  }

  public long getFastestInterval()
  {
    return this.zzamg;
  }

  public long getInterval()
  {
    return this.zzamf;
  }

  public int getNumUpdates()
  {
    return this.zzamh;
  }

  public int getPriority()
  {
    return this.mPriority;
  }

  public float getSmallestDisplacement()
  {
    return this.zzami;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[7];
    arrayOfObject[0] = Integer.valueOf(this.mPriority);
    arrayOfObject[1] = Long.valueOf(this.zzamf);
    arrayOfObject[2] = Long.valueOf(this.zzamg);
    arrayOfObject[3] = Boolean.valueOf(this.zzabz);
    arrayOfObject[4] = Long.valueOf(this.zzalO);
    arrayOfObject[5] = Integer.valueOf(this.zzamh);
    arrayOfObject[6] = Float.valueOf(this.zzami);
    return zzw.hashCode(arrayOfObject);
  }

  public LocationRequest setExpirationDuration(long paramLong)
  {
    long l = SystemClock.elapsedRealtime();
    if (paramLong > 9223372036854775807L - l);
    for (this.zzalO = 9223372036854775807L; ; this.zzalO = (l + paramLong))
    {
      if (this.zzalO < 0L)
        this.zzalO = 0L;
      return this;
    }
  }

  public LocationRequest setExpirationTime(long paramLong)
  {
    this.zzalO = paramLong;
    if (this.zzalO < 0L)
      this.zzalO = 0L;
    return this;
  }

  public LocationRequest setFastestInterval(long paramLong)
  {
    zzA(paramLong);
    this.zzabz = true;
    this.zzamg = paramLong;
    return this;
  }

  public LocationRequest setInterval(long paramLong)
  {
    zzA(paramLong);
    this.zzamf = paramLong;
    if (!this.zzabz)
      this.zzamg = (()(this.zzamf / 6.0D));
    return this;
  }

  public LocationRequest setNumUpdates(int paramInt)
  {
    if (paramInt <= 0)
      throw new IllegalArgumentException("invalid numUpdates: " + paramInt);
    this.zzamh = paramInt;
    return this;
  }

  public LocationRequest setPriority(int paramInt)
  {
    zzfj(paramInt);
    this.mPriority = paramInt;
    return this;
  }

  public LocationRequest setSmallestDisplacement(float paramFloat)
  {
    zza(paramFloat);
    this.zzami = paramFloat;
    return this;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("Request[").append(zzfk(this.mPriority));
    if (this.mPriority != 105)
    {
      localStringBuilder.append(" requested=");
      localStringBuilder.append(this.zzamf + "ms");
    }
    localStringBuilder.append(" fastest=");
    localStringBuilder.append(this.zzamg + "ms");
    if (this.zzamj > this.zzamf)
    {
      localStringBuilder.append(" maxWait=");
      localStringBuilder.append(this.zzamj + "ms");
    }
    if (this.zzalO != 9223372036854775807L)
    {
      long l = this.zzalO - SystemClock.elapsedRealtime();
      localStringBuilder.append(" expireIn=");
      localStringBuilder.append(l + "ms");
    }
    if (this.zzamh != 2147483647)
      localStringBuilder.append(" num=").append(this.zzamh);
    localStringBuilder.append(']');
    return localStringBuilder.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzg.zza(this, paramParcel, paramInt);
  }
}