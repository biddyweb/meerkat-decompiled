package com.google.android.gms.games.snapshot;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.internal.zzlw;

public final class SnapshotMetadataEntity
  implements SafeParcelable, SnapshotMetadata
{
  public static final SnapshotMetadataEntityCreator CREATOR = new SnapshotMetadataEntityCreator();
  private final int zzFG;
  private final String zzSy;
  private final String zzZO;
  private final String zzaef;
  private final GameEntity zzahV;
  private final Uri zzakH;
  private final PlayerEntity zzakK;
  private final String zzakL;
  private final long zzakM;
  private final long zzakN;
  private final float zzakO;
  private final String zzakP;
  private final boolean zzakQ;
  private final long zzakR;

  SnapshotMetadataEntity(int paramInt, GameEntity paramGameEntity, PlayerEntity paramPlayerEntity, String paramString1, Uri paramUri, String paramString2, String paramString3, String paramString4, long paramLong1, long paramLong2, float paramFloat, String paramString5, boolean paramBoolean, long paramLong3)
  {
    this.zzFG = paramInt;
    this.zzahV = paramGameEntity;
    this.zzakK = paramPlayerEntity;
    this.zzaef = paramString1;
    this.zzakH = paramUri;
    this.zzakL = paramString2;
    this.zzakO = paramFloat;
    this.zzSy = paramString3;
    this.zzZO = paramString4;
    this.zzakM = paramLong1;
    this.zzakN = paramLong2;
    this.zzakP = paramString5;
    this.zzakQ = paramBoolean;
    this.zzakR = paramLong3;
  }

  public SnapshotMetadataEntity(SnapshotMetadata paramSnapshotMetadata)
  {
    this.zzFG = 5;
    this.zzahV = new GameEntity(paramSnapshotMetadata.getGame());
    this.zzakK = new PlayerEntity(paramSnapshotMetadata.getOwner());
    this.zzaef = paramSnapshotMetadata.getSnapshotId();
    this.zzakH = paramSnapshotMetadata.getCoverImageUri();
    this.zzakL = paramSnapshotMetadata.getCoverImageUrl();
    this.zzakO = paramSnapshotMetadata.getCoverImageAspectRatio();
    this.zzSy = paramSnapshotMetadata.getTitle();
    this.zzZO = paramSnapshotMetadata.getDescription();
    this.zzakM = paramSnapshotMetadata.getLastModifiedTimestamp();
    this.zzakN = paramSnapshotMetadata.getPlayedTime();
    this.zzakP = paramSnapshotMetadata.getUniqueName();
    this.zzakQ = paramSnapshotMetadata.hasChangePending();
    this.zzakR = paramSnapshotMetadata.getProgressValue();
  }

  static int zza(SnapshotMetadata paramSnapshotMetadata)
  {
    Object[] arrayOfObject = new Object[12];
    arrayOfObject[0] = paramSnapshotMetadata.getGame();
    arrayOfObject[1] = paramSnapshotMetadata.getOwner();
    arrayOfObject[2] = paramSnapshotMetadata.getSnapshotId();
    arrayOfObject[3] = paramSnapshotMetadata.getCoverImageUri();
    arrayOfObject[4] = Float.valueOf(paramSnapshotMetadata.getCoverImageAspectRatio());
    arrayOfObject[5] = paramSnapshotMetadata.getTitle();
    arrayOfObject[6] = paramSnapshotMetadata.getDescription();
    arrayOfObject[7] = Long.valueOf(paramSnapshotMetadata.getLastModifiedTimestamp());
    arrayOfObject[8] = Long.valueOf(paramSnapshotMetadata.getPlayedTime());
    arrayOfObject[9] = paramSnapshotMetadata.getUniqueName();
    arrayOfObject[10] = Boolean.valueOf(paramSnapshotMetadata.hasChangePending());
    arrayOfObject[11] = Long.valueOf(paramSnapshotMetadata.getProgressValue());
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(SnapshotMetadata paramSnapshotMetadata, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof SnapshotMetadata))
      bool = false;
    SnapshotMetadata localSnapshotMetadata;
    do
    {
      do
        return bool;
      while (paramSnapshotMetadata == paramObject);
      localSnapshotMetadata = (SnapshotMetadata)paramObject;
    }
    while ((zzw.equal(localSnapshotMetadata.getGame(), paramSnapshotMetadata.getGame())) && (zzw.equal(localSnapshotMetadata.getOwner(), paramSnapshotMetadata.getOwner())) && (zzw.equal(localSnapshotMetadata.getSnapshotId(), paramSnapshotMetadata.getSnapshotId())) && (zzw.equal(localSnapshotMetadata.getCoverImageUri(), paramSnapshotMetadata.getCoverImageUri())) && (zzw.equal(Float.valueOf(localSnapshotMetadata.getCoverImageAspectRatio()), Float.valueOf(paramSnapshotMetadata.getCoverImageAspectRatio()))) && (zzw.equal(localSnapshotMetadata.getTitle(), paramSnapshotMetadata.getTitle())) && (zzw.equal(localSnapshotMetadata.getDescription(), paramSnapshotMetadata.getDescription())) && (zzw.equal(Long.valueOf(localSnapshotMetadata.getLastModifiedTimestamp()), Long.valueOf(paramSnapshotMetadata.getLastModifiedTimestamp()))) && (zzw.equal(Long.valueOf(localSnapshotMetadata.getPlayedTime()), Long.valueOf(paramSnapshotMetadata.getPlayedTime()))) && (zzw.equal(localSnapshotMetadata.getUniqueName(), paramSnapshotMetadata.getUniqueName())) && (zzw.equal(Boolean.valueOf(localSnapshotMetadata.hasChangePending()), Boolean.valueOf(paramSnapshotMetadata.hasChangePending()))) && (zzw.equal(Long.valueOf(localSnapshotMetadata.getProgressValue()), Long.valueOf(paramSnapshotMetadata.getProgressValue()))));
    return false;
  }

  static String zzb(SnapshotMetadata paramSnapshotMetadata)
  {
    return zzw.zzk(paramSnapshotMetadata).zza("Game", paramSnapshotMetadata.getGame()).zza("Owner", paramSnapshotMetadata.getOwner()).zza("SnapshotId", paramSnapshotMetadata.getSnapshotId()).zza("CoverImageUri", paramSnapshotMetadata.getCoverImageUri()).zza("CoverImageUrl", paramSnapshotMetadata.getCoverImageUrl()).zza("CoverImageAspectRatio", Float.valueOf(paramSnapshotMetadata.getCoverImageAspectRatio())).zza("Description", paramSnapshotMetadata.getDescription()).zza("LastModifiedTimestamp", Long.valueOf(paramSnapshotMetadata.getLastModifiedTimestamp())).zza("PlayedTime", Long.valueOf(paramSnapshotMetadata.getPlayedTime())).zza("UniqueName", paramSnapshotMetadata.getUniqueName()).zza("ChangePending", Boolean.valueOf(paramSnapshotMetadata.hasChangePending())).zza("ProgressValue", Long.valueOf(paramSnapshotMetadata.getProgressValue())).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public SnapshotMetadata freeze()
  {
    return this;
  }

  public float getCoverImageAspectRatio()
  {
    return this.zzakO;
  }

  public Uri getCoverImageUri()
  {
    return this.zzakH;
  }

  public String getCoverImageUrl()
  {
    return this.zzakL;
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzZO, paramCharArrayBuffer);
  }

  public Game getGame()
  {
    return this.zzahV;
  }

  public long getLastModifiedTimestamp()
  {
    return this.zzakM;
  }

  public Player getOwner()
  {
    return this.zzakK;
  }

  public long getPlayedTime()
  {
    return this.zzakN;
  }

  public long getProgressValue()
  {
    return this.zzakR;
  }

  public String getSnapshotId()
  {
    return this.zzaef;
  }

  public String getTitle()
  {
    return this.zzSy;
  }

  public String getUniqueName()
  {
    return this.zzakP;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public boolean hasChangePending()
  {
    return this.zzakQ;
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
    SnapshotMetadataEntityCreator.zza(this, paramParcel, paramInt);
  }
}