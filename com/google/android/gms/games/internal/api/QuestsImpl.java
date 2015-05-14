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
import com.google.android.gms.games.quest.Milestone;
import com.google.android.gms.games.quest.Quest;
import com.google.android.gms.games.quest.QuestBuffer;
import com.google.android.gms.games.quest.QuestUpdateListener;
import com.google.android.gms.games.quest.Quests;
import com.google.android.gms.games.quest.Quests.AcceptQuestResult;
import com.google.android.gms.games.quest.Quests.ClaimMilestoneResult;
import com.google.android.gms.games.quest.Quests.LoadQuestsResult;

public final class QuestsImpl
  implements Quests
{
  public PendingResult<Quests.AcceptQuestResult> accept(GoogleApiClient paramGoogleApiClient, final String paramString)
  {
    return paramGoogleApiClient.zzb(new AcceptImpl(paramGoogleApiClient, paramString)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zzh(this, paramString);
      }
    });
  }

  public PendingResult<Quests.ClaimMilestoneResult> claim(GoogleApiClient paramGoogleApiClient, final String paramString1, final String paramString2)
  {
    return paramGoogleApiClient.zzb(new ClaimImpl(paramGoogleApiClient, paramString1)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zzb(this, paramString1, paramString2);
      }
    });
  }

  public Intent getQuestIntent(GoogleApiClient paramGoogleApiClient, String paramString)
  {
    return Games.zzd(paramGoogleApiClient).zzbP(paramString);
  }

  public Intent getQuestsIntent(GoogleApiClient paramGoogleApiClient, int[] paramArrayOfInt)
  {
    return Games.zzd(paramGoogleApiClient).zzb(paramArrayOfInt);
  }

  public PendingResult<Quests.LoadQuestsResult> load(GoogleApiClient paramGoogleApiClient, final int[] paramArrayOfInt, final int paramInt, final boolean paramBoolean)
  {
    return paramGoogleApiClient.zza(new LoadsImpl(paramGoogleApiClient, paramArrayOfInt)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zza(this, paramArrayOfInt, paramInt, paramBoolean);
      }
    });
  }

  public PendingResult<Quests.LoadQuestsResult> loadByIds(GoogleApiClient paramGoogleApiClient, final boolean paramBoolean, final String[] paramArrayOfString)
  {
    return paramGoogleApiClient.zza(new LoadsImpl(paramGoogleApiClient, paramBoolean)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zzb(this, paramBoolean, paramArrayOfString);
      }
    });
  }

  public void registerQuestUpdateListener(GoogleApiClient paramGoogleApiClient, QuestUpdateListener paramQuestUpdateListener)
  {
    GamesClientImpl localGamesClientImpl = Games.zzb(paramGoogleApiClient, false);
    if (localGamesClientImpl != null)
      localGamesClientImpl.zzc(paramGoogleApiClient.zzf(paramQuestUpdateListener));
  }

  public void showStateChangedPopup(GoogleApiClient paramGoogleApiClient, String paramString)
  {
    GamesClientImpl localGamesClientImpl = Games.zzb(paramGoogleApiClient, false);
    if (localGamesClientImpl != null)
      localGamesClientImpl.zzbQ(paramString);
  }

  public void unregisterQuestUpdateListener(GoogleApiClient paramGoogleApiClient)
  {
    GamesClientImpl localGamesClientImpl = Games.zzb(paramGoogleApiClient, false);
    if (localGamesClientImpl != null)
      localGamesClientImpl.zznz();
  }

  private static abstract class AcceptImpl extends Games.BaseGamesApiMethodImpl<Quests.AcceptQuestResult>
  {
    private AcceptImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Quests.AcceptQuestResult zzag(final Status paramStatus)
    {
      return new Quests.AcceptQuestResult()
      {
        public Quest getQuest()
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

  private static abstract class ClaimImpl extends Games.BaseGamesApiMethodImpl<Quests.ClaimMilestoneResult>
  {
    private ClaimImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Quests.ClaimMilestoneResult zzah(final Status paramStatus)
    {
      return new Quests.ClaimMilestoneResult()
      {
        public Milestone getMilestone()
        {
          return null;
        }

        public Quest getQuest()
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

  private static abstract class LoadsImpl extends Games.BaseGamesApiMethodImpl<Quests.LoadQuestsResult>
  {
    private LoadsImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Quests.LoadQuestsResult zzai(final Status paramStatus)
    {
      return new Quests.LoadQuestsResult()
      {
        public QuestBuffer getQuests()
        {
          return new QuestBuffer(DataHolder.zzay(paramStatus.getStatusCode()));
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