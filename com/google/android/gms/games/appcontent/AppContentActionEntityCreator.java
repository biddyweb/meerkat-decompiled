package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class AppContentActionEntityCreator
  implements Parcelable.Creator<AppContentActionEntity>
{
  static void zza(AppContentActionEntity paramAppContentActionEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramAppContentActionEntity.zzmI(), false);
    zzb.zzc(paramParcel, 1000, paramAppContentActionEntity.getVersionCode());
    zzb.zza(paramParcel, 2, paramAppContentActionEntity.zzmJ(), false);
    zzb.zza(paramParcel, 3, paramAppContentActionEntity.getExtras(), false);
    zzb.zza(paramParcel, 6, paramAppContentActionEntity.getType(), false);
    zzb.zza(paramParcel, 7, paramAppContentActionEntity.getId(), false);
    zzb.zza(paramParcel, 8, paramAppContentActionEntity.zzmH(), paramInt, false);
    zzb.zza(paramParcel, 9, paramAppContentActionEntity.zzmK(), false);
    zzb.zzH(paramParcel, i);
  }

  public AppContentActionEntity zzcR(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    AppContentAnnotationEntity localAppContentAnnotationEntity = null;
    String str2 = null;
    String str3 = null;
    Bundle localBundle = null;
    String str4 = null;
    ArrayList localArrayList = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localArrayList = zza.zzc(paramParcel, k, AppContentConditionEntity.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str4 = zza.zzo(paramParcel, k);
        break;
      case 3:
        localBundle = zza.zzq(paramParcel, k);
        break;
      case 6:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 7:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 8:
        localAppContentAnnotationEntity = (AppContentAnnotationEntity)zza.zza(paramParcel, k, AppContentAnnotationEntity.CREATOR);
        break;
      case 9:
        str1 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new AppContentActionEntity(j, localArrayList, str4, localBundle, str3, str2, localAppContentAnnotationEntity, str1);
  }

  public AppContentActionEntity[] zzer(int paramInt)
  {
    return new AppContentActionEntity[paramInt];
  }
}