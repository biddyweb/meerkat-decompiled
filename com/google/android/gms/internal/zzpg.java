package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.location.LocationRequest;
import java.util.Collections;
import java.util.List;

public class zzpg
  implements SafeParcelable
{
  public static final zzph CREATOR = new zzph();
  static final List<zzox> zzang = Collections.emptyList();
  final String mTag;
  private final int zzFG;
  LocationRequest zzabx;
  boolean zzanh;
  boolean zzani;
  boolean zzanj;
  List<zzox> zzank;

  zzpg(int paramInt, LocationRequest paramLocationRequest, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, List<zzox> paramList, String paramString)
  {
    this.zzFG = paramInt;
    this.zzabx = paramLocationRequest;
    this.zzanh = paramBoolean1;
    this.zzani = paramBoolean2;
    this.zzanj = paramBoolean3;
    this.zzank = paramList;
    this.mTag = paramString;
  }

  private zzpg(String paramString, LocationRequest paramLocationRequest)
  {
    this(1, paramLocationRequest, false, true, true, zzang, paramString);
  }

  public static zzpg zza(String paramString, LocationRequest paramLocationRequest)
  {
    return new zzpg(paramString, paramLocationRequest);
  }

  public static zzpg zzb(LocationRequest paramLocationRequest)
  {
    return zza(null, paramLocationRequest);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof zzpg));
    zzpg localzzpg;
    do
    {
      return false;
      localzzpg = (zzpg)paramObject;
    }
    while ((!zzw.equal(this.zzabx, localzzpg.zzabx)) || (this.zzanh != localzzpg.zzanh) || (this.zzani != localzzpg.zzani) || (this.zzanj != localzzpg.zzanj) || (!zzw.equal(this.zzank, localzzpg.zzank)));
    return true;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    return this.zzabx.hashCode();
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(this.zzabx.toString());
    localStringBuilder.append(" requestNlpDebugInfo=");
    localStringBuilder.append(this.zzanh);
    localStringBuilder.append(" restorePendingIntentListeners=");
    localStringBuilder.append(this.zzani);
    localStringBuilder.append(" triggerUpdate=");
    localStringBuilder.append(this.zzanj);
    localStringBuilder.append(" clients=");
    localStringBuilder.append(this.zzank);
    if (this.mTag != null)
    {
      localStringBuilder.append(" tag=");
      localStringBuilder.append(this.mTag);
    }
    return localStringBuilder.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzph.zza(this, paramParcel, paramInt);
  }
}