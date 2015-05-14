package com.google.android.gms.drive.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.drive.CreateFileActivityBuilder;
import com.google.android.gms.drive.Drive;
import com.google.android.gms.drive.DriveApi;
import com.google.android.gms.drive.DriveApi.DriveContentsResult;
import com.google.android.gms.drive.DriveApi.DriveIdResult;
import com.google.android.gms.drive.DriveApi.MetadataBufferResult;
import com.google.android.gms.drive.DriveContents;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.drive.DriveFolder;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.MetadataBuffer;
import com.google.android.gms.drive.OpenFileActivityBuilder;
import com.google.android.gms.drive.query.Query;
import java.util.List;

public class zzp
  implements DriveApi
{
  public PendingResult<Status> cancelPendingActions(GoogleApiClient paramGoogleApiClient, List<String> paramList)
  {
    return ((zzr)paramGoogleApiClient.zza(Drive.zzGR)).cancelPendingActions(paramGoogleApiClient, paramList);
  }

  public PendingResult<DriveApi.DriveIdResult> fetchDriveId(GoogleApiClient paramGoogleApiClient, final String paramString)
  {
    return paramGoogleApiClient.zza(new zze(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new GetMetadataRequest(DriveId.zzbu(paramString), false), new zzp.zzc(this));
      }
    });
  }

  public DriveFolder getAppFolder(GoogleApiClient paramGoogleApiClient)
  {
    if (!paramGoogleApiClient.isConnected())
      throw new IllegalStateException("Client must be connected");
    DriveId localDriveId = ((zzr)paramGoogleApiClient.zza(Drive.zzGR)).zzkH();
    if (localDriveId != null)
      return new zzv(localDriveId);
    return null;
  }

  public DriveFile getFile(GoogleApiClient paramGoogleApiClient, DriveId paramDriveId)
  {
    if (paramDriveId == null)
      throw new IllegalArgumentException("Id must be provided.");
    if (!paramGoogleApiClient.isConnected())
      throw new IllegalStateException("Client must be connected");
    return new zzt(paramDriveId);
  }

  public DriveFolder getFolder(GoogleApiClient paramGoogleApiClient, DriveId paramDriveId)
  {
    if (paramDriveId == null)
      throw new IllegalArgumentException("Id must be provided.");
    if (!paramGoogleApiClient.isConnected())
      throw new IllegalStateException("Client must be connected");
    return new zzv(paramDriveId);
  }

  public DriveFolder getRootFolder(GoogleApiClient paramGoogleApiClient)
  {
    if (!paramGoogleApiClient.isConnected())
      throw new IllegalStateException("Client must be connected");
    return new zzv(((zzr)paramGoogleApiClient.zza(Drive.zzGR)).zzkG());
  }

  public CreateFileActivityBuilder newCreateFileActivityBuilder()
  {
    return new CreateFileActivityBuilder();
  }

  public PendingResult<DriveApi.DriveContentsResult> newDriveContents(GoogleApiClient paramGoogleApiClient)
  {
    return zza(paramGoogleApiClient, 536870912);
  }

  public OpenFileActivityBuilder newOpenFileActivityBuilder()
  {
    return new OpenFileActivityBuilder();
  }

  public PendingResult<DriveApi.MetadataBufferResult> query(GoogleApiClient paramGoogleApiClient, final Query paramQuery)
  {
    if (paramQuery == null)
      throw new IllegalArgumentException("Query must be provided.");
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new QueryRequest(paramQuery), new zzp.zzi(this));
      }
    });
  }

  public PendingResult<Status> requestSync(GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zzb(new zzq.zza(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new zzbl(this));
      }
    });
  }

  public PendingResult<DriveApi.DriveContentsResult> zza(GoogleApiClient paramGoogleApiClient, final int paramInt)
  {
    return paramGoogleApiClient.zza(new zzb(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new CreateContentsRequest(paramInt), new zzp.zzh(this));
      }
    });
  }

  static class zza
    implements DriveApi.DriveContentsResult
  {
    private final Status zzHb;
    private final DriveContents zzSa;

    public zza(Status paramStatus, DriveContents paramDriveContents)
    {
      this.zzHb = paramStatus;
      this.zzSa = paramDriveContents;
    }

    public DriveContents getDriveContents()
    {
      return this.zzSa;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  static abstract class zzb extends zzq<DriveApi.DriveContentsResult>
  {
    zzb(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public DriveApi.DriveContentsResult zzn(Status paramStatus)
    {
      return new zzp.zza(paramStatus, null);
    }
  }

  static class zzc extends zzc
  {
    private final zza.zzb<DriveApi.DriveIdResult> zzHa;

    public zzc(zza.zzb<DriveApi.DriveIdResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(OnDriveIdResponse paramOnDriveIdResponse)
      throws RemoteException
    {
      this.zzHa.zzd(new zzp.zzd(Status.zzNo, paramOnDriveIdResponse.getDriveId()));
    }

    public void zza(OnMetadataResponse paramOnMetadataResponse)
      throws RemoteException
    {
      this.zzHa.zzd(new zzp.zzd(Status.zzNo, new zzm(paramOnMetadataResponse.zzkU()).getDriveId()));
    }

    public void zzm(Status paramStatus)
      throws RemoteException
    {
      this.zzHa.zzd(new zzp.zzd(paramStatus, null));
    }
  }

  private static class zzd
    implements DriveApi.DriveIdResult
  {
    private final Status zzHb;
    private final DriveId zzRX;

    public zzd(Status paramStatus, DriveId paramDriveId)
    {
      this.zzHb = paramStatus;
      this.zzRX = paramDriveId;
    }

    public DriveId getDriveId()
    {
      return this.zzRX;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  static abstract class zze extends zzq<DriveApi.DriveIdResult>
  {
    zze(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public DriveApi.DriveIdResult zzo(Status paramStatus)
    {
      return new zzp.zzd(paramStatus, null);
    }
  }

  static class zzf
    implements DriveApi.MetadataBufferResult
  {
    private final Status zzHb;
    private final MetadataBuffer zzTA;
    private final boolean zzTB;

    public zzf(Status paramStatus, MetadataBuffer paramMetadataBuffer, boolean paramBoolean)
    {
      this.zzHb = paramStatus;
      this.zzTA = paramMetadataBuffer;
      this.zzTB = paramBoolean;
    }

    public MetadataBuffer getMetadataBuffer()
    {
      return this.zzTA;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  static abstract class zzg extends zzq<DriveApi.MetadataBufferResult>
  {
    zzg(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public DriveApi.MetadataBufferResult zzp(Status paramStatus)
    {
      return new zzp.zzf(paramStatus, null, false);
    }
  }

  private static class zzh extends zzc
  {
    private final zza.zzb<DriveApi.DriveContentsResult> zzHa;

    public zzh(zza.zzb<DriveApi.DriveContentsResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(OnContentsResponse paramOnContentsResponse)
      throws RemoteException
    {
      this.zzHa.zzd(new zzp.zza(Status.zzNo, new zzs(paramOnContentsResponse.zzkL())));
    }

    public void zzm(Status paramStatus)
      throws RemoteException
    {
      this.zzHa.zzd(new zzp.zza(paramStatus, null));
    }
  }

  private static class zzi extends zzc
  {
    private final zza.zzb<DriveApi.MetadataBufferResult> zzHa;

    public zzi(zza.zzb<DriveApi.MetadataBufferResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(OnListEntriesResponse paramOnListEntriesResponse)
      throws RemoteException
    {
      MetadataBuffer localMetadataBuffer = new MetadataBuffer(paramOnListEntriesResponse.zzkR());
      this.zzHa.zzd(new zzp.zzf(Status.zzNo, localMetadataBuffer, paramOnListEntriesResponse.zzkS()));
    }

    public void zzm(Status paramStatus)
      throws RemoteException
    {
      this.zzHa.zzd(new zzp.zzf(paramStatus, null, false));
    }
  }

  static class zzj extends zzq.zza
  {
    zzj(GoogleApiClient paramGoogleApiClient, Status paramStatus)
    {
      super();
      setResult(paramStatus);
    }

    protected void zza(zzr paramzzr)
    {
    }
  }
}