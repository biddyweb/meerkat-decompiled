package com.google.android.gms.games.multiplayer.realtime;

import android.database.CharArrayBuffer;
import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.games.multiplayer.Participant;
import com.google.android.gms.games.multiplayer.ParticipantRef;
import java.util.ArrayList;

public final class RoomRef extends zzd
  implements Room
{
  private final int zzadF;

  RoomRef(DataHolder paramDataHolder, int paramInt1, int paramInt2)
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
    return RoomEntity.zza(this, paramObject);
  }

  public Room freeze()
  {
    return new RoomEntity(this);
  }

  public Bundle getAutoMatchCriteria()
  {
    if (!getBoolean("has_automatch_criteria"))
      return null;
    return RoomConfig.createAutoMatchCriteria(getInteger("automatch_min_players"), getInteger("automatch_max_players"), getLong("automatch_bit_mask"));
  }

  public int getAutoMatchWaitEstimateSeconds()
  {
    return getInteger("automatch_wait_estimate_sec");
  }

  public long getCreationTimestamp()
  {
    return getLong("creation_timestamp");
  }

  public String getCreatorId()
  {
    return getString("creator_external");
  }

  public String getDescription()
  {
    return getString("description");
  }

  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    zza("description", paramCharArrayBuffer);
  }

  public Participant getParticipant(String paramString)
  {
    return RoomEntity.zzc(this, paramString);
  }

  public String getParticipantId(String paramString)
  {
    return RoomEntity.zzb(this, paramString);
  }

  public ArrayList<String> getParticipantIds()
  {
    return RoomEntity.zzc(this);
  }

  public int getParticipantStatus(String paramString)
  {
    return RoomEntity.zza(this, paramString);
  }

  public ArrayList<Participant> getParticipants()
  {
    ArrayList localArrayList = new ArrayList(this.zzadF);
    for (int i = 0; i < this.zzadF; i++)
      localArrayList.add(new ParticipantRef(this.zzMd, i + this.zzNQ));
    return localArrayList;
  }

  public String getRoomId()
  {
    return getString("external_match_id");
  }

  public int getStatus()
  {
    return getInteger("status");
  }

  public int getVariant()
  {
    return getInteger("variant");
  }

  public int hashCode()
  {
    return RoomEntity.zza(this);
  }

  public String toString()
  {
    return RoomEntity.zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((RoomEntity)freeze()).writeToParcel(paramParcel, paramInt);
  }
}