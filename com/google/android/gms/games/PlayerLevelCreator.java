package com.google.android.gms.games;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class PlayerLevelCreator
  implements Parcelable.Creator<PlayerLevel>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(PlayerLevel paramPlayerLevel, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramPlayerLevel.getLevelNumber());
    zzb.zzc(paramParcel, 1000, paramPlayerLevel.getVersionCode());
    zzb.zza(paramParcel, 2, paramPlayerLevel.getMinXp());
    zzb.zza(paramParcel, 3, paramPlayerLevel.getMaxXp());
    zzb.zzH(paramParcel, i);
  }

  public PlayerLevel createFromParcel(Parcel paramParcel)
  {
    long l1 = 0L;
    int i = 0;
    int j = zza.zzJ(paramParcel);
    long l2 = l1;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        i = zza.zzg(paramParcel, m);
        break;
      case 1000:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        l2 = zza.zzi(paramParcel, m);
        break;
      case 3:
        l1 = zza.zzi(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new PlayerLevel(k, i, l2, l1);
  }

  public PlayerLevel[] newArray(int paramInt)
  {
    return new PlayerLevel[paramInt];
  }
}