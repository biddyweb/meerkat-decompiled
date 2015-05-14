package com.google.android.gms.drive.internal;

import com.google.android.gms.drive.Metadata;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public final class zzm extends Metadata
{
  private final MetadataBundle zzTv;

  public zzm(MetadataBundle paramMetadataBundle)
  {
    this.zzTv = paramMetadataBundle;
  }

  public boolean isDataValid()
  {
    return this.zzTv != null;
  }

  public String toString()
  {
    return "Metadata [mImpl=" + this.zzTv + "]";
  }

  public <T> T zza(MetadataField<T> paramMetadataField)
  {
    return this.zzTv.zza(paramMetadataField);
  }

  public Metadata zzkw()
  {
    return new zzm(MetadataBundle.zza(this.zzTv));
  }
}