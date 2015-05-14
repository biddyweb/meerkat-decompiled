package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Iterator;
import java.util.Set;

public class zztf
  implements SafeParcelable
{
  public static final zzth CREATOR = new zzth();
  public final String tag;
  public final int versionCode;
  public final long zzatM;
  public final byte[] zzatN;
  public final Bundle zzatO;

  zztf(int paramInt, long paramLong, String paramString, byte[] paramArrayOfByte, Bundle paramBundle)
  {
    this.versionCode = paramInt;
    this.zzatM = paramLong;
    this.tag = paramString;
    this.zzatN = paramArrayOfByte;
    this.zzatO = paramBundle;
  }

  public zztf(long paramLong, String paramString, byte[] paramArrayOfByte, String[] paramArrayOfString)
  {
    this.versionCode = 1;
    this.zzatM = paramLong;
    this.tag = paramString;
    this.zzatN = paramArrayOfByte;
    this.zzatO = zze(paramArrayOfString);
  }

  private static Bundle zze(String[] paramArrayOfString)
  {
    Bundle localBundle = null;
    if (paramArrayOfString == null);
    while (true)
    {
      return localBundle;
      if (paramArrayOfString.length % 2 != 0)
        throw new IllegalArgumentException("extras must have an even number of elements");
      int i = paramArrayOfString.length / 2;
      localBundle = null;
      if (i != 0)
      {
        localBundle = new Bundle(i);
        for (int j = 0; j < i; j++)
          localBundle.putString(paramArrayOfString[(j * 2)], paramArrayOfString[(1 + j * 2)]);
      }
    }
  }

  public int describeContents()
  {
    return 0;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("tag=").append(this.tag).append(",");
    localStringBuilder.append("eventTime=").append(this.zzatM).append(",");
    if ((this.zzatO != null) && (!this.zzatO.isEmpty()))
    {
      localStringBuilder.append("keyValues=");
      Iterator localIterator = this.zzatO.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localStringBuilder.append("(").append(str).append(",");
        localStringBuilder.append(this.zzatO.getString(str)).append(")");
        localStringBuilder.append(" ");
      }
    }
    return localStringBuilder.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzth.zza(this, paramParcel, paramInt);
  }
}