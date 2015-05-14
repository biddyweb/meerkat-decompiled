package com.google.android.gms.games.internal.api;

import android.content.Intent;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.Games.BaseGamesApiMethodImpl;
import com.google.android.gms.games.achievement.AchievementBuffer;
import com.google.android.gms.games.achievement.Achievements;
import com.google.android.gms.games.achievement.Achievements.LoadAchievementsResult;
import com.google.android.gms.games.achievement.Achievements.UpdateAchievementResult;
import com.google.android.gms.games.internal.GamesClientImpl;

public final class AchievementsImpl
  implements Achievements
{
  public Intent getAchievementsIntent(GoogleApiClient paramGoogleApiClient)
  {
    return Games.zzd(paramGoogleApiClient).zznu();
  }

  public void increment(GoogleApiClient paramGoogleApiClient, final String paramString, final int paramInt)
  {
    paramGoogleApiClient.zzb(new UpdateImpl(paramString, paramGoogleApiClient)
    {
      public void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zza(null, paramString, paramInt);
      }
    });
  }

  public PendingResult<Achievements.UpdateAchievementResult> incrementImmediate(GoogleApiClient paramGoogleApiClient, final String paramString, final int paramInt)
  {
    return paramGoogleApiClient.zzb(new UpdateImpl(paramString, paramGoogleApiClient)
    {
      public void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zza(this, paramString, paramInt);
      }
    });
  }

  public PendingResult<Achievements.LoadAchievementsResult> load(GoogleApiClient paramGoogleApiClient, final boolean paramBoolean)
  {
    return paramGoogleApiClient.zza(new LoadImpl(paramGoogleApiClient, paramBoolean)
    {
      public void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zzc(this, paramBoolean);
      }
    });
  }

  public void reveal(GoogleApiClient paramGoogleApiClient, final String paramString)
  {
    paramGoogleApiClient.zzb(new UpdateImpl(paramString, paramGoogleApiClient)
    {
      public void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zza(null, paramString);
      }
    });
  }

  public PendingResult<Achievements.UpdateAchievementResult> revealImmediate(GoogleApiClient paramGoogleApiClient, final String paramString)
  {
    return paramGoogleApiClient.zzb(new UpdateImpl(paramString, paramGoogleApiClient)
    {
      public void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zza(this, paramString);
      }
    });
  }

  public void setSteps(GoogleApiClient paramGoogleApiClient, final String paramString, final int paramInt)
  {
    paramGoogleApiClient.zzb(new UpdateImpl(paramString, paramGoogleApiClient)
    {
      public void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zzb(null, paramString, paramInt);
      }
    });
  }

  public PendingResult<Achievements.UpdateAchievementResult> setStepsImmediate(GoogleApiClient paramGoogleApiClient, final String paramString, final int paramInt)
  {
    return paramGoogleApiClient.zzb(new UpdateImpl(paramString, paramGoogleApiClient)
    {
      public void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zzb(this, paramString, paramInt);
      }
    });
  }

  public void unlock(GoogleApiClient paramGoogleApiClient, final String paramString)
  {
    paramGoogleApiClient.zzb(new UpdateImpl(paramString, paramGoogleApiClient)
    {
      public void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zzb(null, paramString);
      }
    });
  }

  public PendingResult<Achievements.UpdateAchievementResult> unlockImmediate(GoogleApiClient paramGoogleApiClient, final String paramString)
  {
    return paramGoogleApiClient.zzb(new UpdateImpl(paramString, paramGoogleApiClient)
    {
      public void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zzb(this, paramString);
      }
    });
  }

  private static abstract class LoadImpl extends Games.BaseGamesApiMethodImpl<Achievements.LoadAchievementsResult>
  {
    private LoadImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Achievements.LoadAchievementsResult zzH(final Status paramStatus)
    {
      return new Achievements.LoadAchievementsResult()
      {
        public AchievementBuffer getAchievements()
        {
          return new AchievementBuffer(DataHolder.zzay(14));
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

  private static abstract class UpdateImpl extends Games.BaseGamesApiMethodImpl<Achievements.UpdateAchievementResult>
  {
    private final String zzFA;

    public UpdateImpl(String paramString, GoogleApiClient paramGoogleApiClient)
    {
      super();
      this.zzFA = paramString;
    }

    public Achievements.UpdateAchievementResult zzI(final Status paramStatus)
    {
      return new Achievements.UpdateAchievementResult()
      {
        public String getAchievementId()
        {
          return AchievementsImpl.UpdateImpl.zza(AchievementsImpl.UpdateImpl.this);
        }

        public Status getStatus()
        {
          return paramStatus;
        }
      };
    }
  }
}