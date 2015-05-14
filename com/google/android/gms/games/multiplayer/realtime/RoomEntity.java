package com.google.android.gms.games.multiplayer.realtime;

import android.database.CharArrayBuffer;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.internal.GamesDowngradeableSafeParcel;
import com.google.android.gms.games.multiplayer.Participant;
import com.google.android.gms.games.multiplayer.ParticipantEntity;
import com.google.android.gms.internal.zzlw;
import java.util.ArrayList;

public final class RoomEntity extends GamesDowngradeableSafeParcel
  implements Room
{
  public static final Parcelable.Creator<RoomEntity> CREATOR = new RoomEntityCreatorCompat();
  private final int zzFG;
  private final String zzZO;
  private final String zzaem;
  private final int zzajA;
  private final Bundle zzajQ;
  private final String zzajS;
  private final int zzajT;
  private final int zzajU;
  private final long zzajw;
  private final ArrayList<ParticipantEntity> zzajz;

  RoomEntity(int paramInt1, String paramString1, String paramString2, long paramLong, int paramInt2, String paramString3, int paramInt3, Bundle paramBundle, ArrayList<ParticipantEntity> paramArrayList, int paramInt4)
  {
    this.zzFG = paramInt1;
    this.zzaem = paramString1;
    this.zzajS = paramString2;
    this.zzajw = paramLong;
    this.zzajT = paramInt2;
    this.zzZO = paramString3;
    this.zzajA = paramInt3;
    this.zzajQ = paramBundle;
    this.zzajz = paramArrayList;
    this.zzajU = paramInt4;
  }

  public RoomEntity(Room paramRoom)
  {
    this.zzFG = 2;
    this.zzaem = paramRoom.getRoomId();
    this.zzajS = paramRoom.getCreatorId();
    this.zzajw = paramRoom.getCreationTimestamp();
    this.zzajT = paramRoom.getStatus();
    this.zzZO = paramRoom.getDescription();
    this.zzajA = paramRoom.getVariant();
    this.zzajQ = paramRoom.getAutoMatchCriteria();
    ArrayList localArrayList = paramRoom.getParticipants();
    int i = localArrayList.size();
    this.zzajz = new ArrayList(i);
    for (int j = 0; j < i; j++)
      this.zzajz.add((ParticipantEntity)((Participant)localArrayList.get(j)).freeze());
    this.zzajU = paramRoom.getAutoMatchWaitEstimateSeconds();
  }

  static int zza(Room paramRoom)
  {
    Object[] arrayOfObject = new Object[9];
    arrayOfObject[0] = paramRoom.getRoomId();
    arrayOfObject[1] = paramRoom.getCreatorId();
    arrayOfObject[2] = Long.valueOf(paramRoom.getCreationTimestamp());
    arrayOfObject[3] = Integer.valueOf(paramRoom.getStatus());
    arrayOfObject[4] = paramRoom.getDescription();
    arrayOfObject[5] = Integer.valueOf(paramRoom.getVariant());
    arrayOfObject[6] = paramRoom.getAutoMatchCriteria();
    arrayOfObject[7] = paramRoom.getParticipants();
    arrayOfObject[8] = Integer.valueOf(paramRoom.getAutoMatchWaitEstimateSeconds());
    return zzw.hashCode(arrayOfObject);
  }

  static int zza(Room paramRoom, String paramString)
  {
    ArrayList localArrayList = paramRoom.getParticipants();
    int i = localArrayList.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)localArrayList.get(j);
      if (localParticipant.getParticipantId().equals(paramString))
        return localParticipant.getStatus();
    }
    throw new IllegalStateException("Participant " + paramString + " is not in room " + paramRoom.getRoomId());
  }

  static boolean zza(Room paramRoom, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Room))
      bool = false;
    Room localRoom;
    do
    {
      do
        return bool;
      while (paramRoom == paramObject);
      localRoom = (Room)paramObject;
    }
    while ((zzw.equal(localRoom.getRoomId(), paramRoom.getRoomId())) && (zzw.equal(localRoom.getCreatorId(), paramRoom.getCreatorId())) && (zzw.equal(Long.valueOf(localRoom.getCreationTimestamp()), Long.valueOf(paramRoom.getCreationTimestamp()))) && (zzw.equal(Integer.valueOf(localRoom.getStatus()), Integer.valueOf(paramRoom.getStatus()))) && (zzw.equal(localRoom.getDescription(), paramRoom.getDescription())) && (zzw.equal(Integer.valueOf(localRoom.getVariant()), Integer.valueOf(paramRoom.getVariant()))) && (zzw.equal(localRoom.getAutoMatchCriteria(), paramRoom.getAutoMatchCriteria())) && (zzw.equal(localRoom.getParticipants(), paramRoom.getParticipants())) && (zzw.equal(Integer.valueOf(localRoom.getAutoMatchWaitEstimateSeconds()), Integer.valueOf(paramRoom.getAutoMatchWaitEstimateSeconds()))));
    return false;
  }

  static String zzb(Room paramRoom)
  {
    return zzw.zzk(paramRoom).zza("RoomId", paramRoom.getRoomId()).zza("CreatorId", paramRoom.getCreatorId()).zza("CreationTimestamp", Long.valueOf(paramRoom.getCreationTimestamp())).zza("RoomStatus", Integer.valueOf(paramRoom.getStatus())).zza("Description", paramRoom.getDescription()).zza("Variant", Integer.valueOf(paramRoom.getVariant())).zza("AutoMatchCriteria", paramRoom.getAutoMatchCriteria()).zza("Participants", paramRoom.getParticipants()).zza("AutoMatchWaitEstimateSeconds", Integer.valueOf(paramRoom.getAutoMatchWaitEstimateSeconds())).toString();
  }

  static String zzb(Room paramRoom, String paramString)
  {
    ArrayList localArrayList = paramRoom.getParticipants();
    int i = localArrayList.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)localArrayList.get(j);
      Player localPlayer = localParticipant.getPlayer();
      if ((localPlayer != null) && (localPlayer.getPlayerId().equals(paramString)))
        return localParticipant.getParticipantId();
    }
    return null;
  }

  static Participant zzc(Room paramRoom, String paramString)
  {
    ArrayList localArrayList = paramRoom.getParticipants();
    int i = localArrayList.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)localArrayList.get(j);
      if (localParticipant.getParticipantId().equals(paramString))
        return localParticipant;
    }
    throw new IllegalStateException("Participant " + paramString + " is not in match " + paramRoom.getRoomId());
  }

  static ArrayList<String> zzc(Room paramRoom)
  {
    ArrayList localArrayList1 = paramRoom.getParticipants();
    int i = localArrayList1.size();
    ArrayList localArrayList2 = new ArrayList(i);
    for (int j = 0; j < i; j++)
      localArrayList2.add(((Participant)localArrayList1.get(j)).getParticipantId());
    return localArrayList2;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public Room freeze()
  {
    return this;
  }

  public Bundle getAutoMatchCriteria()
  {
    return this.zzajQ;
  }

  public int getAutoMatchWaitEstimateSeconds()
  {
    return this.zzajU;
  }

  public long getCreationTimestamp()
  {
    return this.zzajw;
  }

  public String getCreatorId()
  {
    return this.zzajS;
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzZO, paramCharArrayBuffer);
  }

  public Participant getParticipant(String paramString)
  {
    return zzc(this, paramString);
  }

  public String getParticipantId(String paramString)
  {
    return zzb(this, paramString);
  }

  public ArrayList<String> getParticipantIds()
  {
    return zzc(this);
  }

  public int getParticipantStatus(String paramString)
  {
    return zza(this, paramString);
  }

  public ArrayList<Participant> getParticipants()
  {
    return new ArrayList(this.zzajz);
  }

  public String getRoomId()
  {
    return this.zzaem;
  }

  public int getStatus()
  {
    return this.zzajT;
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
      RoomEntityCreator.zza(this, paramParcel, paramInt);
    while (true)
    {
      return;
      paramParcel.writeString(this.zzaem);
      paramParcel.writeString(this.zzajS);
      paramParcel.writeLong(this.zzajw);
      paramParcel.writeInt(this.zzajT);
      paramParcel.writeString(this.zzZO);
      paramParcel.writeInt(this.zzajA);
      paramParcel.writeBundle(this.zzajQ);
      int i = this.zzajz.size();
      paramParcel.writeInt(i);
      for (int j = 0; j < i; j++)
        ((ParticipantEntity)this.zzajz.get(j)).writeToParcel(paramParcel, paramInt);
    }
  }

  static final class RoomEntityCreatorCompat extends RoomEntityCreator
  {
    public RoomEntity zzdh(Parcel paramParcel)
    {
      if ((RoomEntity.zzc(RoomEntity.zzmC())) || (RoomEntity.zzbN(RoomEntity.class.getCanonicalName())))
        return super.zzdh(paramParcel);
      String str1 = paramParcel.readString();
      String str2 = paramParcel.readString();
      long l = paramParcel.readLong();
      int i = paramParcel.readInt();
      String str3 = paramParcel.readString();
      int j = paramParcel.readInt();
      Bundle localBundle = paramParcel.readBundle();
      int k = paramParcel.readInt();
      ArrayList localArrayList = new ArrayList(k);
      for (int m = 0; m < k; m++)
        localArrayList.add(ParticipantEntity.CREATOR.createFromParcel(paramParcel));
      return new RoomEntity(2, str1, str2, l, i, str3, j, localBundle, localArrayList, -1);
    }
  }
}