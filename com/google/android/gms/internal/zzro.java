package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public class zzro
  implements SafeParcelable
{
  public static final zzrp CREATOR = new zzrp();
  private final byte[] content;
  private final String type;
  final int versionCode;

  zzro(int paramInt, byte[] paramArrayOfByte, String paramString)
  {
    if (paramArrayOfByte.length <= 1000);
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Integer.valueOf(paramArrayOfByte.length);
      arrayOfObject[1] = Integer.valueOf(1000);
      zzx.zzb(bool, "Content length(%d) must not exceed MAX_CONTENT_SIZE_BYTES(%d)", arrayOfObject);
      this.versionCode = paramInt;
      this.content = ((byte[])zzx.zzl(paramArrayOfByte));
      this.type = ((String)zzx.zzl(paramString));
      return;
    }
  }

  public int describeContents()
  {
    return 0;
  }

  public String getType()
  {
    return this.type;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzrp.zza(this, paramParcel, paramInt);
  }

  public byte[] zzro()
  {
    return this.content;
  }
}