package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class zzlm
  implements SafeParcelable
{
  public static final zzln CREATOR = new zzln();
  final int zzFG;
  private final long zzRi;
  private String zzRj;
  private final String zzRk;
  private final String zzRl;
  private final String zzRm;
  private final String zzRn;
  private final String zzRo;
  private final long zzRp;
  private long zzRq;

  zzlm(int paramInt, long paramLong1, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, long paramLong2)
  {
    this.zzFG = paramInt;
    this.zzRi = paramLong1;
    this.zzRj = paramString1;
    this.zzRk = paramString2;
    this.zzRl = paramString3;
    this.zzRm = paramString4;
    this.zzRn = paramString5;
    this.zzRq = -1L;
    this.zzRo = paramString6;
    this.zzRp = paramLong2;
  }

  public zzlm(long paramLong1, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, long paramLong2)
  {
    this(1, paramLong1, paramString1, paramString2, paramString3, paramString4, paramString5, paramString6, paramLong2);
  }

  public int describeContents()
  {
    return 0;
  }

  public long getTimeMillis()
  {
    return this.zzRi;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzln.zza(this, paramParcel, paramInt);
  }

  public String zzjT()
  {
    return this.zzRj;
  }

  public String zzjU()
  {
    return this.zzRk;
  }

  public String zzjV()
  {
    return this.zzRl;
  }

  public String zzjW()
  {
    return this.zzRm;
  }

  public String zzjX()
  {
    return this.zzRn;
  }

  public String zzjY()
  {
    return this.zzRo;
  }

  public long zzjZ()
  {
    return this.zzRp;
  }
}