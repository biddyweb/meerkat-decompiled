package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.zzb;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.internal.GamesDowngradeableSafeParcel;
import com.google.android.gms.games.internal.player.MostRecentGameInfo;
import com.google.android.gms.games.internal.player.MostRecentGameInfoEntity;
import com.google.android.gms.internal.zzlw;

public final class PlayerEntity extends GamesDowngradeableSafeParcel
  implements Player
{
  public static final Parcelable.Creator<PlayerEntity> CREATOR = new PlayerEntityCreatorCompat();
  private final int zzFG;
  private final String zzSJ;
  private final String zzSy;
  private final String zzacH;
  private final long zzacI;
  private final int zzacJ;
  private final long zzacK;
  private final MostRecentGameInfoEntity zzacL;
  private final PlayerLevelInfo zzacM;
  private final boolean zzacN;
  private final boolean zzacO;
  private final Uri zzacc;
  private final Uri zzacd;
  private final String zzacn;
  private final String zzaco;

  PlayerEntity(int paramInt1, String paramString1, String paramString2, Uri paramUri1, Uri paramUri2, long paramLong1, int paramInt2, long paramLong2, String paramString3, String paramString4, String paramString5, MostRecentGameInfoEntity paramMostRecentGameInfoEntity, PlayerLevelInfo paramPlayerLevelInfo, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.zzFG = paramInt1;
    this.zzacH = paramString1;
    this.zzSJ = paramString2;
    this.zzacc = paramUri1;
    this.zzacn = paramString3;
    this.zzacd = paramUri2;
    this.zzaco = paramString4;
    this.zzacI = paramLong1;
    this.zzacJ = paramInt2;
    this.zzacK = paramLong2;
    this.zzSy = paramString5;
    this.zzacN = paramBoolean1;
    this.zzacL = paramMostRecentGameInfoEntity;
    this.zzacM = paramPlayerLevelInfo;
    this.zzacO = paramBoolean2;
  }

  public PlayerEntity(Player paramPlayer)
  {
    this.zzFG = 12;
    this.zzacH = paramPlayer.getPlayerId();
    this.zzSJ = paramPlayer.getDisplayName();
    this.zzacc = paramPlayer.getIconImageUri();
    this.zzacn = paramPlayer.getIconImageUrl();
    this.zzacd = paramPlayer.getHiResImageUri();
    this.zzaco = paramPlayer.getHiResImageUrl();
    this.zzacI = paramPlayer.getRetrievedTimestamp();
    this.zzacJ = paramPlayer.zzmE();
    this.zzacK = paramPlayer.getLastPlayedWithTimestamp();
    this.zzSy = paramPlayer.getTitle();
    this.zzacN = paramPlayer.isProfileVisible();
    MostRecentGameInfo localMostRecentGameInfo = paramPlayer.zzmF();
    MostRecentGameInfoEntity localMostRecentGameInfoEntity;
    if (localMostRecentGameInfo == null)
    {
      localMostRecentGameInfoEntity = null;
      this.zzacL = localMostRecentGameInfoEntity;
      this.zzacM = paramPlayer.getLevelInfo();
      this.zzacO = paramPlayer.zzmD();
      zzb.zzh(this.zzacH);
      zzb.zzh(this.zzSJ);
      if (this.zzacI <= 0L)
        break label202;
    }
    label202: for (boolean bool = true; ; bool = false)
    {
      zzb.zzN(bool);
      return;
      localMostRecentGameInfoEntity = new MostRecentGameInfoEntity(localMostRecentGameInfo);
      break;
    }
  }

  static boolean zza(Player paramPlayer, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Player))
      bool = false;
    Player localPlayer;
    do
    {
      do
        return bool;
      while (paramPlayer == paramObject);
      localPlayer = (Player)paramObject;
    }
    while ((zzw.equal(localPlayer.getPlayerId(), paramPlayer.getPlayerId())) && (zzw.equal(localPlayer.getDisplayName(), paramPlayer.getDisplayName())) && (zzw.equal(Boolean.valueOf(localPlayer.zzmD()), Boolean.valueOf(paramPlayer.zzmD()))) && (zzw.equal(localPlayer.getIconImageUri(), paramPlayer.getIconImageUri())) && (zzw.equal(localPlayer.getHiResImageUri(), paramPlayer.getHiResImageUri())) && (zzw.equal(Long.valueOf(localPlayer.getRetrievedTimestamp()), Long.valueOf(paramPlayer.getRetrievedTimestamp()))) && (zzw.equal(localPlayer.getTitle(), paramPlayer.getTitle())) && (zzw.equal(localPlayer.getLevelInfo(), paramPlayer.getLevelInfo())));
    return false;
  }

  static int zzb(Player paramPlayer)
  {
    Object[] arrayOfObject = new Object[8];
    arrayOfObject[0] = paramPlayer.getPlayerId();
    arrayOfObject[1] = paramPlayer.getDisplayName();
    arrayOfObject[2] = Boolean.valueOf(paramPlayer.zzmD());
    arrayOfObject[3] = paramPlayer.getIconImageUri();
    arrayOfObject[4] = paramPlayer.getHiResImageUri();
    arrayOfObject[5] = Long.valueOf(paramPlayer.getRetrievedTimestamp());
    arrayOfObject[6] = paramPlayer.getTitle();
    arrayOfObject[7] = paramPlayer.getLevelInfo();
    return zzw.hashCode(arrayOfObject);
  }

  static String zzc(Player paramPlayer)
  {
    return zzw.zzk(paramPlayer).zza("PlayerId", paramPlayer.getPlayerId()).zza("DisplayName", paramPlayer.getDisplayName()).zza("HasDebugAccess", Boolean.valueOf(paramPlayer.zzmD())).zza("IconImageUri", paramPlayer.getIconImageUri()).zza("IconImageUrl", paramPlayer.getIconImageUrl()).zza("HiResImageUri", paramPlayer.getHiResImageUri()).zza("HiResImageUrl", paramPlayer.getHiResImageUrl()).zza("RetrievedTimestamp", Long.valueOf(paramPlayer.getRetrievedTimestamp())).zza("Title", paramPlayer.getTitle()).zza("LevelInfo", paramPlayer.getLevelInfo()).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public Player freeze()
  {
    return this;
  }

  public String getDisplayName()
  {
    return this.zzSJ;
  }

  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzSJ, paramCharArrayBuffer);
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

  public long getLastPlayedWithTimestamp()
  {
    return this.zzacK;
  }

  public PlayerLevelInfo getLevelInfo()
  {
    return this.zzacM;
  }

  public String getPlayerId()
  {
    return this.zzacH;
  }

  public long getRetrievedTimestamp()
  {
    return this.zzacI;
  }

  public String getTitle()
  {
    return this.zzSy;
  }

  public void getTitle(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzSy, paramCharArrayBuffer);
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public boolean hasHiResImage()
  {
    return getHiResImageUri() != null;
  }

  public boolean hasIconImage()
  {
    return getIconImageUri() != null;
  }

  public int hashCode()
  {
    return zzb(this);
  }

  public boolean isDataValid()
  {
    return true;
  }

  public boolean isProfileVisible()
  {
    return this.zzacN;
  }

  public String toString()
  {
    return zzc(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (!zziY())
    {
      PlayerEntityCreator.zza(this, paramParcel, paramInt);
      return;
    }
    paramParcel.writeString(this.zzacH);
    paramParcel.writeString(this.zzSJ);
    String str1;
    String str2;
    if (this.zzacc == null)
    {
      str1 = null;
      paramParcel.writeString(str1);
      Uri localUri = this.zzacd;
      str2 = null;
      if (localUri != null)
        break label84;
    }
    while (true)
    {
      paramParcel.writeString(str2);
      paramParcel.writeLong(this.zzacI);
      return;
      str1 = this.zzacc.toString();
      break;
      label84: str2 = this.zzacd.toString();
    }
  }

  public boolean zzmD()
  {
    return this.zzacO;
  }

  public int zzmE()
  {
    return this.zzacJ;
  }

  public MostRecentGameInfo zzmF()
  {
    return this.zzacL;
  }

  static final class PlayerEntityCreatorCompat extends PlayerEntityCreator
  {
    public PlayerEntity zzcQ(Parcel paramParcel)
    {
      if ((PlayerEntity.zzc(PlayerEntity.zzmC())) || (PlayerEntity.zzbN(PlayerEntity.class.getCanonicalName())))
        return super.zzcQ(paramParcel);
      String str1 = paramParcel.readString();
      String str2 = paramParcel.readString();
      String str3 = paramParcel.readString();
      String str4 = paramParcel.readString();
      Uri localUri1;
      if (str3 == null)
      {
        localUri1 = null;
        if (str4 != null)
          break label105;
      }
      label105: for (Uri localUri2 = null; ; localUri2 = Uri.parse(str4))
      {
        return new PlayerEntity(12, str1, str2, localUri1, localUri2, paramParcel.readLong(), -1, -1L, null, null, null, null, null, true, false);
        localUri1 = Uri.parse(str3);
        break;
      }
    }
  }
}