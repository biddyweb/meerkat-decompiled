package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class AppContentConditionEntityCreator
  implements Parcelable.Creator<AppContentConditionEntity>
{
  static void zza(AppContentConditionEntity paramAppContentConditionEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramAppContentConditionEntity.zzmY(), false);
    zzb.zzc(paramParcel, 1000, paramAppContentConditionEntity.getVersionCode());
    zzb.zza(paramParcel, 2, paramAppContentConditionEntity.zzmZ(), false);
    zzb.zza(paramParcel, 3, paramAppContentConditionEntity.zzna(), false);
    zzb.zza(paramParcel, 4, paramAppContentConditionEntity.zznb(), false);
    zzb.zzH(paramParcel, i);
  }

  public AppContentConditionEntity zzcU(Parcel paramParcel)
  {
    Bundle localBundle = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    String str3 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 3:
        str1 = zza.zzo(paramParcel, k);
        break;
      case 4:
        localBundle = zza.zzq(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new AppContentConditionEntity(j, str3, str2, str1, localBundle);
  }

  public AppContentConditionEntity[] zzeu(int paramInt)
  {
    return new AppContentConditionEntity[paramInt];
  }
}