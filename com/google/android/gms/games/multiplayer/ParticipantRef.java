package com.google.android.gms.games.multiplayer;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerRef;

public final class ParticipantRef extends zzd
  implements Participant
{
  private final PlayerRef zzajF;

  public ParticipantRef(DataHolder paramDataHolder, int paramInt)
  {
    super(paramDataHolder, paramInt);
    this.zzajF = new PlayerRef(paramDataHolder, paramInt);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return ParticipantEntity.zza(this, paramObject);
  }

  public Participant freeze()
  {
    return new ParticipantEntity(this);
  }

  public int getCapabilities()
  {
    return getInteger("capabilities");
  }

  public String getDisplayName()
  {
    if (zzbc("external_player_id"))
      return getString("default_display_name");
    return this.zzajF.getDisplayName();
  }

  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    if (zzbc("external_player_id"))
    {
      zza("default_display_name", paramCharArrayBuffer);
      return;
    }
    this.zzajF.getDisplayName(paramCharArrayBuffer);
  }

  public Uri getHiResImageUri()
  {
    if (zzbc("external_player_id"))
      return zzbb("default_display_hi_res_image_uri");
    return this.zzajF.getHiResImageUri();
  }

  public String getHiResImageUrl()
  {
    if (zzbc("external_player_id"))
      return getString("default_display_hi_res_image_url");
    return this.zzajF.getHiResImageUrl();
  }

  public Uri getIconImageUri()
  {
    if (zzbc("external_player_id"))
      return zzbb("default_display_image_uri");
    return this.zzajF.getIconImageUri();
  }

  public String getIconImageUrl()
  {
    if (zzbc("external_player_id"))
      return getString("default_display_image_url");
    return this.zzajF.getIconImageUrl();
  }

  public String getParticipantId()
  {
    return getString("external_participant_id");
  }

  public Player getPlayer()
  {
    if (zzbc("external_player_id"))
      return null;
    return this.zzajF;
  }

  public ParticipantResult getResult()
  {
    if (zzbc("result_type"))
      return null;
    int i = getInteger("result_type");
    int j = getInteger("placing");
    return new ParticipantResult(getParticipantId(), i, j);
  }

  public int getStatus()
  {
    return getInteger("player_status");
  }

  public int hashCode()
  {
    return ParticipantEntity.zza(this);
  }

  public boolean isConnectedToRoom()
  {
    return getInteger("connected") > 0;
  }

  public String toString()
  {
    return ParticipantEntity.zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((ParticipantEntity)freeze()).writeToParcel(paramParcel, paramInt);
  }

  public String zznl()
  {
    return getString("client_address");
  }
}