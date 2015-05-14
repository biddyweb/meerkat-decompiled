package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzlg
  implements Parcelable.Creator<zzlh.zzb>
{
  static void zza(zzlh.zzb paramzzb, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzb.versionCode);
    zzb.zza(paramParcel, 2, paramzzb.zzfv, false);
    zzb.zza(paramParcel, 3, paramzzb.zzRd, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzlh.zzb zzQ(Parcel paramParcel)
  {
    zzld.zza localzza = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str = zza.zzo(paramParcel, k);
        break;
      case 3:
        localzza = (zzld.zza)zza.zza(paramParcel, k, zzld.zza.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzlh.zzb(j, str, localzza);
  }

  public zzlh.zzb[] zzaW(int paramInt)
  {
    return new zzlh.zzb[paramInt];
  }
}