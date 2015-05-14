package com.google.android.gms.games.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class ConnectionInfo
  implements SafeParcelable
{
  public static final ConnectionInfoCreator CREATOR = new ConnectionInfoCreator();
  private final int zzFG;
  private final String zzadN;
  private final int zzadO;

  public ConnectionInfo(int paramInt1, String paramString, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzadN = paramString;
    this.zzadO = paramInt2;
  }

  public int describeContents()
  {
    return 0;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ConnectionInfoCreator.zza(this, paramParcel, paramInt);
  }

  public String zznl()
  {
    return this.zzadN;
  }

  public int zznm()
  {
    return this.zzadO;
  }
}