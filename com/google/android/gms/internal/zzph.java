package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.location.LocationRequest;
import java.util.List;

public class zzph
  implements Parcelable.Creator<zzpg>
{
  static void zza(zzpg paramzzpg, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzpg.zzabx, paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzpg.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzpg.zzanh);
    zzb.zza(paramParcel, 3, paramzzpg.zzani);
    zzb.zza(paramParcel, 4, paramzzpg.zzanj);
    zzb.zzc(paramParcel, 5, paramzzpg.zzank, false);
    zzb.zza(paramParcel, 6, paramzzpg.mTag, false);
    zzb.zzH(paramParcel, i);
  }

  public zzpg zzdv(Parcel paramParcel)
  {
    String str = null;
    boolean bool1 = true;
    boolean bool2 = false;
    int i = zza.zzJ(paramParcel);
    Object localObject = zzpg.zzang;
    boolean bool3 = bool1;
    LocationRequest localLocationRequest = null;
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localLocationRequest = (LocationRequest)zza.zza(paramParcel, k, LocationRequest.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        bool2 = zza.zzc(paramParcel, k);
        break;
      case 3:
        bool3 = zza.zzc(paramParcel, k);
        break;
      case 4:
        bool1 = zza.zzc(paramParcel, k);
        break;
      case 5:
        localObject = zza.zzc(paramParcel, k, zzox.CREATOR);
        break;
      case 6:
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzpg(j, localLocationRequest, bool2, bool3, bool1, (List)localObject, str);
  }

  public zzpg[] zzfu(int paramInt)
  {
    return new zzpg[paramInt];
  }
}