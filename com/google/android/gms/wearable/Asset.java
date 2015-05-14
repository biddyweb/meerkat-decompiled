package com.google.android.gms.wearable;

import android.net.Uri;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;

public class Asset
  implements SafeParcelable
{
  public static final Parcelable.Creator<Asset> CREATOR = new zzc();
  public Uri uri;
  final int zzFG;
  private String zzaFr;
  public ParcelFileDescriptor zzaFs;
  private byte[] zzakd;

  Asset(int paramInt, byte[] paramArrayOfByte, String paramString, ParcelFileDescriptor paramParcelFileDescriptor, Uri paramUri)
  {
    this.zzFG = paramInt;
    this.zzakd = paramArrayOfByte;
    this.zzaFr = paramString;
    this.zzaFs = paramParcelFileDescriptor;
    this.uri = paramUri;
  }

  public static Asset createFromBytes(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null)
      throw new IllegalArgumentException("Asset data cannot be null");
    return new Asset(1, paramArrayOfByte, null, null, null);
  }

  public static Asset createFromFd(ParcelFileDescriptor paramParcelFileDescriptor)
  {
    if (paramParcelFileDescriptor == null)
      throw new IllegalArgumentException("Asset fd cannot be null");
    return new Asset(1, null, null, paramParcelFileDescriptor, null);
  }

  public static Asset createFromRef(String paramString)
  {
    if (paramString == null)
      throw new IllegalArgumentException("Asset digest cannot be null");
    return new Asset(1, null, paramString, null, null);
  }

  public static Asset createFromUri(Uri paramUri)
  {
    if (paramUri == null)
      throw new IllegalArgumentException("Asset uri cannot be null");
    return new Asset(1, null, null, null, paramUri);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    Asset localAsset;
    do
    {
      return true;
      if (!(paramObject instanceof Asset))
        return false;
      localAsset = (Asset)paramObject;
    }
    while ((zzw.equal(this.zzakd, localAsset.zzakd)) && (zzw.equal(this.zzaFr, localAsset.zzaFr)) && (zzw.equal(this.zzaFs, localAsset.zzaFs)) && (zzw.equal(this.uri, localAsset.uri)));
    return false;
  }

  public byte[] getData()
  {
    return this.zzakd;
  }

  public String getDigest()
  {
    return this.zzaFr;
  }

  public ParcelFileDescriptor getFd()
  {
    return this.zzaFs;
  }

  public Uri getUri()
  {
    return this.uri;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = this.zzakd;
    arrayOfObject[1] = this.zzaFr;
    arrayOfObject[2] = this.zzaFs;
    arrayOfObject[3] = this.uri;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("Asset[@");
    localStringBuilder.append(Integer.toHexString(hashCode()));
    if (this.zzaFr == null)
      localStringBuilder.append(", nodigest");
    while (true)
    {
      if (this.zzakd != null)
      {
        localStringBuilder.append(", size=");
        localStringBuilder.append(this.zzakd.length);
      }
      if (this.zzaFs != null)
      {
        localStringBuilder.append(", fd=");
        localStringBuilder.append(this.zzaFs);
      }
      if (this.uri != null)
      {
        localStringBuilder.append(", uri=");
        localStringBuilder.append(this.uri);
      }
      localStringBuilder.append("]");
      return localStringBuilder.toString();
      localStringBuilder.append(", ");
      localStringBuilder.append(this.zzaFr);
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt | 0x1);
  }
}