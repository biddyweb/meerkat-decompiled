package com.google.android.gms.games.internal.game;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class GameBadgeEntityCreator
  implements Parcelable.Creator<GameBadgeEntity>
{
  static void zza(GameBadgeEntity paramGameBadgeEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramGameBadgeEntity.getType());
    zzb.zzc(paramParcel, 1000, paramGameBadgeEntity.getVersionCode());
    zzb.zza(paramParcel, 2, paramGameBadgeEntity.getTitle(), false);
    zzb.zza(paramParcel, 3, paramGameBadgeEntity.getDescription(), false);
    zzb.zza(paramParcel, 4, paramGameBadgeEntity.getIconImageUri(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public GameBadgeEntity zzda(Parcel paramParcel)
  {
    int i = 0;
    Uri localUri = null;
    int j = zza.zzJ(paramParcel);
    String str1 = null;
    String str2 = null;
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
        str2 = zza.zzo(paramParcel, m);
        break;
      case 3:
        str1 = zza.zzo(paramParcel, m);
        break;
      case 4:
        localUri = (Uri)zza.zza(paramParcel, m, Uri.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new GameBadgeEntity(k, i, str2, str1, localUri);
  }

  public GameBadgeEntity[] zzeN(int paramInt)
  {
    return new GameBadgeEntity[paramInt];
  }
}