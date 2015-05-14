package com.google.android.gms.games.achievement;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.games.PlayerEntity;

public class AchievementEntityCreator
  implements Parcelable.Creator<AchievementEntity>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(AchievementEntity paramAchievementEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramAchievementEntity.getAchievementId(), false);
    zzb.zzc(paramParcel, 2, paramAchievementEntity.getType());
    zzb.zza(paramParcel, 3, paramAchievementEntity.getName(), false);
    zzb.zza(paramParcel, 4, paramAchievementEntity.getDescription(), false);
    zzb.zza(paramParcel, 5, paramAchievementEntity.getUnlockedImageUri(), paramInt, false);
    zzb.zza(paramParcel, 6, paramAchievementEntity.getUnlockedImageUrl(), false);
    zzb.zza(paramParcel, 7, paramAchievementEntity.getRevealedImageUri(), paramInt, false);
    zzb.zza(paramParcel, 8, paramAchievementEntity.getRevealedImageUrl(), false);
    zzb.zzc(paramParcel, 9, paramAchievementEntity.getTotalSteps());
    zzb.zza(paramParcel, 10, paramAchievementEntity.getFormattedTotalSteps(), false);
    zzb.zza(paramParcel, 11, paramAchievementEntity.getPlayer(), paramInt, false);
    zzb.zzc(paramParcel, 12, paramAchievementEntity.getState());
    zzb.zzc(paramParcel, 13, paramAchievementEntity.getCurrentSteps());
    zzb.zza(paramParcel, 14, paramAchievementEntity.getFormattedCurrentSteps(), false);
    zzb.zza(paramParcel, 15, paramAchievementEntity.getLastUpdatedTimestamp());
    zzb.zza(paramParcel, 16, paramAchievementEntity.getXpValue());
    zzb.zzc(paramParcel, 1000, paramAchievementEntity.getVersionCode());
    zzb.zzH(paramParcel, i);
  }

  public AchievementEntity createFromParcel(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    int k = 0;
    String str2 = null;
    String str3 = null;
    Uri localUri1 = null;
    String str4 = null;
    Uri localUri2 = null;
    String str5 = null;
    int m = 0;
    String str6 = null;
    PlayerEntity localPlayerEntity = null;
    int n = 0;
    int i1 = 0;
    String str7 = null;
    long l1 = 0L;
    long l2 = 0L;
    while (paramParcel.dataPosition() < i)
    {
      int i2 = zza.zzI(paramParcel);
      switch (zza.zzaP(i2))
      {
      default:
        zza.zzb(paramParcel, i2);
        break;
      case 1:
        str1 = zza.zzo(paramParcel, i2);
        break;
      case 2:
        k = zza.zzg(paramParcel, i2);
        break;
      case 3:
        str2 = zza.zzo(paramParcel, i2);
        break;
      case 4:
        str3 = zza.zzo(paramParcel, i2);
        break;
      case 5:
        localUri1 = (Uri)zza.zza(paramParcel, i2, Uri.CREATOR);
        break;
      case 6:
        str4 = zza.zzo(paramParcel, i2);
        break;
      case 7:
        localUri2 = (Uri)zza.zza(paramParcel, i2, Uri.CREATOR);
        break;
      case 8:
        str5 = zza.zzo(paramParcel, i2);
        break;
      case 9:
        m = zza.zzg(paramParcel, i2);
        break;
      case 10:
        str6 = zza.zzo(paramParcel, i2);
        break;
      case 11:
        localPlayerEntity = (PlayerEntity)zza.zza(paramParcel, i2, PlayerEntity.CREATOR);
        break;
      case 12:
        n = zza.zzg(paramParcel, i2);
        break;
      case 13:
        i1 = zza.zzg(paramParcel, i2);
        break;
      case 14:
        str7 = zza.zzo(paramParcel, i2);
        break;
      case 15:
        l1 = zza.zzi(paramParcel, i2);
        break;
      case 16:
        l2 = zza.zzi(paramParcel, i2);
        break;
      case 1000:
        j = zza.zzg(paramParcel, i2);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new AchievementEntity(j, str1, k, str2, str3, localUri1, str4, localUri2, str5, m, str6, localPlayerEntity, n, i1, str7, l1, l2);
  }

  public AchievementEntity[] newArray(int paramInt)
  {
    return new AchievementEntity[paramInt];
  }
}