package com.google.android.gms.games.quest;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class MilestoneEntityCreator
  implements Parcelable.Creator<MilestoneEntity>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(MilestoneEntity paramMilestoneEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramMilestoneEntity.getMilestoneId(), false);
    zzb.zzc(paramParcel, 1000, paramMilestoneEntity.getVersionCode());
    zzb.zza(paramParcel, 2, paramMilestoneEntity.getCurrentProgress());
    zzb.zza(paramParcel, 3, paramMilestoneEntity.getTargetProgress());
    zzb.zza(paramParcel, 4, paramMilestoneEntity.getCompletionRewardData(), false);
    zzb.zzc(paramParcel, 5, paramMilestoneEntity.getState());
    zzb.zza(paramParcel, 6, paramMilestoneEntity.getEventId(), false);
    zzb.zzH(paramParcel, i);
  }

  public MilestoneEntity createFromParcel(Parcel paramParcel)
  {
    long l1 = 0L;
    int i = 0;
    String str1 = null;
    int j = zza.zzJ(paramParcel);
    byte[] arrayOfByte = null;
    long l2 = l1;
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
        str2 = zza.zzo(paramParcel, m);
        break;
      case 1000:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        l2 = zza.zzi(paramParcel, m);
        break;
      case 3:
        l1 = zza.zzi(paramParcel, m);
        break;
      case 4:
        arrayOfByte = zza.zzr(paramParcel, m);
        break;
      case 5:
        i = zza.zzg(paramParcel, m);
        break;
      case 6:
        str1 = zza.zzo(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new MilestoneEntity(k, str2, l2, l1, arrayOfByte, i, str1);
  }

  public MilestoneEntity[] newArray(int paramInt)
  {
    return new MilestoneEntity[paramInt];
  }
}