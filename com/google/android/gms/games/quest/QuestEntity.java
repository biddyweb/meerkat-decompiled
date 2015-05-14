package com.google.android.gms.games.quest;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.internal.zzlw;
import java.util.ArrayList;
import java.util.List;

public final class QuestEntity
  implements SafeParcelable, Quest
{
  public static final QuestEntityCreator CREATOR = new QuestEntityCreator();
  private final String mName;
  private final int mState;
  private final int zzFG;
  private final int zzJp;
  private final String zzZO;
  private final long zzadi;
  private final GameEntity zzahV;
  private final String zzakn;
  private final long zzako;
  private final Uri zzakp;
  private final String zzakq;
  private final long zzakr;
  private final Uri zzaks;
  private final String zzakt;
  private final long zzaku;
  private final long zzakv;
  private final ArrayList<MilestoneEntity> zzakw;

  QuestEntity(int paramInt1, GameEntity paramGameEntity, String paramString1, long paramLong1, Uri paramUri1, String paramString2, String paramString3, long paramLong2, long paramLong3, Uri paramUri2, String paramString4, String paramString5, long paramLong4, long paramLong5, int paramInt2, int paramInt3, ArrayList<MilestoneEntity> paramArrayList)
  {
    this.zzFG = paramInt1;
    this.zzahV = paramGameEntity;
    this.zzakn = paramString1;
    this.zzako = paramLong1;
    this.zzakp = paramUri1;
    this.zzakq = paramString2;
    this.zzZO = paramString3;
    this.zzakr = paramLong2;
    this.zzadi = paramLong3;
    this.zzaks = paramUri2;
    this.zzakt = paramString4;
    this.mName = paramString5;
    this.zzaku = paramLong4;
    this.zzakv = paramLong5;
    this.mState = paramInt2;
    this.zzJp = paramInt3;
    this.zzakw = paramArrayList;
  }

  public QuestEntity(Quest paramQuest)
  {
    this.zzFG = 2;
    this.zzahV = new GameEntity(paramQuest.getGame());
    this.zzakn = paramQuest.getQuestId();
    this.zzako = paramQuest.getAcceptedTimestamp();
    this.zzZO = paramQuest.getDescription();
    this.zzakp = paramQuest.getBannerImageUri();
    this.zzakq = paramQuest.getBannerImageUrl();
    this.zzakr = paramQuest.getEndTimestamp();
    this.zzaks = paramQuest.getIconImageUri();
    this.zzakt = paramQuest.getIconImageUrl();
    this.zzadi = paramQuest.getLastUpdatedTimestamp();
    this.mName = paramQuest.getName();
    this.zzaku = paramQuest.zzpa();
    this.zzakv = paramQuest.getStartTimestamp();
    this.mState = paramQuest.getState();
    this.zzJp = paramQuest.getType();
    List localList = paramQuest.zzoZ();
    int i = localList.size();
    this.zzakw = new ArrayList(i);
    for (int j = 0; j < i; j++)
      this.zzakw.add((MilestoneEntity)((Milestone)localList.get(j)).freeze());
  }

  static int zza(Quest paramQuest)
  {
    Object[] arrayOfObject = new Object[13];
    arrayOfObject[0] = paramQuest.getGame();
    arrayOfObject[1] = paramQuest.getQuestId();
    arrayOfObject[2] = Long.valueOf(paramQuest.getAcceptedTimestamp());
    arrayOfObject[3] = paramQuest.getBannerImageUri();
    arrayOfObject[4] = paramQuest.getDescription();
    arrayOfObject[5] = Long.valueOf(paramQuest.getEndTimestamp());
    arrayOfObject[6] = paramQuest.getIconImageUri();
    arrayOfObject[7] = Long.valueOf(paramQuest.getLastUpdatedTimestamp());
    arrayOfObject[8] = paramQuest.zzoZ();
    arrayOfObject[9] = paramQuest.getName();
    arrayOfObject[10] = Long.valueOf(paramQuest.zzpa());
    arrayOfObject[11] = Long.valueOf(paramQuest.getStartTimestamp());
    arrayOfObject[12] = Integer.valueOf(paramQuest.getState());
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(Quest paramQuest, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Quest))
      bool = false;
    Quest localQuest;
    do
    {
      do
        return bool;
      while (paramQuest == paramObject);
      localQuest = (Quest)paramObject;
    }
    while ((zzw.equal(localQuest.getGame(), paramQuest.getGame())) && (zzw.equal(localQuest.getQuestId(), paramQuest.getQuestId())) && (zzw.equal(Long.valueOf(localQuest.getAcceptedTimestamp()), Long.valueOf(paramQuest.getAcceptedTimestamp()))) && (zzw.equal(localQuest.getBannerImageUri(), paramQuest.getBannerImageUri())) && (zzw.equal(localQuest.getDescription(), paramQuest.getDescription())) && (zzw.equal(Long.valueOf(localQuest.getEndTimestamp()), Long.valueOf(paramQuest.getEndTimestamp()))) && (zzw.equal(localQuest.getIconImageUri(), paramQuest.getIconImageUri())) && (zzw.equal(Long.valueOf(localQuest.getLastUpdatedTimestamp()), Long.valueOf(paramQuest.getLastUpdatedTimestamp()))) && (zzw.equal(localQuest.zzoZ(), paramQuest.zzoZ())) && (zzw.equal(localQuest.getName(), paramQuest.getName())) && (zzw.equal(Long.valueOf(localQuest.zzpa()), Long.valueOf(paramQuest.zzpa()))) && (zzw.equal(Long.valueOf(localQuest.getStartTimestamp()), Long.valueOf(paramQuest.getStartTimestamp()))) && (zzw.equal(Integer.valueOf(localQuest.getState()), Integer.valueOf(paramQuest.getState()))));
    return false;
  }

  static String zzb(Quest paramQuest)
  {
    return zzw.zzk(paramQuest).zza("Game", paramQuest.getGame()).zza("QuestId", paramQuest.getQuestId()).zza("AcceptedTimestamp", Long.valueOf(paramQuest.getAcceptedTimestamp())).zza("BannerImageUri", paramQuest.getBannerImageUri()).zza("BannerImageUrl", paramQuest.getBannerImageUrl()).zza("Description", paramQuest.getDescription()).zza("EndTimestamp", Long.valueOf(paramQuest.getEndTimestamp())).zza("IconImageUri", paramQuest.getIconImageUri()).zza("IconImageUrl", paramQuest.getIconImageUrl()).zza("LastUpdatedTimestamp", Long.valueOf(paramQuest.getLastUpdatedTimestamp())).zza("Milestones", paramQuest.zzoZ()).zza("Name", paramQuest.getName()).zza("NotifyTimestamp", Long.valueOf(paramQuest.zzpa())).zza("StartTimestamp", Long.valueOf(paramQuest.getStartTimestamp())).zza("State", Integer.valueOf(paramQuest.getState())).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public Quest freeze()
  {
    return this;
  }

  public long getAcceptedTimestamp()
  {
    return this.zzako;
  }

  public Uri getBannerImageUri()
  {
    return this.zzakp;
  }

  public String getBannerImageUrl()
  {
    return this.zzakq;
  }

  public Milestone getCurrentMilestone()
  {
    return (Milestone)zzoZ().get(0);
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzZO, paramCharArrayBuffer);
  }

  public long getEndTimestamp()
  {
    return this.zzakr;
  }

  public Game getGame()
  {
    return this.zzahV;
  }

  public Uri getIconImageUri()
  {
    return this.zzaks;
  }

  public String getIconImageUrl()
  {
    return this.zzakt;
  }

  public long getLastUpdatedTimestamp()
  {
    return this.zzadi;
  }

  public String getName()
  {
    return this.mName;
  }

  public void getName(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.mName, paramCharArrayBuffer);
  }

  public String getQuestId()
  {
    return this.zzakn;
  }

  public long getStartTimestamp()
  {
    return this.zzakv;
  }

  public int getState()
  {
    return this.mState;
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

  public boolean isDataValid()
  {
    return true;
  }

  public boolean isEndingSoon()
  {
    return this.zzaku <= 1800000L + System.currentTimeMillis();
  }

  public String toString()
  {
    return zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    QuestEntityCreator.zza(this, paramParcel, paramInt);
  }

  public List<Milestone> zzoZ()
  {
    return new ArrayList(this.zzakw);
  }

  public long zzpa()
  {
    return this.zzaku;
  }
}