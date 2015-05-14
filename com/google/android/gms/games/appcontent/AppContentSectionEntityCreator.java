package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class AppContentSectionEntityCreator
  implements Parcelable.Creator<AppContentSectionEntity>
{
  static void zza(AppContentSectionEntity paramAppContentSectionEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramAppContentSectionEntity.getActions(), false);
    zzb.zzc(paramParcel, 1000, paramAppContentSectionEntity.getVersionCode());
    zzb.zzc(paramParcel, 3, paramAppContentSectionEntity.zznd(), false);
    zzb.zza(paramParcel, 4, paramAppContentSectionEntity.zzmJ(), false);
    zzb.zza(paramParcel, 5, paramAppContentSectionEntity.getExtras(), false);
    zzb.zza(paramParcel, 6, paramAppContentSectionEntity.zzmV(), false);
    zzb.zza(paramParcel, 7, paramAppContentSectionEntity.getTitle(), false);
    zzb.zza(paramParcel, 8, paramAppContentSectionEntity.getType(), false);
    zzb.zza(paramParcel, 9, paramAppContentSectionEntity.getId(), false);
    zzb.zza(paramParcel, 10, paramAppContentSectionEntity.zzne(), false);
    zzb.zzc(paramParcel, 14, paramAppContentSectionEntity.zzmT(), false);
    zzb.zzH(paramParcel, i);
  }

  public AppContentSectionEntity zzcV(Parcel paramParcel)
  {
    ArrayList localArrayList1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    Bundle localBundle = null;
    String str6 = null;
    ArrayList localArrayList2 = null;
    ArrayList localArrayList3 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localArrayList3 = zza.zzc(paramParcel, k, AppContentActionEntity.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 3:
        localArrayList2 = zza.zzc(paramParcel, k, AppContentCardEntity.CREATOR);
        break;
      case 4:
        str6 = zza.zzo(paramParcel, k);
        break;
      case 5:
        localBundle = zza.zzq(paramParcel, k);
        break;
      case 6:
        str5 = zza.zzo(paramParcel, k);
        break;
      case 7:
        str4 = zza.zzo(paramParcel, k);
        break;
      case 8:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 9:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 10:
        str1 = zza.zzo(paramParcel, k);
        break;
      case 14:
        localArrayList1 = zza.zzc(paramParcel, k, AppContentAnnotationEntity.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new AppContentSectionEntity(j, localArrayList3, localArrayList2, str6, localBundle, str5, str4, str3, str2, str1, localArrayList1);
  }

  public AppContentSectionEntity[] zzev(int paramInt)
  {
    return new AppContentSectionEntity[paramInt];
  }
}