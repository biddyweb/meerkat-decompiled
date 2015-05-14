package com.google.android.gms.nearby.connection;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import java.util.List;

public final class AppMetadata
  implements SafeParcelable
{
  public static final AppMetadataCreator CREATOR = new AppMetadataCreator();
  private final int zzFG;
  private final List<AppIdentifier> zzasE;

  AppMetadata(int paramInt, List<AppIdentifier> paramList)
  {
    this.zzFG = paramInt;
    this.zzasE = ((List)zzx.zzb(paramList, "Must specify application identifiers"));
    zzx.zza(paramList.size(), "Application identifiers cannot be empty");
  }

  public AppMetadata(List<AppIdentifier> paramList)
  {
    this(1, paramList);
  }

  public int describeContents()
  {
    return 0;
  }

  public List<AppIdentifier> getAppIdentifiers()
  {
    return this.zzasE;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    AppMetadataCreator.zza(this, paramParcel, paramInt);
  }
}