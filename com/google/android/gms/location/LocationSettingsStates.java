package com.google.android.gms.location;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.safeparcel.zzc;

public class LocationSettingsStates
  implements SafeParcelable
{
  public static final Parcelable.Creator<LocationSettingsStates> CREATOR = new zzk();
  private final int zzFG;
  private final boolean zzamq;
  private final boolean zzamr;
  private final boolean zzams;
  private final boolean zzamt;
  private final boolean zzamu;
  private final boolean zzamv;

  LocationSettingsStates(int paramInt, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, boolean paramBoolean6)
  {
    this.zzFG = paramInt;
    this.zzamq = paramBoolean1;
    this.zzamr = paramBoolean2;
    this.zzams = paramBoolean3;
    this.zzamt = paramBoolean4;
    this.zzamu = paramBoolean5;
    this.zzamv = paramBoolean6;
  }

  public static LocationSettingsStates fromIntent(Intent paramIntent)
  {
    return (LocationSettingsStates)zzc.zza(paramIntent, "com.google.android.gms.location.LOCATION_SETTINGS_STATES", CREATOR);
  }

  public int describeContents()
  {
    return 0;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public boolean isBlePresent()
  {
    return this.zzamv;
  }

  public boolean isBleUsable()
  {
    return this.zzams;
  }

  public boolean isGpsPresent()
  {
    return this.zzamt;
  }

  public boolean isGpsUsable()
  {
    return this.zzamq;
  }

  public boolean isLocationPresent()
  {
    return (this.zzamt) || (this.zzamu);
  }

  public boolean isLocationUsable()
  {
    return (this.zzamq) || (this.zzamr);
  }

  public boolean isNetworkLocationPresent()
  {
    return this.zzamu;
  }

  public boolean isNetworkLocationUsable()
  {
    return this.zzamr;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzk.zza(this, paramParcel, paramInt);
  }
}