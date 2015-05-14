package com.google.android.gms.drive.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.drive.DriveApi.MetadataBufferResult;
import com.google.android.gms.drive.DriveContents;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.drive.DriveFolder;
import com.google.android.gms.drive.DriveFolder.DriveFileResult;
import com.google.android.gms.drive.DriveFolder.DriveFolderResult;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.ExecutionOptions;
import com.google.android.gms.drive.ExecutionOptions.Builder;
import com.google.android.gms.drive.MetadataChangeSet;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.drive.query.Filters;
import com.google.android.gms.drive.query.Query;
import com.google.android.gms.drive.query.Query.Builder;
import com.google.android.gms.drive.query.SearchableField;

public class zzv extends zzy
  implements DriveFolder
{
  public zzv(DriveId paramDriveId)
  {
    super(paramDriveId);
  }

  private PendingResult<DriveFolder.DriveFileResult> zza(GoogleApiClient paramGoogleApiClient, final MetadataChangeSet paramMetadataChangeSet, final int paramInt1, final int paramInt2, final ExecutionOptions paramExecutionOptions)
  {
    ExecutionOptions.zza(paramGoogleApiClient, paramExecutionOptions);
    return paramGoogleApiClient.zzb(new zzd(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramMetadataChangeSet.zzkx().setContext(paramAnonymouszzr.getContext());
        CreateFileRequest localCreateFileRequest = new CreateFileRequest(zzv.this.getDriveId(), paramMetadataChangeSet.zzkx(), paramInt1, paramInt2, paramExecutionOptions);
        paramAnonymouszzr.zzkF().zza(localCreateFileRequest, new zzv.zza(this));
      }
    });
  }

  private PendingResult<DriveFolder.DriveFileResult> zza(GoogleApiClient paramGoogleApiClient, MetadataChangeSet paramMetadataChangeSet, DriveContents paramDriveContents, ExecutionOptions paramExecutionOptions)
  {
    int i;
    if (paramDriveContents != null)
    {
      if (!(paramDriveContents instanceof zzs))
        throw new IllegalArgumentException("Only DriveContents obtained from the Drive API are accepted.");
      if (paramDriveContents.getDriveId() != null)
        throw new IllegalArgumentException("Only DriveContents obtained through DriveApi.newDriveContents are accepted for file creation.");
      if (paramDriveContents.zzks())
        throw new IllegalArgumentException("DriveContents are already closed.");
      i = paramDriveContents.zzkq().getRequestId();
      paramDriveContents.zzkr();
    }
    while (paramMetadataChangeSet == null)
    {
      throw new IllegalArgumentException("MetadataChangeSet must be provided.");
      i = 1;
    }
    if ("application/vnd.google-apps.folder".equals(paramMetadataChangeSet.getMimeType()))
      throw new IllegalArgumentException("May not create folders (mimetype: application/vnd.google-apps.folder) using this method. Use DriveFolder.createFolder() instead.");
    return zza(paramGoogleApiClient, paramMetadataChangeSet, i, 0, paramExecutionOptions);
  }

  private Query zza(Query paramQuery)
  {
    Query.Builder localBuilder = new Query.Builder().addFilter(Filters.in(SearchableField.PARENTS, getDriveId()));
    if (paramQuery != null)
    {
      if (paramQuery.getFilter() != null)
        localBuilder.addFilter(paramQuery.getFilter());
      localBuilder.setPageToken(paramQuery.getPageToken());
      localBuilder.setSortOrder(paramQuery.getSortOrder());
    }
    return localBuilder.build();
  }

  public PendingResult<DriveFolder.DriveFileResult> createFile(GoogleApiClient paramGoogleApiClient, MetadataChangeSet paramMetadataChangeSet, DriveContents paramDriveContents)
  {
    return createFile(paramGoogleApiClient, paramMetadataChangeSet, paramDriveContents, null);
  }

  public PendingResult<DriveFolder.DriveFileResult> createFile(GoogleApiClient paramGoogleApiClient, MetadataChangeSet paramMetadataChangeSet, DriveContents paramDriveContents, ExecutionOptions paramExecutionOptions)
  {
    if (paramExecutionOptions == null)
      paramExecutionOptions = new ExecutionOptions.Builder().build();
    if (paramExecutionOptions.zzkv() != 0)
      throw new IllegalStateException("May not set a conflict strategy for calls to createFile.");
    return zza(paramGoogleApiClient, paramMetadataChangeSet, paramDriveContents, paramExecutionOptions);
  }

  public PendingResult<DriveFolder.DriveFolderResult> createFolder(GoogleApiClient paramGoogleApiClient, final MetadataChangeSet paramMetadataChangeSet)
  {
    if (paramMetadataChangeSet == null)
      throw new IllegalArgumentException("MetadataChangeSet must be provided.");
    if ((paramMetadataChangeSet.getMimeType() != null) && (!paramMetadataChangeSet.getMimeType().equals("application/vnd.google-apps.folder")))
      throw new IllegalArgumentException("The mimetype must be of type application/vnd.google-apps.folder");
    return paramGoogleApiClient.zzb(new zzf(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramMetadataChangeSet.zzkx().setContext(paramAnonymouszzr.getContext());
        paramAnonymouszzr.zzkF().zza(new CreateFolderRequest(zzv.this.getDriveId(), paramMetadataChangeSet.zzkx()), new zzv.zzb(this));
      }
    });
  }

  public PendingResult<DriveApi.MetadataBufferResult> listChildren(GoogleApiClient paramGoogleApiClient)
  {
    return queryChildren(paramGoogleApiClient, null);
  }

  public PendingResult<DriveApi.MetadataBufferResult> queryChildren(GoogleApiClient paramGoogleApiClient, Query paramQuery)
  {
    return new zzp().query(paramGoogleApiClient, zza(paramQuery));
  }

  private static class zza extends zzc
  {
    private final zza.zzb<DriveFolder.DriveFileResult> zzHa;

    public zza(zza.zzb<DriveFolder.DriveFileResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(OnDriveIdResponse paramOnDriveIdResponse)
      throws RemoteException
    {
      this.zzHa.zzd(new zzv.zzc(Status.zzNo, new zzt(paramOnDriveIdResponse.getDriveId())));
    }

    public void zzm(Status paramStatus)
      throws RemoteException
    {
      this.zzHa.zzd(new zzv.zzc(paramStatus, null));
    }
  }

  private static class zzb extends zzc
  {
    private final zza.zzb<DriveFolder.DriveFolderResult> zzHa;

    public zzb(zza.zzb<DriveFolder.DriveFolderResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(OnDriveIdResponse paramOnDriveIdResponse)
      throws RemoteException
    {
      this.zzHa.zzd(new zzv.zze(Status.zzNo, new zzv(paramOnDriveIdResponse.getDriveId())));
    }

    public void zzm(Status paramStatus)
      throws RemoteException
    {
      this.zzHa.zzd(new zzv.zze(paramStatus, null));
    }
  }

  private static class zzc
    implements DriveFolder.DriveFileResult
  {
    private final Status zzHb;
    private final DriveFile zzUf;

    public zzc(Status paramStatus, DriveFile paramDriveFile)
    {
      this.zzHb = paramStatus;
      this.zzUf = paramDriveFile;
    }

    public DriveFile getDriveFile()
    {
      return this.zzUf;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  static abstract class zzd extends zzq<DriveFolder.DriveFileResult>
  {
    zzd(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public DriveFolder.DriveFileResult zzq(Status paramStatus)
    {
      return new zzv.zzc(paramStatus, null);
    }
  }

  private static class zze
    implements DriveFolder.DriveFolderResult
  {
    private final Status zzHb;
    private final DriveFolder zzUg;

    public zze(Status paramStatus, DriveFolder paramDriveFolder)
    {
      this.zzHb = paramStatus;
      this.zzUg = paramDriveFolder;
    }

    public DriveFolder getDriveFolder()
    {
      return this.zzUg;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  static abstract class zzf extends zzq<DriveFolder.DriveFolderResult>
  {
    zzf(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public DriveFolder.DriveFolderResult zzr(Status paramStatus)
    {
      return new zzv.zze(paramStatus, null);
    }
  }
}