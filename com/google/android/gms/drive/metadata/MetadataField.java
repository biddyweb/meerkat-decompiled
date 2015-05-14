package com.google.android.gms.drive.metadata;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public abstract interface MetadataField<T>
{
  public abstract String getName();

  public abstract T zza(Bundle paramBundle);

  public abstract T zza(DataHolder paramDataHolder, int paramInt1, int paramInt2);

  public abstract void zza(DataHolder paramDataHolder, MetadataBundle paramMetadataBundle, int paramInt1, int paramInt2);

  public abstract void zza(T paramT, Bundle paramBundle);
}