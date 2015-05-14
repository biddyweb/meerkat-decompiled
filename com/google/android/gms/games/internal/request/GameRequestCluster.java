package com.google.android.gms.games.internal.request;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzb;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.request.GameRequest;
import com.google.android.gms.games.request.GameRequestEntity;
import java.util.ArrayList;

public final class GameRequestCluster
  implements SafeParcelable, GameRequest
{
  public static final GameRequestClusterCreator CREATOR = new GameRequestClusterCreator();
  private final int zzFG;
  private final ArrayList<GameRequestEntity> zzaiO;

  GameRequestCluster(int paramInt, ArrayList<GameRequestEntity> paramArrayList)
  {
    this.zzFG = paramInt;
    this.zzaiO = paramArrayList;
    zzoy();
  }

  private void zzoy()
  {
    boolean bool1;
    GameRequest localGameRequest1;
    int j;
    label39: GameRequest localGameRequest2;
    if (!this.zzaiO.isEmpty())
    {
      bool1 = true;
      zzb.zzN(bool1);
      localGameRequest1 = (GameRequest)this.zzaiO.get(0);
      int i = this.zzaiO.size();
      j = 1;
      if (j >= i)
        return;
      localGameRequest2 = (GameRequest)this.zzaiO.get(j);
      if (localGameRequest1.getType() != localGameRequest2.getType())
        break label117;
    }
    label117: for (boolean bool2 = true; ; bool2 = false)
    {
      zzb.zza(bool2, "All the requests must be of the same type");
      zzb.zza(localGameRequest1.getSender().equals(localGameRequest2.getSender()), "All the requests must be from the same sender");
      j++;
      break label39;
      bool1 = false;
      break;
    }
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof GameRequestCluster))
      return false;
    if (this == paramObject)
      return true;
    GameRequestCluster localGameRequestCluster = (GameRequestCluster)paramObject;
    if (localGameRequestCluster.zzaiO.size() != this.zzaiO.size())
      return false;
    int i = this.zzaiO.size();
    for (int j = 0; j < i; j++)
      if (!((GameRequest)this.zzaiO.get(j)).equals((GameRequest)localGameRequestCluster.zzaiO.get(j)))
        return false;
    return true;
  }

  public GameRequest freeze()
  {
    return this;
  }

  public long getCreationTimestamp()
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }

  public byte[] getData()
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }

  public long getExpirationTimestamp()
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }

  public Game getGame()
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }

  public int getRecipientStatus(String paramString)
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }

  public String getRequestId()
  {
    return ((GameRequestEntity)this.zzaiO.get(0)).getRequestId();
  }

  public Player getSender()
  {
    return ((GameRequestEntity)this.zzaiO.get(0)).getSender();
  }

  public int getStatus()
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }

  public int getType()
  {
    return ((GameRequestEntity)this.zzaiO.get(0)).getType();
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    return zzw.hashCode(this.zzaiO.toArray());
  }

  public boolean isConsumed(String paramString)
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }

  public boolean isDataValid()
  {
    return true;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    GameRequestClusterCreator.zza(this, paramParcel, paramInt);
  }

  public ArrayList<GameRequest> zzoM()
  {
    return new ArrayList(this.zzaiO);
  }

  public ArrayList<Player> zzoN()
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }
}