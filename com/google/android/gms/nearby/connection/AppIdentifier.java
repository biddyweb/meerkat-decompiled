package com.google.android.gms.nearby.connection;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public final class AppIdentifier
  implements SafeParcelable
{
  public static final AppIdentifierCreator CREATOR = new AppIdentifierCreator();
  private final int zzFG;
  private final String zzZN;

  AppIdentifier(int paramInt, String paramString)
  {
    this.zzFG = paramInt;
    this.zzZN = zzx.zzb(paramString, "Missing application identifier value");
  }

  public AppIdentifier(String paramString)
  {
    this(1, paramString);
  }

  public int describeContents()
  {
    return 0;
  }

  public String getIdentifier()
  {
    return this.zzZN;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    AppIdentifierCreator.zza(this, paramParcel, paramInt);
  }
}