package com.google.android.gms.games.internal;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.view.View;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.common.api.zzc;
import com.google.android.gms.common.api.zze;
import com.google.android.gms.common.api.zze.zzb;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zza;
import com.google.android.gms.common.internal.BinderWrapper;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameBuffer;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.Games.GamesOptions;
import com.google.android.gms.games.GamesMetadata.LoadExtendedGamesResult;
import com.google.android.gms.games.GamesMetadata.LoadGameInstancesResult;
import com.google.android.gms.games.GamesMetadata.LoadGameSearchSuggestionsResult;
import com.google.android.gms.games.GamesMetadata.LoadGamesResult;
import com.google.android.gms.games.GamesStatusCodes;
import com.google.android.gms.games.Notifications.ContactSettingLoadResult;
import com.google.android.gms.games.Notifications.GameMuteStatusChangeResult;
import com.google.android.gms.games.Notifications.GameMuteStatusLoadResult;
import com.google.android.gms.games.Notifications.InboxCountResult;
import com.google.android.gms.games.OnNearbyPlayerDetectedListener;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerBuffer;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.games.Players.LoadOwnerCoverPhotoUrisResult;
import com.google.android.gms.games.Players.LoadPlayersResult;
import com.google.android.gms.games.Players.LoadProfileSettingsResult;
import com.google.android.gms.games.Players.LoadXpForGameCategoriesResult;
import com.google.android.gms.games.Players.LoadXpStreamResult;
import com.google.android.gms.games.achievement.AchievementBuffer;
import com.google.android.gms.games.achievement.Achievements.LoadAchievementsResult;
import com.google.android.gms.games.achievement.Achievements.UpdateAchievementResult;
import com.google.android.gms.games.appcontent.AppContents.LoadAppContentResult;
import com.google.android.gms.games.event.EventBuffer;
import com.google.android.gms.games.event.Events.LoadEventsResult;
import com.google.android.gms.games.internal.constants.RequestType;
import com.google.android.gms.games.internal.events.EventIncrementCache;
import com.google.android.gms.games.internal.events.EventIncrementManager;
import com.google.android.gms.games.internal.experience.ExperienceEventBuffer;
import com.google.android.gms.games.internal.game.Acls.LoadAclResult;
import com.google.android.gms.games.internal.game.ExtendedGameBuffer;
import com.google.android.gms.games.internal.game.GameInstanceBuffer;
import com.google.android.gms.games.internal.game.GameSearchSuggestionBuffer;
import com.google.android.gms.games.internal.request.RequestUpdateOutcomes;
import com.google.android.gms.games.leaderboard.Leaderboard;
import com.google.android.gms.games.leaderboard.LeaderboardBuffer;
import com.google.android.gms.games.leaderboard.LeaderboardEntity;
import com.google.android.gms.games.leaderboard.LeaderboardScore;
import com.google.android.gms.games.leaderboard.LeaderboardScoreBuffer;
import com.google.android.gms.games.leaderboard.LeaderboardScoreBufferHeader;
import com.google.android.gms.games.leaderboard.LeaderboardScoreEntity;
import com.google.android.gms.games.leaderboard.Leaderboards.LeaderboardMetadataResult;
import com.google.android.gms.games.leaderboard.Leaderboards.LoadPlayerScoreResult;
import com.google.android.gms.games.leaderboard.Leaderboards.LoadScoresResult;
import com.google.android.gms.games.leaderboard.Leaderboards.SubmitScoreResult;
import com.google.android.gms.games.leaderboard.ScoreSubmissionData;
import com.google.android.gms.games.multiplayer.Invitation;
import com.google.android.gms.games.multiplayer.InvitationBuffer;
import com.google.android.gms.games.multiplayer.Invitations.LoadInvitationsResult;
import com.google.android.gms.games.multiplayer.OnInvitationReceivedListener;
import com.google.android.gms.games.multiplayer.ParticipantResult;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMessage;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMessageReceivedListener;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer.ReliableMessageSentCallback;
import com.google.android.gms.games.multiplayer.realtime.Room;
import com.google.android.gms.games.multiplayer.realtime.RoomBuffer;
import com.google.android.gms.games.multiplayer.realtime.RoomConfig;
import com.google.android.gms.games.multiplayer.realtime.RoomEntity;
import com.google.android.gms.games.multiplayer.realtime.RoomStatusUpdateListener;
import com.google.android.gms.games.multiplayer.realtime.RoomUpdateListener;
import com.google.android.gms.games.multiplayer.turnbased.LoadMatchesResponse;
import com.google.android.gms.games.multiplayer.turnbased.OnTurnBasedMatchUpdateReceivedListener;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMatch;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMatchBuffer;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMatchConfig;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.CancelMatchResult;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.InitiateMatchResult;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.LeaveMatchResult;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.LoadMatchResult;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.LoadMatchesResult;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.UpdateMatchResult;
import com.google.android.gms.games.quest.Milestone;
import com.google.android.gms.games.quest.Quest;
import com.google.android.gms.games.quest.QuestBuffer;
import com.google.android.gms.games.quest.QuestEntity;
import com.google.android.gms.games.quest.QuestUpdateListener;
import com.google.android.gms.games.quest.Quests.AcceptQuestResult;
import com.google.android.gms.games.quest.Quests.ClaimMilestoneResult;
import com.google.android.gms.games.quest.Quests.LoadQuestsResult;
import com.google.android.gms.games.request.GameRequest;
import com.google.android.gms.games.request.GameRequestBuffer;
import com.google.android.gms.games.request.OnRequestReceivedListener;
import com.google.android.gms.games.request.Requests.LoadRequestSummariesResult;
import com.google.android.gms.games.request.Requests.LoadRequestsResult;
import com.google.android.gms.games.request.Requests.SendRequestResult;
import com.google.android.gms.games.request.Requests.UpdateRequestsResult;
import com.google.android.gms.games.snapshot.Snapshot;
import com.google.android.gms.games.snapshot.SnapshotContents;
import com.google.android.gms.games.snapshot.SnapshotContentsEntity;
import com.google.android.gms.games.snapshot.SnapshotEntity;
import com.google.android.gms.games.snapshot.SnapshotMetadata;
import com.google.android.gms.games.snapshot.SnapshotMetadataBuffer;
import com.google.android.gms.games.snapshot.SnapshotMetadataChange;
import com.google.android.gms.games.snapshot.SnapshotMetadataChangeEntity;
import com.google.android.gms.games.snapshot.SnapshotMetadataEntity;
import com.google.android.gms.games.snapshot.Snapshots.CommitSnapshotResult;
import com.google.android.gms.games.snapshot.Snapshots.DeleteSnapshotResult;
import com.google.android.gms.games.snapshot.Snapshots.LoadSnapshotsResult;
import com.google.android.gms.games.snapshot.Snapshots.OpenSnapshotResult;
import com.google.android.gms.internal.zzvc;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.Executors;

public final class GamesClientImpl extends zzk<IGamesService>
  implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener
{
  EventIncrementManager zzadP = new EventIncrementManager()
  {
    public EventIncrementCache zznM()
    {
      return new GamesClientImpl.GameClientEventIncrementCache(GamesClientImpl.this);
    }
  };
  private final String zzadQ;
  private PlayerEntity zzadR;
  private GameEntity zzadS;
  private final PopupManager zzadT;
  private boolean zzadU = false;
  private final Binder zzadV;
  private final long zzadW;
  private final Games.GamesOptions zzadX;

  public GamesClientImpl(Context paramContext, Looper paramLooper, zzf paramzzf, Games.GamesOptions paramGamesOptions, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramLooper, 1, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
    this.zzadQ = paramzzf.zziR();
    this.zzadV = new Binder();
    this.zzadT = PopupManager.zza(this, paramzzf.zziO());
    zzl(paramzzf.zziT());
    this.zzadW = hashCode();
    this.zzadX = paramGamesOptions;
    registerConnectionCallbacks(this);
    registerConnectionFailedListener(this);
  }

  private static Room zzR(DataHolder paramDataHolder)
  {
    RoomBuffer localRoomBuffer = new RoomBuffer(paramDataHolder);
    try
    {
      int i = localRoomBuffer.getCount();
      Room localRoom = null;
      if (i > 0)
        localRoom = (Room)((Room)localRoomBuffer.get(0)).freeze();
      return localRoom;
    }
    finally
    {
      localRoomBuffer.release();
    }
  }

  private void zznn()
  {
    this.zzadR = null;
    this.zzadS = null;
  }

  public void connect()
  {
    zznn();
    super.connect();
  }

  public void disconnect()
  {
    this.zzadU = false;
    if (isConnected());
    try
    {
      IGamesService localIGamesService = (IGamesService)zzjb();
      localIGamesService.zznL();
      this.zzadP.flush();
      localIGamesService.zzu(this.zzadW);
      super.disconnect();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      while (true)
        GamesLog.zzr("GamesClientImpl", "Failed to notify client disconnect.");
    }
  }

  public void onConnected(Bundle paramBundle)
  {
    if (this.zzadU)
    {
      this.zzadT.zzoc();
      this.zzadU = false;
    }
    if (!this.zzadX.zzacA)
      zzno();
  }

  public void onConnectionFailed(ConnectionResult paramConnectionResult)
  {
    this.zzadU = false;
  }

  public void onConnectionSuspended(int paramInt)
  {
  }

  public int zza(zze<RealTimeMultiplayer.ReliableMessageSentCallback> paramzze, byte[] paramArrayOfByte, String paramString1, String paramString2)
  {
    try
    {
      int i = ((IGamesService)zzjb()).zza(new RealTimeReliableMessageBinderCallbacks(paramzze), paramArrayOfByte, paramString1, paramString2);
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return -1;
  }

  public int zza(byte[] paramArrayOfByte, String paramString, String[] paramArrayOfString)
  {
    zzx.zzb(paramArrayOfString, "Participant IDs must not be null");
    try
    {
      int i = ((IGamesService)zzjb()).zzb(paramArrayOfByte, paramString, paramArrayOfString);
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return -1;
  }

  public Intent zza(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zza(paramInt1, paramInt2, paramBoolean);
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public Intent zza(int paramInt1, byte[] paramArrayOfByte, int paramInt2, Bitmap paramBitmap, String paramString)
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zza(paramInt1, paramArrayOfByte, paramInt2, paramString);
      zzx.zzb(paramBitmap, "Must provide a non null icon");
      localIntent.putExtra("com.google.android.gms.games.REQUEST_ITEM_ICON", paramBitmap);
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public Intent zza(PlayerEntity paramPlayerEntity)
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zza(paramPlayerEntity);
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public Intent zza(Room paramRoom, int paramInt)
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zza((RoomEntity)paramRoom.freeze(), paramInt);
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public Intent zza(String paramString, boolean paramBoolean1, boolean paramBoolean2, int paramInt)
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zza(paramString, paramBoolean1, paramBoolean2, paramInt);
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  protected void zza(int paramInt, IBinder paramIBinder, Bundle paramBundle)
  {
    if ((paramInt == 0) && (paramBundle != null))
    {
      paramBundle.setClassLoader(GamesClientImpl.class.getClassLoader());
      this.zzadU = paramBundle.getBoolean("show_welcome_popup");
      this.zzadR = ((PlayerEntity)paramBundle.getParcelable("com.google.android.gms.games.current_player"));
      this.zzadS = ((GameEntity)paramBundle.getParcelable("com.google.android.gms.games.current_game"));
    }
    super.zza(paramInt, paramIBinder, paramBundle);
  }

  public void zza(IBinder paramIBinder, Bundle paramBundle)
  {
    if (isConnected());
    try
    {
      ((IGamesService)zzjb()).zza(paramIBinder, paramBundle);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public void zza(zza.zzb<Requests.LoadRequestsResult> paramzzb, int paramInt1, int paramInt2, int paramInt3)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new RequestsLoadedBinderCallbacks(paramzzb), paramInt1, paramInt2, paramInt3);
  }

  public void zza(zza.zzb<GamesMetadata.LoadExtendedGamesResult> paramzzb, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new ExtendedGamesLoadedBinderCallback(paramzzb), paramInt1, paramInt2, paramBoolean1, paramBoolean2);
  }

  public void zza(zza.zzb<AppContents.LoadAppContentResult> paramzzb, int paramInt, String paramString, String[] paramArrayOfString, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new AppContentLoadedBinderCallbacks(paramzzb), paramInt, paramString, paramArrayOfString, paramBoolean);
  }

  public void zza(zza.zzb<Players.LoadPlayersResult> paramzzb, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new PlayersLoadedBinderCallback(paramzzb), paramInt, paramBoolean1, paramBoolean2);
  }

  public void zza(zza.zzb<TurnBasedMultiplayer.LoadMatchesResult> paramzzb, int paramInt, int[] paramArrayOfInt)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new TurnBasedMatchesLoadedBinderCallbacks(paramzzb), paramInt, paramArrayOfInt);
  }

  public void zza(zza.zzb<Leaderboards.LoadScoresResult> paramzzb, LeaderboardScoreBuffer paramLeaderboardScoreBuffer, int paramInt1, int paramInt2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new LeaderboardScoresLoadedBinderCallback(paramzzb), paramLeaderboardScoreBuffer.zzoQ().zzoR(), paramInt1, paramInt2);
  }

  public void zza(zza.zzb<TurnBasedMultiplayer.InitiateMatchResult> paramzzb, TurnBasedMatchConfig paramTurnBasedMatchConfig)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new TurnBasedMatchInitiatedBinderCallbacks(paramzzb), paramTurnBasedMatchConfig.getVariant(), paramTurnBasedMatchConfig.zzoX(), paramTurnBasedMatchConfig.getInvitedPlayerIds(), paramTurnBasedMatchConfig.getAutoMatchCriteria());
  }

  public void zza(zza.zzb<Snapshots.CommitSnapshotResult> paramzzb, Snapshot paramSnapshot, SnapshotMetadataChange paramSnapshotMetadataChange)
    throws RemoteException
  {
    SnapshotContents localSnapshotContents = paramSnapshot.getSnapshotContents();
    if (!localSnapshotContents.isClosed());
    for (boolean bool = true; ; bool = false)
    {
      zzx.zza(bool, "Snapshot already closed");
      zza localzza = paramSnapshotMetadataChange.zzpc();
      if (localzza != null)
        localzza.zza(getContext().getCacheDir());
      Contents localContents = localSnapshotContents.zzkq();
      localSnapshotContents.close();
      ((IGamesService)zzjb()).zza(new SnapshotCommittedBinderCallbacks(paramzzb), paramSnapshot.getMetadata().getSnapshotId(), (SnapshotMetadataChangeEntity)paramSnapshotMetadataChange, localContents);
      return;
    }
  }

  public void zza(zza.zzb<Achievements.UpdateAchievementResult> paramzzb, String paramString)
    throws RemoteException
  {
    if (paramzzb == null);
    for (Object localObject = null; ; localObject = new AchievementUpdatedBinderCallback(paramzzb))
    {
      ((IGamesService)zzjb()).zza((IGamesCallbacks)localObject, paramString, this.zzadT.zzoe(), this.zzadT.zzod());
      return;
    }
  }

  public void zza(zza.zzb<Achievements.UpdateAchievementResult> paramzzb, String paramString, int paramInt)
    throws RemoteException
  {
    if (paramzzb == null);
    for (Object localObject = null; ; localObject = new AchievementUpdatedBinderCallback(paramzzb))
    {
      ((IGamesService)zzjb()).zza((IGamesCallbacks)localObject, paramString, paramInt, this.zzadT.zzoe(), this.zzadT.zzod());
      return;
    }
  }

  public void zza(zza.zzb<Leaderboards.LoadScoresResult> paramzzb, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new LeaderboardScoresLoadedBinderCallback(paramzzb), paramString, paramInt1, paramInt2, paramInt3, paramBoolean);
  }

  public void zza(zza.zzb<Players.LoadPlayersResult> paramzzb, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException
  {
    int i = -1;
    switch (paramString.hashCode())
    {
    default:
    case 156408498:
    }
    while (true)
      switch (i)
      {
      default:
        throw new IllegalArgumentException("Invalid player collection: " + paramString);
        if (paramString.equals("played_with"))
          i = 0;
        break;
      case 0:
      }
    ((IGamesService)zzjb()).zzd(new PlayersLoadedBinderCallback(paramzzb), paramString, paramInt, paramBoolean1, paramBoolean2);
  }

  public void zza(zza.zzb<GamesMetadata.LoadExtendedGamesResult> paramzzb, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new ExtendedGamesLoadedBinderCallback(paramzzb), paramString, paramInt, paramBoolean1, paramBoolean2, paramBoolean3, paramBoolean4);
  }

  public void zza(zza.zzb<TurnBasedMultiplayer.LoadMatchesResult> paramzzb, String paramString, int paramInt, int[] paramArrayOfInt)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new TurnBasedMatchesLoadedBinderCallbacks(paramzzb), paramString, paramInt, paramArrayOfInt);
  }

  public void zza(zza.zzb<Leaderboards.SubmitScoreResult> paramzzb, String paramString1, long paramLong, String paramString2)
    throws RemoteException
  {
    if (paramzzb == null);
    for (Object localObject = null; ; localObject = new SubmitScoreBinderCallbacks(paramzzb))
    {
      ((IGamesService)zzjb()).zza((IGamesCallbacks)localObject, paramString1, paramLong, paramString2);
      return;
    }
  }

  public void zza(zza.zzb<TurnBasedMultiplayer.LeaveMatchResult> paramzzb, String paramString1, String paramString2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzc(new TurnBasedMatchLeftBinderCallbacks(paramzzb), paramString1, paramString2);
  }

  public void zza(zza.zzb<Leaderboards.LoadPlayerScoreResult> paramzzb, String paramString1, String paramString2, int paramInt1, int paramInt2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new PlayerLeaderboardScoreLoadedBinderCallback(paramzzb), paramString1, paramString2, paramInt1, paramInt2);
  }

  public void zza(zza.zzb<Requests.LoadRequestsResult> paramzzb, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new RequestsLoadedBinderCallbacks(paramzzb), paramString1, paramString2, paramInt1, paramInt2, paramInt3);
  }

  public void zza(zza.zzb<Leaderboards.LoadScoresResult> paramzzb, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new LeaderboardScoresLoadedBinderCallback(paramzzb), paramString1, paramString2, paramInt1, paramInt2, paramInt3, paramBoolean);
  }

  public void zza(zza.zzb<Players.LoadPlayersResult> paramzzb, String paramString1, String paramString2, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException
  {
    int i = -1;
    switch (paramString1.hashCode())
    {
    default:
    case 782949780:
    case 156408498:
    case -1049482625:
    }
    while (true)
      switch (i)
      {
      default:
        throw new IllegalArgumentException("Invalid player collection: " + paramString1);
        if (paramString1.equals("circled"))
        {
          i = 0;
          continue;
          if (paramString1.equals("played_with"))
          {
            i = 1;
            continue;
            if (paramString1.equals("nearby"))
              i = 2;
          }
        }
        break;
      case 0:
      case 1:
      case 2:
      }
    ((IGamesService)zzjb()).zza(new PlayersLoadedBinderCallback(paramzzb), paramString1, paramString2, paramInt, paramBoolean1, paramBoolean2);
  }

  public void zza(zza.zzb<Snapshots.OpenSnapshotResult> paramzzb, String paramString1, String paramString2, SnapshotMetadataChange paramSnapshotMetadataChange, SnapshotContents paramSnapshotContents)
    throws RemoteException
  {
    if (!paramSnapshotContents.isClosed());
    for (boolean bool = true; ; bool = false)
    {
      zzx.zza(bool, "SnapshotContents already closed");
      zza localzza = paramSnapshotMetadataChange.zzpc();
      if (localzza != null)
        localzza.zza(getContext().getCacheDir());
      Contents localContents = paramSnapshotContents.zzkq();
      paramSnapshotContents.close();
      ((IGamesService)zzjb()).zza(new SnapshotOpenedBinderCallbacks(paramzzb), paramString1, paramString2, (SnapshotMetadataChangeEntity)paramSnapshotMetadataChange, localContents);
      return;
    }
  }

  public void zza(zza.zzb<Leaderboards.LeaderboardMetadataResult> paramzzb, String paramString1, String paramString2, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzb(new LeaderboardsLoadedBinderCallback(paramzzb), paramString1, paramString2, paramBoolean);
  }

  public void zza(zza.zzb<Quests.LoadQuestsResult> paramzzb, String paramString1, String paramString2, boolean paramBoolean, String[] paramArrayOfString)
    throws RemoteException
  {
    this.zzadP.flush();
    ((IGamesService)zzjb()).zza(new QuestsLoadedBinderCallbacks(paramzzb), paramString1, paramString2, paramArrayOfString, paramBoolean);
  }

  public void zza(zza.zzb<Quests.LoadQuestsResult> paramzzb, String paramString1, String paramString2, int[] paramArrayOfInt, int paramInt, boolean paramBoolean)
    throws RemoteException
  {
    this.zzadP.flush();
    ((IGamesService)zzjb()).zza(new QuestsLoadedBinderCallbacks(paramzzb), paramString1, paramString2, paramArrayOfInt, paramInt, paramBoolean);
  }

  public void zza(zza.zzb<Requests.UpdateRequestsResult> paramzzb, String paramString1, String paramString2, String[] paramArrayOfString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new RequestsUpdatedBinderCallbacks(paramzzb), paramString1, paramString2, paramArrayOfString);
  }

  public void zza(zza.zzb<Players.LoadPlayersResult> paramzzb, String paramString, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzf(new PlayersLoadedBinderCallback(paramzzb), paramString, paramBoolean);
  }

  public void zza(zza.zzb<Snapshots.OpenSnapshotResult> paramzzb, String paramString, boolean paramBoolean, int paramInt)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new SnapshotOpenedBinderCallbacks(paramzzb), paramString, paramBoolean, paramInt);
  }

  public void zza(zza.zzb<TurnBasedMultiplayer.UpdateMatchResult> paramzzb, String paramString1, byte[] paramArrayOfByte, String paramString2, ParticipantResult[] paramArrayOfParticipantResult)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new TurnBasedMatchUpdatedBinderCallbacks(paramzzb), paramString1, paramArrayOfByte, paramString2, paramArrayOfParticipantResult);
  }

  public void zza(zza.zzb<TurnBasedMultiplayer.UpdateMatchResult> paramzzb, String paramString, byte[] paramArrayOfByte, ParticipantResult[] paramArrayOfParticipantResult)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new TurnBasedMatchUpdatedBinderCallbacks(paramzzb), paramString, paramArrayOfByte, paramArrayOfParticipantResult);
  }

  public void zza(zza.zzb<Requests.SendRequestResult> paramzzb, String paramString, String[] paramArrayOfString, int paramInt1, byte[] paramArrayOfByte, int paramInt2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new RequestSentBinderCallbacks(paramzzb), paramString, paramArrayOfString, paramInt1, paramArrayOfByte, paramInt2);
  }

  public void zza(zza.zzb<Players.LoadPlayersResult> paramzzb, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzc(new PlayersLoadedBinderCallback(paramzzb), paramBoolean);
  }

  public void zza(zza.zzb<Status> paramzzb, boolean paramBoolean, Bundle paramBundle)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new ContactSettingsUpdatedBinderCallback(paramzzb), paramBoolean, paramBundle);
  }

  public void zza(zza.zzb<Events.LoadEventsResult> paramzzb, boolean paramBoolean, String[] paramArrayOfString)
    throws RemoteException
  {
    this.zzadP.flush();
    ((IGamesService)zzjb()).zza(new EventsLoadedBinderCallback(paramzzb), paramBoolean, paramArrayOfString);
  }

  public void zza(zza.zzb<Quests.LoadQuestsResult> paramzzb, int[] paramArrayOfInt, int paramInt, boolean paramBoolean)
    throws RemoteException
  {
    this.zzadP.flush();
    ((IGamesService)zzjb()).zza(new QuestsLoadedBinderCallbacks(paramzzb), paramArrayOfInt, paramInt, paramBoolean);
  }

  public void zza(zza.zzb<Players.LoadPlayersResult> paramzzb, String[] paramArrayOfString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzc(new PlayersLoadedBinderCallback(paramzzb), paramArrayOfString);
  }

  public void zza(zze<OnInvitationReceivedListener> paramzze)
  {
    try
    {
      InvitationReceivedBinderCallback localInvitationReceivedBinderCallback = new InvitationReceivedBinderCallback(paramzze);
      ((IGamesService)zzjb()).zza(localInvitationReceivedBinderCallback, this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public void zza(zze<RoomUpdateListener> paramzze, zze<RoomStatusUpdateListener> paramzze1, zze<RealTimeMessageReceivedListener> paramzze2, RoomConfig paramRoomConfig)
  {
    try
    {
      RoomBinderCallbacks localRoomBinderCallbacks = new RoomBinderCallbacks(paramzze, paramzze1, paramzze2);
      ((IGamesService)zzjb()).zza(localRoomBinderCallbacks, this.zzadV, paramRoomConfig.getVariant(), paramRoomConfig.getInvitedPlayerIds(), paramRoomConfig.getAutoMatchCriteria(), false, this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public void zza(zze<RoomUpdateListener> paramzze, String paramString)
  {
    try
    {
      ((IGamesService)zzjb()).zzc(new RoomBinderCallbacks(paramzze), paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public void zza(Snapshot paramSnapshot)
  {
    SnapshotContents localSnapshotContents = paramSnapshot.getSnapshotContents();
    boolean bool;
    if (!localSnapshotContents.isClosed())
      bool = true;
    while (true)
    {
      zzx.zza(bool, "Snapshot already closed");
      Contents localContents = localSnapshotContents.zzkq();
      localSnapshotContents.close();
      try
      {
        ((IGamesService)zzjb()).zza(localContents);
        return;
        bool = false;
      }
      catch (RemoteException localRemoteException)
      {
        GamesLog.zzr("GamesClientImpl", "service died");
      }
    }
  }

  protected IGamesService zzaW(IBinder paramIBinder)
  {
    return IGamesService.Stub.zzaZ(paramIBinder);
  }

  public Intent zzb(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zzb(paramInt1, paramInt2, paramBoolean);
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public Intent zzb(int[] paramArrayOfInt)
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zzb(paramArrayOfInt);
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public void zzb(zza.zzb<Status> paramzzb)
    throws RemoteException
  {
    this.zzadP.flush();
    ((IGamesService)zzjb()).zza(new SignOutCompleteBinderCallbacks(paramzzb));
  }

  public void zzb(zza.zzb<Players.LoadPlayersResult> paramzzb, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzb(new PlayersLoadedBinderCallback(paramzzb), paramInt, paramBoolean1, paramBoolean2);
  }

  public void zzb(zza.zzb<Achievements.UpdateAchievementResult> paramzzb, String paramString)
    throws RemoteException
  {
    if (paramzzb == null);
    for (Object localObject = null; ; localObject = new AchievementUpdatedBinderCallback(paramzzb))
    {
      ((IGamesService)zzjb()).zzb((IGamesCallbacks)localObject, paramString, this.zzadT.zzoe(), this.zzadT.zzod());
      return;
    }
  }

  public void zzb(zza.zzb<Achievements.UpdateAchievementResult> paramzzb, String paramString, int paramInt)
    throws RemoteException
  {
    if (paramzzb == null);
    for (Object localObject = null; ; localObject = new AchievementUpdatedBinderCallback(paramzzb))
    {
      ((IGamesService)zzjb()).zzb((IGamesCallbacks)localObject, paramString, paramInt, this.zzadT.zzoe(), this.zzadT.zzod());
      return;
    }
  }

  public void zzb(zza.zzb<Leaderboards.LoadScoresResult> paramzzb, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzb(new LeaderboardScoresLoadedBinderCallback(paramzzb), paramString, paramInt1, paramInt2, paramInt3, paramBoolean);
  }

  public void zzb(zza.zzb<GamesMetadata.LoadExtendedGamesResult> paramzzb, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new ExtendedGamesLoadedBinderCallback(paramzzb), paramString, paramInt, paramBoolean1, paramBoolean2);
  }

  public void zzb(zza.zzb<Quests.ClaimMilestoneResult> paramzzb, String paramString1, String paramString2)
    throws RemoteException
  {
    this.zzadP.flush();
    ((IGamesService)zzjb()).zzf(new QuestMilestoneClaimBinderCallbacks(paramzzb, paramString2), paramString1, paramString2);
  }

  public void zzb(zza.zzb<Leaderboards.LoadScoresResult> paramzzb, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzb(new LeaderboardScoresLoadedBinderCallback(paramzzb), paramString1, paramString2, paramInt1, paramInt2, paramInt3, paramBoolean);
  }

  public void zzb(zza.zzb<Players.LoadPlayersResult> paramzzb, String paramString1, String paramString2, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzb(new PlayersLoadedBinderCallback(paramzzb), paramString1, paramString2, paramInt, paramBoolean1, paramBoolean2);
  }

  public void zzb(zza.zzb<Achievements.LoadAchievementsResult> paramzzb, String paramString1, String paramString2, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new AchievementsLoadedBinderCallback(paramzzb), paramString1, paramString2, paramBoolean);
  }

  public void zzb(zza.zzb<Leaderboards.LeaderboardMetadataResult> paramzzb, String paramString, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzc(new LeaderboardsLoadedBinderCallback(paramzzb), paramString, paramBoolean);
  }

  public void zzb(zza.zzb<Leaderboards.LeaderboardMetadataResult> paramzzb, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzb(new LeaderboardsLoadedBinderCallback(paramzzb), paramBoolean);
  }

  public void zzb(zza.zzb<Quests.LoadQuestsResult> paramzzb, boolean paramBoolean, String[] paramArrayOfString)
    throws RemoteException
  {
    this.zzadP.flush();
    ((IGamesService)zzjb()).zza(new QuestsLoadedBinderCallbacks(paramzzb), paramArrayOfString, paramBoolean);
  }

  public void zzb(zza.zzb<Requests.UpdateRequestsResult> paramzzb, String[] paramArrayOfString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new RequestsUpdatedBinderCallbacks(paramzzb), paramArrayOfString);
  }

  public void zzb(zze<OnTurnBasedMatchUpdateReceivedListener> paramzze)
  {
    try
    {
      MatchUpdateReceivedBinderCallback localMatchUpdateReceivedBinderCallback = new MatchUpdateReceivedBinderCallback(paramzze);
      ((IGamesService)zzjb()).zzb(localMatchUpdateReceivedBinderCallback, this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public void zzb(zze<RoomUpdateListener> paramzze, zze<RoomStatusUpdateListener> paramzze1, zze<RealTimeMessageReceivedListener> paramzze2, RoomConfig paramRoomConfig)
  {
    try
    {
      RoomBinderCallbacks localRoomBinderCallbacks = new RoomBinderCallbacks(paramzze, paramzze1, paramzze2);
      ((IGamesService)zzjb()).zza(localRoomBinderCallbacks, this.zzadV, paramRoomConfig.getInvitationId(), false, this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public void zzbO(String paramString)
  {
    try
    {
      ((IGamesService)zzjb()).zzbW(paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public Intent zzbP(String paramString)
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zzbP(paramString);
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public void zzbQ(String paramString)
  {
    try
    {
      ((IGamesService)zzjb()).zza(paramString, this.zzadT.zzoe(), this.zzadT.zzod());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public void zzc(zza.zzb<Invitations.LoadInvitationsResult> paramzzb, int paramInt)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new InvitationsLoadedBinderCallback(paramzzb), paramInt);
  }

  public void zzc(zza.zzb<Players.LoadPlayersResult> paramzzb, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzc(new PlayersLoadedBinderCallback(paramzzb), paramInt, paramBoolean1, paramBoolean2);
  }

  public void zzc(zza.zzb<TurnBasedMultiplayer.InitiateMatchResult> paramzzb, String paramString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzl(new TurnBasedMatchInitiatedBinderCallbacks(paramzzb), paramString);
  }

  public void zzc(zza.zzb<Players.LoadXpStreamResult> paramzzb, String paramString, int paramInt)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzb(new PlayerXpStreamLoadedBinderCallback(paramzzb), paramString, paramInt);
  }

  public void zzc(zza.zzb<GamesMetadata.LoadExtendedGamesResult> paramzzb, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zze(new ExtendedGamesLoadedBinderCallback(paramzzb), paramString, paramInt, paramBoolean1, paramBoolean2);
  }

  public void zzc(zza.zzb<TurnBasedMultiplayer.InitiateMatchResult> paramzzb, String paramString1, String paramString2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzd(new TurnBasedMatchInitiatedBinderCallbacks(paramzzb), paramString1, paramString2);
  }

  public void zzc(zza.zzb<Snapshots.LoadSnapshotsResult> paramzzb, String paramString1, String paramString2, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzc(new SnapshotsLoadedBinderCallbacks(paramzzb), paramString1, paramString2, paramBoolean);
  }

  public void zzc(zza.zzb<Leaderboards.LeaderboardMetadataResult> paramzzb, String paramString, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzd(new LeaderboardsLoadedBinderCallback(paramzzb), paramString, paramBoolean);
  }

  public void zzc(zza.zzb<Achievements.LoadAchievementsResult> paramzzb, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new AchievementsLoadedBinderCallback(paramzzb), paramBoolean);
  }

  public void zzc(zza.zzb<Requests.UpdateRequestsResult> paramzzb, String[] paramArrayOfString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzb(new RequestsUpdatedBinderCallbacks(paramzzb), paramArrayOfString);
  }

  public void zzc(zze<QuestUpdateListener> paramzze)
  {
    try
    {
      QuestUpdateBinderCallback localQuestUpdateBinderCallback = new QuestUpdateBinderCallback(paramzze);
      ((IGamesService)zzjb()).zzd(localQuestUpdateBinderCallback, this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  protected String zzcF()
  {
    return "com.google.android.gms.games.service.START";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.games.internal.IGamesService";
  }

  public int zzd(byte[] paramArrayOfByte, String paramString)
  {
    try
    {
      int i = ((IGamesService)zzjb()).zzb(paramArrayOfByte, paramString, null);
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return -1;
  }

  public void zzd(zza.zzb<Players.LoadPlayersResult> paramzzb, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zze(new PlayersLoadedBinderCallback(paramzzb), paramInt, paramBoolean1, paramBoolean2);
  }

  public void zzd(zza.zzb<TurnBasedMultiplayer.InitiateMatchResult> paramzzb, String paramString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzm(new TurnBasedMatchInitiatedBinderCallbacks(paramzzb), paramString);
  }

  public void zzd(zza.zzb<Players.LoadXpStreamResult> paramzzb, String paramString, int paramInt)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzc(new PlayerXpStreamLoadedBinderCallback(paramzzb), paramString, paramInt);
  }

  public void zzd(zza.zzb<GamesMetadata.LoadExtendedGamesResult> paramzzb, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzf(new ExtendedGamesLoadedBinderCallback(paramzzb), paramString, paramInt, paramBoolean1, paramBoolean2);
  }

  public void zzd(zza.zzb<TurnBasedMultiplayer.InitiateMatchResult> paramzzb, String paramString1, String paramString2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zze(new TurnBasedMatchInitiatedBinderCallbacks(paramzzb), paramString1, paramString2);
  }

  public void zzd(zza.zzb<Notifications.GameMuteStatusChangeResult> paramzzb, String paramString, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new GameMuteStatusChangedBinderCallback(paramzzb), paramString, paramBoolean);
  }

  public void zzd(zza.zzb<Events.LoadEventsResult> paramzzb, boolean paramBoolean)
    throws RemoteException
  {
    this.zzadP.flush();
    ((IGamesService)zzjb()).zzf(new EventsLoadedBinderCallback(paramzzb), paramBoolean);
  }

  public void zzd(zze<OnRequestReceivedListener> paramzze)
  {
    try
    {
      RequestReceivedBinderCallback localRequestReceivedBinderCallback = new RequestReceivedBinderCallback(paramzze);
      ((IGamesService)zzjb()).zzc(localRequestReceivedBinderCallback, this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public void zze(zza.zzb<TurnBasedMultiplayer.LeaveMatchResult> paramzzb, String paramString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzo(new TurnBasedMatchLeftBinderCallbacks(paramzzb), paramString);
  }

  public void zze(zza.zzb<Invitations.LoadInvitationsResult> paramzzb, String paramString, int paramInt)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzb(new InvitationsLoadedBinderCallback(paramzzb), paramString, paramInt, false);
  }

  public void zze(zza.zzb<GamesMetadata.LoadExtendedGamesResult> paramzzb, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzc(new ExtendedGamesLoadedBinderCallback(paramzzb), paramString, paramInt, paramBoolean1, paramBoolean2);
  }

  public void zze(zza.zzb<Snapshots.LoadSnapshotsResult> paramzzb, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzd(new SnapshotsLoadedBinderCallbacks(paramzzb), paramBoolean);
  }

  public void zzeB(int paramInt)
  {
    this.zzadT.setGravity(paramInt);
  }

  public void zzeC(int paramInt)
  {
    try
    {
      ((IGamesService)zzjb()).zzeC(paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  protected List<String> zzf(List<String> paramList)
  {
    int i = paramList.size();
    int j = 0;
    int k = 0;
    boolean bool1 = false;
    String str;
    int m;
    boolean bool3;
    if (j < i)
    {
      str = (String)paramList.get(j);
      if (str.equals("https://www.googleapis.com/auth/games"))
      {
        m = k;
        bool3 = true;
      }
    }
    while (true)
    {
      j++;
      bool1 = bool3;
      k = m;
      break;
      if (str.equals("https://www.googleapis.com/auth/games.firstparty"))
      {
        m = 1;
        bool3 = bool1;
        continue;
        if (k != 0)
        {
          if (!bool1);
          for (boolean bool2 = true; ; bool2 = false)
          {
            zzx.zza(bool2, "Cannot have both %s and %s!", new Object[] { "https://www.googleapis.com/auth/games", "https://www.googleapis.com/auth/games.firstparty" });
            return paramList;
          }
        }
        zzx.zza(bool1, "Games APIs requires %s to function.", new Object[] { "https://www.googleapis.com/auth/games" });
        return paramList;
      }
      else
      {
        m = k;
        bool3 = bool1;
      }
    }
  }

  public void zzf(zza.zzb<GamesMetadata.LoadGamesResult> paramzzb)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzd(new GamesLoadedBinderCallback(paramzzb));
  }

  public void zzf(zza.zzb<TurnBasedMultiplayer.CancelMatchResult> paramzzb, String paramString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzn(new TurnBasedMatchCanceledBinderCallbacks(paramzzb), paramString);
  }

  public void zzf(zza.zzb<Requests.LoadRequestSummariesResult> paramzzb, String paramString, int paramInt)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zza(new RequestSummariesLoadedBinderCallbacks(paramzzb), paramString, paramInt);
  }

  public void zzf(zza.zzb<Players.LoadPlayersResult> paramzzb, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzb(new PlayersLoadedBinderCallback(paramzzb), paramString, paramInt, paramBoolean1, paramBoolean2);
  }

  public void zzf(zza.zzb<Players.LoadProfileSettingsResult> paramzzb, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzg(new ProfileSettingsLoadedBinderCallback(paramzzb), paramBoolean);
  }

  public void zzg(zza.zzb<Players.LoadOwnerCoverPhotoUrisResult> paramzzb)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzj(new OwnerCoverPhotoUrisLoadedBinderCallback(paramzzb));
  }

  public void zzg(zza.zzb<TurnBasedMultiplayer.LoadMatchResult> paramzzb, String paramString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzp(new TurnBasedMatchLoadedBinderCallbacks(paramzzb), paramString);
  }

  public void zzg(zza.zzb<Status> paramzzb, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzh(new ProfileSettingsUpdatedBinderCallback(paramzzb), paramBoolean);
  }

  public void zzh(zza.zzb<Acls.LoadAclResult> paramzzb)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzh(new NotifyAclLoadedBinderCallback(paramzzb));
  }

  public void zzh(zza.zzb<Quests.AcceptQuestResult> paramzzb, String paramString)
    throws RemoteException
  {
    this.zzadP.flush();
    ((IGamesService)zzjb()).zzu(new QuestAcceptedBinderCallbacks(paramzzb), paramString);
  }

  public void zzh(zza.zzb<Notifications.ContactSettingLoadResult> paramzzb, boolean paramBoolean)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zze(new ContactSettingsLoadedBinderCallback(paramzzb), paramBoolean);
  }

  public boolean zzhc()
  {
    return true;
  }

  public Bundle zzhp()
  {
    try
    {
      Bundle localBundle = ((IGamesService)zzjb()).zzhp();
      if (localBundle != null)
        localBundle.setClassLoader(GamesClientImpl.class.getClassLoader());
      return localBundle;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  protected Bundle zzhq()
  {
    String str = getContext().getResources().getConfiguration().locale.toString();
    Bundle localBundle = new Bundle();
    localBundle.putString("com.google.android.gms.games.key.gamePackageName", this.zzadQ);
    localBundle.putBoolean("com.google.android.gms.games.key.isHeadless", this.zzadX.zzacA);
    localBundle.putBoolean("com.google.android.gms.games.key.showConnectingPopup", this.zzadX.zzacB);
    localBundle.putInt("com.google.android.gms.games.key.connectingPopupGravity", this.zzadX.zzacC);
    localBundle.putBoolean("com.google.android.gms.games.key.retryingSignIn", this.zzadX.zzacD);
    localBundle.putInt("com.google.android.gms.games.key.sdkVariant", this.zzadX.zzacE);
    localBundle.putString("com.google.android.gms.games.key.forceResolveAccountKey", this.zzadX.zzacF);
    localBundle.putStringArrayList("com.google.android.gms.games.key.proxyApis", this.zzadX.zzacG);
    localBundle.putString("com.google.android.gms.games.key.desiredLocale", str);
    localBundle.putParcelable("com.google.android.gms.games.key.popupWindowToken", new BinderWrapper(this.zzadT.zzoe()));
    zzf localzzf = zzja();
    if (localzzf.zziU() != null)
      localBundle.putBundle("com.google.android.gms.games.key.signInOptions", zzvc.zza(localzzf.zziU(), localzzf.zziV(), Executors.newSingleThreadExecutor()));
    return localBundle;
  }

  public void zzi(zza.zzb<Notifications.InboxCountResult> paramzzb)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzt(new InboxCountsLoadedBinderCallback(paramzzb), null);
  }

  public void zzi(zza.zzb<Snapshots.DeleteSnapshotResult> paramzzb, String paramString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzr(new SnapshotDeletedBinderCallbacks(paramzzb), paramString);
  }

  public void zzj(zza.zzb<GamesMetadata.LoadExtendedGamesResult> paramzzb, String paramString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zze(new ExtendedGamesLoadedBinderCallback(paramzzb), paramString);
  }

  public void zzk(zza.zzb<GamesMetadata.LoadGameInstancesResult> paramzzb, String paramString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzf(new GameInstancesLoadedBinderCallback(paramzzb), paramString);
  }

  public void zzl(View paramView)
  {
    this.zzadT.zzm(paramView);
  }

  public void zzl(zza.zzb<GamesMetadata.LoadGameSearchSuggestionsResult> paramzzb, String paramString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzq(new GameSearchSuggestionsLoadedBinderCallback(paramzzb), paramString);
  }

  public void zzm(zza.zzb<Players.LoadXpForGameCategoriesResult> paramzzb, String paramString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzs(new PlayerXpForGameCategoriesLoadedBinderCallback(paramzzb), paramString);
  }

  public void zzn(zza.zzb<Invitations.LoadInvitationsResult> paramzzb, String paramString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzk(new InvitationsLoadedBinderCallback(paramzzb), paramString);
  }

  public void zznA()
  {
    try
    {
      ((IGamesService)zzjb()).zzx(this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public Intent zznB()
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zznB();
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public Intent zznC()
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zznC();
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public int zznD()
  {
    try
    {
      int i = ((IGamesService)zzjb()).zznD();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return 4368;
  }

  public String zznE()
  {
    try
    {
      String str = ((IGamesService)zzjb()).zznE();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public int zznF()
  {
    try
    {
      int i = ((IGamesService)zzjb()).zznF();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return -1;
  }

  public Intent zznG()
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zznG();
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public int zznH()
  {
    try
    {
      int i = ((IGamesService)zzjb()).zznH();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return -1;
  }

  public int zznI()
  {
    try
    {
      int i = ((IGamesService)zzjb()).zznI();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return -1;
  }

  public int zznJ()
  {
    try
    {
      int i = ((IGamesService)zzjb()).zznJ();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return -1;
  }

  public int zznK()
  {
    try
    {
      int i = ((IGamesService)zzjb()).zznK();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return -1;
  }

  public void zznL()
  {
    if (isConnected());
    try
    {
      ((IGamesService)zzjb()).zznL();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public void zzno()
  {
    try
    {
      PopupLocationInfoBinderCallbacks localPopupLocationInfoBinderCallbacks = new PopupLocationInfoBinderCallbacks(this.zzadT);
      ((IGamesService)zzjb()).zza(localPopupLocationInfoBinderCallbacks, this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public String zznp()
  {
    try
    {
      String str = ((IGamesService)zzjb()).zznp();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public String zznq()
  {
    if (this.zzadR != null)
      return this.zzadR.getPlayerId();
    try
    {
      String str = ((IGamesService)zzjb()).zznq();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public Player zznr()
  {
    zzfc();
    try
    {
      PlayerEntity localPlayerEntity = this.zzadR;
      if (localPlayerEntity == null);
      try
      {
        PlayerBuffer localPlayerBuffer = new PlayerBuffer(((IGamesService)zzjb()).zznN());
        try
        {
          if (localPlayerBuffer.getCount() > 0)
            this.zzadR = ((PlayerEntity)localPlayerBuffer.get(0).freeze());
          localPlayerBuffer.release();
          return this.zzadR;
        }
        finally
        {
          localObject2 = finally;
          localPlayerBuffer.release();
          throw localObject2;
        }
      }
      catch (RemoteException localRemoteException)
      {
        while (true)
          GamesLog.zzr("GamesClientImpl", "service died");
      }
    }
    finally
    {
    }
  }

  public Game zzns()
  {
    zzfc();
    try
    {
      GameEntity localGameEntity = this.zzadS;
      if (localGameEntity == null);
      try
      {
        GameBuffer localGameBuffer = new GameBuffer(((IGamesService)zzjb()).zznP());
        try
        {
          if (localGameBuffer.getCount() > 0)
            this.zzadS = ((GameEntity)localGameBuffer.get(0).freeze());
          localGameBuffer.release();
          return this.zzadS;
        }
        finally
        {
          localObject2 = finally;
          localGameBuffer.release();
          throw localObject2;
        }
      }
      catch (RemoteException localRemoteException)
      {
        while (true)
          GamesLog.zzr("GamesClientImpl", "service died");
      }
    }
    finally
    {
    }
  }

  public Intent zznt()
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zznt();
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public Intent zznu()
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zznu();
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public Intent zznv()
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zznv();
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public Intent zznw()
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zznw();
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public void zznx()
  {
    try
    {
      ((IGamesService)zzjb()).zzv(this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public void zzny()
  {
    try
    {
      ((IGamesService)zzjb()).zzw(this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public void zznz()
  {
    try
    {
      ((IGamesService)zzjb()).zzy(this.zzadW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public Intent zzo(String paramString, int paramInt)
  {
    try
    {
      Intent localIntent = ((IGamesService)zzjb()).zzv(paramString, paramInt);
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
    return null;
  }

  public void zzo(zza.zzb<Status> paramzzb, String paramString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzj(new NotifyAclUpdatedBinderCallback(paramzzb), paramString);
  }

  public void zzp(zza.zzb<Notifications.GameMuteStatusLoadResult> paramzzb, String paramString)
    throws RemoteException
  {
    ((IGamesService)zzjb()).zzi(new GameMuteStatusLoadedBinderCallback(paramzzb), paramString);
  }

  public void zzp(String paramString, int paramInt)
  {
    this.zzadP.zzp(paramString, paramInt);
  }

  public void zzq(String paramString, int paramInt)
  {
    try
    {
      ((IGamesService)zzjb()).zzq(paramString, paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  public void zzr(String paramString, int paramInt)
  {
    try
    {
      ((IGamesService)zzjb()).zzr(paramString, paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      GamesLog.zzr("GamesClientImpl", "service died");
    }
  }

  private static abstract class AbstractPeerStatusNotifier extends GamesClientImpl.AbstractRoomStatusNotifier
  {
    private final ArrayList<String> zzadZ = new ArrayList();

    AbstractPeerStatusNotifier(DataHolder paramDataHolder, String[] paramArrayOfString)
    {
      super();
      int i = 0;
      int j = paramArrayOfString.length;
      while (i < j)
      {
        this.zzadZ.add(paramArrayOfString[i]);
        i++;
      }
    }

    protected void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      zza(paramRoomStatusUpdateListener, paramRoom, this.zzadZ);
    }

    protected abstract void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList);
  }

  private static abstract class AbstractRoomNotifier extends com.google.android.gms.common.api.zzb<RoomUpdateListener>
  {
    AbstractRoomNotifier(DataHolder paramDataHolder)
    {
      super();
    }

    protected void zza(RoomUpdateListener paramRoomUpdateListener, DataHolder paramDataHolder)
    {
      zza(paramRoomUpdateListener, GamesClientImpl.zzS(paramDataHolder), paramDataHolder.getStatusCode());
    }

    protected abstract void zza(RoomUpdateListener paramRoomUpdateListener, Room paramRoom, int paramInt);
  }

  private static abstract class AbstractRoomStatusNotifier extends com.google.android.gms.common.api.zzb<RoomStatusUpdateListener>
  {
    AbstractRoomStatusNotifier(DataHolder paramDataHolder)
    {
      super();
    }

    protected void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, DataHolder paramDataHolder)
    {
      zza(paramRoomStatusUpdateListener, GamesClientImpl.zzS(paramDataHolder));
    }

    protected abstract void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom);
  }

  private static final class AcceptQuestResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Quests.AcceptQuestResult
  {
    private final Quest zzaea;

    AcceptQuestResultImpl(DataHolder paramDataHolder)
    {
      super();
      QuestBuffer localQuestBuffer = new QuestBuffer(paramDataHolder);
      try
      {
        if (localQuestBuffer.getCount() > 0);
        for (this.zzaea = new QuestEntity((Quest)localQuestBuffer.get(0)); ; this.zzaea = null)
          return;
      }
      finally
      {
        localQuestBuffer.release();
      }
    }

    public Quest getQuest()
    {
      return this.zzaea;
    }
  }

  private static final class AchievementUpdatedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Achievements.UpdateAchievementResult> zzHa;

    AchievementUpdatedBinderCallback(zza.zzb<Achievements.UpdateAchievementResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzf(int paramInt, String paramString)
    {
      this.zzHa.zzd(new GamesClientImpl.UpdateAchievementResultImpl(paramInt, paramString));
    }
  }

  private static final class AchievementsLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Achievements.LoadAchievementsResult> zzHa;

    AchievementsLoadedBinderCallback(zza.zzb<Achievements.LoadAchievementsResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzc(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadAchievementsResultImpl(paramDataHolder));
    }
  }

  private static final class AppContentLoadedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<AppContents.LoadAppContentResult> zzaeb;

    public AppContentLoadedBinderCallbacks(zza.zzb<AppContents.LoadAppContentResult> paramzzb)
    {
      this.zzaeb = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zza(DataHolder[] paramArrayOfDataHolder)
    {
      this.zzaeb.zzd(new GamesClientImpl.LoadAppContentsResultImpl(paramArrayOfDataHolder));
    }
  }

  private static final class CancelMatchResultImpl
    implements TurnBasedMultiplayer.CancelMatchResult
  {
    private final Status zzHb;
    private final String zzaec;

    CancelMatchResultImpl(Status paramStatus, String paramString)
    {
      this.zzHb = paramStatus;
      this.zzaec = paramString;
    }

    public String getMatchId()
    {
      return this.zzaec;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  private static final class ClaimMilestoneResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Quests.ClaimMilestoneResult
  {
    private final Quest zzaea;
    private final Milestone zzaed;

    ClaimMilestoneResultImpl(DataHolder paramDataHolder, String paramString)
    {
      super();
      QuestBuffer localQuestBuffer = new QuestBuffer(paramDataHolder);
      try
      {
        if (localQuestBuffer.getCount() > 0)
        {
          this.zzaea = new QuestEntity((Quest)localQuestBuffer.get(0));
          List localList = this.zzaea.zzoZ();
          int j = localList.size();
          while (i < j)
          {
            if (((Milestone)localList.get(i)).getMilestoneId().equals(paramString))
            {
              this.zzaed = ((Milestone)localList.get(i));
              return;
            }
            i++;
          }
          this.zzaed = null;
        }
        while (true)
        {
          return;
          this.zzaed = null;
          this.zzaea = null;
        }
      }
      finally
      {
        localQuestBuffer.release();
      }
    }

    public Milestone getMilestone()
    {
      return this.zzaed;
    }

    public Quest getQuest()
    {
      return this.zzaea;
    }
  }

  private static final class CommitSnapshotResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Snapshots.CommitSnapshotResult
  {
    private final SnapshotMetadata zzaee;

    CommitSnapshotResultImpl(DataHolder paramDataHolder)
    {
      super();
      SnapshotMetadataBuffer localSnapshotMetadataBuffer = new SnapshotMetadataBuffer(paramDataHolder);
      try
      {
        if (localSnapshotMetadataBuffer.getCount() > 0);
        for (this.zzaee = new SnapshotMetadataEntity(localSnapshotMetadataBuffer.get(0)); ; this.zzaee = null)
          return;
      }
      finally
      {
        localSnapshotMetadataBuffer.release();
      }
    }

    public SnapshotMetadata getSnapshotMetadata()
    {
      return this.zzaee;
    }
  }

  private static final class ConnectedToRoomNotifier extends GamesClientImpl.AbstractRoomStatusNotifier
  {
    ConnectedToRoomNotifier(DataHolder paramDataHolder)
    {
      super();
    }

    public void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      paramRoomStatusUpdateListener.onConnectedToRoom(paramRoom);
    }
  }

  private static final class ContactSettingLoadResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Notifications.ContactSettingLoadResult
  {
    ContactSettingLoadResultImpl(DataHolder paramDataHolder)
    {
      super();
    }
  }

  private static final class ContactSettingsLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Notifications.ContactSettingLoadResult> zzHa;

    ContactSettingsLoadedBinderCallback(zza.zzb<Notifications.ContactSettingLoadResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzD(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.ContactSettingLoadResultImpl(paramDataHolder));
    }
  }

  private static final class ContactSettingsUpdatedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Status> zzHa;

    ContactSettingsUpdatedBinderCallback(zza.zzb<Status> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzey(int paramInt)
    {
      this.zzHa.zzd(GamesStatusCodes.zzep(paramInt));
    }
  }

  private static final class DeleteSnapshotResultImpl
    implements Snapshots.DeleteSnapshotResult
  {
    private final Status zzHb;
    private final String zzaef;

    DeleteSnapshotResultImpl(int paramInt, String paramString)
    {
      this.zzHb = GamesStatusCodes.zzep(paramInt);
      this.zzaef = paramString;
    }

    public String getSnapshotId()
    {
      return this.zzaef;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  private static final class DisconnectedFromRoomNotifier extends GamesClientImpl.AbstractRoomStatusNotifier
  {
    DisconnectedFromRoomNotifier(DataHolder paramDataHolder)
    {
      super();
    }

    public void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      paramRoomStatusUpdateListener.onDisconnectedFromRoom(paramRoom);
    }
  }

  private static final class EventsLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Events.LoadEventsResult> zzHa;

    EventsLoadedBinderCallback(zza.zzb<Events.LoadEventsResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzd(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadEventResultImpl(paramDataHolder));
    }
  }

  private static final class ExtendedGamesLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<GamesMetadata.LoadExtendedGamesResult> zzHa;

    ExtendedGamesLoadedBinderCallback(zza.zzb<GamesMetadata.LoadExtendedGamesResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzj(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadExtendedGamesResultImpl(paramDataHolder));
    }
  }

  private class GameClientEventIncrementCache extends EventIncrementCache
  {
    public GameClientEventIncrementCache()
    {
      super(1000);
    }

    protected void zzs(String paramString, int paramInt)
    {
      try
      {
        if (GamesClientImpl.this.isConnected())
        {
          ((IGamesService)GamesClientImpl.this.zzjb()).zzp(paramString, paramInt);
          return;
        }
        GamesLog.zzs("GamesClientImpl", "Unable to increment event " + paramString + " by " + paramInt + " because the games client is no longer connected");
        return;
      }
      catch (RemoteException localRemoteException)
      {
        GamesLog.zzr("GamesClientImpl", "service died");
      }
    }
  }

  private static final class GameInstancesLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<GamesMetadata.LoadGameInstancesResult> zzHa;

    GameInstancesLoadedBinderCallback(zza.zzb<GamesMetadata.LoadGameInstancesResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzk(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadGameInstancesResultImpl(paramDataHolder));
    }
  }

  private static final class GameMuteStatusChangeResultImpl
    implements Notifications.GameMuteStatusChangeResult
  {
    private final Status zzHb;
    private final String zzaeg;
    private final boolean zzaeh;

    public GameMuteStatusChangeResultImpl(int paramInt, String paramString, boolean paramBoolean)
    {
      this.zzHb = GamesStatusCodes.zzep(paramInt);
      this.zzaeg = paramString;
      this.zzaeh = paramBoolean;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  private static final class GameMuteStatusChangedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Notifications.GameMuteStatusChangeResult> zzHa;

    GameMuteStatusChangedBinderCallback(zza.zzb<Notifications.GameMuteStatusChangeResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zza(int paramInt, String paramString, boolean paramBoolean)
    {
      this.zzHa.zzd(new GamesClientImpl.GameMuteStatusChangeResultImpl(paramInt, paramString, paramBoolean));
    }
  }

  private static final class GameMuteStatusLoadResultImpl
    implements Notifications.GameMuteStatusLoadResult
  {
    private final Status zzHb;
    private final String zzaeg;
    private final boolean zzaeh;

    public GameMuteStatusLoadResultImpl(DataHolder paramDataHolder)
    {
      try
      {
        this.zzHb = GamesStatusCodes.zzep(paramDataHolder.getStatusCode());
        if (paramDataHolder.getCount() > 0)
          this.zzaeg = paramDataHolder.zzc("external_game_id", 0, 0);
        for (this.zzaeh = paramDataHolder.zzd("muted", 0, 0); ; this.zzaeh = false)
        {
          return;
          this.zzaeg = null;
        }
      }
      finally
      {
        paramDataHolder.close();
      }
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  private static final class GameMuteStatusLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Notifications.GameMuteStatusLoadResult> zzHa;

    GameMuteStatusLoadedBinderCallback(zza.zzb<Notifications.GameMuteStatusLoadResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzB(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.GameMuteStatusLoadResultImpl(paramDataHolder));
    }
  }

  private static final class GameSearchSuggestionsLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<GamesMetadata.LoadGameSearchSuggestionsResult> zzHa;

    GameSearchSuggestionsLoadedBinderCallback(zza.zzb<GamesMetadata.LoadGameSearchSuggestionsResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzl(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadGameSearchSuggestionsResultImpl(paramDataHolder));
    }
  }

  private static abstract class GamesDataHolderResult extends zzc
  {
    protected GamesDataHolderResult(DataHolder paramDataHolder)
    {
      super(GamesStatusCodes.zzep(paramDataHolder.getStatusCode()));
    }
  }

  private static final class GamesLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<GamesMetadata.LoadGamesResult> zzHa;

    GamesLoadedBinderCallback(zza.zzb<GamesMetadata.LoadGamesResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzi(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadGamesResultImpl(paramDataHolder));
    }
  }

  private static final class InboxCountResultImpl
    implements Notifications.InboxCountResult
  {
    private final Status zzHb;
    private final Bundle zzaei;

    InboxCountResultImpl(Status paramStatus, Bundle paramBundle)
    {
      this.zzHb = paramStatus;
      this.zzaei = paramBundle;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  private static final class InboxCountsLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Notifications.InboxCountResult> zzHa;

    InboxCountsLoadedBinderCallback(zza.zzb<Notifications.InboxCountResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzh(int paramInt, Bundle paramBundle)
    {
      paramBundle.setClassLoader(getClass().getClassLoader());
      Status localStatus = GamesStatusCodes.zzep(paramInt);
      this.zzHa.zzd(new GamesClientImpl.InboxCountResultImpl(localStatus, paramBundle));
    }
  }

  private static final class InitiateMatchResultImpl extends GamesClientImpl.TurnBasedMatchResult
    implements TurnBasedMultiplayer.InitiateMatchResult
  {
    InitiateMatchResultImpl(DataHolder paramDataHolder)
    {
      super();
    }
  }

  private static final class InvitationReceivedBinderCallback extends AbstractGamesCallbacks
  {
    private final zze<OnInvitationReceivedListener> zzTW;

    InvitationReceivedBinderCallback(zze<OnInvitationReceivedListener> paramzze)
    {
      this.zzTW = paramzze;
    }

    public void onInvitationRemoved(String paramString)
    {
      this.zzTW.zza(new GamesClientImpl.InvitationRemovedNotifier(paramString));
    }

    public void zzn(DataHolder paramDataHolder)
    {
      InvitationBuffer localInvitationBuffer = new InvitationBuffer(paramDataHolder);
      try
      {
        int i = localInvitationBuffer.getCount();
        Invitation localInvitation = null;
        if (i > 0)
          localInvitation = (Invitation)((Invitation)localInvitationBuffer.get(0)).freeze();
        localInvitationBuffer.release();
        if (localInvitation != null)
          this.zzTW.zza(new GamesClientImpl.InvitationReceivedNotifier(localInvitation));
        return;
      }
      finally
      {
        localInvitationBuffer.release();
      }
    }
  }

  private static final class InvitationReceivedNotifier
    implements zze.zzb<OnInvitationReceivedListener>
  {
    private final Invitation zzaej;

    InvitationReceivedNotifier(Invitation paramInvitation)
    {
      this.zzaej = paramInvitation;
    }

    public void zza(OnInvitationReceivedListener paramOnInvitationReceivedListener)
    {
      paramOnInvitationReceivedListener.onInvitationReceived(this.zzaej);
    }

    public void zzhX()
    {
    }
  }

  private static final class InvitationRemovedNotifier
    implements zze.zzb<OnInvitationReceivedListener>
  {
    private final String zzaek;

    InvitationRemovedNotifier(String paramString)
    {
      this.zzaek = paramString;
    }

    public void zza(OnInvitationReceivedListener paramOnInvitationReceivedListener)
    {
      paramOnInvitationReceivedListener.onInvitationRemoved(this.zzaek);
    }

    public void zzhX()
    {
    }
  }

  private static final class InvitationsLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Invitations.LoadInvitationsResult> zzHa;

    InvitationsLoadedBinderCallback(zza.zzb<Invitations.LoadInvitationsResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzm(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadInvitationsResultImpl(paramDataHolder));
    }
  }

  private static final class JoinedRoomNotifier extends GamesClientImpl.AbstractRoomNotifier
  {
    public JoinedRoomNotifier(DataHolder paramDataHolder)
    {
      super();
    }

    public void zza(RoomUpdateListener paramRoomUpdateListener, Room paramRoom, int paramInt)
    {
      paramRoomUpdateListener.onJoinedRoom(paramInt, paramRoom);
    }
  }

  private static final class LeaderboardMetadataResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Leaderboards.LeaderboardMetadataResult
  {
    private final LeaderboardBuffer zzael;

    LeaderboardMetadataResultImpl(DataHolder paramDataHolder)
    {
      super();
      this.zzael = new LeaderboardBuffer(paramDataHolder);
    }

    public LeaderboardBuffer getLeaderboards()
    {
      return this.zzael;
    }
  }

  private static final class LeaderboardScoresLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Leaderboards.LoadScoresResult> zzHa;

    LeaderboardScoresLoadedBinderCallback(zza.zzb<Leaderboards.LoadScoresResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zza(DataHolder paramDataHolder1, DataHolder paramDataHolder2)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadScoresResultImpl(paramDataHolder1, paramDataHolder2));
    }
  }

  private static final class LeaderboardsLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Leaderboards.LeaderboardMetadataResult> zzHa;

    LeaderboardsLoadedBinderCallback(zza.zzb<Leaderboards.LeaderboardMetadataResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zze(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LeaderboardMetadataResultImpl(paramDataHolder));
    }
  }

  private static final class LeaveMatchResultImpl extends GamesClientImpl.TurnBasedMatchResult
    implements TurnBasedMultiplayer.LeaveMatchResult
  {
    LeaveMatchResultImpl(DataHolder paramDataHolder)
    {
      super();
    }
  }

  private static final class LeftRoomNotifier
    implements zze.zzb<RoomUpdateListener>
  {
    private final int zzLs;
    private final String zzaem;

    LeftRoomNotifier(int paramInt, String paramString)
    {
      this.zzLs = paramInt;
      this.zzaem = paramString;
    }

    public void zza(RoomUpdateListener paramRoomUpdateListener)
    {
      paramRoomUpdateListener.onLeftRoom(this.zzLs, this.zzaem);
    }

    public void zzhX()
    {
    }
  }

  private static final class LoadAchievementsResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Achievements.LoadAchievementsResult
  {
    private final AchievementBuffer zzaen;

    LoadAchievementsResultImpl(DataHolder paramDataHolder)
    {
      super();
      this.zzaen = new AchievementBuffer(paramDataHolder);
    }

    public AchievementBuffer getAchievements()
    {
      return this.zzaen;
    }
  }

  private static final class LoadAclResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Acls.LoadAclResult
  {
    LoadAclResultImpl(DataHolder paramDataHolder)
    {
      super();
    }
  }

  private static final class LoadAppContentsResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements AppContents.LoadAppContentResult
  {
    private final ArrayList<DataHolder> zzaeo;

    LoadAppContentsResultImpl(DataHolder[] paramArrayOfDataHolder)
    {
      super();
      this.zzaeo = new ArrayList(Arrays.asList(paramArrayOfDataHolder));
    }
  }

  private static final class LoadEventResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Events.LoadEventsResult
  {
    private final EventBuffer zzaep;

    LoadEventResultImpl(DataHolder paramDataHolder)
    {
      super();
      this.zzaep = new EventBuffer(paramDataHolder);
    }

    public EventBuffer getEvents()
    {
      return this.zzaep;
    }
  }

  private static final class LoadExtendedGamesResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements GamesMetadata.LoadExtendedGamesResult
  {
    private final ExtendedGameBuffer zzaeq;

    LoadExtendedGamesResultImpl(DataHolder paramDataHolder)
    {
      super();
      this.zzaeq = new ExtendedGameBuffer(paramDataHolder);
    }
  }

  private static final class LoadGameInstancesResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements GamesMetadata.LoadGameInstancesResult
  {
    private final GameInstanceBuffer zzaer;

    LoadGameInstancesResultImpl(DataHolder paramDataHolder)
    {
      super();
      this.zzaer = new GameInstanceBuffer(paramDataHolder);
    }
  }

  private static final class LoadGameSearchSuggestionsResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements GamesMetadata.LoadGameSearchSuggestionsResult
  {
    private final GameSearchSuggestionBuffer zzaes;

    LoadGameSearchSuggestionsResultImpl(DataHolder paramDataHolder)
    {
      super();
      this.zzaes = new GameSearchSuggestionBuffer(paramDataHolder);
    }
  }

  private static final class LoadGamesResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements GamesMetadata.LoadGamesResult
  {
    private final GameBuffer zzaet;

    LoadGamesResultImpl(DataHolder paramDataHolder)
    {
      super();
      this.zzaet = new GameBuffer(paramDataHolder);
    }

    public GameBuffer getGames()
    {
      return this.zzaet;
    }
  }

  private static final class LoadInvitationsResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Invitations.LoadInvitationsResult
  {
    private final InvitationBuffer zzaeu;

    LoadInvitationsResultImpl(DataHolder paramDataHolder)
    {
      super();
      this.zzaeu = new InvitationBuffer(paramDataHolder);
    }

    public InvitationBuffer getInvitations()
    {
      return this.zzaeu;
    }
  }

  private static final class LoadMatchResultImpl extends GamesClientImpl.TurnBasedMatchResult
    implements TurnBasedMultiplayer.LoadMatchResult
  {
    LoadMatchResultImpl(DataHolder paramDataHolder)
    {
      super();
    }
  }

  private static final class LoadMatchesResultImpl
    implements TurnBasedMultiplayer.LoadMatchesResult
  {
    private final Status zzHb;
    private final LoadMatchesResponse zzaev;

    LoadMatchesResultImpl(Status paramStatus, Bundle paramBundle)
    {
      this.zzHb = paramStatus;
      this.zzaev = new LoadMatchesResponse(paramBundle);
    }

    public LoadMatchesResponse getMatches()
    {
      return this.zzaev;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }

    public void release()
    {
      this.zzaev.release();
    }
  }

  private static final class LoadOwnerCoverPhotoUrisResultImpl
    implements Players.LoadOwnerCoverPhotoUrisResult
  {
    private final Bundle zzGK;
    private final Status zzHb;

    LoadOwnerCoverPhotoUrisResultImpl(int paramInt, Bundle paramBundle)
    {
      this.zzHb = GamesStatusCodes.zzep(paramInt);
      this.zzGK = paramBundle;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  private static final class LoadPlayerScoreResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Leaderboards.LoadPlayerScoreResult
  {
    private final LeaderboardScoreEntity zzaew;

    LoadPlayerScoreResultImpl(DataHolder paramDataHolder)
    {
      super();
      LeaderboardScoreBuffer localLeaderboardScoreBuffer = new LeaderboardScoreBuffer(paramDataHolder);
      try
      {
        if (localLeaderboardScoreBuffer.getCount() > 0);
        for (this.zzaew = ((LeaderboardScoreEntity)localLeaderboardScoreBuffer.get(0).freeze()); ; this.zzaew = null)
          return;
      }
      finally
      {
        localLeaderboardScoreBuffer.release();
      }
    }

    public LeaderboardScore getScore()
    {
      return this.zzaew;
    }
  }

  private static final class LoadPlayersResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Players.LoadPlayersResult
  {
    private final PlayerBuffer zzaex;

    LoadPlayersResultImpl(DataHolder paramDataHolder)
    {
      super();
      this.zzaex = new PlayerBuffer(paramDataHolder);
    }

    public PlayerBuffer getPlayers()
    {
      return this.zzaex;
    }
  }

  private static final class LoadProfileSettingsResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Players.LoadProfileSettingsResult
  {
    private final boolean zzadM;
    private final boolean zzaey;

    LoadProfileSettingsResultImpl(DataHolder paramDataHolder)
    {
      super();
      try
      {
        int i;
        if (paramDataHolder.getCount() > 0)
        {
          i = paramDataHolder.zzax(0);
          this.zzadM = paramDataHolder.zzd("profile_visible", 0, i);
        }
        for (this.zzaey = paramDataHolder.zzd("profile_visibility_explicitly_set", 0, i); ; this.zzaey = false)
        {
          return;
          this.zzadM = true;
        }
      }
      finally
      {
        paramDataHolder.close();
      }
    }

    public Status getStatus()
    {
      return this.zzHb;
    }

    public boolean isProfileVisible()
    {
      return this.zzadM;
    }

    public boolean isVisibilityExplicitlySet()
    {
      return this.zzaey;
    }
  }

  private static final class LoadQuestsResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Quests.LoadQuestsResult
  {
    private final DataHolder zzMd;

    LoadQuestsResultImpl(DataHolder paramDataHolder)
    {
      super();
      this.zzMd = paramDataHolder;
    }

    public QuestBuffer getQuests()
    {
      return new QuestBuffer(this.zzMd);
    }
  }

  private static final class LoadRequestSummariesResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Requests.LoadRequestSummariesResult
  {
    LoadRequestSummariesResultImpl(DataHolder paramDataHolder)
    {
      super();
    }
  }

  private static final class LoadRequestsResultImpl
    implements Requests.LoadRequestsResult
  {
    private final Status zzHb;
    private final Bundle zzaez;

    LoadRequestsResultImpl(Status paramStatus, Bundle paramBundle)
    {
      this.zzHb = paramStatus;
      this.zzaez = paramBundle;
    }

    public GameRequestBuffer getRequests(int paramInt)
    {
      String str = RequestType.zzeJ(paramInt);
      if (!this.zzaez.containsKey(str))
        return null;
      return new GameRequestBuffer((DataHolder)this.zzaez.get(str));
    }

    public Status getStatus()
    {
      return this.zzHb;
    }

    public void release()
    {
      Iterator localIterator = this.zzaez.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        DataHolder localDataHolder = (DataHolder)this.zzaez.getParcelable(str);
        if (localDataHolder != null)
          localDataHolder.close();
      }
    }
  }

  private static final class LoadScoresResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Leaderboards.LoadScoresResult
  {
    private final LeaderboardEntity zzaeA;
    private final LeaderboardScoreBuffer zzaeB;

    LoadScoresResultImpl(DataHolder paramDataHolder1, DataHolder paramDataHolder2)
    {
      super();
      LeaderboardBuffer localLeaderboardBuffer = new LeaderboardBuffer(paramDataHolder1);
      try
      {
        if (localLeaderboardBuffer.getCount() > 0);
        for (this.zzaeA = ((LeaderboardEntity)((Leaderboard)localLeaderboardBuffer.get(0)).freeze()); ; this.zzaeA = null)
        {
          localLeaderboardBuffer.release();
          this.zzaeB = new LeaderboardScoreBuffer(paramDataHolder2);
          return;
        }
      }
      finally
      {
        localLeaderboardBuffer.release();
      }
    }

    public Leaderboard getLeaderboard()
    {
      return this.zzaeA;
    }

    public LeaderboardScoreBuffer getScores()
    {
      return this.zzaeB;
    }
  }

  private static final class LoadSnapshotsResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Snapshots.LoadSnapshotsResult
  {
    LoadSnapshotsResultImpl(DataHolder paramDataHolder)
    {
      super();
    }

    public SnapshotMetadataBuffer getSnapshots()
    {
      return new SnapshotMetadataBuffer(this.zzMd);
    }
  }

  private static final class LoadXpForGameCategoriesResultImpl
    implements Players.LoadXpForGameCategoriesResult
  {
    private final Status zzHb;
    private final List<String> zzaeC;
    private final Bundle zzaeD;

    LoadXpForGameCategoriesResultImpl(Status paramStatus, Bundle paramBundle)
    {
      this.zzHb = paramStatus;
      this.zzaeC = paramBundle.getStringArrayList("game_category_list");
      this.zzaeD = paramBundle;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  private static final class LoadXpStreamResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Players.LoadXpStreamResult
  {
    private final ExperienceEventBuffer zzaeE;

    LoadXpStreamResultImpl(DataHolder paramDataHolder)
    {
      super();
      this.zzaeE = new ExperienceEventBuffer(paramDataHolder);
    }
  }

  private static final class MatchRemovedNotifier
    implements zze.zzb<OnTurnBasedMatchUpdateReceivedListener>
  {
    private final String zzaeF;

    MatchRemovedNotifier(String paramString)
    {
      this.zzaeF = paramString;
    }

    public void zza(OnTurnBasedMatchUpdateReceivedListener paramOnTurnBasedMatchUpdateReceivedListener)
    {
      paramOnTurnBasedMatchUpdateReceivedListener.onTurnBasedMatchRemoved(this.zzaeF);
    }

    public void zzhX()
    {
    }
  }

  private static final class MatchUpdateReceivedBinderCallback extends AbstractGamesCallbacks
  {
    private final zze<OnTurnBasedMatchUpdateReceivedListener> zzTW;

    MatchUpdateReceivedBinderCallback(zze<OnTurnBasedMatchUpdateReceivedListener> paramzze)
    {
      this.zzTW = paramzze;
    }

    public void onTurnBasedMatchRemoved(String paramString)
    {
      this.zzTW.zza(new GamesClientImpl.MatchRemovedNotifier(paramString));
    }

    public void zzt(DataHolder paramDataHolder)
    {
      TurnBasedMatchBuffer localTurnBasedMatchBuffer = new TurnBasedMatchBuffer(paramDataHolder);
      try
      {
        int i = localTurnBasedMatchBuffer.getCount();
        TurnBasedMatch localTurnBasedMatch = null;
        if (i > 0)
          localTurnBasedMatch = (TurnBasedMatch)((TurnBasedMatch)localTurnBasedMatchBuffer.get(0)).freeze();
        localTurnBasedMatchBuffer.release();
        if (localTurnBasedMatch != null)
          this.zzTW.zza(new GamesClientImpl.MatchUpdateReceivedNotifier(localTurnBasedMatch));
        return;
      }
      finally
      {
        localTurnBasedMatchBuffer.release();
      }
    }
  }

  private static final class MatchUpdateReceivedNotifier
    implements zze.zzb<OnTurnBasedMatchUpdateReceivedListener>
  {
    private final TurnBasedMatch zzaeG;

    MatchUpdateReceivedNotifier(TurnBasedMatch paramTurnBasedMatch)
    {
      this.zzaeG = paramTurnBasedMatch;
    }

    public void zza(OnTurnBasedMatchUpdateReceivedListener paramOnTurnBasedMatchUpdateReceivedListener)
    {
      paramOnTurnBasedMatchUpdateReceivedListener.onTurnBasedMatchReceived(this.zzaeG);
    }

    public void zzhX()
    {
    }
  }

  private static final class MessageReceivedNotifier
    implements zze.zzb<RealTimeMessageReceivedListener>
  {
    private final RealTimeMessage zzaeH;

    MessageReceivedNotifier(RealTimeMessage paramRealTimeMessage)
    {
      this.zzaeH = paramRealTimeMessage;
    }

    public void zza(RealTimeMessageReceivedListener paramRealTimeMessageReceivedListener)
    {
      paramRealTimeMessageReceivedListener.onRealTimeMessageReceived(this.zzaeH);
    }

    public void zzhX()
    {
    }
  }

  private static final class NearbyPlayerDetectedNotifier
    implements zze.zzb<OnNearbyPlayerDetectedListener>
  {
    private final Player zzaeI;

    public void zza(OnNearbyPlayerDetectedListener paramOnNearbyPlayerDetectedListener)
    {
      paramOnNearbyPlayerDetectedListener.zza(this.zzaeI);
    }

    public void zzhX()
    {
    }
  }

  private static final class NotifyAclLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Acls.LoadAclResult> zzHa;

    NotifyAclLoadedBinderCallback(zza.zzb<Acls.LoadAclResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzC(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadAclResultImpl(paramDataHolder));
    }
  }

  private static final class NotifyAclUpdatedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Status> zzHa;

    NotifyAclUpdatedBinderCallback(zza.zzb<Status> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzex(int paramInt)
    {
      this.zzHa.zzd(GamesStatusCodes.zzep(paramInt));
    }
  }

  private static final class OpenSnapshotResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Snapshots.OpenSnapshotResult
  {
    private final Snapshot zzaeJ;
    private final String zzaeK;
    private final Snapshot zzaeL;
    private final Contents zzaeM;
    private final SnapshotContents zzaeN;

    OpenSnapshotResultImpl(DataHolder paramDataHolder, Contents paramContents)
    {
      this(paramDataHolder, null, paramContents, null, null);
    }

    OpenSnapshotResultImpl(DataHolder paramDataHolder, String paramString, Contents paramContents1, Contents paramContents2, Contents paramContents3)
    {
      super();
      SnapshotMetadataBuffer localSnapshotMetadataBuffer = new SnapshotMetadataBuffer(paramDataHolder);
      while (true)
      {
        try
        {
          if (localSnapshotMetadataBuffer.getCount() == 0)
          {
            this.zzaeJ = null;
            this.zzaeL = null;
            localSnapshotMetadataBuffer.release();
            this.zzaeK = paramString;
            this.zzaeM = paramContents3;
            this.zzaeN = new SnapshotContentsEntity(paramContents3);
            return;
          }
          if (localSnapshotMetadataBuffer.getCount() != i)
            break label147;
          if (paramDataHolder.getStatusCode() != 4004)
          {
            com.google.android.gms.common.internal.zzb.zzN(i);
            this.zzaeJ = new SnapshotEntity(new SnapshotMetadataEntity(localSnapshotMetadataBuffer.get(0)), new SnapshotContentsEntity(paramContents1));
            this.zzaeL = null;
            continue;
          }
        }
        finally
        {
          localSnapshotMetadataBuffer.release();
        }
        int j = 0;
        continue;
        label147: this.zzaeJ = new SnapshotEntity(new SnapshotMetadataEntity(localSnapshotMetadataBuffer.get(0)), new SnapshotContentsEntity(paramContents1));
        this.zzaeL = new SnapshotEntity(new SnapshotMetadataEntity(localSnapshotMetadataBuffer.get(1)), new SnapshotContentsEntity(paramContents2));
      }
    }

    public String getConflictId()
    {
      return this.zzaeK;
    }

    public Snapshot getConflictingSnapshot()
    {
      return this.zzaeL;
    }

    public SnapshotContents getResolutionSnapshotContents()
    {
      return this.zzaeN;
    }

    public Snapshot getSnapshot()
    {
      return this.zzaeJ;
    }
  }

  private static final class OwnerCoverPhotoUrisLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Players.LoadOwnerCoverPhotoUrisResult> zzHa;

    OwnerCoverPhotoUrisLoadedBinderCallback(zza.zzb<Players.LoadOwnerCoverPhotoUrisResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzf(int paramInt, Bundle paramBundle)
    {
      paramBundle.setClassLoader(getClass().getClassLoader());
      this.zzHa.zzd(new GamesClientImpl.LoadOwnerCoverPhotoUrisResultImpl(paramInt, paramBundle));
    }
  }

  private static final class P2PConnectedNotifier
    implements zze.zzb<RoomStatusUpdateListener>
  {
    private final String zzaeO;

    P2PConnectedNotifier(String paramString)
    {
      this.zzaeO = paramString;
    }

    public void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener)
    {
      paramRoomStatusUpdateListener.onP2PConnected(this.zzaeO);
    }

    public void zzhX()
    {
    }
  }

  private static final class P2PDisconnectedNotifier
    implements zze.zzb<RoomStatusUpdateListener>
  {
    private final String zzaeO;

    P2PDisconnectedNotifier(String paramString)
    {
      this.zzaeO = paramString;
    }

    public void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener)
    {
      paramRoomStatusUpdateListener.onP2PDisconnected(this.zzaeO);
    }

    public void zzhX()
    {
    }
  }

  private static final class PeerConnectedNotifier extends GamesClientImpl.AbstractPeerStatusNotifier
  {
    PeerConnectedNotifier(DataHolder paramDataHolder, String[] paramArrayOfString)
    {
      super(paramArrayOfString);
    }

    protected void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      paramRoomStatusUpdateListener.onPeersConnected(paramRoom, paramArrayList);
    }
  }

  private static final class PeerDeclinedNotifier extends GamesClientImpl.AbstractPeerStatusNotifier
  {
    PeerDeclinedNotifier(DataHolder paramDataHolder, String[] paramArrayOfString)
    {
      super(paramArrayOfString);
    }

    protected void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      paramRoomStatusUpdateListener.onPeerDeclined(paramRoom, paramArrayList);
    }
  }

  private static final class PeerDisconnectedNotifier extends GamesClientImpl.AbstractPeerStatusNotifier
  {
    PeerDisconnectedNotifier(DataHolder paramDataHolder, String[] paramArrayOfString)
    {
      super(paramArrayOfString);
    }

    protected void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      paramRoomStatusUpdateListener.onPeersDisconnected(paramRoom, paramArrayList);
    }
  }

  private static final class PeerInvitedToRoomNotifier extends GamesClientImpl.AbstractPeerStatusNotifier
  {
    PeerInvitedToRoomNotifier(DataHolder paramDataHolder, String[] paramArrayOfString)
    {
      super(paramArrayOfString);
    }

    protected void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      paramRoomStatusUpdateListener.onPeerInvitedToRoom(paramRoom, paramArrayList);
    }
  }

  private static final class PeerJoinedRoomNotifier extends GamesClientImpl.AbstractPeerStatusNotifier
  {
    PeerJoinedRoomNotifier(DataHolder paramDataHolder, String[] paramArrayOfString)
    {
      super(paramArrayOfString);
    }

    protected void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      paramRoomStatusUpdateListener.onPeerJoined(paramRoom, paramArrayList);
    }
  }

  private static final class PeerLeftRoomNotifier extends GamesClientImpl.AbstractPeerStatusNotifier
  {
    PeerLeftRoomNotifier(DataHolder paramDataHolder, String[] paramArrayOfString)
    {
      super(paramArrayOfString);
    }

    protected void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      paramRoomStatusUpdateListener.onPeerLeft(paramRoom, paramArrayList);
    }
  }

  private static final class PlayerLeaderboardScoreLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Leaderboards.LoadPlayerScoreResult> zzHa;

    PlayerLeaderboardScoreLoadedBinderCallback(zza.zzb<Leaderboards.LoadPlayerScoreResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzE(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadPlayerScoreResultImpl(paramDataHolder));
    }
  }

  private static final class PlayerXpForGameCategoriesLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Players.LoadXpForGameCategoriesResult> zzHa;

    PlayerXpForGameCategoriesLoadedBinderCallback(zza.zzb<Players.LoadXpForGameCategoriesResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzg(int paramInt, Bundle paramBundle)
    {
      paramBundle.setClassLoader(getClass().getClassLoader());
      Status localStatus = GamesStatusCodes.zzep(paramInt);
      this.zzHa.zzd(new GamesClientImpl.LoadXpForGameCategoriesResultImpl(localStatus, paramBundle));
    }
  }

  static final class PlayerXpStreamLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Players.LoadXpStreamResult> zzHa;

    PlayerXpStreamLoadedBinderCallback(zza.zzb<Players.LoadXpStreamResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzP(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadXpStreamResultImpl(paramDataHolder));
    }
  }

  private static final class PlayersLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Players.LoadPlayersResult> zzHa;

    PlayersLoadedBinderCallback(zza.zzb<Players.LoadPlayersResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzg(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadPlayersResultImpl(paramDataHolder));
    }

    public void zzh(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadPlayersResultImpl(paramDataHolder));
    }
  }

  private static final class PopupLocationInfoBinderCallbacks extends AbstractGamesClient
  {
    private final PopupManager zzadT;

    public PopupLocationInfoBinderCallbacks(PopupManager paramPopupManager)
    {
      this.zzadT = paramPopupManager;
    }

    public PopupLocationInfoParcelable zznk()
    {
      return new PopupLocationInfoParcelable(this.zzadT.zzof());
    }
  }

  static final class ProfileSettingsLoadedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Players.LoadProfileSettingsResult> zzHa;

    ProfileSettingsLoadedBinderCallback(zza.zzb<Players.LoadProfileSettingsResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzQ(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.LoadProfileSettingsResultImpl(paramDataHolder));
    }
  }

  private static final class ProfileSettingsUpdatedBinderCallback extends AbstractGamesCallbacks
  {
    private final zza.zzb<Status> zzHa;

    ProfileSettingsUpdatedBinderCallback(zza.zzb<Status> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzez(int paramInt)
    {
      this.zzHa.zzd(GamesStatusCodes.zzep(paramInt));
    }
  }

  private static final class QuestAcceptedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<Quests.AcceptQuestResult> zzaeP;

    public QuestAcceptedBinderCallbacks(zza.zzb<Quests.AcceptQuestResult> paramzzb)
    {
      this.zzaeP = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzL(DataHolder paramDataHolder)
    {
      this.zzaeP.zzd(new GamesClientImpl.AcceptQuestResultImpl(paramDataHolder));
    }
  }

  private static final class QuestCompletedNotifier
    implements zze.zzb<QuestUpdateListener>
  {
    private final Quest zzaea;

    QuestCompletedNotifier(Quest paramQuest)
    {
      this.zzaea = paramQuest;
    }

    public void zza(QuestUpdateListener paramQuestUpdateListener)
    {
      paramQuestUpdateListener.onQuestCompleted(this.zzaea);
    }

    public void zzhX()
    {
    }
  }

  private static final class QuestMilestoneClaimBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<Quests.ClaimMilestoneResult> zzaeQ;
    private final String zzaeR;

    public QuestMilestoneClaimBinderCallbacks(zza.zzb<Quests.ClaimMilestoneResult> paramzzb, String paramString)
    {
      this.zzaeQ = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
      this.zzaeR = ((String)zzx.zzb(paramString, "MilestoneId must not be null"));
    }

    public void zzK(DataHolder paramDataHolder)
    {
      this.zzaeQ.zzd(new GamesClientImpl.ClaimMilestoneResultImpl(paramDataHolder, this.zzaeR));
    }
  }

  private static final class QuestUpdateBinderCallback extends AbstractGamesCallbacks
  {
    private final zze<QuestUpdateListener> zzTW;

    QuestUpdateBinderCallback(zze<QuestUpdateListener> paramzze)
    {
      this.zzTW = paramzze;
    }

    private Quest zzT(DataHolder paramDataHolder)
    {
      QuestBuffer localQuestBuffer = new QuestBuffer(paramDataHolder);
      try
      {
        int i = localQuestBuffer.getCount();
        Quest localQuest = null;
        if (i > 0)
          localQuest = (Quest)((Quest)localQuestBuffer.get(0)).freeze();
        return localQuest;
      }
      finally
      {
        localQuestBuffer.release();
      }
    }

    public void zzM(DataHolder paramDataHolder)
    {
      Quest localQuest = zzT(paramDataHolder);
      if (localQuest != null)
        this.zzTW.zza(new GamesClientImpl.QuestCompletedNotifier(localQuest));
    }
  }

  private static final class QuestsLoadedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<Quests.LoadQuestsResult> zzaeS;

    public QuestsLoadedBinderCallbacks(zza.zzb<Quests.LoadQuestsResult> paramzzb)
    {
      this.zzaeS = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzO(DataHolder paramDataHolder)
    {
      this.zzaeS.zzd(new GamesClientImpl.LoadQuestsResultImpl(paramDataHolder));
    }
  }

  private static final class RealTimeMessageSentNotifier
    implements zze.zzb<RealTimeMultiplayer.ReliableMessageSentCallback>
  {
    private final int zzLs;
    private final String zzaeT;
    private final int zzaeU;

    RealTimeMessageSentNotifier(int paramInt1, int paramInt2, String paramString)
    {
      this.zzLs = paramInt1;
      this.zzaeU = paramInt2;
      this.zzaeT = paramString;
    }

    public void zza(RealTimeMultiplayer.ReliableMessageSentCallback paramReliableMessageSentCallback)
    {
      if (paramReliableMessageSentCallback != null)
        paramReliableMessageSentCallback.onRealTimeMessageSent(this.zzLs, this.zzaeU, this.zzaeT);
    }

    public void zzhX()
    {
    }
  }

  private static final class RealTimeReliableMessageBinderCallbacks extends AbstractGamesCallbacks
  {
    final zze<RealTimeMultiplayer.ReliableMessageSentCallback> zzaeV;

    public RealTimeReliableMessageBinderCallbacks(zze<RealTimeMultiplayer.ReliableMessageSentCallback> paramzze)
    {
      this.zzaeV = paramzze;
    }

    public void zzb(int paramInt1, int paramInt2, String paramString)
    {
      if (this.zzaeV != null)
        this.zzaeV.zza(new GamesClientImpl.RealTimeMessageSentNotifier(paramInt1, paramInt2, paramString));
    }
  }

  private static final class RequestReceivedBinderCallback extends AbstractGamesCallbacks
  {
    private final zze<OnRequestReceivedListener> zzTW;

    RequestReceivedBinderCallback(zze<OnRequestReceivedListener> paramzze)
    {
      this.zzTW = paramzze;
    }

    public void onRequestRemoved(String paramString)
    {
      this.zzTW.zza(new GamesClientImpl.RequestRemovedNotifier(paramString));
    }

    public void zzo(DataHolder paramDataHolder)
    {
      GameRequestBuffer localGameRequestBuffer = new GameRequestBuffer(paramDataHolder);
      try
      {
        int i = localGameRequestBuffer.getCount();
        GameRequest localGameRequest = null;
        if (i > 0)
          localGameRequest = (GameRequest)((GameRequest)localGameRequestBuffer.get(0)).freeze();
        localGameRequestBuffer.release();
        if (localGameRequest != null)
          this.zzTW.zza(new GamesClientImpl.RequestReceivedNotifier(localGameRequest));
        return;
      }
      finally
      {
        localGameRequestBuffer.release();
      }
    }
  }

  private static final class RequestReceivedNotifier
    implements zze.zzb<OnRequestReceivedListener>
  {
    private final GameRequest zzaeW;

    RequestReceivedNotifier(GameRequest paramGameRequest)
    {
      this.zzaeW = paramGameRequest;
    }

    public void zza(OnRequestReceivedListener paramOnRequestReceivedListener)
    {
      paramOnRequestReceivedListener.onRequestReceived(this.zzaeW);
    }

    public void zzhX()
    {
    }
  }

  private static final class RequestRemovedNotifier
    implements zze.zzb<OnRequestReceivedListener>
  {
    private final String zzxv;

    RequestRemovedNotifier(String paramString)
    {
      this.zzxv = paramString;
    }

    public void zza(OnRequestReceivedListener paramOnRequestReceivedListener)
    {
      paramOnRequestReceivedListener.onRequestRemoved(this.zzxv);
    }

    public void zzhX()
    {
    }
  }

  private static final class RequestSentBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<Requests.SendRequestResult> zzaeX;

    public RequestSentBinderCallbacks(zza.zzb<Requests.SendRequestResult> paramzzb)
    {
      this.zzaeX = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzG(DataHolder paramDataHolder)
    {
      this.zzaeX.zzd(new GamesClientImpl.SendRequestResultImpl(paramDataHolder));
    }
  }

  private static final class RequestSummariesLoadedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<Requests.LoadRequestSummariesResult> zzaeY;

    public RequestSummariesLoadedBinderCallbacks(zza.zzb<Requests.LoadRequestSummariesResult> paramzzb)
    {
      this.zzaeY = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzH(DataHolder paramDataHolder)
    {
      this.zzaeY.zzd(new GamesClientImpl.LoadRequestSummariesResultImpl(paramDataHolder));
    }
  }

  private static final class RequestsLoadedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<Requests.LoadRequestsResult> zzaeZ;

    public RequestsLoadedBinderCallbacks(zza.zzb<Requests.LoadRequestsResult> paramzzb)
    {
      this.zzaeZ = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zze(int paramInt, Bundle paramBundle)
    {
      paramBundle.setClassLoader(getClass().getClassLoader());
      Status localStatus = GamesStatusCodes.zzep(paramInt);
      this.zzaeZ.zzd(new GamesClientImpl.LoadRequestsResultImpl(localStatus, paramBundle));
    }
  }

  private static final class RequestsUpdatedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<Requests.UpdateRequestsResult> zzafa;

    public RequestsUpdatedBinderCallbacks(zza.zzb<Requests.UpdateRequestsResult> paramzzb)
    {
      this.zzafa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzF(DataHolder paramDataHolder)
    {
      this.zzafa.zzd(new GamesClientImpl.UpdateRequestsResultImpl(paramDataHolder));
    }
  }

  private static final class RoomAutoMatchingNotifier extends GamesClientImpl.AbstractRoomStatusNotifier
  {
    RoomAutoMatchingNotifier(DataHolder paramDataHolder)
    {
      super();
    }

    public void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      paramRoomStatusUpdateListener.onRoomAutoMatching(paramRoom);
    }
  }

  private static final class RoomBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zze<? extends RoomUpdateListener> zzafb;
    private final zze<? extends RoomStatusUpdateListener> zzafc;
    private final zze<RealTimeMessageReceivedListener> zzafd;

    public RoomBinderCallbacks(zze<RoomUpdateListener> paramzze)
    {
      this.zzafb = ((zze)zzx.zzb(paramzze, "Callbacks must not be null"));
      this.zzafc = null;
      this.zzafd = null;
    }

    public RoomBinderCallbacks(zze<? extends RoomUpdateListener> paramzze, zze<? extends RoomStatusUpdateListener> paramzze1, zze<RealTimeMessageReceivedListener> paramzze2)
    {
      this.zzafb = ((zze)zzx.zzb(paramzze, "Callbacks must not be null"));
      this.zzafc = paramzze1;
      this.zzafd = paramzze2;
    }

    public void onLeftRoom(int paramInt, String paramString)
    {
      this.zzafb.zza(new GamesClientImpl.LeftRoomNotifier(paramInt, paramString));
    }

    public void onP2PConnected(String paramString)
    {
      if (this.zzafc != null)
        this.zzafc.zza(new GamesClientImpl.P2PConnectedNotifier(paramString));
    }

    public void onP2PDisconnected(String paramString)
    {
      if (this.zzafc != null)
        this.zzafc.zza(new GamesClientImpl.P2PDisconnectedNotifier(paramString));
    }

    public void onRealTimeMessageReceived(RealTimeMessage paramRealTimeMessage)
    {
      if (this.zzafd != null)
        this.zzafd.zza(new GamesClientImpl.MessageReceivedNotifier(paramRealTimeMessage));
    }

    public void zzA(DataHolder paramDataHolder)
    {
      if (this.zzafc != null)
        this.zzafc.zza(new GamesClientImpl.DisconnectedFromRoomNotifier(paramDataHolder));
    }

    public void zza(DataHolder paramDataHolder, String[] paramArrayOfString)
    {
      if (this.zzafc != null)
        this.zzafc.zza(new GamesClientImpl.PeerInvitedToRoomNotifier(paramDataHolder, paramArrayOfString));
    }

    public void zzb(DataHolder paramDataHolder, String[] paramArrayOfString)
    {
      if (this.zzafc != null)
        this.zzafc.zza(new GamesClientImpl.PeerJoinedRoomNotifier(paramDataHolder, paramArrayOfString));
    }

    public void zzc(DataHolder paramDataHolder, String[] paramArrayOfString)
    {
      if (this.zzafc != null)
        this.zzafc.zza(new GamesClientImpl.PeerLeftRoomNotifier(paramDataHolder, paramArrayOfString));
    }

    public void zzd(DataHolder paramDataHolder, String[] paramArrayOfString)
    {
      if (this.zzafc != null)
        this.zzafc.zza(new GamesClientImpl.PeerDeclinedNotifier(paramDataHolder, paramArrayOfString));
    }

    public void zze(DataHolder paramDataHolder, String[] paramArrayOfString)
    {
      if (this.zzafc != null)
        this.zzafc.zza(new GamesClientImpl.PeerConnectedNotifier(paramDataHolder, paramArrayOfString));
    }

    public void zzf(DataHolder paramDataHolder, String[] paramArrayOfString)
    {
      if (this.zzafc != null)
        this.zzafc.zza(new GamesClientImpl.PeerDisconnectedNotifier(paramDataHolder, paramArrayOfString));
    }

    public void zzu(DataHolder paramDataHolder)
    {
      this.zzafb.zza(new GamesClientImpl.RoomCreatedNotifier(paramDataHolder));
    }

    public void zzv(DataHolder paramDataHolder)
    {
      this.zzafb.zza(new GamesClientImpl.JoinedRoomNotifier(paramDataHolder));
    }

    public void zzw(DataHolder paramDataHolder)
    {
      if (this.zzafc != null)
        this.zzafc.zza(new GamesClientImpl.RoomConnectingNotifier(paramDataHolder));
    }

    public void zzx(DataHolder paramDataHolder)
    {
      if (this.zzafc != null)
        this.zzafc.zza(new GamesClientImpl.RoomAutoMatchingNotifier(paramDataHolder));
    }

    public void zzy(DataHolder paramDataHolder)
    {
      this.zzafb.zza(new GamesClientImpl.RoomConnectedNotifier(paramDataHolder));
    }

    public void zzz(DataHolder paramDataHolder)
    {
      if (this.zzafc != null)
        this.zzafc.zza(new GamesClientImpl.ConnectedToRoomNotifier(paramDataHolder));
    }
  }

  private static final class RoomConnectedNotifier extends GamesClientImpl.AbstractRoomNotifier
  {
    RoomConnectedNotifier(DataHolder paramDataHolder)
    {
      super();
    }

    public void zza(RoomUpdateListener paramRoomUpdateListener, Room paramRoom, int paramInt)
    {
      paramRoomUpdateListener.onRoomConnected(paramInt, paramRoom);
    }
  }

  private static final class RoomConnectingNotifier extends GamesClientImpl.AbstractRoomStatusNotifier
  {
    RoomConnectingNotifier(DataHolder paramDataHolder)
    {
      super();
    }

    public void zza(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      paramRoomStatusUpdateListener.onRoomConnecting(paramRoom);
    }
  }

  private static final class RoomCreatedNotifier extends GamesClientImpl.AbstractRoomNotifier
  {
    public RoomCreatedNotifier(DataHolder paramDataHolder)
    {
      super();
    }

    public void zza(RoomUpdateListener paramRoomUpdateListener, Room paramRoom, int paramInt)
    {
      paramRoomUpdateListener.onRoomCreated(paramInt, paramRoom);
    }
  }

  private static final class SendRequestResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Requests.SendRequestResult
  {
    private final GameRequest zzaeW;

    SendRequestResultImpl(DataHolder paramDataHolder)
    {
      super();
      GameRequestBuffer localGameRequestBuffer = new GameRequestBuffer(paramDataHolder);
      try
      {
        if (localGameRequestBuffer.getCount() > 0);
        for (this.zzaeW = ((GameRequest)((GameRequest)localGameRequestBuffer.get(0)).freeze()); ; this.zzaeW = null)
          return;
      }
      finally
      {
        localGameRequestBuffer.release();
      }
    }
  }

  private static final class SignOutCompleteBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<Status> zzHa;

    public SignOutCompleteBinderCallbacks(zza.zzb<Status> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzhb()
    {
      Status localStatus = GamesStatusCodes.zzep(0);
      this.zzHa.zzd(localStatus);
    }
  }

  private static final class SnapshotCommittedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<Snapshots.CommitSnapshotResult> zzafe;

    public SnapshotCommittedBinderCallbacks(zza.zzb<Snapshots.CommitSnapshotResult> paramzzb)
    {
      this.zzafe = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzJ(DataHolder paramDataHolder)
    {
      this.zzafe.zzd(new GamesClientImpl.CommitSnapshotResultImpl(paramDataHolder));
    }
  }

  static final class SnapshotDeletedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<Snapshots.DeleteSnapshotResult> zzHa;

    public SnapshotDeletedBinderCallbacks(zza.zzb<Snapshots.DeleteSnapshotResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzh(int paramInt, String paramString)
    {
      this.zzHa.zzd(new GamesClientImpl.DeleteSnapshotResultImpl(paramInt, paramString));
    }
  }

  private static final class SnapshotOpenedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<Snapshots.OpenSnapshotResult> zzaff;

    public SnapshotOpenedBinderCallbacks(zza.zzb<Snapshots.OpenSnapshotResult> paramzzb)
    {
      this.zzaff = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zza(DataHolder paramDataHolder, Contents paramContents)
    {
      this.zzaff.zzd(new GamesClientImpl.OpenSnapshotResultImpl(paramDataHolder, paramContents));
    }

    public void zza(DataHolder paramDataHolder, String paramString, Contents paramContents1, Contents paramContents2, Contents paramContents3)
    {
      this.zzaff.zzd(new GamesClientImpl.OpenSnapshotResultImpl(paramDataHolder, paramString, paramContents1, paramContents2, paramContents3));
    }
  }

  private static final class SnapshotsLoadedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<Snapshots.LoadSnapshotsResult> zzafg;

    public SnapshotsLoadedBinderCallbacks(zza.zzb<Snapshots.LoadSnapshotsResult> paramzzb)
    {
      this.zzafg = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzI(DataHolder paramDataHolder)
    {
      this.zzafg.zzd(new GamesClientImpl.LoadSnapshotsResultImpl(paramDataHolder));
    }
  }

  private static final class SubmitScoreBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<Leaderboards.SubmitScoreResult> zzHa;

    public SubmitScoreBinderCallbacks(zza.zzb<Leaderboards.SubmitScoreResult> paramzzb)
    {
      this.zzHa = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzf(DataHolder paramDataHolder)
    {
      this.zzHa.zzd(new GamesClientImpl.SubmitScoreResultImpl(paramDataHolder));
    }
  }

  private static final class SubmitScoreResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Leaderboards.SubmitScoreResult
  {
    private final ScoreSubmissionData zzafh;

    public SubmitScoreResultImpl(DataHolder paramDataHolder)
    {
      super();
      try
      {
        this.zzafh = new ScoreSubmissionData(paramDataHolder);
        return;
      }
      finally
      {
        paramDataHolder.close();
      }
    }

    public ScoreSubmissionData getScoreData()
    {
      return this.zzafh;
    }
  }

  private static final class TurnBasedMatchCanceledBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<TurnBasedMultiplayer.CancelMatchResult> zzafi;

    public TurnBasedMatchCanceledBinderCallbacks(zza.zzb<TurnBasedMultiplayer.CancelMatchResult> paramzzb)
    {
      this.zzafi = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzg(int paramInt, String paramString)
    {
      Status localStatus = GamesStatusCodes.zzep(paramInt);
      this.zzafi.zzd(new GamesClientImpl.CancelMatchResultImpl(localStatus, paramString));
    }
  }

  private static final class TurnBasedMatchInitiatedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<TurnBasedMultiplayer.InitiateMatchResult> zzafj;

    public TurnBasedMatchInitiatedBinderCallbacks(zza.zzb<TurnBasedMultiplayer.InitiateMatchResult> paramzzb)
    {
      this.zzafj = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzq(DataHolder paramDataHolder)
    {
      this.zzafj.zzd(new GamesClientImpl.InitiateMatchResultImpl(paramDataHolder));
    }
  }

  private static final class TurnBasedMatchLeftBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<TurnBasedMultiplayer.LeaveMatchResult> zzafk;

    public TurnBasedMatchLeftBinderCallbacks(zza.zzb<TurnBasedMultiplayer.LeaveMatchResult> paramzzb)
    {
      this.zzafk = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzs(DataHolder paramDataHolder)
    {
      this.zzafk.zzd(new GamesClientImpl.LeaveMatchResultImpl(paramDataHolder));
    }
  }

  private static final class TurnBasedMatchLoadedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<TurnBasedMultiplayer.LoadMatchResult> zzafl;

    public TurnBasedMatchLoadedBinderCallbacks(zza.zzb<TurnBasedMultiplayer.LoadMatchResult> paramzzb)
    {
      this.zzafl = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzp(DataHolder paramDataHolder)
    {
      this.zzafl.zzd(new GamesClientImpl.LoadMatchResultImpl(paramDataHolder));
    }
  }

  private static abstract class TurnBasedMatchResult extends GamesClientImpl.GamesDataHolderResult
  {
    final TurnBasedMatch zzaeG;

    TurnBasedMatchResult(DataHolder paramDataHolder)
    {
      super();
      TurnBasedMatchBuffer localTurnBasedMatchBuffer = new TurnBasedMatchBuffer(paramDataHolder);
      try
      {
        if (localTurnBasedMatchBuffer.getCount() > 0);
        for (this.zzaeG = ((TurnBasedMatch)((TurnBasedMatch)localTurnBasedMatchBuffer.get(0)).freeze()); ; this.zzaeG = null)
          return;
      }
      finally
      {
        localTurnBasedMatchBuffer.release();
      }
    }

    public TurnBasedMatch getMatch()
    {
      return this.zzaeG;
    }
  }

  private static final class TurnBasedMatchUpdatedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<TurnBasedMultiplayer.UpdateMatchResult> zzafm;

    public TurnBasedMatchUpdatedBinderCallbacks(zza.zzb<TurnBasedMultiplayer.UpdateMatchResult> paramzzb)
    {
      this.zzafm = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzr(DataHolder paramDataHolder)
    {
      this.zzafm.zzd(new GamesClientImpl.UpdateMatchResultImpl(paramDataHolder));
    }
  }

  private static final class TurnBasedMatchesLoadedBinderCallbacks extends AbstractGamesCallbacks
  {
    private final zza.zzb<TurnBasedMultiplayer.LoadMatchesResult> zzafn;

    public TurnBasedMatchesLoadedBinderCallbacks(zza.zzb<TurnBasedMultiplayer.LoadMatchesResult> paramzzb)
    {
      this.zzafn = ((zza.zzb)zzx.zzb(paramzzb, "Holder must not be null"));
    }

    public void zzd(int paramInt, Bundle paramBundle)
    {
      paramBundle.setClassLoader(getClass().getClassLoader());
      Status localStatus = GamesStatusCodes.zzep(paramInt);
      this.zzafn.zzd(new GamesClientImpl.LoadMatchesResultImpl(localStatus, paramBundle));
    }
  }

  private static final class UpdateAchievementResultImpl
    implements Achievements.UpdateAchievementResult
  {
    private final Status zzHb;
    private final String zzacY;

    UpdateAchievementResultImpl(int paramInt, String paramString)
    {
      this.zzHb = GamesStatusCodes.zzep(paramInt);
      this.zzacY = paramString;
    }

    public String getAchievementId()
    {
      return this.zzacY;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  private static final class UpdateMatchResultImpl extends GamesClientImpl.TurnBasedMatchResult
    implements TurnBasedMultiplayer.UpdateMatchResult
  {
    UpdateMatchResultImpl(DataHolder paramDataHolder)
    {
      super();
    }
  }

  private static final class UpdateRequestsResultImpl extends GamesClientImpl.GamesDataHolderResult
    implements Requests.UpdateRequestsResult
  {
    private final RequestUpdateOutcomes zzafo;

    UpdateRequestsResultImpl(DataHolder paramDataHolder)
    {
      super();
      this.zzafo = RequestUpdateOutcomes.zzW(paramDataHolder);
    }

    public Set<String> getRequestIds()
    {
      return this.zzafo.getRequestIds();
    }

    public int getRequestOutcome(String paramString)
    {
      return this.zzafo.getRequestOutcome(paramString);
    }
  }
}