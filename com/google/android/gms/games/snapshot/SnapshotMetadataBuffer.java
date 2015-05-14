package com.google.android.gms.games.snapshot;

import com.google.android.gms.common.data.AbstractDataBuffer;
import com.google.android.gms.common.data.DataHolder;

public final class SnapshotMetadataBuffer extends AbstractDataBuffer<SnapshotMetadata>
{
  public SnapshotMetadataBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  public SnapshotMetadata get(int paramInt)
  {
    return new SnapshotMetadataRef(this.zzMd, paramInt);
  }
}