package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class AppContentCardEntityCreator
  implements Parcelable.Creator<AppContentCardEntity>
{
  static void zza(AppContentCardEntity paramAppContentCardEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramAppContentCardEntity.getActions(), false);
    zzb.zzc(paramParcel, 1000, paramAppContentCardEntity.getVersionCode());
    zzb.zzc(paramParcel, 2, paramAppContentCardEntity.zzmT(), false);
    zzb.zzc(paramParcel, 3, paramAppContentCardEntity.zzmI(), false);
    zzb.zza(paramParcel, 4, paramAppContentCardEntity.zzmJ(), false);
    zzb.zzc(paramParcel, 5, paramAppContentCardEntity.zzmU());
    zzb.zza(paramParcel, 6, paramAppContentCardEntity.getDescription(), false);
    zzb.zza(paramParcel, 7, paramAppContentCardEntity.getExtras(), false);
    zzb.zza(paramParcel, 10, paramAppContentCardEntity.zzmV(), false);
    zzb.zza(paramParcel, 11, paramAppContentCardEntity.getTitle(), false);
    zzb.zzc(paramParcel, 12, paramAppContentCardEntity.zzmW());
    zzb.zza(paramParcel, 13, paramAppContentCardEntity.getType(), false);
    zzb.zza(paramParcel, 14, paramAppContentCardEntity.getId(), false);
    zzb.zzH(paramParcel, i);
  }

  public AppContentCardEntity zzcT(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList1 = null;
    ArrayList localArrayList2 = null;
    ArrayList localArrayList3 = null;
    String str1 = null;
    int k = 0;
    String str2 = null;
    Bundle localBundle = null;
    String str3 = null;
    String str4 = null;
    int m = 0;
    String str5 = null;
    String str6 = null;
    while (paramParcel.dataPosition() < i)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        localArrayList1 = zza.zzc(paramParcel, n, AppContentActionEntity.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, n);
        break;
      case 2:
        localArrayList2 = zza.zzc(paramParcel, n, AppContentAnnotationEntity.CREATOR);
        break;
      case 3:
        localArrayList3 = zza.zzc(paramParcel, n, AppContentConditionEntity.CREATOR);
        break;
      case 4:
        str1 = zza.zzo(paramParcel, n);
        break;
      case 5:
        k = zza.zzg(paramParcel, n);
        break;
      case 6:
        str2 = zza.zzo(paramParcel, n);
        break;
      case 7:
        localBundle = zza.zzq(paramParcel, n);
        break;
      case 10:
        str3 = zza.zzo(paramParcel, n);
        break;
      case 11:
        str4 = zza.zzo(paramParcel, n);
        break;
      case 12:
        m = zza.zzg(paramParcel, n);
        break;
      case 13:
        str5 = zza.zzo(paramParcel, n);
        break;
      case 14:
        str6 = zza.zzo(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new AppContentCardEntity(j, localArrayList1, localArrayList2, localArrayList3, str1, k, str2, localBundle, str3, str4, m, str5, str6);
  }

  public AppContentCardEntity[] zzet(int paramInt)
  {
    return new AppContentCardEntity[paramInt];
  }
}