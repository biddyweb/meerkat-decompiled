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
import com.google.android.gms.games.multiplayer.InvitationBuffer;
import com.google.android.gms.games.multiplayer.Invitations;
import com.google.android.gms.games.multiplayer.Invitations.LoadInvitationsResult;
import com.google.android.gms.games.multiplayer.OnInvitationReceivedListener;

public final class InvitationsImpl
  implements Invitations
{
  public Intent getInvitationInboxIntent(GoogleApiClient paramGoogleApiClient)
  {
    return Games.zzd(paramGoogleApiClient).zznw();
  }

  public PendingResult<Invitations.LoadInvitationsResult> loadInvitations(GoogleApiClient paramGoogleApiClient)
  {
    return loadInvitations(paramGoogleApiClient, 0);
  }

  public PendingResult<Invitations.LoadInvitationsResult> loadInvitations(GoogleApiClient paramGoogleApiClient, final int paramInt)
  {
    return paramGoogleApiClient.zza(new LoadInvitationsImpl(paramGoogleApiClient, paramInt)
    {
      protected void zza(GamesClientImpl paramAnonymousGamesClientImpl)
        throws RemoteException
      {
        paramAnonymousGamesClientImpl.zzc(this, paramInt);
      }
    });
  }

  public void registerInvitationListener(GoogleApiClient paramGoogleApiClient, OnInvitationReceivedListener paramOnInvitationReceivedListener)
  {
    GamesClientImpl localGamesClientImpl = Games.zzb(paramGoogleApiClient, false);
    if (localGamesClientImpl != null)
      localGamesClientImpl.zza(paramGoogleApiClient.zzf(paramOnInvitationReceivedListener));
  }

  public void unregisterInvitationListener(GoogleApiClient paramGoogleApiClient)
  {
    GamesClientImpl localGamesClientImpl = Games.zzb(paramGoogleApiClient, false);
    if (localGamesClientImpl != null)
      localGamesClientImpl.zznx();
  }

  private static abstract class LoadInvitationsImpl extends Games.BaseGamesApiMethodImpl<Invitations.LoadInvitationsResult>
  {
    private LoadInvitationsImpl(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Invitations.LoadInvitationsResult zzS(final Status paramStatus)
    {
      return new Invitations.LoadInvitationsResult()
      {
        public InvitationBuffer getInvitations()
        {
          return new InvitationBuffer(DataHolder.zzay(14));
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