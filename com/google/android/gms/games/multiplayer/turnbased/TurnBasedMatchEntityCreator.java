package com.google.android.gms.games.multiplayer.turnbased;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.multiplayer.ParticipantEntity;
import java.util.ArrayList;

public class TurnBasedMatchEntityCreator
  implements Parcelable.Creator<TurnBasedMatchEntity>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(TurnBasedMatchEntity paramTurnBasedMatchEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramTurnBasedMatchEntity.getGame(), paramInt, false);
    zzb.zza(paramParcel, 2, paramTurnBasedMatchEntity.getMatchId(), false);
    zzb.zza(paramParcel, 3, paramTurnBasedMatchEntity.getCreatorId(), false);
    zzb.zza(paramParcel, 4, paramTurnBasedMatchEntity.getCreationTimestamp());
    zzb.zza(paramParcel, 5, paramTurnBasedMatchEntity.getLastUpdaterId(), false);
    zzb.zza(paramParcel, 6, paramTurnBasedMatchEntity.getLastUpdatedTimestamp());
    zzb.zza(paramParcel, 7, paramTurnBasedMatchEntity.getPendingParticipantId(), false);
    zzb.zzc(paramParcel, 8, paramTurnBasedMatchEntity.getStatus());
    zzb.zzc(paramParcel, 10, paramTurnBasedMatchEntity.getVariant());
    zzb.zzc(paramParcel, 11, paramTurnBasedMatchEntity.getVersion());
    zzb.zza(paramParcel, 12, paramTurnBasedMatchEntity.getData(), false);
    zzb.zzc(paramParcel, 13, paramTurnBasedMatchEntity.getParticipants(), false);
    zzb.zza(paramParcel, 14, paramTurnBasedMatchEntity.getRematchId(), false);
    zzb.zza(paramParcel, 15, paramTurnBasedMatchEntity.getPreviousMatchData(), false);
    zzb.zza(paramParcel, 17, paramTurnBasedMatchEntity.getAutoMatchCriteria(), false);
    zzb.zzc(paramParcel, 16, paramTurnBasedMatchEntity.getMatchNumber());
    zzb.zzc(paramParcel, 1000, paramTurnBasedMatchEntity.getVersionCode());
    zzb.zza(paramParcel, 19, paramTurnBasedMatchEntity.isLocallyModified());
    zzb.zzc(paramParcel, 18, paramTurnBasedMatchEntity.getTurnStatus());
    zzb.zza(paramParcel, 21, paramTurnBasedMatchEntity.getDescriptionParticipantId(), false);
    zzb.zza(paramParcel, 20, paramTurnBasedMatchEntity.getDescription(), false);
    zzb.zzH(paramParcel, i);
  }

  public TurnBasedMatchEntity createFromParcel(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    GameEntity localGameEntity = null;
    String str1 = null;
    String str2 = null;
    long l1 = 0L;
    String str3 = null;
    long l2 = 0L;
    String str4 = null;
    int k = 0;
    int m = 0;
    int n = 0;
    byte[] arrayOfByte1 = null;
    ArrayList localArrayList = null;
    String str5 = null;
    byte[] arrayOfByte2 = null;
    int i1 = 0;
    Bundle localBundle = null;
    int i2 = 0;
    boolean bool = false;
    String str6 = null;
    String str7 = null;
    while (paramParcel.dataPosition() < i)
    {
      int i3 = zza.zzI(paramParcel);
      switch (zza.zzaP(i3))
      {
      default:
        zza.zzb(paramParcel, i3);
        break;
      case 1:
        localGameEntity = (GameEntity)zza.zza(paramParcel, i3, GameEntity.CREATOR);
        break;
      case 2:
        str1 = zza.zzo(paramParcel, i3);
        break;
      case 3:
        str2 = zza.zzo(paramParcel, i3);
        break;
      case 4:
        l1 = zza.zzi(paramParcel, i3);
        break;
      case 5:
        str3 = zza.zzo(paramParcel, i3);
        break;
      case 6:
        l2 = zza.zzi(paramParcel, i3);
        break;
      case 7:
        str4 = zza.zzo(paramParcel, i3);
        break;
      case 8:
        k = zza.zzg(paramParcel, i3);
        break;
      case 10:
        m = zza.zzg(paramParcel, i3);
        break;
      case 11:
        n = zza.zzg(paramParcel, i3);
        break;
      case 12:
        arrayOfByte1 = zza.zzr(paramParcel, i3);
        break;
      case 13:
        localArrayList = zza.zzc(paramParcel, i3, ParticipantEntity.CREATOR);
        break;
      case 14:
        str5 = zza.zzo(paramParcel, i3);
        break;
      case 15:
        arrayOfByte2 = zza.zzr(paramParcel, i3);
        break;
      case 17:
        localBundle = zza.zzq(paramParcel, i3);
        break;
      case 16:
        i1 = zza.zzg(paramParcel, i3);
        break;
      case 1000:
        j = zza.zzg(paramParcel, i3);
        break;
      case 19:
        bool = zza.zzc(paramParcel, i3);
        break;
      case 18:
        i2 = zza.zzg(paramParcel, i3);
        break;
      case 21:
        str7 = zza.zzo(paramParcel, i3);
        break;
      case 20:
        str6 = zza.zzo(paramParcel, i3);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new TurnBasedMatchEntity(j, localGameEntity, str1, str2, l1, str3, l2, str4, k, m, n, arrayOfByte1, localArrayList, str5, arrayOfByte2, i1, localBundle, i2, bool, str6, str7);
  }

  public TurnBasedMatchEntity[] newArray(int paramInt)
  {
    return new TurnBasedMatchEntity[paramInt];
  }
}