package com.google.android.gms.games.multiplayer;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.games.PlayerEntity;

public class ParticipantEntityCreator
  implements Parcelable.Creator<ParticipantEntity>
{
  static void zza(ParticipantEntity paramParticipantEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramParticipantEntity.getParticipantId(), false);
    zzb.zzc(paramParcel, 1000, paramParticipantEntity.getVersionCode());
    zzb.zza(paramParcel, 2, paramParticipantEntity.getDisplayName(), false);
    zzb.zza(paramParcel, 3, paramParticipantEntity.getIconImageUri(), paramInt, false);
    zzb.zza(paramParcel, 4, paramParticipantEntity.getHiResImageUri(), paramInt, false);
    zzb.zzc(paramParcel, 5, paramParticipantEntity.getStatus());
    zzb.zza(paramParcel, 6, paramParticipantEntity.zznl(), false);
    zzb.zza(paramParcel, 7, paramParticipantEntity.isConnectedToRoom());
    zzb.zza(paramParcel, 8, paramParticipantEntity.getPlayer(), paramInt, false);
    zzb.zzc(paramParcel, 9, paramParticipantEntity.getCapabilities());
    zzb.zza(paramParcel, 10, paramParticipantEntity.getResult(), paramInt, false);
    zzb.zza(paramParcel, 11, paramParticipantEntity.getIconImageUrl(), false);
    zzb.zza(paramParcel, 12, paramParticipantEntity.getHiResImageUrl(), false);
    zzb.zzH(paramParcel, i);
  }

  public ParticipantEntity zzdf(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    Uri localUri1 = null;
    Uri localUri2 = null;
    int k = 0;
    String str3 = null;
    boolean bool = false;
    PlayerEntity localPlayerEntity = null;
    int m = 0;
    ParticipantResult localParticipantResult = null;
    String str4 = null;
    String str5 = null;
    while (paramParcel.dataPosition() < i)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        str1 = zza.zzo(paramParcel, n);
        break;
      case 1000:
        j = zza.zzg(paramParcel, n);
        break;
      case 2:
        str2 = zza.zzo(paramParcel, n);
        break;
      case 3:
        localUri1 = (Uri)zza.zza(paramParcel, n, Uri.CREATOR);
        break;
      case 4:
        localUri2 = (Uri)zza.zza(paramParcel, n, Uri.CREATOR);
        break;
      case 5:
        k = zza.zzg(paramParcel, n);
        break;
      case 6:
        str3 = zza.zzo(paramParcel, n);
        break;
      case 7:
        bool = zza.zzc(paramParcel, n);
        break;
      case 8:
        localPlayerEntity = (PlayerEntity)zza.zza(paramParcel, n, PlayerEntity.CREATOR);
        break;
      case 9:
        m = zza.zzg(paramParcel, n);
        break;
      case 10:
        localParticipantResult = (ParticipantResult)zza.zza(paramParcel, n, ParticipantResult.CREATOR);
        break;
      case 11:
        str4 = zza.zzo(paramParcel, n);
        break;
      case 12:
        str5 = zza.zzo(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new ParticipantEntity(j, str1, str2, localUri1, localUri2, k, str3, bool, localPlayerEntity, m, localParticipantResult, str4, str5);
  }

  public ParticipantEntity[] zzeW(int paramInt)
  {
    return new ParticipantEntity[paramInt];
  }
}