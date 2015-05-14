package com.google.android.gms.drive.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.drive.DriveApi.DriveContentsResult;
import com.google.android.gms.drive.DriveFile.DownloadProgressListener;

class zzbe extends zzc
{
  private final zza.zzb<DriveApi.DriveContentsResult> zzHa;
  private final DriveFile.DownloadProgressListener zzVc;

  zzbe(zza.zzb<DriveApi.DriveContentsResult> paramzzb, DriveFile.DownloadProgressListener paramDownloadProgressListener)
  {
    this.zzHa = paramzzb;
    this.zzVc = paramDownloadProgressListener;
  }

  public void zza(OnContentsResponse paramOnContentsResponse)
    throws RemoteException
  {
    if (paramOnContentsResponse.zzkM());
    for (Status localStatus = new Status(-1); ; localStatus = Status.zzNo)
    {
      this.zzHa.zzd(new zzp.zza(localStatus, new zzs(paramOnContentsResponse.zzkL())));
      return;
    }
  }

  public void zza(OnDownloadProgressResponse paramOnDownloadProgressResponse)
    throws RemoteException
  {
    if (this.zzVc != null)
      this.zzVc.onProgress(paramOnDownloadProgressResponse.zzkO(), paramOnDownloadProgressResponse.zzkP());
  }

  public void zzm(Status paramStatus)
    throws RemoteException
  {
    this.zzHa.zzd(new zzp.zza(paramStatus, null));
  }
}