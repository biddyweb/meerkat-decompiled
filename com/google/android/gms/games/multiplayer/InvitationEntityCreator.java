package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.games.GameEntity;
import java.util.ArrayList;

public class InvitationEntityCreator
  implements Parcelable.Creator<InvitationEntity>
{
  static void zza(InvitationEntity paramInvitationEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramInvitationEntity.getGame(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramInvitationEntity.getVersionCode());
    zzb.zza(paramParcel, 2, paramInvitationEntity.getInvitationId(), false);
    zzb.zza(paramParcel, 3, paramInvitationEntity.getCreationTimestamp());
    zzb.zzc(paramParcel, 4, paramInvitationEntity.getInvitationType());
    zzb.zza(paramParcel, 5, paramInvitationEntity.getInviter(), paramInt, false);
    zzb.zzc(paramParcel, 6, paramInvitationEntity.getParticipants(), false);
    zzb.zzc(paramParcel, 7, paramInvitationEntity.getVariant());
    zzb.zzc(paramParcel, 8, paramInvitationEntity.getAvailableAutoMatchSlots());
    zzb.zzH(paramParcel, i);
  }

  public InvitationEntity zzde(Parcel paramParcel)
  {
    ArrayList localArrayList = null;
    int i = 0;
    int j = zza.zzJ(paramParcel);
    long l = 0L;
    int k = 0;
    ParticipantEntity localParticipantEntity = null;
    int m = 0;
    String str = null;
    GameEntity localGameEntity = null;
    int n = 0;
    while (paramParcel.dataPosition() < j)
    {
      int i1 = zza.zzI(paramParcel);
      switch (zza.zzaP(i1))
      {
      default:
        zza.zzb(paramParcel, i1);
        break;
      case 1:
        localGameEntity = (GameEntity)zza.zza(paramParcel, i1, GameEntity.CREATOR);
        break;
      case 1000:
        n = zza.zzg(paramParcel, i1);
        break;
      case 2:
        str = zza.zzo(paramParcel, i1);
        break;
      case 3:
        l = zza.zzi(paramParcel, i1);
        break;
      case 4:
        m = zza.zzg(paramParcel, i1);
        break;
      case 5:
        localParticipantEntity = (ParticipantEntity)zza.zza(paramParcel, i1, ParticipantEntity.CREATOR);
        break;
      case 6:
        localArrayList = zza.zzc(paramParcel, i1, ParticipantEntity.CREATOR);
        break;
      case 7:
        k = zza.zzg(paramParcel, i1);
        break;
      case 8:
        i = zza.zzg(paramParcel, i1);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new InvitationEntity(n, localGameEntity, str, l, m, localParticipantEntity, localArrayList, k, i);
  }

  public InvitationEntity[] zzeV(int paramInt)
  {
    return new InvitationEntity[paramInt];
  }
}