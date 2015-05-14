package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class CreateFolderRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<CreateFolderRequest> CREATOR = new zzl();
  final int zzFG;
  final MetadataBundle zzTp;
  final DriveId zzTr;

  CreateFolderRequest(int paramInt, DriveId paramDriveId, MetadataBundle paramMetadataBundle)
  {
    this.zzFG = paramInt;
    this.zzTr = ((DriveId)zzx.zzl(paramDriveId));
    this.zzTp = ((MetadataBundle)zzx.zzl(paramMetadataBundle));
  }

  public CreateFolderRequest(DriveId paramDriveId, MetadataBundle paramMetadataBundle)
  {
    this(1, paramDriveId, paramMetadataBundle);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzl.zza(this, paramParcel, paramInt);
  }
}