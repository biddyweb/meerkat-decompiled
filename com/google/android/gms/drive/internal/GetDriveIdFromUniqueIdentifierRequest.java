package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class GetDriveIdFromUniqueIdentifierRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<GetDriveIdFromUniqueIdentifierRequest> CREATOR = new zzae();
  final int zzFG;
  final boolean zzUA;
  final String zzUz;

  GetDriveIdFromUniqueIdentifierRequest(int paramInt, String paramString, boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzUz = paramString;
    this.zzUA = paramBoolean;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzae.zza(this, paramParcel, paramInt);
  }
}