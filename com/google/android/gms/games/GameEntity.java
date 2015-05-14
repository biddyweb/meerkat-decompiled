package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.internal.GamesDowngradeableSafeParcel;
import com.google.android.gms.internal.zzlw;

public final class GameEntity extends GamesDowngradeableSafeParcel
  implements Game
{
  public static final Parcelable.Creator<GameEntity> CREATOR = new GameEntityCreatorCompat();
  private final int zzFG;
  private final String zzIm;
  private final String zzSJ;
  private final String zzZO;
  private final String zzabZ;
  private final String zzaca;
  private final String zzacb;
  private final Uri zzacc;
  private final Uri zzacd;
  private final Uri zzace;
  private final boolean zzacf;
  private final boolean zzacg;
  private final String zzach;
  private final int zzaci;
  private final int zzacj;
  private final int zzack;
  private final boolean zzacl;
  private final boolean zzacm;
  private final String zzacn;
  private final String zzaco;
  private final String zzacp;
  private final boolean zzacq;
  private final boolean zzacr;
  private final boolean zzacs;
  private final String zzact;
  private final boolean zzacu;

  GameEntity(int paramInt1, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, Uri paramUri1, Uri paramUri2, Uri paramUri3, boolean paramBoolean1, boolean paramBoolean2, String paramString7, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean3, boolean paramBoolean4, String paramString8, String paramString9, String paramString10, boolean paramBoolean5, boolean paramBoolean6, boolean paramBoolean7, String paramString11, boolean paramBoolean8)
  {
    this.zzFG = paramInt1;
    this.zzIm = paramString1;
    this.zzSJ = paramString2;
    this.zzabZ = paramString3;
    this.zzaca = paramString4;
    this.zzZO = paramString5;
    this.zzacb = paramString6;
    this.zzacc = paramUri1;
    this.zzacn = paramString8;
    this.zzacd = paramUri2;
    this.zzaco = paramString9;
    this.zzace = paramUri3;
    this.zzacp = paramString10;
    this.zzacf = paramBoolean1;
    this.zzacg = paramBoolean2;
    this.zzach = paramString7;
    this.zzaci = paramInt2;
    this.zzacj = paramInt3;
    this.zzack = paramInt4;
    this.zzacl = paramBoolean3;
    this.zzacm = paramBoolean4;
    this.zzacq = paramBoolean5;
    this.zzacr = paramBoolean6;
    this.zzacs = paramBoolean7;
    this.zzact = paramString11;
    this.zzacu = paramBoolean8;
  }

  public GameEntity(Game paramGame)
  {
    this.zzFG = 6;
    this.zzIm = paramGame.getApplicationId();
    this.zzabZ = paramGame.getPrimaryCategory();
    this.zzaca = paramGame.getSecondaryCategory();
    this.zzZO = paramGame.getDescription();
    this.zzacb = paramGame.getDeveloperName();
    this.zzSJ = paramGame.getDisplayName();
    this.zzacc = paramGame.getIconImageUri();
    this.zzacn = paramGame.getIconImageUrl();
    this.zzacd = paramGame.getHiResImageUri();
    this.zzaco = paramGame.getHiResImageUrl();
    this.zzace = paramGame.getFeaturedImageUri();
    this.zzacp = paramGame.getFeaturedImageUrl();
    this.zzacf = paramGame.zzmx();
    this.zzacg = paramGame.zzmz();
    this.zzach = paramGame.zzmA();
    this.zzaci = paramGame.zzmB();
    this.zzacj = paramGame.getAchievementTotalCount();
    this.zzack = paramGame.getLeaderboardCount();
    this.zzacl = paramGame.isRealTimeMultiplayerEnabled();
    this.zzacm = paramGame.isTurnBasedMultiplayerEnabled();
    this.zzacq = paramGame.isMuted();
    this.zzacr = paramGame.zzmy();
    this.zzacs = paramGame.areSnapshotsEnabled();
    this.zzact = paramGame.getThemeColor();
    this.zzacu = paramGame.hasGamepadSupport();
  }

  static int zza(Game paramGame)
  {
    Object[] arrayOfObject = new Object[22];
    arrayOfObject[0] = paramGame.getApplicationId();
    arrayOfObject[1] = paramGame.getDisplayName();
    arrayOfObject[2] = paramGame.getPrimaryCategory();
    arrayOfObject[3] = paramGame.getSecondaryCategory();
    arrayOfObject[4] = paramGame.getDescription();
    arrayOfObject[5] = paramGame.getDeveloperName();
    arrayOfObject[6] = paramGame.getIconImageUri();
    arrayOfObject[7] = paramGame.getHiResImageUri();
    arrayOfObject[8] = paramGame.getFeaturedImageUri();
    arrayOfObject[9] = Boolean.valueOf(paramGame.zzmx());
    arrayOfObject[10] = Boolean.valueOf(paramGame.zzmz());
    arrayOfObject[11] = paramGame.zzmA();
    arrayOfObject[12] = Integer.valueOf(paramGame.zzmB());
    arrayOfObject[13] = Integer.valueOf(paramGame.getAchievementTotalCount());
    arrayOfObject[14] = Integer.valueOf(paramGame.getLeaderboardCount());
    arrayOfObject[15] = Boolean.valueOf(paramGame.isRealTimeMultiplayerEnabled());
    arrayOfObject[16] = Boolean.valueOf(paramGame.isTurnBasedMultiplayerEnabled());
    arrayOfObject[17] = Boolean.valueOf(paramGame.isMuted());
    arrayOfObject[18] = Boolean.valueOf(paramGame.zzmy());
    arrayOfObject[19] = Boolean.valueOf(paramGame.areSnapshotsEnabled());
    arrayOfObject[20] = paramGame.getThemeColor();
    arrayOfObject[21] = Boolean.valueOf(paramGame.hasGamepadSupport());
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(Game paramGame, Object paramObject)
  {
    boolean bool1 = true;
    if (!(paramObject instanceof Game))
      bool1 = false;
    while (true)
    {
      return bool1;
      if (paramGame != paramObject)
      {
        Game localGame = (Game)paramObject;
        Boolean localBoolean;
        if ((zzw.equal(localGame.getApplicationId(), paramGame.getApplicationId())) && (zzw.equal(localGame.getDisplayName(), paramGame.getDisplayName())) && (zzw.equal(localGame.getPrimaryCategory(), paramGame.getPrimaryCategory())) && (zzw.equal(localGame.getSecondaryCategory(), paramGame.getSecondaryCategory())) && (zzw.equal(localGame.getDescription(), paramGame.getDescription())) && (zzw.equal(localGame.getDeveloperName(), paramGame.getDeveloperName())) && (zzw.equal(localGame.getIconImageUri(), paramGame.getIconImageUri())) && (zzw.equal(localGame.getHiResImageUri(), paramGame.getHiResImageUri())) && (zzw.equal(localGame.getFeaturedImageUri(), paramGame.getFeaturedImageUri())) && (zzw.equal(Boolean.valueOf(localGame.zzmx()), Boolean.valueOf(paramGame.zzmx()))) && (zzw.equal(Boolean.valueOf(localGame.zzmz()), Boolean.valueOf(paramGame.zzmz()))) && (zzw.equal(localGame.zzmA(), paramGame.zzmA())) && (zzw.equal(Integer.valueOf(localGame.zzmB()), Integer.valueOf(paramGame.zzmB()))) && (zzw.equal(Integer.valueOf(localGame.getAchievementTotalCount()), Integer.valueOf(paramGame.getAchievementTotalCount()))) && (zzw.equal(Integer.valueOf(localGame.getLeaderboardCount()), Integer.valueOf(paramGame.getLeaderboardCount()))) && (zzw.equal(Boolean.valueOf(localGame.isRealTimeMultiplayerEnabled()), Boolean.valueOf(paramGame.isRealTimeMultiplayerEnabled()))))
        {
          localBoolean = Boolean.valueOf(localGame.isTurnBasedMultiplayerEnabled());
          if ((!paramGame.isTurnBasedMultiplayerEnabled()) || (!zzw.equal(Boolean.valueOf(localGame.isMuted()), Boolean.valueOf(paramGame.isMuted()))) || (!zzw.equal(Boolean.valueOf(localGame.zzmy()), Boolean.valueOf(paramGame.zzmy()))))
            break label499;
        }
        label499: for (boolean bool2 = bool1; (!zzw.equal(localBoolean, Boolean.valueOf(bool2))) || (!zzw.equal(Boolean.valueOf(localGame.areSnapshotsEnabled()), Boolean.valueOf(paramGame.areSnapshotsEnabled()))) || (!zzw.equal(localGame.getThemeColor(), paramGame.getThemeColor())) || (!zzw.equal(Boolean.valueOf(localGame.hasGamepadSupport()), Boolean.valueOf(paramGame.hasGamepadSupport()))); bool2 = false)
          return false;
      }
    }
  }

  static String zzb(Game paramGame)
  {
    return zzw.zzk(paramGame).zza("ApplicationId", paramGame.getApplicationId()).zza("DisplayName", paramGame.getDisplayName()).zza("PrimaryCategory", paramGame.getPrimaryCategory()).zza("SecondaryCategory", paramGame.getSecondaryCategory()).zza("Description", paramGame.getDescription()).zza("DeveloperName", paramGame.getDeveloperName()).zza("IconImageUri", paramGame.getIconImageUri()).zza("IconImageUrl", paramGame.getIconImageUrl()).zza("HiResImageUri", paramGame.getHiResImageUri()).zza("HiResImageUrl", paramGame.getHiResImageUrl()).zza("FeaturedImageUri", paramGame.getFeaturedImageUri()).zza("FeaturedImageUrl", paramGame.getFeaturedImageUrl()).zza("PlayEnabledGame", Boolean.valueOf(paramGame.zzmx())).zza("InstanceInstalled", Boolean.valueOf(paramGame.zzmz())).zza("InstancePackageName", paramGame.zzmA()).zza("AchievementTotalCount", Integer.valueOf(paramGame.getAchievementTotalCount())).zza("LeaderboardCount", Integer.valueOf(paramGame.getLeaderboardCount())).zza("RealTimeMultiplayerEnabled", Boolean.valueOf(paramGame.isRealTimeMultiplayerEnabled())).zza("TurnBasedMultiplayerEnabled", Boolean.valueOf(paramGame.isTurnBasedMultiplayerEnabled())).zza("AreSnapshotsEnabled", Boolean.valueOf(paramGame.areSnapshotsEnabled())).zza("ThemeColor", paramGame.getThemeColor()).zza("HasGamepadSupport", Boolean.valueOf(paramGame.hasGamepadSupport())).toString();
  }

  public boolean areSnapshotsEnabled()
  {
    return this.zzacs;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public Game freeze()
  {
    return this;
  }

  public int getAchievementTotalCount()
  {
    return this.zzacj;
  }

  public String getApplicationId()
  {
    return this.zzIm;
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzZO, paramCharArrayBuffer);
  }

  public String getDeveloperName()
  {
    return this.zzacb;
  }

  public void getDeveloperName(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzacb, paramCharArrayBuffer);
  }

  public String getDisplayName()
  {
    return this.zzSJ;
  }

  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzSJ, paramCharArrayBuffer);
  }

  public Uri getFeaturedImageUri()
  {
    return this.zzace;
  }

  public String getFeaturedImageUrl()
  {
    return this.zzacp;
  }

  public Uri getHiResImageUri()
  {
    return this.zzacd;
  }

  public String getHiResImageUrl()
  {
    return this.zzaco;
  }

  public Uri getIconImageUri()
  {
    return this.zzacc;
  }

  public String getIconImageUrl()
  {
    return this.zzacn;
  }

  public int getLeaderboardCount()
  {
    return this.zzack;
  }

  public String getPrimaryCategory()
  {
    return this.zzabZ;
  }

  public String getSecondaryCategory()
  {
    return this.zzaca;
  }

  public String getThemeColor()
  {
    return this.zzact;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public boolean hasGamepadSupport()
  {
    return this.zzacu;
  }

  public int hashCode()
  {
    return zza(this);
  }

  public boolean isDataValid()
  {
    return true;
  }

  public boolean isMuted()
  {
    return this.zzacq;
  }

  public boolean isRealTimeMultiplayerEnabled()
  {
    return this.zzacl;
  }

  public boolean isTurnBasedMultiplayerEnabled()
  {
    return this.zzacm;
  }

  public String toString()
  {
    return zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    int i = 1;
    if (!zziY())
    {
      GameEntityCreator.zza(this, paramParcel, paramInt);
      return;
    }
    paramParcel.writeString(this.zzIm);
    paramParcel.writeString(this.zzSJ);
    paramParcel.writeString(this.zzabZ);
    paramParcel.writeString(this.zzaca);
    paramParcel.writeString(this.zzZO);
    paramParcel.writeString(this.zzacb);
    String str1;
    String str2;
    label90: String str3;
    label110: int j;
    if (this.zzacc == null)
    {
      str1 = null;
      paramParcel.writeString(str1);
      if (this.zzacd != null)
        break label189;
      str2 = null;
      paramParcel.writeString(str2);
      Uri localUri = this.zzace;
      str3 = null;
      if (localUri != null)
        break label201;
      paramParcel.writeString(str3);
      if (!this.zzacf)
        break label213;
      j = i;
      label126: paramParcel.writeInt(j);
      if (!this.zzacg)
        break label219;
    }
    while (true)
    {
      paramParcel.writeInt(i);
      paramParcel.writeString(this.zzach);
      paramParcel.writeInt(this.zzaci);
      paramParcel.writeInt(this.zzacj);
      paramParcel.writeInt(this.zzack);
      return;
      str1 = this.zzacc.toString();
      break;
      label189: str2 = this.zzacd.toString();
      break label90;
      label201: str3 = this.zzace.toString();
      break label110;
      label213: j = 0;
      break label126;
      label219: i = 0;
    }
  }

  public String zzmA()
  {
    return this.zzach;
  }

  public int zzmB()
  {
    return this.zzaci;
  }

  public boolean zzmx()
  {
    return this.zzacf;
  }

  public boolean zzmy()
  {
    return this.zzacr;
  }

  public boolean zzmz()
  {
    return this.zzacg;
  }

  static final class GameEntityCreatorCompat extends GameEntityCreator
  {
    public GameEntity zzcP(Parcel paramParcel)
    {
      if ((GameEntity.zzc(GameEntity.zzmC())) || (GameEntity.zzbN(GameEntity.class.getCanonicalName())))
        return super.zzcP(paramParcel);
      String str1 = paramParcel.readString();
      String str2 = paramParcel.readString();
      String str3 = paramParcel.readString();
      String str4 = paramParcel.readString();
      String str5 = paramParcel.readString();
      String str6 = paramParcel.readString();
      String str7 = paramParcel.readString();
      Uri localUri1;
      String str8;
      Uri localUri2;
      label88: String str9;
      Uri localUri3;
      label102: boolean bool1;
      if (str7 == null)
      {
        localUri1 = null;
        str8 = paramParcel.readString();
        if (str8 != null)
          break label188;
        localUri2 = null;
        str9 = paramParcel.readString();
        if (str9 != null)
          break label198;
        localUri3 = null;
        if (paramParcel.readInt() <= 0)
          break label208;
        bool1 = true;
        label112: if (paramParcel.readInt() <= 0)
          break label214;
      }
      label188: label198: label208: label214: for (boolean bool2 = true; ; bool2 = false)
      {
        return new GameEntity(6, str1, str2, str3, str4, str5, str6, localUri1, localUri2, localUri3, bool1, bool2, paramParcel.readString(), paramParcel.readInt(), paramParcel.readInt(), paramParcel.readInt(), false, false, null, null, null, false, false, false, null, false);
        localUri1 = Uri.parse(str7);
        break;
        localUri2 = Uri.parse(str8);
        break label88;
        localUri3 = Uri.parse(str9);
        break label102;
        bool1 = false;
        break label112;
      }
    }
  }
}