package com.google.android.gms.games.internal;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class PopupLocationInfoParcelable
  implements SafeParcelable
{
  public static final PopupLocationInfoParcelableCreator CREATOR = new PopupLocationInfoParcelableCreator();
  private final int zzFG;
  private final Bundle zzafr;
  private final IBinder zzafs;

  PopupLocationInfoParcelable(int paramInt, Bundle paramBundle, IBinder paramIBinder)
  {
    this.zzFG = paramInt;
    this.zzafr = paramBundle;
    this.zzafs = paramIBinder;
  }

  public PopupLocationInfoParcelable(PopupManager.PopupLocationInfo paramPopupLocationInfo)
  {
    this.zzFG = 1;
    this.zzafr = paramPopupLocationInfo.zzob();
    this.zzafs = paramPopupLocationInfo.zzafv;
  }

  public int describeContents()
  {
    return 0;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public IBinder getWindowToken()
  {
    return this.zzafs;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    PopupLocationInfoParcelableCreator.zza(this, paramParcel, paramInt);
  }

  public Bundle zzob()
  {
    return this.zzafr;
  }
}