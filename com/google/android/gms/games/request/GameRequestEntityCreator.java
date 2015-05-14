package com.google.android.gms.games.request;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.PlayerEntity;
import java.util.ArrayList;

public class GameRequestEntityCreator
  implements Parcelable.Creator<GameRequestEntity>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(GameRequestEntity paramGameRequestEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramGameRequestEntity.getGame(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramGameRequestEntity.getVersionCode());
    zzb.zza(paramParcel, 2, paramGameRequestEntity.getSender(), paramInt, false);
    zzb.zza(paramParcel, 3, paramGameRequestEntity.getData(), false);
    zzb.zza(paramParcel, 4, paramGameRequestEntity.getRequestId(), false);
    zzb.zzc(paramParcel, 5, paramGameRequestEntity.getRecipients(), false);
    zzb.zzc(paramParcel, 7, paramGameRequestEntity.getType());
    zzb.zza(paramParcel, 9, paramGameRequestEntity.getCreationTimestamp());
    zzb.zza(paramParcel, 10, paramGameRequestEntity.getExpirationTimestamp());
    zzb.zza(paramParcel, 11, paramGameRequestEntity.zzpb(), false);
    zzb.zzc(paramParcel, 12, paramGameRequestEntity.getStatus());
    zzb.zzH(paramParcel, i);
  }

  public GameRequestEntity createFromParcel(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    GameEntity localGameEntity = null;
    PlayerEntity localPlayerEntity = null;
    byte[] arrayOfByte = null;
    String str = null;
    ArrayList localArrayList = null;
    int k = 0;
    long l1 = 0L;
    long l2 = 0L;
    Bundle localBundle = null;
    int m = 0;
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
        localPlayerEntity = (PlayerEntity)zza.zza(paramParcel, n, PlayerEntity.CREATOR);
        break;
      case 3:
        arrayOfByte = zza.zzr(paramParcel, n);
        break;
      case 4:
        str = zza.zzo(paramParcel, n);
        break;
      case 5:
        localArrayList = zza.zzc(paramParcel, n, PlayerEntity.CREATOR);
        break;
      case 7:
        k = zza.zzg(paramParcel, n);
        break;
      case 9:
        l1 = zza.zzi(paramParcel, n);
        break;
      case 10:
        l2 = zza.zzi(paramParcel, n);
        break;
      case 11:
        localBundle = zza.zzq(paramParcel, n);
        break;
      case 12:
        m = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new GameRequestEntity(j, localGameEntity, localPlayerEntity, arrayOfByte, str, localArrayList, k, l1, l2, localBundle, m);
  }

  public GameRequestEntity[] newArray(int paramInt)
  {
    return new GameRequestEntity[paramInt];
  }
}