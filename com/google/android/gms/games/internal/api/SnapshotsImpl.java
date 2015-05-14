package com.google.android.gms.games.internal.api;

import android.content.Intent;
import android.os.Bundle;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.Games.BaseGamesApiMethodImpl;
import com.google.android.gms.games.internal.GamesClientImpl;
import com.google.android.gms.games.snapshot.Snapshot;
import com.google.android.gms.games.snapshot.SnapshotContents;
import com.google.android.gms.games.snapshot.SnapshotMetadata;
import com.google.android.gms.games.snapshot.SnapshotMetadataBuffer;
import com.google.android.gms.games.snapshot.SnapshotMetadataChange;
import com.google.android.gms.games.snapshot.SnapshotMetadataChange.Builder;
import com.google.android.gms.games.snapshot.Snapshots;
import com.google.android.gms.games.snapshot.Snapshots.CommitSnapshotResult;
import com.google.android.gms.games.snapshot.Snapshots.DeleteSnapshotResult;
import com.google.android.gms.games.snapshot.Snapshots.LoadSnapshotsResult;
import com.google.android.gms.games.snapshot.Snapshots.OpenSnapshotResult;

public final class SnapshotsImpl
  implements Snapshots
{
  public PendingResult<Snapshots.CommitSnapshotResult> commitAndClose(GoogleApiClient paramGoogleApiClient, final Snapshot paramSnapshot, final SnapshotMetadataChange paramSnapshotMetadataChange)
  {
    return paramGoogleApiClient.zzb(new CommitImpl(paramGoogleApiClient, paramSnapshot)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zza(this, paramSnapshot, paramSnapshotMetadataChange);
      }
    });
  }

  public PendingResult<Snapshots.DeleteSnapshotResult> delete(GoogleApiClient paramGoogleApiClient, final SnapshotMetadata paramSnapshotMetadata)
  {
    return paramGoogleApiClient.zzb(new DeleteImpl(paramGoogleApiClient, paramSnapshotMetadata)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zzi(this, paramSnapshotMetadata.getSnapshotId());
      }
    });
  }

  public void discardAndClose(GoogleApiClient paramGoogleApiClient, Snapshot paramSnapshot)
  {
    Games.zzd(paramGoogleApiClient).zza(paramSnapshot);
  }

  public int getMaxCoverImageSize(GoogleApiClient paramGoogleApiClient)
  {
    return Games.zzd(paramGoogleApiClient).zznK();
  }

  public int getMaxDataSize(GoogleApiClient paramGoogleApiClient)
  {
    return Games.zzd(paramGoogleApiClient).zznJ();
  }

  public Intent getSelectSnapshotIntent(GoogleApiClient paramGoogleApiClient, String paramString, boolean paramBoolean1, boolean paramBoolean2, int paramInt)
  {
    return Games.zzd(paramGoogleApiClient).zza(paramString, paramBoolean1, paramBoolean2, paramInt);
  }

  public SnapshotMetadata getSnapshotFromBundle(Bundle paramBundle)
  {
    if ((paramBundle == null) || (!paramBundle.containsKey("com.google.android.gms.games.SNAPSHOT_METADATA")))
      return null;
    return (SnapshotMetadata)paramBundle.getParcelable("com.google.android.gms.games.SNAPSHOT_METADATA");
  }

  public PendingResult<Snapshots.LoadSnapshotsResult> load(GoogleApiClient paramGoogleApiClient, final boolean paramBoolean)
  {
    return paramGoogleApiClient.zza(new LoadImpl(paramGoogleApiClient, paramBoolean)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zze(this, paramBoolean);
      }
    });
  }

  public PendingResult<Snapshots.OpenSnapshotResult> open(GoogleApiClient paramGoogleApiClient, SnapshotMetadata paramSnapshotMetadata)
  {
    return open(paramGoogleApiClient, paramSnapshotMetadata.getUniqueName(), false);
  }

  public PendingResult<Snapshots.OpenSnapshotResult> open(GoogleApiClient paramGoogleApiClient, SnapshotMetadata paramSnapshotMetadata, int paramInt)
  {
    return open(paramGoogleApiClient, paramSnapshotMetadata.getUniqueName(), false, paramInt);
  }

  public PendingResult<Snapshots.OpenSnapshotResult> open(GoogleApiClient paramGoogleApiClient, String paramString, boolean paramBoolean)
  {
    return open(paramGoogleApiClient, paramString, paramBoolean, -1);
  }

  public PendingResult<Snapshots.OpenSnapshotResult> open(GoogleApiClient paramGoogleApiClient, final String paramString, final boolean paramBoolean, final int paramInt)
  {
    return paramGoogleApiClient.zzb(new OpenImpl(paramGoogleApiClient, paramString)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zza(this, paramString, paramBoolean, paramInt);
      }
    });
  }

  public PendingResult<Snapshots.OpenSnapshotResult> resolveConflict(GoogleApiClient paramGoogleApiClient, String paramString, Snapshot paramSnapshot)
  {
    SnapshotMetadata localSnapshotMetadata = paramSnapshot.getMetadata();
    SnapshotMetadataChange localSnapshotMetadataChange = new SnapshotMetadataChange.Builder().fromMetadata(localSnapshotMetadata).build();
    return resolveConflict(paramGoogleApiClient, paramString, localSnapshotMetadata.getSnapshotId(), localSnapshotMetadataChange, paramSnapshot.getSnapshotContents());
  }

  public PendingResult<Snapshots.OpenSnapshotResult> resolveConflict(GoogleApiClient paramGoogleApiClient, final String paramString1, final String paramString2, final SnapshotMetadataChange paramSnapshotMetadataChange, final SnapshotContents paramSnapshotContents)
  {
    return paramGoogleApiClient.zzb(new OpenImpl(paramGoogleApiClient, paramString1)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zza(this, paramString1, paramString2, paramSnapshotMetadataChange, paramSnapshotContents);
      }
    });
  }

  private static abstract class CommitImpl extends Games.BaseGamesApiMethodImpl<Snapshots.CommitSnapshotResult>
  {
    private CommitImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Snapshots.CommitSnapshotResult zzan(final Status paramStatus)
    {
      return new Snapshots.CommitSnapshotResult()
      {
        public SnapshotMetadata getSnapshotMetadata()
        {
          return null;
        }

        public Status getStatus()
        {
          return paramStatus;
        }
      };
    }
  }

  private static abstract class DeleteImpl extends Games.BaseGamesApiMethodImpl<Snapshots.DeleteSnapshotResult>
  {
    private DeleteImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Snapshots.DeleteSnapshotResult zzao(final Status paramStatus)
    {
      return new Snapshots.DeleteSnapshotResult()
      {
        public String getSnapshotId()
        {
          return null;
        }

        public Status getStatus()
        {
          return paramStatus;
        }
      };
    }
  }

  private static abstract class LoadImpl extends Games.BaseGamesApiMethodImpl<Snapshots.LoadSnapshotsResult>
  {
    private LoadImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Snapshots.LoadSnapshotsResult zzap(final Status paramStatus)
    {
      return new Snapshots.LoadSnapshotsResult()
      {
        public SnapshotMetadataBuffer getSnapshots()
        {
          return new SnapshotMetadataBuffer(DataHolder.zzay(14));
        }

        public Status getStatus()
        {
          return paramStatus;
        }

        public void release()
        {
        }
      };
    }
  }

  private static abstract class OpenImpl extends Games.BaseGamesApiMethodImpl<Snapshots.OpenSnapshotResult>
  {
    private OpenImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Snapshots.OpenSnapshotResult zzaq(final Status paramStatus)
    {
      return new Snapshots.OpenSnapshotResult()
      {
        public String getConflictId()
        {
          return null;
        }

        public Snapshot getConflictingSnapshot()
        {
          return null;
        }

        public SnapshotContents getResolutionSnapshotContents()
        {
          return null;
        }

        public Snapshot getSnapshot()
        {
          return null;
        }

        public Status getStatus()
        {
          return paramStatus;
        }
      };
    }
  }
}