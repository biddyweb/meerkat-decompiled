package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class CreateFileIntentSenderRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<CreateFileIntentSenderRequest> CREATOR = new zzj();
  final int zzFG;
  final int zzRV;
  final DriveId zzSA;
  final String zzSy;
  final MetadataBundle zzTp;
  final Integer zzTq;

  CreateFileIntentSenderRequest(int paramInt1, MetadataBundle paramMetadataBundle, int paramInt2, String paramString, DriveId paramDriveId, Integer paramInteger)
  {
    this.zzFG = paramInt1;
    this.zzTp = paramMetadataBundle;
    this.zzRV = paramInt2;
    this.zzSy = paramString;
    this.zzSA = paramDriveId;
    this.zzTq = paramInteger;
  }

  public CreateFileIntentSenderRequest(MetadataBundle paramMetadataBundle, int paramInt1, String paramString, DriveId paramDriveId, int paramInt2)
  {
    this(1, paramMetadataBundle, paramInt1, paramString, paramDriveId, Integer.valueOf(paramInt2));
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzj.zza(this, paramParcel, paramInt);
  }
}