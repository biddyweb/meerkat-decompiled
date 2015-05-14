package com.google.android.gms.location;

import android.location.Location;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.List;

public class zzi
  implements Parcelable.Creator<zzh>
{
  static void zza(zzh paramzzh, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzh.zzaml, false);
    zzb.zzc(paramParcel, 1000, paramzzh.getVersionCode());
    zzb.zzH(paramParcel, i);
  }

  public zzh zzdq(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Object localObject = zzh.zzamk;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localObject = zza.zzc(paramParcel, k, Location.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzh(j, (List)localObject);
  }

  public zzh[] zzfm(int paramInt)
  {
    return new zzh[paramInt];
  }
}