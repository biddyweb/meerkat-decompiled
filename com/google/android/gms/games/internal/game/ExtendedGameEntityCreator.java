package com.google.android.gms.games.internal.game;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.snapshot.SnapshotMetadataEntity;
import java.util.ArrayList;

public class ExtendedGameEntityCreator
  implements Parcelable.Creator<ExtendedGameEntity>
{
  static void zza(ExtendedGameEntity paramExtendedGameEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramExtendedGameEntity.zzor(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramExtendedGameEntity.getVersionCode());
    zzb.zzc(paramParcel, 2, paramExtendedGameEntity.zzoi());
    zzb.zza(paramParcel, 3, paramExtendedGameEntity.zzoj());
    zzb.zzc(paramParcel, 4, paramExtendedGameEntity.zzok());
    zzb.zza(paramParcel, 5, paramExtendedGameEntity.zzol());
    zzb.zza(paramParcel, 6, paramExtendedGameEntity.zzom());
    zzb.zza(paramParcel, 7, paramExtendedGameEntity.zzon(), false);
    zzb.zza(paramParcel, 8, paramExtendedGameEntity.zzoo());
    zzb.zza(paramParcel, 9, paramExtendedGameEntity.zzop(), false);
    zzb.zzc(paramParcel, 10, paramExtendedGameEntity.zzoh(), false);
    zzb.zza(paramParcel, 11, paramExtendedGameEntity.zzoq(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public ExtendedGameEntity zzcZ(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    GameEntity localGameEntity = null;
    int k = 0;
    boolean bool = false;
    int m = 0;
    long l1 = 0L;
    long l2 = 0L;
    String str1 = null;
    long l3 = 0L;
    String str2 = null;
    ArrayList localArrayList = null;
    SnapshotMetadataEntity localSnapshotMetadataEntity = null;
    while (paramParcel.dataPosition() < i)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        localGameEntity = (GameEntity)zza.zza(paramParcel, n, GameEntity.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, n);
        break;
      case 2:
        k = zza.zzg(paramParcel, n);
        break;
      case 3:
        bool = zza.zzc(paramParcel, n);
        break;
      case 4:
        m = zza.zzg(paramParcel, n);
        break;
      case 5:
        l1 = zza.zzi(paramParcel, n);
        break;
      case 6:
        l2 = zza.zzi(paramParcel, n);
        break;
      case 7:
        str1 = zza.zzo(paramParcel, n);
        break;
      case 8:
        l3 = zza.zzi(paramParcel, n);
        break;
      case 9:
        str2 = zza.zzo(paramParcel, n);
        break;
      case 10:
        localArrayList = zza.zzc(paramParcel, n, GameBadgeEntity.CREATOR);
        break;
      case 11:
        localSnapshotMetadataEntity = (SnapshotMetadataEntity)zza.zza(paramParcel, n, SnapshotMetadataEntity.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new ExtendedGameEntity(j, localGameEntity, k, bool, m, l1, l2, str1, l3, str2, localArrayList, localSnapshotMetadataEntity);
  }

  public ExtendedGameEntity[] zzeL(int paramInt)
  {
    return new ExtendedGameEntity[paramInt];
  }
}