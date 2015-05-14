package com.google.android.gms.games.snapshot;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.Contents;

public class SnapshotContentsEntityCreator
  implements Parcelable.Creator<SnapshotContentsEntity>
{
  static void zza(SnapshotContentsEntity paramSnapshotContentsEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramSnapshotContentsEntity.zzkq(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramSnapshotContentsEntity.getVersionCode());
    zzb.zzH(paramParcel, i);
  }

  public SnapshotContentsEntity zzdi(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Contents localContents = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localContents = (Contents)zza.zza(paramParcel, k, Contents.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new SnapshotContentsEntity(j, localContents);
  }

  public SnapshotContentsEntity[] zzfa(int paramInt)
  {
    return new SnapshotContentsEntity[paramInt];
  }
}