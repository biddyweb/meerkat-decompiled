package com.google.android.gms.games.appcontent;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class AppContentTupleEntityCreator
  implements Parcelable.Creator<AppContentTupleEntity>
{
  static void zza(AppContentTupleEntity paramAppContentTupleEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramAppContentTupleEntity.getName(), false);
    zzb.zzc(paramParcel, 1000, paramAppContentTupleEntity.getVersionCode());
    zzb.zza(paramParcel, 2, paramAppContentTupleEntity.getValue(), false);
    zzb.zzH(paramParcel, i);
  }

  public AppContentTupleEntity zzcW(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str2 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str1 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new AppContentTupleEntity(j, str2, str1);
  }

  public AppContentTupleEntity[] zzew(int paramInt)
  {
    return new AppContentTupleEntity[paramInt];
  }
}