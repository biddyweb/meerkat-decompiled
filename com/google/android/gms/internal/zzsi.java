package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;

public class zzsi
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzsi> CREATOR = new zzsj();
  private String mimeType;
  private String type;
  private final int versionCode;
  private int zzato;
  private String zzatp;
  private String zzatq;
  private byte[] zzatr;

  private zzsi()
  {
    this.versionCode = 1;
  }

  zzsi(int paramInt1, int paramInt2, String paramString1, String paramString2, String paramString3, String paramString4, byte[] paramArrayOfByte)
  {
    this.versionCode = paramInt1;
    this.zzato = paramInt2;
    this.zzatp = paramString1;
    this.mimeType = paramString2;
    this.zzatq = paramString3;
    this.type = paramString4;
    this.zzatr = paramArrayOfByte;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    zzsi localzzsi;
    do
    {
      return true;
      if (!(paramObject instanceof zzsi))
        return false;
      localzzsi = (zzsi)paramObject;
    }
    while ((zzw.equal(Integer.valueOf(this.zzato), Integer.valueOf(localzzsi.zzato))) && (zzw.equal(this.zzatp, localzzsi.zzatp)) && (zzw.equal(this.mimeType, localzzsi.mimeType)) && (zzw.equal(this.zzatq, localzzsi.zzatq)) && (zzw.equal(this.type, localzzsi.type)) && (zzw.equal(this.zzatr, localzzsi.zzatr)));
    return false;
  }

  public int getContentType()
  {
    return this.zzato;
  }

  public String getDomain()
  {
    return this.zzatq;
  }

  public String getMimeType()
  {
    return this.mimeType;
  }

  public byte[] getPayload()
  {
    return this.zzatr;
  }

  public String getType()
  {
    return this.type;
  }

  public String getUri()
  {
    return this.zzatp;
  }

  int getVersionCode()
  {
    return this.versionCode;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[6];
    arrayOfObject[0] = Integer.valueOf(this.zzato);
    arrayOfObject[1] = this.zzatp;
    arrayOfObject[2] = this.mimeType;
    arrayOfObject[3] = this.zzatq;
    arrayOfObject[4] = this.type;
    arrayOfObject[5] = this.zzatr;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return "ShardContent[uri=" + this.zzatp + "]";
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzsj.zza(this, paramParcel, paramInt);
  }
}