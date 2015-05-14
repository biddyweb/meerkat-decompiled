package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.ChangeSequenceNumber;
import com.google.android.gms.drive.DriveSpace;
import java.util.List;
import java.util.Set;

public class GetChangesRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<GetChangesRequest> CREATOR = new zzad();
  final int zzFG;
  final ChangeSequenceNumber zzUv;
  final int zzUw;
  final List<DriveSpace> zzUx;
  private final Set<DriveSpace> zzUy;

  GetChangesRequest(int paramInt1, ChangeSequenceNumber paramChangeSequenceNumber, int paramInt2, List<DriveSpace> paramList)
  {
  }

  private GetChangesRequest(int paramInt1, ChangeSequenceNumber paramChangeSequenceNumber, int paramInt2, List<DriveSpace> paramList, Set<DriveSpace> paramSet)
  {
    this.zzFG = paramInt1;
    this.zzUv = paramChangeSequenceNumber;
    this.zzUw = paramInt2;
    this.zzUx = paramList;
    this.zzUy = paramSet;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzad.zza(this, paramParcel, paramInt);
  }
}