package com.google.android.gms.games.request;

import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameRef;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerRef;
import java.util.ArrayList;
import java.util.List;

public final class GameRequestRef extends zzd
  implements GameRequest
{
  private final int zzadF;

  public GameRequestRef(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    super(paramDataHolder, paramInt1);
    this.zzadF = paramInt2;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return GameRequestEntity.zza(this, paramObject);
  }

  public GameRequest freeze()
  {
    return new GameRequestEntity(this);
  }

  public long getCreationTimestamp()
  {
    return getLong("creation_timestamp");
  }

  public byte[] getData()
  {
    return getByteArray("data");
  }

  public long getExpirationTimestamp()
  {
    return getLong("expiration_timestamp");
  }

  public Game getGame()
  {
    return new GameRef(this.zzMd, this.zzNQ);
  }

  public int getRecipientStatus(String paramString)
  {
    for (int i = this.zzNQ; i < this.zzNQ + this.zzadF; i++)
    {
      int j = this.zzMd.zzax(i);
      if (this.zzMd.zzc("recipient_external_player_id", i, j).equals(paramString))
        return this.zzMd.zzb("recipient_status", i, j);
    }
    return -1;
  }

  public List<Player> getRecipients()
  {
    ArrayList localArrayList = new ArrayList(this.zzadF);
    for (int i = 0; i < this.zzadF; i++)
      localArrayList.add(new PlayerRef(this.zzMd, i + this.zzNQ, "recipient_"));
    return localArrayList;
  }

  public String getRequestId()
  {
    return getString("external_request_id");
  }

  public Player getSender()
  {
    return new PlayerRef(this.zzMd, zzix(), "sender_");
  }

  public int getStatus()
  {
    return getInteger("status");
  }

  public int getType()
  {
    return getInteger("type");
  }

  public int hashCode()
  {
    return GameRequestEntity.zza(this);
  }

  public boolean isConsumed(String paramString)
  {
    return getRecipientStatus(paramString) == 1;
  }

  public String toString()
  {
    return GameRequestEntity.zzc(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((GameRequestEntity)freeze()).writeToParcel(paramParcel, paramInt);
  }
}