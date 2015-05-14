package com.google.android.gms.drive.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.zze;
import com.google.android.gms.common.api.zze.zzb;
import com.google.android.gms.drive.DriveApi.DriveContentsResult;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.drive.DriveFile.DownloadProgressListener;
import com.google.android.gms.drive.DriveId;

public class zzt extends zzy
  implements DriveFile
{
  public zzt(DriveId paramDriveId)
  {
    super(paramDriveId);
  }

  private static DriveFile.DownloadProgressListener zza(GoogleApiClient paramGoogleApiClient, DriveFile.DownloadProgressListener paramDownloadProgressListener)
  {
    if (paramDownloadProgressListener == null)
      return null;
    return new zza(paramGoogleApiClient.zzf(paramDownloadProgressListener));
  }

  public PendingResult<DriveApi.DriveContentsResult> open(GoogleApiClient paramGoogleApiClient, final int paramInt, DriveFile.DownloadProgressListener paramDownloadProgressListener)
  {
    if ((paramInt != 268435456) && (paramInt != 536870912) && (paramInt != 805306368))
      throw new IllegalArgumentException("Invalid mode provided.");
    return paramGoogleApiClient.zza(new zzp.zzb(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new OpenContentsRequest(zzt.this.getDriveId(), paramInt, 0), new zzbe(this, this.zzTU));
      }
    });
  }

  private static class zza
    implements DriveFile.DownloadProgressListener
  {
    private final zze<DriveFile.DownloadProgressListener> zzTW;

    public zza(zze<DriveFile.DownloadProgressListener> paramzze)
    {
      this.zzTW = paramzze;
    }

    public void onProgress(final long paramLong1, long paramLong2)
    {
      this.zzTW.zza(new zze.zzb()
      {
        public void zza(DriveFile.DownloadProgressListener paramAnonymousDownloadProgressListener)
        {
          paramAnonymousDownloadProgressListener.onProgress(paramLong1, this.zzTY);
        }

        public void zzhX()
        {
        }
      });
    }
  }
}