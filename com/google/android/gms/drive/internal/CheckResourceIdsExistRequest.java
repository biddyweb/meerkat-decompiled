package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.List;

public class CheckResourceIdsExistRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<CheckResourceIdsExistRequest> CREATOR = new zze();
  private final int zzFG;
  private final List<String> zzTg;

  CheckResourceIdsExistRequest(int paramInt, List<String> paramList)
  {
    this.zzFG = paramInt;
    this.zzTg = paramList;
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
    zze.zza(this, paramParcel, paramInt);
  }

  public List<String> zzkE()
  {
    return this.zzTg;
  }
}