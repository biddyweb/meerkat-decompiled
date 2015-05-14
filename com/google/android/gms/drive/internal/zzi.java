package com.google.android.gms.drive.internal;

import android.content.IntentSender;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.Drive;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.MetadataChangeSet;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class zzi
{
  private DriveId zzSA;
  private String zzSy;
  protected MetadataChangeSet zzTm;
  private Integer zzTn;
  private final int zzTo;

  public zzi(int paramInt)
  {
    this.zzTo = paramInt;
  }

  public IntentSender build(GoogleApiClient paramGoogleApiClient)
  {
    zzx.zzb(this.zzTm, "Must provide initial metadata to CreateFileActivityBuilder.");
    zzx.zza(paramGoogleApiClient.isConnected(), "Client must be connected");
    zzr localzzr = (zzr)paramGoogleApiClient.zza(Drive.zzGR);
    this.zzTm.zzkx().setContext(localzzr.getContext());
    int i;
    if (this.zzTn == null)
      i = -1;
    try
    {
      while (true)
      {
        IntentSender localIntentSender = localzzr.zzkF().zza(new CreateFileIntentSenderRequest(this.zzTm.zzkx(), i, this.zzSy, this.zzSA, this.zzTo));
        return localIntentSender;
        i = this.zzTn.intValue();
      }
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeException("Unable to connect Drive Play Service", localRemoteException);
    }
  }

  public void zza(DriveId paramDriveId)
  {
    this.zzSA = ((DriveId)zzx.zzl(paramDriveId));
  }

  public void zza(MetadataChangeSet paramMetadataChangeSet)
  {
    this.zzTm = ((MetadataChangeSet)zzx.zzl(paramMetadataChangeSet));
  }

  public void zzbD(int paramInt)
  {
    this.zzTn = Integer.valueOf(paramInt);
  }

  public void zzbx(String paramString)
  {
    this.zzSy = ((String)zzx.zzl(paramString));
  }
}