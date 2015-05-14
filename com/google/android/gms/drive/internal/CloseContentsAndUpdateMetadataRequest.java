package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.ExecutionOptions;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class CloseContentsAndUpdateMetadataRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<CloseContentsAndUpdateMetadataRequest> CREATOR = new zzf();
  final int zzFG;
  final String zzSq;
  final boolean zzSr;
  final DriveId zzTh;
  final MetadataBundle zzTi;
  final Contents zzTj;
  final int zzTk;

  CloseContentsAndUpdateMetadataRequest(int paramInt1, DriveId paramDriveId, MetadataBundle paramMetadataBundle, Contents paramContents, boolean paramBoolean, String paramString, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzTh = paramDriveId;
    this.zzTi = paramMetadataBundle;
    this.zzTj = paramContents;
    this.zzSr = paramBoolean;
    this.zzSq = paramString;
    this.zzTk = paramInt2;
  }

  public CloseContentsAndUpdateMetadataRequest(DriveId paramDriveId, MetadataBundle paramMetadataBundle, Contents paramContents, ExecutionOptions paramExecutionOptions)
  {
    this(1, paramDriveId, paramMetadataBundle, paramContents, paramExecutionOptions.zzku(), paramExecutionOptions.zzkt(), paramExecutionOptions.zzkv());
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzf.zza(this, paramParcel, paramInt);
  }
}