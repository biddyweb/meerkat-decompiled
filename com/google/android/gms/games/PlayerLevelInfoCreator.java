package com.google.android.gms.games;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class PlayerLevelInfoCreator
  implements Parcelable.Creator<PlayerLevelInfo>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(PlayerLevelInfo paramPlayerLevelInfo, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramPlayerLevelInfo.getCurrentXpTotal());
    zzb.zzc(paramParcel, 1000, paramPlayerLevelInfo.getVersionCode());
    zzb.zza(paramParcel, 2, paramPlayerLevelInfo.getLastLevelUpTimestamp());
    zzb.zza(paramParcel, 3, paramPlayerLevelInfo.getCurrentLevel(), paramInt, false);
    zzb.zza(paramParcel, 4, paramPlayerLevelInfo.getNextLevel(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public PlayerLevelInfo createFromParcel(Parcel paramParcel)
  {
    long l1 = 0L;
    PlayerLevel localPlayerLevel1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    PlayerLevel localPlayerLevel2 = null;
    long l2 = l1;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        l2 = zza.zzi(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        l1 = zza.zzi(paramParcel, k);
        break;
      case 3:
        localPlayerLevel2 = (PlayerLevel)zza.zza(paramParcel, k, PlayerLevel.CREATOR);
        break;
      case 4:
        localPlayerLevel1 = (PlayerLevel)zza.zza(paramParcel, k, PlayerLevel.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new PlayerLevelInfo(j, l2, l1, localPlayerLevel2, localPlayerLevel1);
  }

  public PlayerLevelInfo[] newArray(int paramInt)
  {
    return new PlayerLevelInfo[paramInt];
  }
}