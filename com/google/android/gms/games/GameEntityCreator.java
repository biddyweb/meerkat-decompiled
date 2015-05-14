package com.google.android.gms.games;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class GameEntityCreator
  implements Parcelable.Creator<GameEntity>
{
  static void zza(GameEntity paramGameEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramGameEntity.getApplicationId(), false);
    zzb.zza(paramParcel, 2, paramGameEntity.getDisplayName(), false);
    zzb.zza(paramParcel, 3, paramGameEntity.getPrimaryCategory(), false);
    zzb.zza(paramParcel, 4, paramGameEntity.getSecondaryCategory(), false);
    zzb.zza(paramParcel, 5, paramGameEntity.getDescription(), false);
    zzb.zza(paramParcel, 6, paramGameEntity.getDeveloperName(), false);
    zzb.zza(paramParcel, 7, paramGameEntity.getIconImageUri(), paramInt, false);
    zzb.zza(paramParcel, 8, paramGameEntity.getHiResImageUri(), paramInt, false);
    zzb.zza(paramParcel, 9, paramGameEntity.getFeaturedImageUri(), paramInt, false);
    zzb.zza(paramParcel, 10, paramGameEntity.zzmx());
    zzb.zza(paramParcel, 11, paramGameEntity.zzmz());
    zzb.zza(paramParcel, 12, paramGameEntity.zzmA(), false);
    zzb.zzc(paramParcel, 13, paramGameEntity.zzmB());
    zzb.zzc(paramParcel, 14, paramGameEntity.getAchievementTotalCount());
    zzb.zzc(paramParcel, 15, paramGameEntity.getLeaderboardCount());
    zzb.zza(paramParcel, 17, paramGameEntity.isTurnBasedMultiplayerEnabled());
    zzb.zza(paramParcel, 16, paramGameEntity.isRealTimeMultiplayerEnabled());
    zzb.zzc(paramParcel, 1000, paramGameEntity.getVersionCode());
    zzb.zza(paramParcel, 19, paramGameEntity.getHiResImageUrl(), false);
    zzb.zza(paramParcel, 18, paramGameEntity.getIconImageUrl(), false);
    zzb.zza(paramParcel, 21, paramGameEntity.isMuted());
    zzb.zza(paramParcel, 20, paramGameEntity.getFeaturedImageUrl(), false);
    zzb.zza(paramParcel, 23, paramGameEntity.areSnapshotsEnabled());
    zzb.zza(paramParcel, 22, paramGameEntity.zzmy());
    zzb.zza(paramParcel, 25, paramGameEntity.hasGamepadSupport());
    zzb.zza(paramParcel, 24, paramGameEntity.getThemeColor(), false);
    zzb.zzH(paramParcel, i);
  }

  public GameEntity zzcP(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    String str6 = null;
    Uri localUri1 = null;
    Uri localUri2 = null;
    Uri localUri3 = null;
    boolean bool1 = false;
    boolean bool2 = false;
    String str7 = null;
    int k = 0;
    int m = 0;
    int n = 0;
    boolean bool3 = false;
    boolean bool4 = false;
    String str8 = null;
    String str9 = null;
    String str10 = null;
    boolean bool5 = false;
    boolean bool6 = false;
    boolean bool7 = false;
    String str11 = null;
    boolean bool8 = false;
    while (paramParcel.dataPosition() < i)
    {
      int i1 = zza.zzI(paramParcel);
      switch (zza.zzaP(i1))
      {
      default:
        zza.zzb(paramParcel, i1);
        break;
      case 1:
        str1 = zza.zzo(paramParcel, i1);
        break;
      case 2:
        str2 = zza.zzo(paramParcel, i1);
        break;
      case 3:
        str3 = zza.zzo(paramParcel, i1);
        break;
      case 4:
        str4 = zza.zzo(paramParcel, i1);
        break;
      case 5:
        str5 = zza.zzo(paramParcel, i1);
        break;
      case 6:
        str6 = zza.zzo(paramParcel, i1);
        break;
      case 7:
        localUri1 = (Uri)zza.zza(paramParcel, i1, Uri.CREATOR);
        break;
      case 8:
        localUri2 = (Uri)zza.zza(paramParcel, i1, Uri.CREATOR);
        break;
      case 9:
        localUri3 = (Uri)zza.zza(paramParcel, i1, Uri.CREATOR);
        break;
      case 10:
        bool1 = zza.zzc(paramParcel, i1);
        break;
      case 11:
        bool2 = zza.zzc(paramParcel, i1);
        break;
      case 12:
        str7 = zza.zzo(paramParcel, i1);
        break;
      case 13:
        k = zza.zzg(paramParcel, i1);
        break;
      case 14:
        m = zza.zzg(paramParcel, i1);
        break;
      case 15:
        n = zza.zzg(paramParcel, i1);
        break;
      case 17:
        bool4 = zza.zzc(paramParcel, i1);
        break;
      case 16:
        bool3 = zza.zzc(paramParcel, i1);
        break;
      case 1000:
        j = zza.zzg(paramParcel, i1);
        break;
      case 19:
        str9 = zza.zzo(paramParcel, i1);
        break;
      case 18:
        str8 = zza.zzo(paramParcel, i1);
        break;
      case 21:
        bool5 = zza.zzc(paramParcel, i1);
        break;
      case 20:
        str10 = zza.zzo(paramParcel, i1);
        break;
      case 23:
        bool7 = zza.zzc(paramParcel, i1);
        break;
      case 22:
        bool6 = zza.zzc(paramParcel, i1);
        break;
      case 25:
        bool8 = zza.zzc(paramParcel, i1);
        break;
      case 24:
        str11 = zza.zzo(paramParcel, i1);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new GameEntity(j, str1, str2, str3, str4, str5, str6, localUri1, localUri2, localUri3, bool1, bool2, str7, k, m, n, bool3, bool4, str8, str9, str10, bool5, bool6, bool7, str11, bool8);
  }

  public GameEntity[] zzeo(int paramInt)
  {
    return new GameEntity[paramInt];
  }
}