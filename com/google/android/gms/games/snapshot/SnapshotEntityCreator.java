package com.google.android.gms.games.snapshot;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class SnapshotEntityCreator
  implements Parcelable.Creator<SnapshotEntity>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(SnapshotEntity paramSnapshotEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramSnapshotEntity.getMetadata(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramSnapshotEntity.getVersionCode());
    zzb.zza(paramParcel, 3, paramSnapshotEntity.getSnapshotContents(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public SnapshotEntity createFromParcel(Parcel paramParcel)
  {
    Object localObject1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Object localObject2 = null;
    if (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      Object localObject3;
      Object localObject4;
      int m;
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        localObject3 = localObject1;
        localObject4 = localObject2;
        m = j;
      case 1:
      case 1000:
      case 3:
      }
      while (true)
      {
        j = m;
        localObject2 = localObject4;
        localObject1 = localObject3;
        break;
        SnapshotMetadataEntity localSnapshotMetadataEntity = (SnapshotMetadataEntity)zza.zza(paramParcel, k, SnapshotMetadataEntity.CREATOR);
        m = j;
        localObject3 = localObject1;
        localObject4 = localSnapshotMetadataEntity;
        continue;
        int n = zza.zzg(paramParcel, k);
        Object localObject5 = localObject1;
        localObject4 = localObject2;
        m = n;
        localObject3 = localObject5;
        continue;
        localObject3 = (SnapshotContentsEntity)zza.zza(paramParcel, k, SnapshotContentsEntity.CREATOR);
        localObject4 = localObject2;
        m = j;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new SnapshotEntity(j, localObject2, localObject1);
  }

  public SnapshotEntity[] newArray(int paramInt)
  {
    return new SnapshotEntity[paramInt];
  }
}