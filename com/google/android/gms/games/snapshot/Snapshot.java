package com.google.android.gms.games.snapshot;

import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;

public abstract interface Snapshot extends Parcelable, Freezable<Snapshot>
{
  public abstract SnapshotMetadata getMetadata();

  public abstract SnapshotContents getSnapshotContents();
}