package com.google.android.gms.drive.internal;

import android.os.ParcelFileDescriptor;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.drive.DriveApi.DriveContentsResult;
import com.google.android.gms.drive.DriveContents;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.ExecutionOptions;
import com.google.android.gms.drive.ExecutionOptions.Builder;
import com.google.android.gms.drive.MetadataChangeSet;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import java.io.InputStream;
import java.io.OutputStream;

public class zzs
  implements DriveContents
{
  private boolean mClosed = false;
  private final Contents zzTO;
  private boolean zzTP = false;
  private boolean zzTQ = false;

  public zzs(Contents paramContents)
  {
    this.zzTO = ((Contents)zzx.zzl(paramContents));
  }

  public PendingResult<Status> commit(GoogleApiClient paramGoogleApiClient, MetadataChangeSet paramMetadataChangeSet)
  {
    return commit(paramGoogleApiClient, paramMetadataChangeSet, null);
  }

  public PendingResult<Status> commit(GoogleApiClient paramGoogleApiClient, final MetadataChangeSet paramMetadataChangeSet, final ExecutionOptions paramExecutionOptions)
  {
    if (paramExecutionOptions == null)
      paramExecutionOptions = new ExecutionOptions.Builder().build();
    if (this.zzTO.getMode() == 268435456)
      throw new IllegalStateException("Cannot commit contents opened with MODE_READ_ONLY");
    if ((ExecutionOptions.zzbl(paramExecutionOptions.zzkv())) && (!this.zzTO.zzko()))
      throw new IllegalStateException("DriveContents must be valid for conflict detection.");
    ExecutionOptions.zza(paramGoogleApiClient, paramExecutionOptions);
    if (zzks())
      throw new IllegalStateException("DriveContents already closed.");
    if (getDriveId() == null)
      throw new IllegalStateException("Only DriveContents obtained through DriveFile.open can be committed.");
    if (paramMetadataChangeSet != null);
    while (true)
    {
      zzkr();
      return paramGoogleApiClient.zzb(new zzq.zza(paramGoogleApiClient)
      {
        protected void zza(zzr paramAnonymouszzr)
          throws RemoteException
        {
          paramMetadataChangeSet.zzkx().setContext(paramAnonymouszzr.getContext());
          paramAnonymouszzr.zzkF().zza(new CloseContentsAndUpdateMetadataRequest(zzs.zza(zzs.this).getDriveId(), paramMetadataChangeSet.zzkx(), zzs.zza(zzs.this), paramExecutionOptions), new zzbl(this));
        }
      });
      paramMetadataChangeSet = MetadataChangeSet.zzSv;
    }
  }

  public void discard(GoogleApiClient paramGoogleApiClient)
  {
    if (zzks())
      throw new IllegalStateException("DriveContents already closed.");
    zzkr();
    ((4)paramGoogleApiClient.zzb(new zzq.zza(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new CloseContentsRequest(zzs.zza(zzs.this), false), new zzbl(this));
      }
    })).setResultCallback(new ResultCallback()
    {
      public void zzi(Status paramAnonymousStatus)
      {
        if (!paramAnonymousStatus.isSuccess())
        {
          zzw.zzs("DriveContentsImpl", "Error discarding contents");
          return;
        }
        zzw.zzq("DriveContentsImpl", "Contents discarded");
      }
    });
  }

  public DriveId getDriveId()
  {
    return this.zzTO.getDriveId();
  }

  public InputStream getInputStream()
  {
    if (zzks())
      throw new IllegalStateException("Contents have been closed, cannot access the input stream.");
    if (this.zzTO.getMode() != 268435456)
      throw new IllegalStateException("getInputStream() can only be used with contents opened with MODE_READ_ONLY.");
    if (this.zzTP)
      throw new IllegalStateException("getInputStream() can only be called once per Contents instance.");
    this.zzTP = true;
    return this.zzTO.getInputStream();
  }

  public int getMode()
  {
    return this.zzTO.getMode();
  }

  public OutputStream getOutputStream()
  {
    if (zzks())
      throw new IllegalStateException("Contents have been closed, cannot access the output stream.");
    if (this.zzTO.getMode() != 536870912)
      throw new IllegalStateException("getOutputStream() can only be used with contents opened with MODE_WRITE_ONLY.");
    if (this.zzTQ)
      throw new IllegalStateException("getOutputStream() can only be called once per Contents instance.");
    this.zzTQ = true;
    return this.zzTO.getOutputStream();
  }

  public ParcelFileDescriptor getParcelFileDescriptor()
  {
    if (zzks())
      throw new IllegalStateException("Contents have been closed, cannot access the output stream.");
    return this.zzTO.getParcelFileDescriptor();
  }

  public PendingResult<DriveApi.DriveContentsResult> reopenForWrite(GoogleApiClient paramGoogleApiClient)
  {
    if (zzks())
      throw new IllegalStateException("DriveContents already closed.");
    if (this.zzTO.getMode() != 268435456)
      throw new IllegalStateException("reopenForWrite can only be used with DriveContents opened with MODE_READ_ONLY.");
    zzkr();
    return paramGoogleApiClient.zza(new zzp.zzb(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new OpenContentsRequest(zzs.this.getDriveId(), 536870912, zzs.zza(zzs.this).getRequestId()), new zzbe(this, null));
      }
    });
  }

  public Contents zzkq()
  {
    return this.zzTO;
  }

  public void zzkr()
  {
    this.mClosed = true;
  }

  public boolean zzks()
  {
    return this.mClosed;
  }
}