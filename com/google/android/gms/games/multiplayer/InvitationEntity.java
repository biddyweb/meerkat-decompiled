package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.internal.GamesDowngradeableSafeParcel;
import java.util.ArrayList;

public final class InvitationEntity extends GamesDowngradeableSafeParcel
  implements Invitation
{
  public static final Parcelable.Creator<InvitationEntity> CREATOR = new InvitationEntityCreatorCompat();
  private final int zzFG;
  private final String zzaek;
  private final GameEntity zzahV;
  private final int zzajA;
  private final int zzajB;
  private final long zzajw;
  private final int zzajx;
  private final ParticipantEntity zzajy;
  private final ArrayList<ParticipantEntity> zzajz;

  InvitationEntity(int paramInt1, GameEntity paramGameEntity, String paramString, long paramLong, int paramInt2, ParticipantEntity paramParticipantEntity, ArrayList<ParticipantEntity> paramArrayList, int paramInt3, int paramInt4)
  {
    this.zzFG = paramInt1;
    this.zzahV = paramGameEntity;
    this.zzaek = paramString;
    this.zzajw = paramLong;
    this.zzajx = paramInt2;
    this.zzajy = paramParticipantEntity;
    this.zzajz = paramArrayList;
    this.zzajA = paramInt3;
    this.zzajB = paramInt4;
  }

  InvitationEntity(Invitation paramInvitation)
  {
    this.zzFG = 2;
    this.zzahV = new GameEntity(paramInvitation.getGame());
    this.zzaek = paramInvitation.getInvitationId();
    this.zzajw = paramInvitation.getCreationTimestamp();
    this.zzajx = paramInvitation.getInvitationType();
    this.zzajA = paramInvitation.getVariant();
    this.zzajB = paramInvitation.getAvailableAutoMatchSlots();
    String str = paramInvitation.getInviter().getParticipantId();
    Object localObject = null;
    ArrayList localArrayList = paramInvitation.getParticipants();
    int i = localArrayList.size();
    this.zzajz = new ArrayList(i);
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)localArrayList.get(j);
      if (localParticipant.getParticipantId().equals(str))
        localObject = localParticipant;
      this.zzajz.add((ParticipantEntity)localParticipant.freeze());
    }
    zzx.zzb(localObject, "Must have a valid inviter!");
    this.zzajy = ((ParticipantEntity)localObject.freeze());
  }

  static int zza(Invitation paramInvitation)
  {
    Object[] arrayOfObject = new Object[8];
    arrayOfObject[0] = paramInvitation.getGame();
    arrayOfObject[1] = paramInvitation.getInvitationId();
    arrayOfObject[2] = Long.valueOf(paramInvitation.getCreationTimestamp());
    arrayOfObject[3] = Integer.valueOf(paramInvitation.getInvitationType());
    arrayOfObject[4] = paramInvitation.getInviter();
    arrayOfObject[5] = paramInvitation.getParticipants();
    arrayOfObject[6] = Integer.valueOf(paramInvitation.getVariant());
    arrayOfObject[7] = Integer.valueOf(paramInvitation.getAvailableAutoMatchSlots());
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(Invitation paramInvitation, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Invitation))
      bool = false;
    Invitation localInvitation;
    do
    {
      do
        return bool;
      while (paramInvitation == paramObject);
      localInvitation = (Invitation)paramObject;
    }
    while ((zzw.equal(localInvitation.getGame(), paramInvitation.getGame())) && (zzw.equal(localInvitation.getInvitationId(), paramInvitation.getInvitationId())) && (zzw.equal(Long.valueOf(localInvitation.getCreationTimestamp()), Long.valueOf(paramInvitation.getCreationTimestamp()))) && (zzw.equal(Integer.valueOf(localInvitation.getInvitationType()), Integer.valueOf(paramInvitation.getInvitationType()))) && (zzw.equal(localInvitation.getInviter(), paramInvitation.getInviter())) && (zzw.equal(localInvitation.getParticipants(), paramInvitation.getParticipants())) && (zzw.equal(Integer.valueOf(localInvitation.getVariant()), Integer.valueOf(paramInvitation.getVariant()))) && (zzw.equal(Integer.valueOf(localInvitation.getAvailableAutoMatchSlots()), Integer.valueOf(paramInvitation.getAvailableAutoMatchSlots()))));
    return false;
  }

  static String zzb(Invitation paramInvitation)
  {
    return zzw.zzk(paramInvitation).zza("Game", paramInvitation.getGame()).zza("InvitationId", paramInvitation.getInvitationId()).zza("CreationTimestamp", Long.valueOf(paramInvitation.getCreationTimestamp())).zza("InvitationType", Integer.valueOf(paramInvitation.getInvitationType())).zza("Inviter", paramInvitation.getInviter()).zza("Participants", paramInvitation.getParticipants()).zza("Variant", Integer.valueOf(paramInvitation.getVariant())).zza("AvailableAutoMatchSlots", Integer.valueOf(paramInvitation.getAvailableAutoMatchSlots())).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public Invitation freeze()
  {
    return this;
  }

  public int getAvailableAutoMatchSlots()
  {
    return this.zzajB;
  }

  public long getCreationTimestamp()
  {
    return this.zzajw;
  }

  public Game getGame()
  {
    return this.zzahV;
  }

  public String getInvitationId()
  {
    return this.zzaek;
  }

  public int getInvitationType()
  {
    return this.zzajx;
  }

  public Participant getInviter()
  {
    return this.zzajy;
  }

  public ArrayList<Participant> getParticipants()
  {
    return new ArrayList(this.zzajz);
  }

  public int getVariant()
  {
    return this.zzajA;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    return zza(this);
  }

  public boolean isDataValid()
  {
    return true;
  }

  public String toString()
  {
    return zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (!zziY())
      InvitationEntityCreator.zza(this, paramParcel, paramInt);
    while (true)
    {
      return;
      this.zzahV.writeToParcel(paramParcel, paramInt);
      paramParcel.writeString(this.zzaek);
      paramParcel.writeLong(this.zzajw);
      paramParcel.writeInt(this.zzajx);
      this.zzajy.writeToParcel(paramParcel, paramInt);
      int i = this.zzajz.size();
      paramParcel.writeInt(i);
      for (int j = 0; j < i; j++)
        ((ParticipantEntity)this.zzajz.get(j)).writeToParcel(paramParcel, paramInt);
    }
  }

  static final class InvitationEntityCreatorCompat extends InvitationEntityCreator
  {
    public InvitationEntity zzde(Parcel paramParcel)
    {
      if ((InvitationEntity.zzc(InvitationEntity.zzmC())) || (InvitationEntity.zzbN(InvitationEntity.class.getCanonicalName())))
        return super.zzde(paramParcel);
      GameEntity localGameEntity = (GameEntity)GameEntity.CREATOR.createFromParcel(paramParcel);
      String str = paramParcel.readString();
      long l = paramParcel.readLong();
      int i = paramParcel.readInt();
      ParticipantEntity localParticipantEntity = (ParticipantEntity)ParticipantEntity.CREATOR.createFromParcel(paramParcel);
      int j = paramParcel.readInt();
      ArrayList localArrayList = new ArrayList(j);
      for (int k = 0; k < j; k++)
        localArrayList.add(ParticipantEntity.CREATOR.createFromParcel(paramParcel));
      return new InvitationEntity(2, localGameEntity, str, l, i, localParticipantEntity, localArrayList, -1, 0);
    }
  }
}