package com.google.android.gms.drive.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.drive.Drive;
import com.google.android.gms.drive.DriveApi.MetadataBufferResult;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.DriveResource;
import com.google.android.gms.drive.DriveResource.MetadataResult;
import com.google.android.gms.drive.Metadata;
import com.google.android.gms.drive.MetadataBuffer;
import com.google.android.gms.drive.MetadataChangeSet;
import com.google.android.gms.drive.events.ChangeListener;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class zzy
  implements DriveResource
{
  protected final DriveId zzRX;

  protected zzy(DriveId paramDriveId)
  {
    this.zzRX = paramDriveId;
  }

  private PendingResult<DriveResource.MetadataResult> zza(GoogleApiClient paramGoogleApiClient, final boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_1
    //   1: new 19\011com/google/android/gms/drive/internal/zzy$1
    //   4: dup
    //   5: aload_0
    //   6: aload_1
    //   7: iload_2
    //   8: invokespecial 22\011com/google/android/gms/drive/internal/zzy$1:<init>\011(Lcom/google/android/gms/drive/internal/zzy;Lcom/google/android/gms/common/api/GoogleApiClient;Z)V
    //   11: invokeinterface 27 2 0
    //   16: areturn
  }

  public PendingResult<Status> addChangeListener(GoogleApiClient paramGoogleApiClient, ChangeListener paramChangeListener)
  {
    return ((zzr)paramGoogleApiClient.zza(Drive.zzGR)).zza(paramGoogleApiClient, this.zzRX, 1, paramChangeListener);
  }

  public PendingResult<Status> addChangeSubscription(GoogleApiClient paramGoogleApiClient)
  {
    return ((zzr)paramGoogleApiClient.zza(Drive.zzGR)).zza(paramGoogleApiClient, this.zzRX, 1);
  }

  public DriveId getDriveId()
  {
    return this.zzRX;
  }

  public PendingResult<DriveResource.MetadataResult> getMetadata(GoogleApiClient paramGoogleApiClient)
  {
    return zza(paramGoogleApiClient, false);
  }

  public PendingResult<DriveApi.MetadataBufferResult> listParents(GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zza(new zzp.zzg(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new ListParentsRequest(zzy.this.zzRX), new zzy.zza(this));
      }
    });
  }

  public PendingResult<Status> removeChangeListener(GoogleApiClient paramGoogleApiClient, ChangeListener paramChangeListener)
  {
    return ((zzr)paramGoogleApiClient.zza(Drive.zzGR)).zzb(paramGoogleApiClient, this.zzRX, 1, paramChangeListener);
  }

  public PendingResult<Status> removeChangeSubscription(GoogleApiClient paramGoogleApiClient)
  {
    return ((zzr)paramGoogleApiClient.zza(Drive.zzGR)).zzb(paramGoogleApiClient, this.zzRX, 1);
  }

  public PendingResult<Status> setParents(GoogleApiClient paramGoogleApiClient, Set<DriveId> paramSet)
  {
    if (paramSet == null)
      throw new IllegalArgumentException("ParentIds must be provided.");
    if (paramSet.isEmpty())
      throw new IllegalArgumentException("ParentIds must contain at least one parent.");
    return paramGoogleApiClient.zzb(new zzq.zza(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new SetResourceParentsRequest(zzy.this.zzRX, this.zzUn), new zzbl(this));
      }
    });
  }

  public PendingResult<Status> trash(GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zzb(new zzq.zza(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new TrashResourceRequest(zzy.this.zzRX), new zzbl(this));
      }
    });
  }

  public PendingResult<Status> untrash(GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zzb(new zzq.zza(paramGoogleApiClient)
    {
      protected void zza(zzr paramAnonymouszzr)
        throws RemoteException
      {
        paramAnonymouszzr.zzkF().zza(new UntrashResourceRequest(zzy.this.zzRX), new zzbl(this));
      }
    });
  }

  public PendingResult<DriveResource.MetadataResult> updateMetadata(GoogleApiClient paramGoogleApiClient, final MetadataChangeSet paramMetadataChangeSet)
  {
    // Byte code:
    //   0: aload_2
    //   1: ifnonnull +13 -> 14
    //   4: new 70\011java/lang/IllegalArgumentException
    //   7: dup
    //   8: ldc 107
    //   10: invokespecial 75\011java/lang/IllegalArgumentException:<init>\011(Ljava/lang/String;)V
    //   13: athrow
    //   14: aload_1
    //   15: new 109\011com/google/android/gms/drive/internal/zzy$4
    //   18: dup
    //   19: aload_0
    //   20: aload_1
    //   21: aload_2
    //   22: invokespecial 112\011com/google/android/gms/drive/internal/zzy$4:<init>\011(Lcom/google/android/gms/drive/internal/zzy;Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/drive/MetadataChangeSet;)V
    //   25: invokeinterface 95 2 0
    //   30: areturn
  }

  private static class zza extends zzc
  {
    private final zza.zzb<DriveApi.MetadataBufferResult> zzHa;

    public zza(zza.zzb<DriveApi.MetadataBufferResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(OnListParentsResponse paramOnListParentsResponse)
      throws RemoteException
    {
      MetadataBuffer localMetadataBuffer = new MetadataBuffer(paramOnListParentsResponse.zzkT());
      this.zzHa.zzd(new zzp.zzf(Status.zzNo, localMetadataBuffer, false));
    }

    public void zzm(Status paramStatus)
      throws RemoteException
    {
      this.zzHa.zzd(new zzp.zzf(paramStatus, null, false));
    }
  }

  private static class zzb extends zzc
  {
    private final zza.zzb<DriveResource.MetadataResult> zzHa;

    public zzb(zza.zzb<DriveResource.MetadataResult> paramzzb)
    {
      this.zzHa = paramzzb;
    }

    public void zza(OnMetadataResponse paramOnMetadataResponse)
      throws RemoteException
    {
      this.zzHa.zzd(new zzy.zzc(Status.zzNo, new zzm(paramOnMetadataResponse.zzkU())));
    }

    public void zzm(Status paramStatus)
      throws RemoteException
    {
      this.zzHa.zzd(new zzy.zzc(paramStatus, null));
    }
  }

  private static class zzc
    implements DriveResource.MetadataResult
  {
    private final Status zzHb;
    private final Metadata zzUo;

    public zzc(Status paramStatus, Metadata paramMetadata)
    {
      this.zzHb = paramStatus;
      this.zzUo = paramMetadata;
    }

    public Metadata getMetadata()
    {
      return this.zzUo;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  private abstract class zzd extends zzq<DriveResource.MetadataResult>
  {
    private zzd(GoogleApiClient arg2)
    {
      super();
    }

    public DriveResource.MetadataResult zzt(Status paramStatus)
    {
      return new zzy.zzc(paramStatus, null);
    }
  }
}