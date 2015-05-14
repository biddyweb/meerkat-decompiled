package com.google.android.gms.games.multiplayer.realtime;

import android.os.Bundle;
import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.Arrays;

public abstract class RoomConfig
{
  public static Builder builder(RoomUpdateListener paramRoomUpdateListener)
  {
    return new Builder(paramRoomUpdateListener, null);
  }

  public static Bundle createAutoMatchCriteria(int paramInt1, int paramInt2, long paramLong)
  {
    Bundle localBundle = new Bundle();
    localBundle.putInt("min_automatch_players", paramInt1);
    localBundle.putInt("max_automatch_players", paramInt2);
    localBundle.putLong("exclusive_bit_mask", paramLong);
    return localBundle;
  }

  public abstract Bundle getAutoMatchCriteria();

  public abstract String getInvitationId();

  public abstract String[] getInvitedPlayerIds();

  public abstract RealTimeMessageReceivedListener getMessageReceivedListener();

  public abstract RoomStatusUpdateListener getRoomStatusUpdateListener();

  public abstract RoomUpdateListener getRoomUpdateListener();

  public abstract int getVariant();

  public static final class Builder
  {
    int zzajA = -1;
    final RoomUpdateListener zzajL;
    RoomStatusUpdateListener zzajM;
    RealTimeMessageReceivedListener zzajN;
    String zzajO = null;
    ArrayList<String> zzajP = new ArrayList();
    Bundle zzajQ;

    private Builder(RoomUpdateListener paramRoomUpdateListener)
    {
      this.zzajL = ((RoomUpdateListener)zzx.zzb(paramRoomUpdateListener, "Must provide a RoomUpdateListener"));
    }

    public Builder addPlayersToInvite(ArrayList<String> paramArrayList)
    {
      zzx.zzl(paramArrayList);
      this.zzajP.addAll(paramArrayList);
      return this;
    }

    public Builder addPlayersToInvite(String[] paramArrayOfString)
    {
      zzx.zzl(paramArrayOfString);
      this.zzajP.addAll(Arrays.asList(paramArrayOfString));
      return this;
    }

    public RoomConfig build()
    {
      return new RoomConfigImpl(this);
    }

    public Builder setAutoMatchCriteria(Bundle paramBundle)
    {
      this.zzajQ = paramBundle;
      return this;
    }

    public Builder setInvitationIdToAccept(String paramString)
    {
      zzx.zzl(paramString);
      this.zzajO = paramString;
      return this;
    }

    public Builder setMessageReceivedListener(RealTimeMessageReceivedListener paramRealTimeMessageReceivedListener)
    {
      this.zzajN = paramRealTimeMessageReceivedListener;
      return this;
    }

    public Builder setRoomStatusUpdateListener(RoomStatusUpdateListener paramRoomStatusUpdateListener)
    {
      this.zzajM = paramRoomStatusUpdateListener;
      return this;
    }

    public Builder setVariant(int paramInt)
    {
      if ((paramInt == -1) || (paramInt > 0));
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, "Variant must be a positive integer or Room.ROOM_VARIANT_ANY");
        this.zzajA = paramInt;
        return this;
      }
    }
  }
}