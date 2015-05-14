package com.google.android.gms.games.multiplayer.turnbased;

import android.database.CharArrayBuffer;
import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.multiplayer.Participant;
import com.google.android.gms.games.multiplayer.ParticipantEntity;
import com.google.android.gms.internal.zzlw;
import java.util.ArrayList;

public final class TurnBasedMatchEntity
  implements SafeParcelable, TurnBasedMatch
{
  public static final TurnBasedMatchEntityCreator CREATOR = new TurnBasedMatchEntityCreator();
  private final int zzFG;
  private final int zzHe;
  private final String zzZO;
  private final long zzadi;
  private final String zzaeF;
  private final GameEntity zzahV;
  private final int zzajA;
  private final Bundle zzajQ;
  private final String zzajS;
  private final long zzajw;
  private final ArrayList<ParticipantEntity> zzajz;
  private final String zzaka;
  private final String zzakb;
  private final int zzakc;
  private final byte[] zzakd;
  private final String zzake;
  private final byte[] zzakf;
  private final int zzakg;
  private final int zzakh;
  private final boolean zzaki;
  private final String zzakj;

  TurnBasedMatchEntity(int paramInt1, GameEntity paramGameEntity, String paramString1, String paramString2, long paramLong1, String paramString3, long paramLong2, String paramString4, int paramInt2, int paramInt3, int paramInt4, byte[] paramArrayOfByte1, ArrayList<ParticipantEntity> paramArrayList, String paramString5, byte[] paramArrayOfByte2, int paramInt5, Bundle paramBundle, int paramInt6, boolean paramBoolean, String paramString6, String paramString7)
  {
    this.zzFG = paramInt1;
    this.zzahV = paramGameEntity;
    this.zzaeF = paramString1;
    this.zzajS = paramString2;
    this.zzajw = paramLong1;
    this.zzaka = paramString3;
    this.zzadi = paramLong2;
    this.zzakb = paramString4;
    this.zzakc = paramInt2;
    this.zzakh = paramInt6;
    this.zzajA = paramInt3;
    this.zzHe = paramInt4;
    this.zzakd = paramArrayOfByte1;
    this.zzajz = paramArrayList;
    this.zzake = paramString5;
    this.zzakf = paramArrayOfByte2;
    this.zzakg = paramInt5;
    this.zzajQ = paramBundle;
    this.zzaki = paramBoolean;
    this.zzZO = paramString6;
    this.zzakj = paramString7;
  }

  public TurnBasedMatchEntity(TurnBasedMatch paramTurnBasedMatch)
  {
    this.zzFG = 2;
    this.zzahV = new GameEntity(paramTurnBasedMatch.getGame());
    this.zzaeF = paramTurnBasedMatch.getMatchId();
    this.zzajS = paramTurnBasedMatch.getCreatorId();
    this.zzajw = paramTurnBasedMatch.getCreationTimestamp();
    this.zzaka = paramTurnBasedMatch.getLastUpdaterId();
    this.zzadi = paramTurnBasedMatch.getLastUpdatedTimestamp();
    this.zzakb = paramTurnBasedMatch.getPendingParticipantId();
    this.zzakc = paramTurnBasedMatch.getStatus();
    this.zzakh = paramTurnBasedMatch.getTurnStatus();
    this.zzajA = paramTurnBasedMatch.getVariant();
    this.zzHe = paramTurnBasedMatch.getVersion();
    this.zzake = paramTurnBasedMatch.getRematchId();
    this.zzakg = paramTurnBasedMatch.getMatchNumber();
    this.zzajQ = paramTurnBasedMatch.getAutoMatchCriteria();
    this.zzaki = paramTurnBasedMatch.isLocallyModified();
    this.zzZO = paramTurnBasedMatch.getDescription();
    this.zzakj = paramTurnBasedMatch.getDescriptionParticipantId();
    byte[] arrayOfByte1 = paramTurnBasedMatch.getData();
    byte[] arrayOfByte2;
    if (arrayOfByte1 == null)
    {
      this.zzakd = null;
      arrayOfByte2 = paramTurnBasedMatch.getPreviousMatchData();
      if (arrayOfByte2 != null)
        break label314;
      this.zzakf = null;
    }
    while (true)
    {
      ArrayList localArrayList = paramTurnBasedMatch.getParticipants();
      int i = localArrayList.size();
      this.zzajz = new ArrayList(i);
      for (int j = 0; j < i; j++)
        this.zzajz.add((ParticipantEntity)((Participant)localArrayList.get(j)).freeze());
      this.zzakd = new byte[arrayOfByte1.length];
      System.arraycopy(arrayOfByte1, 0, this.zzakd, 0, arrayOfByte1.length);
      break;
      label314: this.zzakf = new byte[arrayOfByte2.length];
      System.arraycopy(arrayOfByte2, 0, this.zzakf, 0, arrayOfByte2.length);
    }
  }

  static int zza(TurnBasedMatch paramTurnBasedMatch)
  {
    Object[] arrayOfObject = new Object[18];
    arrayOfObject[0] = paramTurnBasedMatch.getGame();
    arrayOfObject[1] = paramTurnBasedMatch.getMatchId();
    arrayOfObject[2] = paramTurnBasedMatch.getCreatorId();
    arrayOfObject[3] = Long.valueOf(paramTurnBasedMatch.getCreationTimestamp());
    arrayOfObject[4] = paramTurnBasedMatch.getLastUpdaterId();
    arrayOfObject[5] = Long.valueOf(paramTurnBasedMatch.getLastUpdatedTimestamp());
    arrayOfObject[6] = paramTurnBasedMatch.getPendingParticipantId();
    arrayOfObject[7] = Integer.valueOf(paramTurnBasedMatch.getStatus());
    arrayOfObject[8] = Integer.valueOf(paramTurnBasedMatch.getTurnStatus());
    arrayOfObject[9] = paramTurnBasedMatch.getDescription();
    arrayOfObject[10] = Integer.valueOf(paramTurnBasedMatch.getVariant());
    arrayOfObject[11] = Integer.valueOf(paramTurnBasedMatch.getVersion());
    arrayOfObject[12] = paramTurnBasedMatch.getParticipants();
    arrayOfObject[13] = paramTurnBasedMatch.getRematchId();
    arrayOfObject[14] = Integer.valueOf(paramTurnBasedMatch.getMatchNumber());
    arrayOfObject[15] = paramTurnBasedMatch.getAutoMatchCriteria();
    arrayOfObject[16] = Integer.valueOf(paramTurnBasedMatch.getAvailableAutoMatchSlots());
    arrayOfObject[17] = Boolean.valueOf(paramTurnBasedMatch.isLocallyModified());
    return zzw.hashCode(arrayOfObject);
  }

  static int zza(TurnBasedMatch paramTurnBasedMatch, String paramString)
  {
    ArrayList localArrayList = paramTurnBasedMatch.getParticipants();
    int i = localArrayList.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)localArrayList.get(j);
      if (localParticipant.getParticipantId().equals(paramString))
        return localParticipant.getStatus();
    }
    throw new IllegalStateException("Participant " + paramString + " is not in match " + paramTurnBasedMatch.getMatchId());
  }

  static boolean zza(TurnBasedMatch paramTurnBasedMatch, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof TurnBasedMatch))
      bool = false;
    TurnBasedMatch localTurnBasedMatch;
    do
    {
      do
        return bool;
      while (paramTurnBasedMatch == paramObject);
      localTurnBasedMatch = (TurnBasedMatch)paramObject;
    }
    while ((zzw.equal(localTurnBasedMatch.getGame(), paramTurnBasedMatch.getGame())) && (zzw.equal(localTurnBasedMatch.getMatchId(), paramTurnBasedMatch.getMatchId())) && (zzw.equal(localTurnBasedMatch.getCreatorId(), paramTurnBasedMatch.getCreatorId())) && (zzw.equal(Long.valueOf(localTurnBasedMatch.getCreationTimestamp()), Long.valueOf(paramTurnBasedMatch.getCreationTimestamp()))) && (zzw.equal(localTurnBasedMatch.getLastUpdaterId(), paramTurnBasedMatch.getLastUpdaterId())) && (zzw.equal(Long.valueOf(localTurnBasedMatch.getLastUpdatedTimestamp()), Long.valueOf(paramTurnBasedMatch.getLastUpdatedTimestamp()))) && (zzw.equal(localTurnBasedMatch.getPendingParticipantId(), paramTurnBasedMatch.getPendingParticipantId())) && (zzw.equal(Integer.valueOf(localTurnBasedMatch.getStatus()), Integer.valueOf(paramTurnBasedMatch.getStatus()))) && (zzw.equal(Integer.valueOf(localTurnBasedMatch.getTurnStatus()), Integer.valueOf(paramTurnBasedMatch.getTurnStatus()))) && (zzw.equal(localTurnBasedMatch.getDescription(), paramTurnBasedMatch.getDescription())) && (zzw.equal(Integer.valueOf(localTurnBasedMatch.getVariant()), Integer.valueOf(paramTurnBasedMatch.getVariant()))) && (zzw.equal(Integer.valueOf(localTurnBasedMatch.getVersion()), Integer.valueOf(paramTurnBasedMatch.getVersion()))) && (zzw.equal(localTurnBasedMatch.getParticipants(), paramTurnBasedMatch.getParticipants())) && (zzw.equal(localTurnBasedMatch.getRematchId(), paramTurnBasedMatch.getRematchId())) && (zzw.equal(Integer.valueOf(localTurnBasedMatch.getMatchNumber()), Integer.valueOf(paramTurnBasedMatch.getMatchNumber()))) && (zzw.equal(localTurnBasedMatch.getAutoMatchCriteria(), paramTurnBasedMatch.getAutoMatchCriteria())) && (zzw.equal(Integer.valueOf(localTurnBasedMatch.getAvailableAutoMatchSlots()), Integer.valueOf(paramTurnBasedMatch.getAvailableAutoMatchSlots()))) && (zzw.equal(Boolean.valueOf(localTurnBasedMatch.isLocallyModified()), Boolean.valueOf(paramTurnBasedMatch.isLocallyModified()))));
    return false;
  }

  static String zzb(TurnBasedMatch paramTurnBasedMatch)
  {
    return zzw.zzk(paramTurnBasedMatch).zza("Game", paramTurnBasedMatch.getGame()).zza("MatchId", paramTurnBasedMatch.getMatchId()).zza("CreatorId", paramTurnBasedMatch.getCreatorId()).zza("CreationTimestamp", Long.valueOf(paramTurnBasedMatch.getCreationTimestamp())).zza("LastUpdaterId", paramTurnBasedMatch.getLastUpdaterId()).zza("LastUpdatedTimestamp", Long.valueOf(paramTurnBasedMatch.getLastUpdatedTimestamp())).zza("PendingParticipantId", paramTurnBasedMatch.getPendingParticipantId()).zza("MatchStatus", Integer.valueOf(paramTurnBasedMatch.getStatus())).zza("TurnStatus", Integer.valueOf(paramTurnBasedMatch.getTurnStatus())).zza("Description", paramTurnBasedMatch.getDescription()).zza("Variant", Integer.valueOf(paramTurnBasedMatch.getVariant())).zza("Data", paramTurnBasedMatch.getData()).zza("Version", Integer.valueOf(paramTurnBasedMatch.getVersion())).zza("Participants", paramTurnBasedMatch.getParticipants()).zza("RematchId", paramTurnBasedMatch.getRematchId()).zza("PreviousData", paramTurnBasedMatch.getPreviousMatchData()).zza("MatchNumber", Integer.valueOf(paramTurnBasedMatch.getMatchNumber())).zza("AutoMatchCriteria", paramTurnBasedMatch.getAutoMatchCriteria()).zza("AvailableAutoMatchSlots", Integer.valueOf(paramTurnBasedMatch.getAvailableAutoMatchSlots())).zza("LocallyModified", Boolean.valueOf(paramTurnBasedMatch.isLocallyModified())).zza("DescriptionParticipantId", paramTurnBasedMatch.getDescriptionParticipantId()).toString();
  }

  static String zzb(TurnBasedMatch paramTurnBasedMatch, String paramString)
  {
    ArrayList localArrayList = paramTurnBasedMatch.getParticipants();
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

  static Participant zzc(TurnBasedMatch paramTurnBasedMatch, String paramString)
  {
    ArrayList localArrayList = paramTurnBasedMatch.getParticipants();
    int i = localArrayList.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)localArrayList.get(j);
      if (localParticipant.getParticipantId().equals(paramString))
        return localParticipant;
    }
    throw new IllegalStateException("Participant " + paramString + " is not in match " + paramTurnBasedMatch.getMatchId());
  }

  static ArrayList<String> zzc(TurnBasedMatch paramTurnBasedMatch)
  {
    ArrayList localArrayList1 = paramTurnBasedMatch.getParticipants();
    int i = localArrayList1.size();
    ArrayList localArrayList2 = new ArrayList(i);
    for (int j = 0; j < i; j++)
      localArrayList2.add(((Participant)localArrayList1.get(j)).getParticipantId());
    return localArrayList2;
  }

  public boolean canRematch()
  {
    return (this.zzakc == 2) && (this.zzake == null);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public TurnBasedMatch freeze()
  {
    return this;
  }

  public Bundle getAutoMatchCriteria()
  {
    return this.zzajQ;
  }

  public int getAvailableAutoMatchSlots()
  {
    if (this.zzajQ == null)
      return 0;
    return this.zzajQ.getInt("max_automatch_players");
  }

  public long getCreationTimestamp()
  {
    return this.zzajw;
  }

  public String getCreatorId()
  {
    return this.zzajS;
  }

  public byte[] getData()
  {
    return this.zzakd;
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzZO, paramCharArrayBuffer);
  }

  public Participant getDescriptionParticipant()
  {
    String str = getDescriptionParticipantId();
    if (str == null)
      return null;
    return getParticipant(str);
  }

  public String getDescriptionParticipantId()
  {
    return this.zzakj;
  }

  public Game getGame()
  {
    return this.zzahV;
  }

  public long getLastUpdatedTimestamp()
  {
    return this.zzadi;
  }

  public String getLastUpdaterId()
  {
    return this.zzaka;
  }

  public String getMatchId()
  {
    return this.zzaeF;
  }

  public int getMatchNumber()
  {
    return this.zzakg;
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

  public String getPendingParticipantId()
  {
    return this.zzakb;
  }

  public byte[] getPreviousMatchData()
  {
    return this.zzakf;
  }

  public String getRematchId()
  {
    return this.zzake;
  }

  public int getStatus()
  {
    return this.zzakc;
  }

  public int getTurnStatus()
  {
    return this.zzakh;
  }

  public int getVariant()
  {
    return this.zzajA;
  }

  public int getVersion()
  {
    return this.zzHe;
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

  public boolean isLocallyModified()
  {
    return this.zzaki;
  }

  public String toString()
  {
    return zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    TurnBasedMatchEntityCreator.zza(this, paramParcel, paramInt);
  }
}