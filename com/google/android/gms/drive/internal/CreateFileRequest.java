package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.ExecutionOptions;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class CreateFileRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<CreateFileRequest> CREATOR = new zzk();
  final int zzFG;
  final String zzSq;
  final Contents zzTj;
  final MetadataBundle zzTp;
  final Integer zzTq;
  final DriveId zzTr;
  final boolean zzTs;
  final int zzTt;
  final int zzTu;

  CreateFileRequest(int paramInt1, DriveId paramDriveId, MetadataBundle paramMetadataBundle, Contents paramContents, Integer paramInteger, boolean paramBoolean, String paramString, int paramInt2, int paramInt3)
  {
    if ((paramContents != null) && (paramInt3 != 0))
      if (paramContents.getRequestId() != paramInt3)
        break label67;
    label67: for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "inconsistent contents reference");
      if (((paramInteger != null) && (paramInteger.intValue() != 0)) || (paramContents != null) || (paramInt3 != 0))
        break;
      throw new IllegalArgumentException("Need a valid contents");
    }
    this.zzFG = paramInt1;
    this.zzTr = ((DriveId)zzx.zzl(paramDriveId));
    this.zzTp = ((MetadataBundle)zzx.zzl(paramMetadataBundle));
    this.zzTj = paramContents;
    this.zzTq = paramInteger;
    this.zzSq = paramString;
    this.zzTt = paramInt2;
    this.zzTs = paramBoolean;
    this.zzTu = paramInt3;
  }

  public CreateFileRequest(DriveId paramDriveId, MetadataBundle paramMetadataBundle, int paramInt1, int paramInt2, ExecutionOptions paramExecutionOptions)
  {
    this(2, paramDriveId, paramMetadataBundle, null, Integer.valueOf(paramInt2), paramExecutionOptions.zzku(), paramExecutionOptions.zzkt(), paramExecutionOptions.zzkv(), paramInt1);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzk.zza(this, paramParcel, paramInt);
  }
}