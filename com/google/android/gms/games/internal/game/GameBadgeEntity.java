package com.google.android.gms.games.internal.game;

import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.internal.GamesDowngradeableSafeParcel;

public final class GameBadgeEntity extends GamesDowngradeableSafeParcel
  implements GameBadge
{
  public static final GameBadgeEntityCreator CREATOR = new GameBadgeEntityCreatorCompat();
  private final int zzFG;
  private int zzJp;
  private String zzSy;
  private String zzZO;
  private Uri zzacc;

  GameBadgeEntity(int paramInt1, int paramInt2, String paramString1, String paramString2, Uri paramUri)
  {
    this.zzFG = paramInt1;
    this.zzJp = paramInt2;
    this.zzSy = paramString1;
    this.zzZO = paramString2;
    this.zzacc = paramUri;
  }

  public GameBadgeEntity(GameBadge paramGameBadge)
  {
    this.zzFG = 1;
    this.zzJp = paramGameBadge.getType();
    this.zzSy = paramGameBadge.getTitle();
    this.zzZO = paramGameBadge.getDescription();
    this.zzacc = paramGameBadge.getIconImageUri();
  }

  static int zza(GameBadge paramGameBadge)
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = Integer.valueOf(paramGameBadge.getType());
    arrayOfObject[1] = paramGameBadge.getTitle();
    arrayOfObject[2] = paramGameBadge.getDescription();
    arrayOfObject[3] = paramGameBadge.getIconImageUri();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(GameBadge paramGameBadge, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof GameBadge))
      bool = false;
    GameBadge localGameBadge;
    do
    {
      do
        return bool;
      while (paramGameBadge == paramObject);
      localGameBadge = (GameBadge)paramObject;
    }
    while ((zzw.equal(Integer.valueOf(localGameBadge.getType()), paramGameBadge.getTitle())) && (zzw.equal(localGameBadge.getDescription(), paramGameBadge.getIconImageUri())));
    return false;
  }

  static String zzb(GameBadge paramGameBadge)
  {
    return zzw.zzk(paramGameBadge).zza("Type", Integer.valueOf(paramGameBadge.getType())).zza("Title", paramGameBadge.getTitle()).zza("Description", paramGameBadge.getDescription()).zza("IconImageUri", paramGameBadge.getIconImageUri()).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public Uri getIconImageUri()
  {
    return this.zzacc;
  }

  public String getTitle()
  {
    return this.zzSy;
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

  public String toString()
  {
    return zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (!zziY())
    {
      GameBadgeEntityCreator.zza(this, paramParcel, paramInt);
      return;
    }
    paramParcel.writeInt(this.zzJp);
    paramParcel.writeString(this.zzSy);
    paramParcel.writeString(this.zzZO);
    if (this.zzacc == null);
    for (String str = null; ; str = this.zzacc.toString())
    {
      paramParcel.writeString(str);
      return;
    }
  }

  public GameBadge zzot()
  {
    return this;
  }

  static final class GameBadgeEntityCreatorCompat extends GameBadgeEntityCreator
  {
    public GameBadgeEntity zzda(Parcel paramParcel)
    {
      if ((GameBadgeEntity.zzc(GameBadgeEntity.zzmC())) || (GameBadgeEntity.zzbN(GameBadgeEntity.class.getCanonicalName())))
        return super.zzda(paramParcel);
      int i = paramParcel.readInt();
      String str1 = paramParcel.readString();
      String str2 = paramParcel.readString();
      String str3 = paramParcel.readString();
      if (str3 == null);
      for (Uri localUri = null; ; localUri = Uri.parse(str3))
        return new GameBadgeEntity(1, i, str1, str2, localUri);
    }
  }
}