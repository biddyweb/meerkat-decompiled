package com.google.android.gms.games.snapshot;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.PlayerEntity;

public class SnapshotMetadataEntityCreator
  implements Parcelable.Creator<SnapshotMetadataEntity>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(SnapshotMetadataEntity paramSnapshotMetadataEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramSnapshotMetadataEntity.getGame(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramSnapshotMetadataEntity.getVersionCode());
    zzb.zza(paramParcel, 2, paramSnapshotMetadataEntity.getOwner(), paramInt, false);
    zzb.zza(paramParcel, 3, paramSnapshotMetadataEntity.getSnapshotId(), false);
    zzb.zza(paramParcel, 5, paramSnapshotMetadataEntity.getCoverImageUri(), paramInt, false);
    zzb.zza(paramParcel, 6, paramSnapshotMetadataEntity.getCoverImageUrl(), false);
    zzb.zza(paramParcel, 7, paramSnapshotMetadataEntity.getTitle(), false);
    zzb.zza(paramParcel, 8, paramSnapshotMetadataEntity.getDescription(), false);
    zzb.zza(paramParcel, 9, paramSnapshotMetadataEntity.getLastModifiedTimestamp());
    zzb.zza(paramParcel, 10, paramSnapshotMetadataEntity.getPlayedTime());
    zzb.zza(paramParcel, 11, paramSnapshotMetadataEntity.getCoverImageAspectRatio());
    zzb.zza(paramParcel, 12, paramSnapshotMetadataEntity.getUniqueName(), false);
    zzb.zza(paramParcel, 13, paramSnapshotMetadataEntity.hasChangePending());
    zzb.zza(paramParcel, 14, paramSnapshotMetadataEntity.getProgressValue());
    zzb.zzH(paramParcel, i);
  }

  public SnapshotMetadataEntity createFromParcel(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    GameEntity localGameEntity = null;
    PlayerEntity localPlayerEntity = null;
    String str1 = null;
    Uri localUri = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    long l1 = 0L;
    long l2 = 0L;
    float f = 0.0F;
    String str5 = null;
    boolean bool = false;
    long l3 = 0L;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localGameEntity = (GameEntity)zza.zza(paramParcel, k, GameEntity.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localPlayerEntity = (PlayerEntity)zza.zza(paramParcel, k, PlayerEntity.CREATOR);
        break;
      case 3:
        str1 = zza.zzo(paramParcel, k);
        break;
      case 5:
        localUri = (Uri)zza.zza(paramParcel, k, Uri.CREATOR);
        break;
      case 6:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 7:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 8:
        str4 = zza.zzo(paramParcel, k);
        break;
      case 9:
        l1 = zza.zzi(paramParcel, k);
        break;
      case 10:
        l2 = zza.zzi(paramParcel, k);
        break;
      case 11:
        f = zza.zzl(paramParcel, k);
        break;
      case 12:
        str5 = zza.zzo(paramParcel, k);
        break;
      case 13:
        bool = zza.zzc(paramParcel, k);
        break;
      case 14:
        l3 = zza.zzi(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new SnapshotMetadataEntity(j, localGameEntity, localPlayerEntity, str1, localUri, str2, str3, str4, l1, l2, f, str5, bool, l3);
  }

  public SnapshotMetadataEntity[] newArray(int paramInt)
  {
    return new SnapshotMetadataEntity[paramInt];
  }
}