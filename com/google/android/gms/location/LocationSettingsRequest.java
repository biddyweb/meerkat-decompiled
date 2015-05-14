package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

public class LocationSettingsRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<LocationSettingsRequest> CREATOR = new zzj();
  private final int zzFG;
  private final List<LocationRequest> zzabu;
  private final boolean zzamm;
  private final boolean zzamn;

  LocationSettingsRequest(int paramInt, List<LocationRequest> paramList, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.zzFG = paramInt;
    this.zzabu = paramList;
    this.zzamm = paramBoolean1;
    this.zzamn = paramBoolean2;
  }

  private LocationSettingsRequest(List<LocationRequest> paramList, boolean paramBoolean1, boolean paramBoolean2)
  {
    this(1, paramList, paramBoolean1, paramBoolean2);
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
    zzj.zza(this, paramParcel, paramInt);
  }

  public List<LocationRequest> zzme()
  {
    return Collections.unmodifiableList(this.zzabu);
  }

  public boolean zzps()
  {
    return this.zzamm;
  }

  public boolean zzpt()
  {
    return this.zzamn;
  }

  public static final class Builder
  {
    private boolean zzamm = false;
    private boolean zzamn = false;
    private final ArrayList<LocationRequest> zzamo = new ArrayList();

    public Builder addAllLocationRequests(Collection<LocationRequest> paramCollection)
    {
      this.zzamo.addAll(paramCollection);
      return this;
    }

    public Builder addLocationRequest(LocationRequest paramLocationRequest)
    {
      this.zzamo.add(paramLocationRequest);
      return this;
    }

    public LocationSettingsRequest build()
    {
      return new LocationSettingsRequest(this.zzamo, this.zzamm, this.zzamn, null);
    }

    public Builder setAlwaysShow(boolean paramBoolean)
    {
      this.zzamm = paramBoolean;
      return this;
    }

    public Builder setNeedBle(boolean paramBoolean)
    {
      this.zzamn = paramBoolean;
      return this;
    }
  }
}