package com.google.android.gms.games.internal.game;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.internal.GamesDowngradeableSafeParcel;
import com.google.android.gms.games.snapshot.SnapshotMetadata;
import com.google.android.gms.games.snapshot.SnapshotMetadataEntity;
import java.util.ArrayList;

public final class ExtendedGameEntity extends GamesDowngradeableSafeParcel
  implements ExtendedGame
{
  public static final ExtendedGameEntityCreator CREATOR = new ExtendedGameEntityCreatorCompat();
  private final int zzFG;
  private final GameEntity zzahV;
  private final int zzahW;
  private final boolean zzahX;
  private final int zzahY;
  private final long zzahZ;
  private final long zzaia;
  private final String zzaib;
  private final long zzaic;
  private final String zzaid;
  private final ArrayList<GameBadgeEntity> zzaie;
  private final SnapshotMetadataEntity zzaif;

  ExtendedGameEntity(int paramInt1, GameEntity paramGameEntity, int paramInt2, boolean paramBoolean, int paramInt3, long paramLong1, long paramLong2, String paramString1, long paramLong3, String paramString2, ArrayList<GameBadgeEntity> paramArrayList, SnapshotMetadataEntity paramSnapshotMetadataEntity)
  {
    this.zzFG = paramInt1;
    this.zzahV = paramGameEntity;
    this.zzahW = paramInt2;
    this.zzahX = paramBoolean;
    this.zzahY = paramInt3;
    this.zzahZ = paramLong1;
    this.zzaia = paramLong2;
    this.zzaib = paramString1;
    this.zzaic = paramLong3;
    this.zzaid = paramString2;
    this.zzaie = paramArrayList;
    this.zzaif = paramSnapshotMetadataEntity;
  }

  public ExtendedGameEntity(ExtendedGame paramExtendedGame)
  {
    this.zzFG = 2;
    Game localGame = paramExtendedGame.getGame();
    GameEntity localGameEntity;
    SnapshotMetadata localSnapshotMetadata;
    SnapshotMetadataEntity localSnapshotMetadataEntity;
    if (localGame == null)
    {
      localGameEntity = null;
      this.zzahV = localGameEntity;
      this.zzahW = paramExtendedGame.zzoi();
      this.zzahX = paramExtendedGame.zzoj();
      this.zzahY = paramExtendedGame.zzok();
      this.zzahZ = paramExtendedGame.zzol();
      this.zzaia = paramExtendedGame.zzom();
      this.zzaib = paramExtendedGame.zzon();
      this.zzaic = paramExtendedGame.zzoo();
      this.zzaid = paramExtendedGame.zzop();
      localSnapshotMetadata = paramExtendedGame.zzoq();
      localSnapshotMetadataEntity = null;
      if (localSnapshotMetadata != null)
        break label211;
    }
    while (true)
    {
      this.zzaif = localSnapshotMetadataEntity;
      ArrayList localArrayList = paramExtendedGame.zzoh();
      int i = localArrayList.size();
      this.zzaie = new ArrayList(i);
      for (int j = 0; j < i; j++)
        this.zzaie.add((GameBadgeEntity)((GameBadge)localArrayList.get(j)).freeze());
      localGameEntity = new GameEntity(localGame);
      break;
      label211: localSnapshotMetadataEntity = new SnapshotMetadataEntity(localSnapshotMetadata);
    }
  }

  static int zza(ExtendedGame paramExtendedGame)
  {
    Object[] arrayOfObject = new Object[9];
    arrayOfObject[0] = paramExtendedGame.getGame();
    arrayOfObject[1] = Integer.valueOf(paramExtendedGame.zzoi());
    arrayOfObject[2] = Boolean.valueOf(paramExtendedGame.zzoj());
    arrayOfObject[3] = Integer.valueOf(paramExtendedGame.zzok());
    arrayOfObject[4] = Long.valueOf(paramExtendedGame.zzol());
    arrayOfObject[5] = Long.valueOf(paramExtendedGame.zzom());
    arrayOfObject[6] = paramExtendedGame.zzon();
    arrayOfObject[7] = Long.valueOf(paramExtendedGame.zzoo());
    arrayOfObject[8] = paramExtendedGame.zzop();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(ExtendedGame paramExtendedGame, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof ExtendedGame))
      bool = false;
    ExtendedGame localExtendedGame;
    do
    {
      do
        return bool;
      while (paramExtendedGame == paramObject);
      localExtendedGame = (ExtendedGame)paramObject;
    }
    while ((zzw.equal(localExtendedGame.getGame(), paramExtendedGame.getGame())) && (zzw.equal(Integer.valueOf(localExtendedGame.zzoi()), Integer.valueOf(paramExtendedGame.zzoi()))) && (zzw.equal(Boolean.valueOf(localExtendedGame.zzoj()), Boolean.valueOf(paramExtendedGame.zzoj()))) && (zzw.equal(Integer.valueOf(localExtendedGame.zzok()), Integer.valueOf(paramExtendedGame.zzok()))) && (zzw.equal(Long.valueOf(localExtendedGame.zzol()), Long.valueOf(paramExtendedGame.zzol()))) && (zzw.equal(Long.valueOf(localExtendedGame.zzom()), Long.valueOf(paramExtendedGame.zzom()))) && (zzw.equal(localExtendedGame.zzon(), paramExtendedGame.zzon())) && (zzw.equal(Long.valueOf(localExtendedGame.zzoo()), Long.valueOf(paramExtendedGame.zzoo()))) && (zzw.equal(localExtendedGame.zzop(), paramExtendedGame.zzop())));
    return false;
  }

  static String zzb(ExtendedGame paramExtendedGame)
  {
    return zzw.zzk(paramExtendedGame).zza("Game", paramExtendedGame.getGame()).zza("Availability", Integer.valueOf(paramExtendedGame.zzoi())).zza("Owned", Boolean.valueOf(paramExtendedGame.zzoj())).zza("AchievementUnlockedCount", Integer.valueOf(paramExtendedGame.zzok())).zza("LastPlayedServerTimestamp", Long.valueOf(paramExtendedGame.zzol())).zza("PriceMicros", Long.valueOf(paramExtendedGame.zzom())).zza("FormattedPrice", paramExtendedGame.zzon()).zza("FullPriceMicros", Long.valueOf(paramExtendedGame.zzoo())).zza("FormattedFullPrice", paramExtendedGame.zzop()).zza("Snapshot", paramExtendedGame.zzoq()).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
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
    int i = 0;
    if (!zziY())
    {
      ExtendedGameEntityCreator.zza(this, paramParcel, paramInt);
      return;
    }
    this.zzahV.writeToParcel(paramParcel, paramInt);
    paramParcel.writeInt(this.zzahW);
    if (this.zzahX);
    for (int j = 1; ; j = 0)
    {
      paramParcel.writeInt(j);
      paramParcel.writeInt(this.zzahY);
      paramParcel.writeLong(this.zzahZ);
      paramParcel.writeLong(this.zzaia);
      paramParcel.writeString(this.zzaib);
      paramParcel.writeLong(this.zzaic);
      paramParcel.writeString(this.zzaid);
      int k = this.zzaie.size();
      paramParcel.writeInt(k);
      while (i < k)
      {
        ((GameBadgeEntity)this.zzaie.get(i)).writeToParcel(paramParcel, paramInt);
        i++;
      }
      break;
    }
  }

  public ArrayList<GameBadge> zzoh()
  {
    return new ArrayList(this.zzaie);
  }

  public int zzoi()
  {
    return this.zzahW;
  }

  public boolean zzoj()
  {
    return this.zzahX;
  }

  public int zzok()
  {
    return this.zzahY;
  }

  public long zzol()
  {
    return this.zzahZ;
  }

  public long zzom()
  {
    return this.zzaia;
  }

  public String zzon()
  {
    return this.zzaib;
  }

  public long zzoo()
  {
    return this.zzaic;
  }

  public String zzop()
  {
    return this.zzaid;
  }

  public SnapshotMetadata zzoq()
  {
    return this.zzaif;
  }

  public GameEntity zzor()
  {
    return this.zzahV;
  }

  public ExtendedGame zzos()
  {
    return this;
  }

  static final class ExtendedGameEntityCreatorCompat extends ExtendedGameEntityCreator
  {
    public ExtendedGameEntity zzcZ(Parcel paramParcel)
    {
      if ((ExtendedGameEntity.zzc(ExtendedGameEntity.zzmC())) || (ExtendedGameEntity.zzbN(ExtendedGameEntity.class.getCanonicalName())))
        return super.zzcZ(paramParcel);
      GameEntity localGameEntity = (GameEntity)GameEntity.CREATOR.createFromParcel(paramParcel);
      int i = paramParcel.readInt();
      if (paramParcel.readInt() == 1);
      int j;
      long l1;
      long l2;
      String str1;
      long l3;
      String str2;
      ArrayList localArrayList;
      for (boolean bool = true; ; bool = false)
      {
        j = paramParcel.readInt();
        l1 = paramParcel.readLong();
        l2 = paramParcel.readLong();
        str1 = paramParcel.readString();
        l3 = paramParcel.readLong();
        str2 = paramParcel.readString();
        int k = paramParcel.readInt();
        localArrayList = new ArrayList(k);
        for (int m = 0; m < k; m++)
          localArrayList.add(GameBadgeEntity.CREATOR.zzda(paramParcel));
      }
      return new ExtendedGameEntity(2, localGameEntity, i, bool, j, l1, l2, str1, l3, str2, localArrayList, null);
    }
  }
}