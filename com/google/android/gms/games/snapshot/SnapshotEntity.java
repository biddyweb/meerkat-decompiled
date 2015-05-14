package com.google.android.gms.games.snapshot;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public final class SnapshotEntity
  implements SafeParcelable, Snapshot
{
  public static final SnapshotEntityCreator CREATOR = new SnapshotEntityCreator();
  private final int zzFG;
  private final SnapshotMetadataEntity zzakC;
  private final SnapshotContentsEntity zzakD;

  SnapshotEntity(int paramInt, SnapshotMetadata paramSnapshotMetadata, SnapshotContentsEntity paramSnapshotContentsEntity)
  {
    this.zzFG = paramInt;
    this.zzakC = new SnapshotMetadataEntity(paramSnapshotMetadata);
    this.zzakD = paramSnapshotContentsEntity;
  }

  public SnapshotEntity(SnapshotMetadata paramSnapshotMetadata, SnapshotContentsEntity paramSnapshotContentsEntity)
  {
    this(2, paramSnapshotMetadata, paramSnapshotContentsEntity);
  }

  private boolean isClosed()
  {
    return this.zzakD.isClosed();
  }

  static boolean zza(Snapshot paramSnapshot, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Snapshot))
      bool = false;
    Snapshot localSnapshot;
    do
    {
      do
        return bool;
      while (paramSnapshot == paramObject);
      localSnapshot = (Snapshot)paramObject;
    }
    while ((zzw.equal(localSnapshot.getMetadata(), paramSnapshot.getMetadata())) && (zzw.equal(localSnapshot.getSnapshotContents(), paramSnapshot.getSnapshotContents())));
    return false;
  }

  static int zzb(Snapshot paramSnapshot)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = paramSnapshot.getMetadata();
    arrayOfObject[1] = paramSnapshot.getSnapshotContents();
    return zzw.hashCode(arrayOfObject);
  }

  static String zzc(Snapshot paramSnapshot)
  {
    zzw.zza localzza = zzw.zzk(paramSnapshot).zza("Metadata", paramSnapshot.getMetadata());
    if (paramSnapshot.getSnapshotContents() != null);
    for (boolean bool = true; ; bool = false)
      return localzza.zza("HasContents", Boolean.valueOf(bool)).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public Snapshot freeze()
  {
    return this;
  }

  public SnapshotMetadata getMetadata()
  {
    return this.zzakC;
  }

  public SnapshotContents getSnapshotContents()
  {
    if (isClosed())
      return null;
    return this.zzakD;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    return zzb(this);
  }

  public boolean isDataValid()
  {
    return true;
  }

  public String toString()
  {
    return zzc(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    SnapshotEntityCreator.zza(this, paramParcel, paramInt);
  }
}