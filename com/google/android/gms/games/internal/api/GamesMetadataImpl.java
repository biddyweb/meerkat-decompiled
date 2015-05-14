package com.google.android.gms.games.internal.api;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameBuffer;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.Games.BaseGamesApiMethodImpl;
import com.google.android.gms.games.GamesMetadata;
import com.google.android.gms.games.GamesMetadata.LoadExtendedGamesResult;
import com.google.android.gms.games.GamesMetadata.LoadGameInstancesResult;
import com.google.android.gms.games.GamesMetadata.LoadGameSearchSuggestionsResult;
import com.google.android.gms.games.GamesMetadata.LoadGamesResult;
import com.google.android.gms.games.internal.GamesClientImpl;

public final class GamesMetadataImpl
  implements GamesMetadata
{
  public Game getCurrentGame(GoogleApiClient paramGoogleApiClient)
  {
    return Games.zzd(paramGoogleApiClient).zzns();
  }

  public PendingResult<GamesMetadata.LoadGamesResult> loadGame(GoogleApiClient paramGoogleApiClient)
  {
    // Byte code:
    //   0: aload_1
    //   1: new 28\011com/google/android/gms/games/internal/api/GamesMetadataImpl$1
    //   4: dup
    //   5: aload_0
    //   6: aload_1
    //   7: invokespecial 31\011com/google/android/gms/games/internal/api/GamesMetadataImpl$1:<init>\011(Lcom/google/android/gms/games/internal/api/GamesMetadataImpl;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    //   10: invokeinterface 37 2 0
    //   15: areturn
  }

  private static abstract class LoadExtendedGamesImpl extends Games.BaseGamesApiMethodImpl<GamesMetadata.LoadExtendedGamesResult>
  {
    public GamesMetadata.LoadExtendedGamesResult zzO(final Status paramStatus)
    {
      return new GamesMetadata.LoadExtendedGamesResult()
      {
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

  private static abstract class LoadGameInstancesImpl extends Games.BaseGamesApiMethodImpl<GamesMetadata.LoadGameInstancesResult>
  {
    public GamesMetadata.LoadGameInstancesResult zzP(final Status paramStatus)
    {
      return new GamesMetadata.LoadGameInstancesResult()
      {
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

  private static abstract class LoadGameSearchSuggestionsImpl extends Games.BaseGamesApiMethodImpl<GamesMetadata.LoadGameSearchSuggestionsResult>
  {
    public GamesMetadata.LoadGameSearchSuggestionsResult zzQ(final Status paramStatus)
    {
      return new GamesMetadata.LoadGameSearchSuggestionsResult()
      {
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

  private static abstract class LoadGamesImpl extends Games.BaseGamesApiMethodImpl<GamesMetadata.LoadGamesResult>
  {
    private LoadGamesImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public GamesMetadata.LoadGamesResult zzR(final Status paramStatus)
    {
      return new GamesMetadata.LoadGamesResult()
      {
        public GameBuffer getGames()
        {
          return new GameBuffer(DataHolder.zzay(14));
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