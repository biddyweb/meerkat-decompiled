package com.google.android.gms.games.internal.multiplayer;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzb;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.multiplayer.Invitation;
import com.google.android.gms.games.multiplayer.InvitationEntity;
import com.google.android.gms.games.multiplayer.Participant;
import java.util.ArrayList;

public final class ZInvitationCluster
  implements SafeParcelable, Invitation
{
  public static final InvitationClusterCreator CREATOR = new InvitationClusterCreator();
  private final int zzFG;
  private final ArrayList<InvitationEntity> zzaih;

  ZInvitationCluster(int paramInt, ArrayList<InvitationEntity> paramArrayList)
  {
    this.zzFG = paramInt;
    this.zzaih = paramArrayList;
    zzoy();
  }

  private void zzoy()
  {
    if (!this.zzaih.isEmpty());
    for (boolean bool = true; ; bool = false)
    {
      zzb.zzN(bool);
      Invitation localInvitation1 = (Invitation)this.zzaih.get(0);
      int i = this.zzaih.size();
      for (int j = 1; j < i; j++)
      {
        Invitation localInvitation2 = (Invitation)this.zzaih.get(j);
        zzb.zza(localInvitation1.getInviter().equals(localInvitation2.getInviter()), "All the invitations must be from the same inviter");
      }
    }
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof ZInvitationCluster))
      return false;
    if (this == paramObject)
      return true;
    ZInvitationCluster localZInvitationCluster = (ZInvitationCluster)paramObject;
    if (localZInvitationCluster.zzaih.size() != this.zzaih.size())
      return false;
    int i = this.zzaih.size();
    for (int j = 0; j < i; j++)
      if (!((Invitation)this.zzaih.get(j)).equals((Invitation)localZInvitationCluster.zzaih.get(j)))
        return false;
    return true;
  }

  public Invitation freeze()
  {
    return this;
  }

  public int getAvailableAutoMatchSlots()
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }

  public long getCreationTimestamp()
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }

  public Game getGame()
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }

  public String getInvitationId()
  {
    return ((InvitationEntity)this.zzaih.get(0)).getInvitationId();
  }

  public int getInvitationType()
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }

  public Participant getInviter()
  {
    return ((InvitationEntity)this.zzaih.get(0)).getInviter();
  }

  public ArrayList<Participant> getParticipants()
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }

  public int getVariant()
  {
    throw new UnsupportedOperationException("Method not supported on a cluster");
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    return zzw.hashCode(this.zzaih.toArray());
  }

  public boolean isDataValid()
  {
    return true;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    InvitationClusterCreator.zza(this, paramParcel, paramInt);
  }

  public ArrayList<Invitation> zzoz()
  {
    return new ArrayList(this.zzaih);
  }
}