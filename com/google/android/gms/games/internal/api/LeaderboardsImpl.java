package com.google.android.gms.games.internal.api;

import android.content.Intent;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.Games.BaseGamesApiMethodImpl;
import com.google.android.gms.games.internal.GamesClientImpl;
import com.google.android.gms.games.internal.GamesLog;
import com.google.android.gms.games.leaderboard.Leaderboard;
import com.google.android.gms.games.leaderboard.LeaderboardBuffer;
import com.google.android.gms.games.leaderboard.LeaderboardScore;
import com.google.android.gms.games.leaderboard.LeaderboardScoreBuffer;
import com.google.android.gms.games.leaderboard.Leaderboards;
import com.google.android.gms.games.leaderboard.Leaderboards.LeaderboardMetadataResult;
import com.google.android.gms.games.leaderboard.Leaderboards.LoadPlayerScoreResult;
import com.google.android.gms.games.leaderboard.Leaderboards.LoadScoresResult;
import com.google.android.gms.games.leaderboard.Leaderboards.SubmitScoreResult;
import com.google.android.gms.games.leaderboard.ScoreSubmissionData;

public final class LeaderboardsImpl
  implements Leaderboards
{
  public Intent getAllLeaderboardsIntent(GoogleApiClient paramGoogleApiClient)
  {
    return Games.zzd(paramGoogleApiClient).zznt();
  }

  public Intent getLeaderboardIntent(GoogleApiClient paramGoogleApiClient, String paramString)
  {
    return getLeaderboardIntent(paramGoogleApiClient, paramString, -1);
  }

  public Intent getLeaderboardIntent(GoogleApiClient paramGoogleApiClient, String paramString, int paramInt)
  {
    return Games.zzd(paramGoogleApiClient).zzo(paramString, paramInt);
  }

  public PendingResult<Leaderboards.LoadPlayerScoreResult> loadCurrentPlayerLeaderboardScore(GoogleApiClient paramGoogleApiClient, final String paramString, final int paramInt1, final int paramInt2)
  {
    return paramGoogleApiClient.zza(new LoadPlayerScoreImpl(paramGoogleApiClient, paramString)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zza(this, null, paramString, paramInt1, paramInt2);
      }
    });
  }

  public PendingResult<Leaderboards.LeaderboardMetadataResult> loadLeaderboardMetadata(GoogleApiClient paramGoogleApiClient, final String paramString, final boolean paramBoolean)
  {
    return paramGoogleApiClient.zza(new LoadMetadataImpl(paramGoogleApiClient, paramString)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zzb(this, paramString, paramBoolean);
      }
    });
  }

  public PendingResult<Leaderboards.LeaderboardMetadataResult> loadLeaderboardMetadata(GoogleApiClient paramGoogleApiClient, final boolean paramBoolean)
  {
    return paramGoogleApiClient.zza(new LoadMetadataImpl(paramGoogleApiClient, paramBoolean)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zzb(this, paramBoolean);
      }
    });
  }

  public PendingResult<Leaderboards.LoadScoresResult> loadMoreScores(GoogleApiClient paramGoogleApiClient, final LeaderboardScoreBuffer paramLeaderboardScoreBuffer, final int paramInt1, final int paramInt2)
  {
    return paramGoogleApiClient.zza(new LoadScoresImpl(paramGoogleApiClient, paramLeaderboardScoreBuffer)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zza(this, paramLeaderboardScoreBuffer, paramInt1, paramInt2);
      }
    });
  }

  public PendingResult<Leaderboards.LoadScoresResult> loadPlayerCenteredScores(GoogleApiClient paramGoogleApiClient, String paramString, int paramInt1, int paramInt2, int paramInt3)
  {
    return loadPlayerCenteredScores(paramGoogleApiClient, paramString, paramInt1, paramInt2, paramInt3, false);
  }

  public PendingResult<Leaderboards.LoadScoresResult> loadPlayerCenteredScores(GoogleApiClient paramGoogleApiClient, final String paramString, final int paramInt1, final int paramInt2, final int paramInt3, final boolean paramBoolean)
  {
    return paramGoogleApiClient.zza(new LoadScoresImpl(paramGoogleApiClient, paramString)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zzb(this, paramString, paramInt1, paramInt2, paramInt3, paramBoolean);
      }
    });
  }

  public PendingResult<Leaderboards.LoadScoresResult> loadTopScores(GoogleApiClient paramGoogleApiClient, String paramString, int paramInt1, int paramInt2, int paramInt3)
  {
    return loadTopScores(paramGoogleApiClient, paramString, paramInt1, paramInt2, paramInt3, false);
  }

  public PendingResult<Leaderboards.LoadScoresResult> loadTopScores(GoogleApiClient paramGoogleApiClient, final String paramString, final int paramInt1, final int paramInt2, final int paramInt3, final boolean paramBoolean)
  {
    return paramGoogleApiClient.zza(new LoadScoresImpl(paramGoogleApiClient, paramString)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zza(this, paramString, paramInt1, paramInt2, paramInt3, paramBoolean);
      }
    });
  }

  public void submitScore(GoogleApiClient paramGoogleApiClient, String paramString, long paramLong)
  {
    submitScore(paramGoogleApiClient, paramString, paramLong, null);
  }

  public void submitScore(GoogleApiClient paramGoogleApiClient, String paramString1, long paramLong, String paramString2)
  {
    GamesClientImpl localGamesClientImpl = Games.zzb(paramGoogleApiClient, false);
    if (localGamesClientImpl != null);
    try
    {
      localGamesClientImpl.zza(null, paramString1, paramLong, paramString2);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("LeaderboardsImpl", "service died");
    }
  }

  public PendingResult<Leaderboards.SubmitScoreResult> submitScoreImmediate(GoogleApiClient paramGoogleApiClient, String paramString, long paramLong)
  {
    return submitScoreImmediate(paramGoogleApiClient, paramString, paramLong, null);
  }

  public PendingResult<Leaderboards.SubmitScoreResult> submitScoreImmediate(GoogleApiClient paramGoogleApiClient, final String paramString1, final long paramLong, String paramString2)
  {
    return paramGoogleApiClient.zzb(new SubmitScoreImpl(paramGoogleApiClient)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zza(this, paramString1, paramLong, this.zzago);
      }
    });
  }

  private static abstract class LoadMetadataImpl extends Games.BaseGamesApiMethodImpl<Leaderboards.LeaderboardMetadataResult>
  {
    private LoadMetadataImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Leaderboards.LeaderboardMetadataResult zzT(final Status paramStatus)
    {
      return new Leaderboards.LeaderboardMetadataResult()
      {
        public LeaderboardBuffer getLeaderboards()
        {
          return new LeaderboardBuffer(DataHolder.zzay(14));
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

  private static abstract class LoadPlayerScoreImpl extends Games.BaseGamesApiMethodImpl<Leaderboards.LoadPlayerScoreResult>
  {
    private LoadPlayerScoreImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Leaderboards.LoadPlayerScoreResult zzU(final Status paramStatus)
    {
      return new Leaderboards.LoadPlayerScoreResult()
      {
        public LeaderboardScore getScore()
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

  private static abstract class LoadScoresImpl extends Games.BaseGamesApiMethodImpl<Leaderboards.LoadScoresResult>
  {
    private LoadScoresImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Leaderboards.LoadScoresResult zzV(final Status paramStatus)
    {
      return new Leaderboards.LoadScoresResult()
      {
        public Leaderboard getLeaderboard()
        {
          return null;
        }

        public LeaderboardScoreBuffer getScores()
        {
          return new LeaderboardScoreBuffer(DataHolder.zzay(14));
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

  protected static abstract class SubmitScoreImpl extends Games.BaseGamesApiMethodImpl<Leaderboards.SubmitScoreResult>
  {
    protected SubmitScoreImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Leaderboards.SubmitScoreResult zzW(final Status paramStatus)
    {
      return new Leaderboards.SubmitScoreResult()
      {
        public ScoreSubmissionData getScoreData()
        {
          return new ScoreSubmissionData(DataHolder.zzay(14));
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
}