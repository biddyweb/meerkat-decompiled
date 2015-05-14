package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.util.Base64;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.internal.zzan;
import com.google.android.gms.drive.internal.zzw;
import com.google.android.gms.internal.zzwx;
import com.google.android.gms.internal.zzwy;

public class DriveId
  implements SafeParcelable
{
  public static final Parcelable.Creator<DriveId> CREATOR = new zzd();
  public static final int RESOURCE_TYPE_FILE = 0;
  public static final int RESOURCE_TYPE_FOLDER = 1;
  public static final int RESOURCE_TYPE_UNKNOWN = -1;
  final int zzFG;
  final long zzRS;
  private volatile String zzRU = null;
  final String zzSh;
  final long zzSi;
  final int zzSj;

  DriveId(int paramInt1, String paramString, long paramLong1, long paramLong2, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzSh = paramString;
    if (!"".equals(paramString));
    for (boolean bool1 = true; ; bool1 = false)
    {
      zzx.zzO(bool1);
      boolean bool2;
      if (paramString == null)
      {
        boolean bool3 = paramLong1 < -1L;
        bool2 = false;
        if (!bool3);
      }
      else
      {
        bool2 = true;
      }
      zzx.zzO(bool2);
      this.zzSi = paramLong1;
      this.zzRS = paramLong2;
      this.zzSj = paramInt2;
      return;
    }
  }

  public DriveId(String paramString, long paramLong1, long paramLong2, int paramInt)
  {
    this(1, paramString, paramLong1, paramLong2, paramInt);
  }

  public static DriveId decodeFromString(String paramString)
  {
    zzx.zzb(paramString.startsWith("DriveId:"), "Invalid DriveId: " + paramString);
    return zzg(Base64.decode(paramString.substring("DriveId:".length()), 10));
  }

  public static DriveId zzbu(String paramString)
  {
    zzx.zzl(paramString);
    return new DriveId(paramString, -1L, -1L, -1);
  }

  static DriveId zzg(byte[] paramArrayOfByte)
  {
    while (true)
    {
      zzan localzzan;
      try
      {
        localzzan = zzan.zzh(paramArrayOfByte);
        if ("".equals(localzzan.zzUI))
        {
          str = null;
          return new DriveId(localzzan.versionCode, str, localzzan.zzUJ, localzzan.zzUG, localzzan.zzUK);
        }
      }
      catch (zzwx localzzwx)
      {
        throw new IllegalArgumentException();
      }
      String str = localzzan.zzUI;
    }
  }

  public int describeContents()
  {
    return 0;
  }

  public final String encodeToString()
  {
    if (this.zzRU == null)
    {
      String str = Base64.encodeToString(zzkn(), 10);
      this.zzRU = ("DriveId:" + str);
    }
    return this.zzRU;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof DriveId));
    DriveId localDriveId;
    do
    {
      return false;
      localDriveId = (DriveId)paramObject;
      if (localDriveId.zzRS != this.zzRS)
      {
        zzw.zzr("DriveId", "Attempt to compare invalid DriveId detected. Has local storage been cleared?");
        return false;
      }
      if ((localDriveId.zzSi == -1L) && (this.zzSi == -1L))
        return localDriveId.zzSh.equals(this.zzSh);
    }
    while (localDriveId.zzSi != this.zzSi);
    return true;
  }

  public String getResourceId()
  {
    return this.zzSh;
  }

  public int getResourceType()
  {
    return this.zzSj;
  }

  public int hashCode()
  {
    if (this.zzSi == -1L)
      return this.zzSh.hashCode();
    return (String.valueOf(this.zzRS) + String.valueOf(this.zzSi)).hashCode();
  }

  public String toString()
  {
    return encodeToString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzd.zza(this, paramParcel, paramInt);
  }

  final byte[] zzkn()
  {
    zzan localzzan = new zzan();
    localzzan.versionCode = this.zzFG;
    if (this.zzSh == null);
    for (String str = ""; ; str = this.zzSh)
    {
      localzzan.zzUI = str;
      localzzan.zzUJ = this.zzSi;
      localzzan.zzUG = this.zzRS;
      localzzan.zzUK = this.zzSj;
      return zzwy.zzf(localzzan);
    }
  }
}