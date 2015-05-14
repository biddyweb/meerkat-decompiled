package com.google.android.gms.games.internal.player;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class MostRecentGameInfoEntityCreator
  implements Parcelable.Creator<MostRecentGameInfoEntity>
{
  static void zza(MostRecentGameInfoEntity paramMostRecentGameInfoEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramMostRecentGameInfoEntity.zzoF(), false);
    zzb.zzc(paramParcel, 1000, paramMostRecentGameInfoEntity.getVersionCode());
    zzb.zza(paramParcel, 2, paramMostRecentGameInfoEntity.zzoG(), false);
    zzb.zza(paramParcel, 3, paramMostRecentGameInfoEntity.zzoH());
    zzb.zza(paramParcel, 4, paramMostRecentGameInfoEntity.zzoI(), paramInt, false);
    zzb.zza(paramParcel, 5, paramMostRecentGameInfoEntity.zzoJ(), paramInt, false);
    zzb.zza(paramParcel, 6, paramMostRecentGameInfoEntity.zzoK(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public MostRecentGameInfoEntity zzdc(Parcel paramParcel)
  {
    Uri localUri1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    long l = 0L;
    Uri localUri2 = null;
    Uri localUri3 = null;
    String str1 = null;
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
        break;
      case 3:
        l = zza.zzi(paramParcel, k);
        break;
      case 4:
        localUri3 = (Uri)zza.zza(paramParcel, k, Uri.CREATOR);
        break;
      case 5:
        localUri2 = (Uri)zza.zza(paramParcel, k, Uri.CREATOR);
        break;
      case 6:
        localUri1 = (Uri)zza.zza(paramParcel, k, Uri.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new MostRecentGameInfoEntity(j, str2, str1, l, localUri3, localUri2, localUri1);
  }

  public MostRecentGameInfoEntity[] zzeS(int paramInt)
  {
    return new MostRecentGameInfoEntity[paramInt];
  }
}