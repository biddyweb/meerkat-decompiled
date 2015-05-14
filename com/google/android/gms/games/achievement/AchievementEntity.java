package com.google.android.gms.games.achievement;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzb;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.internal.zzlw;

public final class AchievementEntity
  implements SafeParcelable, Achievement
{
  public static final AchievementEntityCreator CREATOR = new AchievementEntityCreator();
  private final String mName;
  private final int mState;
  private final int zzFG;
  private final int zzJp;
  private final String zzZO;
  private final String zzacY;
  private final Uri zzacZ;
  private final String zzada;
  private final Uri zzadb;
  private final String zzadc;
  private final int zzadd;
  private final String zzade;
  private final PlayerEntity zzadf;
  private final int zzadg;
  private final String zzadh;
  private final long zzadi;
  private final long zzadj;

  AchievementEntity(int paramInt1, String paramString1, int paramInt2, String paramString2, String paramString3, Uri paramUri1, String paramString4, Uri paramUri2, String paramString5, int paramInt3, String paramString6, PlayerEntity paramPlayerEntity, int paramInt4, int paramInt5, String paramString7, long paramLong1, long paramLong2)
  {
    this.zzFG = paramInt1;
    this.zzacY = paramString1;
    this.zzJp = paramInt2;
    this.mName = paramString2;
    this.zzZO = paramString3;
    this.zzacZ = paramUri1;
    this.zzada = paramString4;
    this.zzadb = paramUri2;
    this.zzadc = paramString5;
    this.zzadd = paramInt3;
    this.zzade = paramString6;
    this.zzadf = paramPlayerEntity;
    this.mState = paramInt4;
    this.zzadg = paramInt5;
    this.zzadh = paramString7;
    this.zzadi = paramLong1;
    this.zzadj = paramLong2;
  }

  public AchievementEntity(Achievement paramAchievement)
  {
    this.zzFG = 1;
    this.zzacY = paramAchievement.getAchievementId();
    this.zzJp = paramAchievement.getType();
    this.mName = paramAchievement.getName();
    this.zzZO = paramAchievement.getDescription();
    this.zzacZ = paramAchievement.getUnlockedImageUri();
    this.zzada = paramAchievement.getUnlockedImageUrl();
    this.zzadb = paramAchievement.getRevealedImageUri();
    this.zzadc = paramAchievement.getRevealedImageUrl();
    this.zzadf = ((PlayerEntity)paramAchievement.getPlayer().freeze());
    this.mState = paramAchievement.getState();
    this.zzadi = paramAchievement.getLastUpdatedTimestamp();
    this.zzadj = paramAchievement.getXpValue();
    if (paramAchievement.getType() == 1)
    {
      this.zzadd = paramAchievement.getTotalSteps();
      this.zzade = paramAchievement.getFormattedTotalSteps();
      this.zzadg = paramAchievement.getCurrentSteps();
    }
    for (this.zzadh = paramAchievement.getFormattedCurrentSteps(); ; this.zzadh = null)
    {
      zzb.zzh(this.zzacY);
      zzb.zzh(this.zzZO);
      return;
      this.zzadd = 0;
      this.zzade = null;
      this.zzadg = 0;
    }
  }

  static int zza(Achievement paramAchievement)
  {
    int j;
    int i;
    if (paramAchievement.getType() == 1)
    {
      j = paramAchievement.getCurrentSteps();
      i = paramAchievement.getTotalSteps();
    }
    while (true)
    {
      Object[] arrayOfObject = new Object[10];
      arrayOfObject[0] = paramAchievement.getAchievementId();
      arrayOfObject[1] = paramAchievement.getName();
      arrayOfObject[2] = Integer.valueOf(paramAchievement.getType());
      arrayOfObject[3] = paramAchievement.getDescription();
      arrayOfObject[4] = Long.valueOf(paramAchievement.getXpValue());
      arrayOfObject[5] = Integer.valueOf(paramAchievement.getState());
      arrayOfObject[6] = Long.valueOf(paramAchievement.getLastUpdatedTimestamp());
      arrayOfObject[7] = paramAchievement.getPlayer();
      arrayOfObject[8] = Integer.valueOf(j);
      arrayOfObject[9] = Integer.valueOf(i);
      return zzw.hashCode(arrayOfObject);
      i = 0;
      j = 0;
    }
  }

  static boolean zza(Achievement paramAchievement, Object paramObject)
  {
    int i = 1;
    if (!(paramObject instanceof Achievement))
      i = 0;
    while (true)
    {
      return i;
      if (paramAchievement != paramObject)
      {
        Achievement localAchievement = (Achievement)paramObject;
        boolean bool2;
        boolean bool1;
        if (paramAchievement.getType() == i)
        {
          bool2 = zzw.equal(Integer.valueOf(localAchievement.getCurrentSteps()), Integer.valueOf(paramAchievement.getCurrentSteps()));
          bool1 = zzw.equal(Integer.valueOf(localAchievement.getTotalSteps()), Integer.valueOf(paramAchievement.getTotalSteps()));
        }
        while ((!zzw.equal(localAchievement.getAchievementId(), paramAchievement.getAchievementId())) || (!zzw.equal(localAchievement.getName(), paramAchievement.getName())) || (!zzw.equal(Integer.valueOf(localAchievement.getType()), Integer.valueOf(paramAchievement.getType()))) || (!zzw.equal(localAchievement.getDescription(), paramAchievement.getDescription())) || (!zzw.equal(Long.valueOf(localAchievement.getXpValue()), Long.valueOf(paramAchievement.getXpValue()))) || (!zzw.equal(Integer.valueOf(localAchievement.getState()), Integer.valueOf(paramAchievement.getState()))) || (!zzw.equal(Long.valueOf(localAchievement.getLastUpdatedTimestamp()), Long.valueOf(paramAchievement.getLastUpdatedTimestamp()))) || (!zzw.equal(localAchievement.getPlayer(), paramAchievement.getPlayer())) || (!bool2) || (!bool1))
        {
          return false;
          bool1 = i;
          bool2 = i;
        }
      }
    }
  }

  static String zzb(Achievement paramAchievement)
  {
    zzw.zza localzza = zzw.zzk(paramAchievement).zza("Id", paramAchievement.getAchievementId()).zza("Type", Integer.valueOf(paramAchievement.getType())).zza("Name", paramAchievement.getName()).zza("Description", paramAchievement.getDescription()).zza("Player", paramAchievement.getPlayer()).zza("State", Integer.valueOf(paramAchievement.getState()));
    if (paramAchievement.getType() == 1)
    {
      localzza.zza("CurrentSteps", Integer.valueOf(paramAchievement.getCurrentSteps()));
      localzza.zza("TotalSteps", Integer.valueOf(paramAchievement.getTotalSteps()));
    }
    return localzza.toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public Achievement freeze()
  {
    return this;
  }

  public String getAchievementId()
  {
    return this.zzacY;
  }

  public int getCurrentSteps()
  {
    return this.zzadg;
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzZO, paramCharArrayBuffer);
  }

  public String getFormattedCurrentSteps()
  {
    return this.zzadh;
  }

  public void getFormattedCurrentSteps(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzadh, paramCharArrayBuffer);
  }

  public String getFormattedTotalSteps()
  {
    return this.zzade;
  }

  public void getFormattedTotalSteps(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzade, paramCharArrayBuffer);
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

  public Player getPlayer()
  {
    return this.zzadf;
  }

  public Uri getRevealedImageUri()
  {
    return this.zzadb;
  }

  public String getRevealedImageUrl()
  {
    return this.zzadc;
  }

  public int getState()
  {
    return this.mState;
  }

  public int getTotalSteps()
  {
    return this.zzadd;
  }

  public int getType()
  {
    return this.zzJp;
  }

  public Uri getUnlockedImageUri()
  {
    return this.zzacZ;
  }

  public String getUnlockedImageUrl()
  {
    return this.zzada;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public long getXpValue()
  {
    return this.zzadj;
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
    AchievementEntityCreator.zza(this, paramParcel, paramInt);
  }
}