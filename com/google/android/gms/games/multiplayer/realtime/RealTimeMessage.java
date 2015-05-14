package com.google.android.gms.games.multiplayer.realtime;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.zzx;

public final class RealTimeMessage
  implements Parcelable
{
  public static final Parcelable.Creator<RealTimeMessage> CREATOR = new Parcelable.Creator()
  {
    public RealTimeMessage zzdg(Parcel paramAnonymousParcel)
    {
      return new RealTimeMessage(paramAnonymousParcel, null);
    }

    public RealTimeMessage[] zzeX(int paramAnonymousInt)
    {
      return new RealTimeMessage[paramAnonymousInt];
    }
  };
  public static final int RELIABLE = 1;
  public static final int UNRELIABLE;
  private final String zzajI;
  private final byte[] zzajJ;
  private final int zzajK;

  private RealTimeMessage(Parcel paramParcel)
  {
    this(paramParcel.readString(), paramParcel.createByteArray(), paramParcel.readInt());
  }

  public RealTimeMessage(String paramString, byte[] paramArrayOfByte, int paramInt)
  {
    this.zzajI = ((String)zzx.zzl(paramString));
    this.zzajJ = ((byte[])((byte[])zzx.zzl(paramArrayOfByte)).clone());
    this.zzajK = paramInt;
  }

  public int describeContents()
  {
    return 0;
  }

  public byte[] getMessageData()
  {
    return this.zzajJ;
  }

  public String getSenderParticipantId()
  {
    return this.zzajI;
  }

  public boolean isReliable()
  {
    return this.zzajK == 1;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.zzajI);
    paramParcel.writeByteArray(this.zzajJ);
    paramParcel.writeInt(this.zzajK);
  }
}