package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameRef;
import java.util.ArrayList;

public final class InvitationRef extends zzd
  implements Invitation
{
  private final Game zzaiU;
  private final ParticipantRef zzajC;
  private final ArrayList<Participant> zzajz;

  InvitationRef(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    super(paramDataHolder, paramInt1);
    this.zzaiU = new GameRef(paramDataHolder, paramInt1);
    this.zzajz = new ArrayList(paramInt2);
    String str = getString("external_inviter_id");
    int i = 0;
    Object localObject = null;
    while (i < paramInt2)
    {
      ParticipantRef localParticipantRef = new ParticipantRef(this.zzMd, i + this.zzNQ);
      if (localParticipantRef.getParticipantId().equals(str))
        localObject = localParticipantRef;
      this.zzajz.add(localParticipantRef);
      i++;
    }
    this.zzajC = ((ParticipantRef)zzx.zzb(localObject, "Must have a valid inviter!"));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return InvitationEntity.zza(this, paramObject);
  }

  public Invitation freeze()
  {
    return new InvitationEntity(this);
  }

  public int getAvailableAutoMatchSlots()
  {
    if (!getBoolean("has_automatch_criteria"))
      return 0;
    return getInteger("automatch_max_players");
  }

  public long getCreationTimestamp()
  {
    return Math.max(getLong("creation_timestamp"), getLong("last_modified_timestamp"));
  }

  public Game getGame()
  {
    return this.zzaiU;
  }

  public String getInvitationId()
  {
    return getString("external_invitation_id");
  }

  public int getInvitationType()
  {
    return getInteger("type");
  }

  public Participant getInviter()
  {
    return this.zzajC;
  }

  public ArrayList<Participant> getParticipants()
  {
    return this.zzajz;
  }

  public int getVariant()
  {
    return getInteger("variant");
  }

  public int hashCode()
  {
    return InvitationEntity.zza(this);
  }

  public String toString()
  {
    return InvitationEntity.zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((InvitationEntity)freeze()).writeToParcel(paramParcel, paramInt);
  }
}