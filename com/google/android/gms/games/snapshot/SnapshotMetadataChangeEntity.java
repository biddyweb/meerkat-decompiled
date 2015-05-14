package com.google.android.gms.games.snapshot;

import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.data.zza;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public final class SnapshotMetadataChangeEntity extends SnapshotMetadataChange
  implements SafeParcelable
{
  public static final SnapshotMetadataChangeCreator CREATOR = new SnapshotMetadataChangeCreator();
  private final int zzFG;
  private final String zzZO;
  private final Long zzakF;
  private final Uri zzakH;
  private final Long zzakI;
  private zza zzakJ;

  SnapshotMetadataChangeEntity()
  {
    this(5, null, null, null, null, null);
  }

  SnapshotMetadataChangeEntity(int paramInt, String paramString, Long paramLong1, zza paramzza, Uri paramUri, Long paramLong2)
  {
    this.zzFG = paramInt;
    this.zzZO = paramString;
    this.zzakI = paramLong1;
    this.zzakJ = paramzza;
    this.zzakH = paramUri;
    this.zzakF = paramLong2;
    if (this.zzakJ != null)
      if (this.zzakH == null)
        zzx.zza(bool, "Cannot set both a URI and an image");
    while (this.zzakH == null)
      while (true)
      {
        return;
        bool = false;
      }
    if (this.zzakJ == null);
    while (true)
    {
      zzx.zza(bool, "Cannot set both a URI and an image");
      return;
      bool = false;
    }
  }

  SnapshotMetadataChangeEntity(String paramString, Long paramLong1, zza paramzza, Uri paramUri, Long paramLong2)
  {
    this(5, paramString, paramLong1, paramzza, paramUri, paramLong2);
  }

  public int describeContents()
  {
    return 0;
  }

  public Bitmap getCoverImage()
  {
    if (this.zzakJ == null)
      return null;
    return this.zzakJ.zziv();
  }

  public Uri getCoverImageUri()
  {
    return this.zzakH;
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public Long getPlayedTimeMillis()
  {
    return this.zzakI;
  }

  public Long getProgressValue()
  {
    return this.zzakF;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    SnapshotMetadataChangeCreator.zza(this, paramParcel, paramInt);
  }

  public zza zzpc()
  {
    return this.zzakJ;
  }
}