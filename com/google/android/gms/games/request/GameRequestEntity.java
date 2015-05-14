package com.google.android.gms.games.request;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class GameRequestEntity
  implements SafeParcelable, GameRequest
{
  public static final GameRequestEntityCreator CREATOR = new GameRequestEntityCreator();
  private final int zzFG;
  private final int zzJp;
  private final GameEntity zzahV;
  private final long zzajw;
  private final Bundle zzakA;
  private final byte[] zzakd;
  private final PlayerEntity zzakx;
  private final ArrayList<PlayerEntity> zzaky;
  private final long zzakz;
  private final int zzrX;
  private final String zzxv;

  GameRequestEntity(int paramInt1, GameEntity paramGameEntity, PlayerEntity paramPlayerEntity, byte[] paramArrayOfByte, String paramString, ArrayList<PlayerEntity> paramArrayList, int paramInt2, long paramLong1, long paramLong2, Bundle paramBundle, int paramInt3)
  {
    this.zzFG = paramInt1;
    this.zzahV = paramGameEntity;
    this.zzakx = paramPlayerEntity;
    this.zzakd = paramArrayOfByte;
    this.zzxv = paramString;
    this.zzaky = paramArrayList;
    this.zzJp = paramInt2;
    this.zzajw = paramLong1;
    this.zzakz = paramLong2;
    this.zzakA = paramBundle;
    this.zzrX = paramInt3;
  }

  public GameRequestEntity(GameRequest paramGameRequest)
  {
    this.zzFG = 2;
    this.zzahV = new GameEntity(paramGameRequest.getGame());
    this.zzakx = new PlayerEntity(paramGameRequest.getSender());
    this.zzxv = paramGameRequest.getRequestId();
    this.zzJp = paramGameRequest.getType();
    this.zzajw = paramGameRequest.getCreationTimestamp();
    this.zzakz = paramGameRequest.getExpirationTimestamp();
    this.zzrX = paramGameRequest.getStatus();
    byte[] arrayOfByte = paramGameRequest.getData();
    if (arrayOfByte == null)
      this.zzakd = null;
    while (true)
    {
      List localList = paramGameRequest.getRecipients();
      int i = localList.size();
      this.zzaky = new ArrayList(i);
      this.zzakA = new Bundle();
      for (int j = 0; j < i; j++)
      {
        Player localPlayer = (Player)((Player)localList.get(j)).freeze();
        String str = localPlayer.getPlayerId();
        this.zzaky.add((PlayerEntity)localPlayer);
        this.zzakA.putInt(str, paramGameRequest.getRecipientStatus(str));
      }
      this.zzakd = new byte[arrayOfByte.length];
      System.arraycopy(arrayOfByte, 0, this.zzakd, 0, arrayOfByte.length);
    }
  }

  static int zza(GameRequest paramGameRequest)
  {
    Object[] arrayOfObject = new Object[8];
    arrayOfObject[0] = paramGameRequest.getGame();
    arrayOfObject[1] = paramGameRequest.getRecipients();
    arrayOfObject[2] = paramGameRequest.getRequestId();
    arrayOfObject[3] = paramGameRequest.getSender();
    arrayOfObject[4] = zzb(paramGameRequest);
    arrayOfObject[5] = Integer.valueOf(paramGameRequest.getType());
    arrayOfObject[6] = Long.valueOf(paramGameRequest.getCreationTimestamp());
    arrayOfObject[7] = Long.valueOf(paramGameRequest.getExpirationTimestamp());
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(GameRequest paramGameRequest, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof GameRequest))
      bool = false;
    GameRequest localGameRequest;
    do
    {
      do
        return bool;
      while (paramGameRequest == paramObject);
      localGameRequest = (GameRequest)paramObject;
    }
    while ((zzw.equal(localGameRequest.getGame(), paramGameRequest.getGame())) && (zzw.equal(localGameRequest.getRecipients(), paramGameRequest.getRecipients())) && (zzw.equal(localGameRequest.getRequestId(), paramGameRequest.getRequestId())) && (zzw.equal(localGameRequest.getSender(), paramGameRequest.getSender())) && (Arrays.equals(zzb(localGameRequest), zzb(paramGameRequest))) && (zzw.equal(Integer.valueOf(localGameRequest.getType()), Integer.valueOf(paramGameRequest.getType()))) && (zzw.equal(Long.valueOf(localGameRequest.getCreationTimestamp()), Long.valueOf(paramGameRequest.getCreationTimestamp()))) && (zzw.equal(Long.valueOf(localGameRequest.getExpirationTimestamp()), Long.valueOf(paramGameRequest.getExpirationTimestamp()))));
    return false;
  }

  private static int[] zzb(GameRequest paramGameRequest)
  {
    List localList = paramGameRequest.getRecipients();
    int i = localList.size();
    int[] arrayOfInt = new int[i];
    for (int j = 0; j < i; j++)
      arrayOfInt[j] = paramGameRequest.getRecipientStatus(((Player)localList.get(j)).getPlayerId());
    return arrayOfInt;
  }

  static String zzc(GameRequest paramGameRequest)
  {
    return zzw.zzk(paramGameRequest).zza("Game", paramGameRequest.getGame()).zza("Sender", paramGameRequest.getSender()).zza("Recipients", paramGameRequest.getRecipients()).zza("Data", paramGameRequest.getData()).zza("RequestId", paramGameRequest.getRequestId()).zza("Type", Integer.valueOf(paramGameRequest.getType())).zza("CreationTimestamp", Long.valueOf(paramGameRequest.getCreationTimestamp())).zza("ExpirationTimestamp", Long.valueOf(paramGameRequest.getExpirationTimestamp())).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public GameRequest freeze()
  {
    return this;
  }

  public long getCreationTimestamp()
  {
    return this.zzajw;
  }

  public byte[] getData()
  {
    return this.zzakd;
  }

  public long getExpirationTimestamp()
  {
    return this.zzakz;
  }

  public Game getGame()
  {
    return this.zzahV;
  }

  public int getRecipientStatus(String paramString)
  {
    return this.zzakA.getInt(paramString, 0);
  }

  public List<Player> getRecipients()
  {
    return new ArrayList(this.zzaky);
  }

  public String getRequestId()
  {
    return this.zzxv;
  }

  public Player getSender()
  {
    return this.zzakx;
  }

  public int getStatus()
  {
    return this.zzrX;
  }

  public int getType()
  {
    return this.zzJp;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    return zza(this);
  }

  public boolean isConsumed(String paramString)
  {
    return getRecipientStatus(paramString) == 1;
  }

  public boolean isDataValid()
  {
    return true;
  }

  public String toString()
  {
    return zzc(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    GameRequestEntityCreator.zza(this, paramParcel, paramInt);
  }

  public Bundle zzpb()
  {
    return this.zzakA;
  }
}