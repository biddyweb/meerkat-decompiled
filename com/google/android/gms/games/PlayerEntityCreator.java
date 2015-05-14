package com.google.android.gms.games;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.games.internal.player.MostRecentGameInfoEntity;

public class PlayerEntityCreator
  implements Parcelable.Creator<PlayerEntity>
{
  static void zza(PlayerEntity paramPlayerEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramPlayerEntity.getPlayerId(), false);
    zzb.zza(paramParcel, 2, paramPlayerEntity.getDisplayName(), false);
    zzb.zza(paramParcel, 3, paramPlayerEntity.getIconImageUri(), paramInt, false);
    zzb.zza(paramParcel, 4, paramPlayerEntity.getHiResImageUri(), paramInt, false);
    zzb.zza(paramParcel, 5, paramPlayerEntity.getRetrievedTimestamp());
    zzb.zzc(paramParcel, 6, paramPlayerEntity.zzmE());
    zzb.zza(paramParcel, 7, paramPlayerEntity.getLastPlayedWithTimestamp());
    zzb.zza(paramParcel, 8, paramPlayerEntity.getIconImageUrl(), false);
    zzb.zza(paramParcel, 9, paramPlayerEntity.getHiResImageUrl(), false);
    zzb.zza(paramParcel, 14, paramPlayerEntity.getTitle(), false);
    zzb.zza(paramParcel, 15, paramPlayerEntity.zzmF(), paramInt, false);
    zzb.zza(paramParcel, 16, paramPlayerEntity.getLevelInfo(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramPlayerEntity.getVersionCode());
    zzb.zza(paramParcel, 19, paramPlayerEntity.zzmD());
    zzb.zza(paramParcel, 18, paramPlayerEntity.isProfileVisible());
    zzb.zzH(paramParcel, i);
  }

  public PlayerEntity zzcQ(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    Uri localUri1 = null;
    Uri localUri2 = null;
    long l1 = 0L;
    int k = 0;
    long l2 = 0L;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    MostRecentGameInfoEntity localMostRecentGameInfoEntity = null;
    PlayerLevelInfo localPlayerLevelInfo = null;
    boolean bool1 = false;
    boolean bool2 = false;
    while (paramParcel.dataPosition() < i)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        str1 = zza.zzo(paramParcel, m);
        break;
      case 2:
        str2 = zza.zzo(paramParcel, m);
        break;
      case 3:
        localUri1 = (Uri)zza.zza(paramParcel, m, Uri.CREATOR);
        break;
      case 4:
        localUri2 = (Uri)zza.zza(paramParcel, m, Uri.CREATOR);
        break;
      case 5:
        l1 = zza.zzi(paramParcel, m);
        break;
      case 6:
        k = zza.zzg(paramParcel, m);
        break;
      case 7:
        l2 = zza.zzi(paramParcel, m);
        break;
      case 8:
        str3 = zza.zzo(paramParcel, m);
        break;
      case 9:
        str4 = zza.zzo(paramParcel, m);
        break;
      case 14:
        str5 = zza.zzo(paramParcel, m);
        break;
      case 15:
        localMostRecentGameInfoEntity = (MostRecentGameInfoEntity)zza.zza(paramParcel, m, MostRecentGameInfoEntity.CREATOR);
        break;
      case 16:
        localPlayerLevelInfo = (PlayerLevelInfo)zza.zza(paramParcel, m, PlayerLevelInfo.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, m);
        break;
      case 19:
        bool2 = zza.zzc(paramParcel, m);
        break;
      case 18:
        bool1 = zza.zzc(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new PlayerEntity(j, str1, str2, localUri1, localUri2, l1, k, l2, str3, str4, str5, localMostRecentGameInfoEntity, localPlayerLevelInfo, bool1, bool2);
  }

  public PlayerEntity[] zzeq(int paramInt)
  {
    return new PlayerEntity[paramInt];
  }
}