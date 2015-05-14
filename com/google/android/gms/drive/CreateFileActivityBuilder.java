package com.google.android.gms.drive;

import android.content.IntentSender;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.internal.zzi;
import com.google.android.gms.drive.internal.zzs;
import com.google.android.gms.internal.zzlz;

public class CreateFileActivityBuilder
{
  public static final String EXTRA_RESPONSE_DRIVE_ID = "response_drive_id";
  private final zzi zzRZ = new zzi(0);
  private DriveContents zzSa;
  private boolean zzSb;

  public IntentSender build(GoogleApiClient paramGoogleApiClient)
  {
    zzx.zzb(Boolean.valueOf(this.zzSb), "Must call setInitialDriveContents to CreateFileActivityBuilder.");
    if ((paramGoogleApiClient.zza(Drive.SCOPE_FILE)) || (paramGoogleApiClient.zza(Drive.zzSc)));
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "The apiClient must have suitable scope to create files");
      if (this.zzSa != null)
      {
        zzlz.zza(this.zzSa.getParcelFileDescriptor());
        this.zzSa.zzkr();
      }
      return this.zzRZ.build(paramGoogleApiClient);
    }
  }

  public CreateFileActivityBuilder setActivityStartFolder(DriveId paramDriveId)
  {
    this.zzRZ.zza(paramDriveId);
    return this;
  }

  public CreateFileActivityBuilder setActivityTitle(String paramString)
  {
    this.zzRZ.zzbx(paramString);
    return this;
  }

  public CreateFileActivityBuilder setInitialDriveContents(DriveContents paramDriveContents)
  {
    if (paramDriveContents != null)
    {
      if (!(paramDriveContents instanceof zzs))
        throw new IllegalArgumentException("Only DriveContents obtained from the Drive API are accepted.");
      if (paramDriveContents.getDriveId() != null)
        throw new IllegalArgumentException("Only DriveContents obtained through DriveApi.newDriveContents are accepted for file creation.");
      if (paramDriveContents.zzks())
        throw new IllegalArgumentException("DriveContents are already closed.");
      this.zzRZ.zzbD(paramDriveContents.zzkq().getRequestId());
      this.zzSa = paramDriveContents;
    }
    while (true)
    {
      this.zzSb = true;
      return this;
      this.zzRZ.zzbD(1);
    }
  }

  public CreateFileActivityBuilder setInitialMetadata(MetadataChangeSet paramMetadataChangeSet)
  {
    this.zzRZ.zza(paramMetadataChangeSet);
    return this;
  }
}