package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.wearable.MessageEvent;

public class zzal
  implements SafeParcelable, MessageEvent
{
  public static final Parcelable.Creator<zzal> CREATOR = new zzam();
  final int zzFG;
  private final int zzRV;
  private final String zzaGw;
  private final byte[] zzakd;
  private final String zzanN;

  zzal(int paramInt1, int paramInt2, String paramString1, byte[] paramArrayOfByte, String paramString2)
  {
    this.zzFG = paramInt1;
    this.zzRV = paramInt2;
    this.zzaGw = paramString1;
    this.zzakd = paramArrayOfByte;
    this.zzanN = paramString2;
  }

  public int describeContents()
  {
    return 0;
  }

  public byte[] getData()
  {
    return this.zzakd;
  }

  public String getPath()
  {
    return this.zzaGw;
  }

  public int getRequestId()
  {
    return this.zzRV;
  }

  public String getSourceNodeId()
  {
    return this.zzanN;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder().append("MessageEventParcelable[").append(this.zzRV).append(",").append(this.zzaGw).append(", size=");
    if (this.zzakd == null);
    for (Object localObject = "null"; ; localObject = Integer.valueOf(this.zzakd.length))
      return localObject + "]";
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzam.zza(this, paramParcel, paramInt);
  }
}