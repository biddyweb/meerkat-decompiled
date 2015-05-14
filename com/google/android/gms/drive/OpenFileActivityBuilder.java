package com.google.android.gms.drive;

import android.content.IntentSender;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.internal.OpenFileIntentSenderRequest;
import com.google.android.gms.drive.internal.zzag;
import com.google.android.gms.drive.internal.zzr;

public class OpenFileActivityBuilder
{
  public static final String EXTRA_RESPONSE_DRIVE_ID = "response_drive_id";
  private DriveId zzSA;
  private String zzSy;
  private String[] zzSz;

  public IntentSender build(GoogleApiClient paramGoogleApiClient)
  {
    zzx.zza(paramGoogleApiClient.isConnected(), "Client must be connected");
    if (this.zzSz == null)
      this.zzSz = new String[0];
    try
    {
      IntentSender localIntentSender = ((zzr)paramGoogleApiClient.zza(Drive.zzGR)).zzkF().zza(new OpenFileIntentSenderRequest(this.zzSy, this.zzSz, this.zzSA));
      return localIntentSender;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeException("Unable to connect Drive Play Service", localRemoteException);
    }
  }

  public OpenFileActivityBuilder setActivityStartFolder(DriveId paramDriveId)
  {
    this.zzSA = ((DriveId)zzx.zzl(paramDriveId));
    return this;
  }

  public OpenFileActivityBuilder setActivityTitle(String paramString)
  {
    this.zzSy = ((String)zzx.zzl(paramString));
    return this;
  }

  public OpenFileActivityBuilder setMimeType(String[] paramArrayOfString)
  {
    if (paramArrayOfString != null);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "mimeTypes may not be null");
      this.zzSz = paramArrayOfString;
      return this;
    }
  }
}