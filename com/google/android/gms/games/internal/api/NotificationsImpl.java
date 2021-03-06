package com.google.android.gms.games.internal.api;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.Games.BaseGamesApiMethodImpl;
import com.google.android.gms.games.Notifications;
import com.google.android.gms.games.Notifications.ContactSettingLoadResult;
import com.google.android.gms.games.Notifications.GameMuteStatusChangeResult;
import com.google.android.gms.games.Notifications.GameMuteStatusLoadResult;
import com.google.android.gms.games.Notifications.InboxCountResult;
import com.google.android.gms.games.internal.GamesClientImpl;

public final class NotificationsImpl
  implements Notifications
{
  public void clear(GoogleApiClient paramGoogleApiClient, int paramInt)
  {
    GamesClientImpl localGamesClientImpl = Games.zzb(paramGoogleApiClient, false);
    if (localGamesClientImpl != null)
      localGamesClientImpl.zzeC(paramInt);
  }

  public void clearAll(GoogleApiClient paramGoogleApiClient)
  {
    clear(paramGoogleApiClient, 31);
  }

  private static abstract class ContactSettingLoadImpl extends Games.BaseGamesApiMethodImpl<Notifications.ContactSettingLoadResult>
  {
    public Notifications.ContactSettingLoadResult zzZ(final Status paramStatus)
    {
      return new Notifications.ContactSettingLoadResult()
      {
        public Status getStatus()
        {
          return paramStatus;
        }
      };
    }
  }

  private static abstract class ContactSettingUpdateImpl extends Games.BaseGamesApiMethodImpl<Status>
  {
    public Status zzb(Status paramStatus)
    {
      return paramStatus;
    }
  }

  private static abstract class InboxCountImpl extends Games.BaseGamesApiMethodImpl<Notifications.InboxCountResult>
  {
    public Notifications.InboxCountResult zzaa(final Status paramStatus)
    {
      return new Notifications.InboxCountResult()
      {
        public Status getStatus()
        {
          return paramStatus;
        }
      };
    }
  }
}