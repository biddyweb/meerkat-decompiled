package com.google.android.gms.games.snapshot;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class SnapshotMetadataChangeCreator
  implements Parcelable.Creator<SnapshotMetadataChangeEntity>
{
  static void zza(SnapshotMetadataChangeEntity paramSnapshotMetadataChangeEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramSnapshotMetadataChangeEntity.getDescription(), false);
    zzb.zzc(paramParcel, 1000, paramSnapshotMetadataChangeEntity.getVersionCode());
    zzb.zza(paramParcel, 2, paramSnapshotMetadataChangeEntity.getPlayedTimeMillis(), false);
    zzb.zza(paramParcel, 4, paramSnapshotMetadataChangeEntity.getCoverImageUri(), paramInt, false);
    zzb.zza(paramParcel, 5, paramSnapshotMetadataChangeEntity.zzpc(), paramInt, false);
    zzb.zza(paramParcel, 6, paramSnapshotMetadataChangeEntity.getProgressValue(), false);
    zzb.zzH(paramParcel, i);
  }

  public SnapshotMetadataChangeEntity zzdj(Parcel paramParcel)
  {
    Long localLong1 = null;
    int i = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    int j = 0;
    Uri localUri = null;
    com.google.android.gms.common.data.zza localzza = null;
    Long localLong2 = null;
    String str = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = com.google.android.gms.common.internal.safeparcel.zza.zzI(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzaP(k))
      {
      default:
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, k);
        break;
      case 1:
        str = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 1000:
        j = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, k);
        break;
      case 2:
        localLong2 = com.google.android.gms.common.internal.safeparcel.zza.zzj(paramParcel, k);
        break;
      case 4:
        localUri = (Uri)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, k, Uri.CREATOR);
        break;
      case 5:
        localzza = (com.google.android.gms.common.data.zza)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, k, com.google.android.gms.common.data.zza.CREATOR);
        break;
      case 6:
        localLong1 = com.google.android.gms.common.internal.safeparcel.zza.zzj(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new SnapshotMetadataChangeEntity(j, str, localLong2, localzza, localUri, localLong1);
  }

  public SnapshotMetadataChangeEntity[] zzfb(int paramInt)
  {
    return new SnapshotMetadataChangeEntity[paramInt];
  }
}