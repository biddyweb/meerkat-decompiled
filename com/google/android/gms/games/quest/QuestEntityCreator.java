package com.google.android.gms.games.quest;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.games.GameEntity;
import java.util.ArrayList;

public class QuestEntityCreator
  implements Parcelable.Creator<QuestEntity>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(QuestEntity paramQuestEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramQuestEntity.getGame(), paramInt, false);
    zzb.zza(paramParcel, 2, paramQuestEntity.getQuestId(), false);
    zzb.zza(paramParcel, 3, paramQuestEntity.getAcceptedTimestamp());
    zzb.zza(paramParcel, 4, paramQuestEntity.getBannerImageUri(), paramInt, false);
    zzb.zza(paramParcel, 5, paramQuestEntity.getBannerImageUrl(), false);
    zzb.zza(paramParcel, 6, paramQuestEntity.getDescription(), false);
    zzb.zza(paramParcel, 7, paramQuestEntity.getEndTimestamp());
    zzb.zza(paramParcel, 8, paramQuestEntity.getLastUpdatedTimestamp());
    zzb.zza(paramParcel, 9, paramQuestEntity.getIconImageUri(), paramInt, false);
    zzb.zza(paramParcel, 10, paramQuestEntity.getIconImageUrl(), false);
    zzb.zza(paramParcel, 12, paramQuestEntity.getName(), false);
    zzb.zza(paramParcel, 13, paramQuestEntity.zzpa());
    zzb.zza(paramParcel, 14, paramQuestEntity.getStartTimestamp());
    zzb.zzc(paramParcel, 15, paramQuestEntity.getState());
    zzb.zzc(paramParcel, 17, paramQuestEntity.zzoZ(), false);
    zzb.zzc(paramParcel, 16, paramQuestEntity.getType());
    zzb.zzc(paramParcel, 1000, paramQuestEntity.getVersionCode());
    zzb.zzH(paramParcel, i);
  }

  public QuestEntity createFromParcel(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    GameEntity localGameEntity = null;
    String str1 = null;
    long l1 = 0L;
    Uri localUri1 = null;
    String str2 = null;
    String str3 = null;
    long l2 = 0L;
    long l3 = 0L;
    Uri localUri2 = null;
    String str4 = null;
    String str5 = null;
    long l4 = 0L;
    long l5 = 0L;
    int k = 0;
    int m = 0;
    ArrayList localArrayList = null;
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
      case 2:
        str1 = zza.zzo(paramParcel, n);
        break;
      case 3:
        l1 = zza.zzi(paramParcel, n);
        break;
      case 4:
        localUri1 = (Uri)zza.zza(paramParcel, n, Uri.CREATOR);
        break;
      case 5:
        str2 = zza.zzo(paramParcel, n);
        break;
      case 6:
        str3 = zza.zzo(paramParcel, n);
        break;
      case 7:
        l2 = zza.zzi(paramParcel, n);
        break;
      case 8:
        l3 = zza.zzi(paramParcel, n);
        break;
      case 9:
        localUri2 = (Uri)zza.zza(paramParcel, n, Uri.CREATOR);
        break;
      case 10:
        str4 = zza.zzo(paramParcel, n);
        break;
      case 12:
        str5 = zza.zzo(paramParcel, n);
        break;
      case 13:
        l4 = zza.zzi(paramParcel, n);
        break;
      case 14:
        l5 = zza.zzi(paramParcel, n);
        break;
      case 15:
        k = zza.zzg(paramParcel, n);
        break;
      case 17:
        localArrayList = zza.zzc(paramParcel, n, MilestoneEntity.CREATOR);
        break;
      case 16:
        m = zza.zzg(paramParcel, n);
        break;
      case 1000:
        j = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new QuestEntity(j, localGameEntity, str1, l1, localUri1, str2, str3, l2, l3, localUri2, str4, str5, l4, l5, k, m, localArrayList);
  }

  public QuestEntity[] newArray(int paramInt)
  {
    return new QuestEntity[paramInt];
  }
}