package com.google.android.gms.location;

import android.os.Parcel;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class LocationSettingsResult
  implements Result, SafeParcelable
{
  public static final LocationSettingsResultCreator CREATOR = new LocationSettingsResultCreator();
  private final int zzFG;
  private final Status zzHb;
  private final LocationSettingsStates zzamp;

  LocationSettingsResult(int paramInt, Status paramStatus, LocationSettingsStates paramLocationSettingsStates)
  {
    this.zzFG = paramInt;
    this.zzHb = paramStatus;
    this.zzamp = paramLocationSettingsStates;
  }

  public LocationSettingsResult(Status paramStatus)
  {
    this(1, paramStatus, null);
  }

  public int describeContents()
  {
    return 0;
  }

  public LocationSettingsStates getLocationSettingsStates()
  {
    return this.zzamp;
  }

  public Status getStatus()
  {
    return this.zzHb;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    LocationSettingsResultCreator.zza(this, paramParcel, paramInt);
  }
}