package com.google.android.gms.games.snapshot;

import android.graphics.Bitmap;
import android.net.Uri;
import com.google.android.gms.common.data.zza;

public abstract class SnapshotMetadataChange
{
  public static final SnapshotMetadataChange EMPTY_CHANGE = new SnapshotMetadataChangeEntity();

  public abstract Bitmap getCoverImage();

  public abstract String getDescription();

  public abstract Long getPlayedTimeMillis();

  public abstract Long getProgressValue();

  public abstract zza zzpc();

  public static final class Builder
  {
    private String zzZO;
    private Long zzakE;
    private Long zzakF;
    private zza zzakG;
    private Uri zzakH;

    public SnapshotMetadataChange build()
    {
      return new SnapshotMetadataChangeEntity(this.zzZO, this.zzakE, this.zzakG, this.zzakH, this.zzakF);
    }

    public Builder fromMetadata(SnapshotMetadata paramSnapshotMetadata)
    {
      this.zzZO = paramSnapshotMetadata.getDescription();
      this.zzakE = Long.valueOf(paramSnapshotMetadata.getPlayedTime());
      this.zzakF = Long.valueOf(paramSnapshotMetadata.getProgressValue());
      if (this.zzakE.longValue() == -1L)
        this.zzakE = null;
      this.zzakH = paramSnapshotMetadata.getCoverImageUri();
      if (this.zzakH != null)
        this.zzakG = null;
      return this;
    }

    public Builder setCoverImage(Bitmap paramBitmap)
    {
      this.zzakG = new zza(paramBitmap);
      this.zzakH = null;
      return this;
    }

    public Builder setDescription(String paramString)
    {
      this.zzZO = paramString;
      return this;
    }

    public Builder setPlayedTimeMillis(long paramLong)
    {
      this.zzakE = Long.valueOf(paramLong);
      return this;
    }

    public Builder setProgressValue(long paramLong)
    {
      this.zzakF = Long.valueOf(paramLong);
      return this;
    }
  }
}