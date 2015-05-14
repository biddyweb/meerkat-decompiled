package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.location.Geofence;
import java.util.Locale;

public class zzpk
  implements SafeParcelable, Geofence
{
  public static final zzpl CREATOR = new zzpl();
  private final int zzFG;
  private final int zzalN;
  private final short zzalP;
  private final double zzalQ;
  private final double zzalR;
  private final float zzalS;
  private final int zzalT;
  private final int zzalU;
  private final long zzanp;
  private final String zzxv;

  public zzpk(int paramInt1, String paramString, int paramInt2, short paramShort, double paramDouble1, double paramDouble2, float paramFloat, long paramLong, int paramInt3, int paramInt4)
  {
    zzcl(paramString);
    zzb(paramFloat);
    zza(paramDouble1, paramDouble2);
    int i = zzfw(paramInt2);
    this.zzFG = paramInt1;
    this.zzalP = paramShort;
    this.zzxv = paramString;
    this.zzalQ = paramDouble1;
    this.zzalR = paramDouble2;
    this.zzalS = paramFloat;
    this.zzanp = paramLong;
    this.zzalN = i;
    this.zzalT = paramInt3;
    this.zzalU = paramInt4;
  }

  public zzpk(String paramString, int paramInt1, short paramShort, double paramDouble1, double paramDouble2, float paramFloat, long paramLong, int paramInt2, int paramInt3)
  {
    this(1, paramString, paramInt1, paramShort, paramDouble1, paramDouble2, paramFloat, paramLong, paramInt2, paramInt3);
  }

  private static void zza(double paramDouble1, double paramDouble2)
  {
    if ((paramDouble1 > 90.0D) || (paramDouble1 < -90.0D))
      throw new IllegalArgumentException("invalid latitude: " + paramDouble1);
    if ((paramDouble2 > 180.0D) || (paramDouble2 < -180.0D))
      throw new IllegalArgumentException("invalid longitude: " + paramDouble2);
  }

  private static void zzb(float paramFloat)
  {
    if (paramFloat <= 0.0F)
      throw new IllegalArgumentException("invalid radius: " + paramFloat);
  }

  private static void zzcl(String paramString)
  {
    if ((paramString == null) || (paramString.length() > 100))
      throw new IllegalArgumentException("requestId is null or too long: " + paramString);
  }

  private static int zzfw(int paramInt)
  {
    int i = paramInt & 0x7;
    if (i == 0)
      throw new IllegalArgumentException("No supported transition specified: " + paramInt);
    return i;
  }

  private static String zzfx(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return null;
    case 1:
    }
    return "CIRCLE";
  }

  public static zzpk zzi(byte[] paramArrayOfByte)
  {
    Parcel localParcel = Parcel.obtain();
    localParcel.unmarshall(paramArrayOfByte, 0, paramArrayOfByte.length);
    localParcel.setDataPosition(0);
    zzpk localzzpk = CREATOR.zzdx(localParcel);
    localParcel.recycle();
    return localzzpk;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zzpk localzzpk;
    do
    {
      return true;
      if (paramObject == null)
        return false;
      if (!(paramObject instanceof zzpk))
        return false;
      localzzpk = (zzpk)paramObject;
      if (this.zzalS != localzzpk.zzalS)
        return false;
      if (this.zzalQ != localzzpk.zzalQ)
        return false;
      if (this.zzalR != localzzpk.zzalR)
        return false;
    }
    while (this.zzalP == localzzpk.zzalP);
    return false;
  }

  public long getExpirationTime()
  {
    return this.zzanp;
  }

  public double getLatitude()
  {
    return this.zzalQ;
  }

  public double getLongitude()
  {
    return this.zzalR;
  }

  public int getNotificationResponsiveness()
  {
    return this.zzalT;
  }

  public String getRequestId()
  {
    return this.zzxv;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    long l1 = Double.doubleToLongBits(this.zzalQ);
    int i = 31 + (int)(l1 ^ l1 >>> 32);
    long l2 = Double.doubleToLongBits(this.zzalR);
    return 31 * (31 * (31 * (i * 31 + (int)(l2 ^ l2 >>> 32)) + Float.floatToIntBits(this.zzalS)) + this.zzalP) + this.zzalN;
  }

  public String toString()
  {
    Locale localLocale = Locale.US;
    Object[] arrayOfObject = new Object[9];
    arrayOfObject[0] = zzfx(this.zzalP);
    arrayOfObject[1] = this.zzxv;
    arrayOfObject[2] = Integer.valueOf(this.zzalN);
    arrayOfObject[3] = Double.valueOf(this.zzalQ);
    arrayOfObject[4] = Double.valueOf(this.zzalR);
    arrayOfObject[5] = Float.valueOf(this.zzalS);
    arrayOfObject[6] = Integer.valueOf(this.zzalT / 1000);
    arrayOfObject[7] = Integer.valueOf(this.zzalU);
    arrayOfObject[8] = Long.valueOf(this.zzanp);
    return String.format(localLocale, "Geofence[%s id:%s transitions:%d %.6f, %.6f %.0fm, resp=%ds, dwell=%dms, @%d]", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzpl.zza(this, paramParcel, paramInt);
  }

  public short zzpB()
  {
    return this.zzalP;
  }

  public float zzpC()
  {
    return this.zzalS;
  }

  public int zzpD()
  {
    return this.zzalN;
  }

  public int zzpE()
  {
    return this.zzalU;
  }
}