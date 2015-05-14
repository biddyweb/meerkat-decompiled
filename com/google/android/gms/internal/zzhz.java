package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzhz
  implements Parcelable.Creator<zzhy>
{
  static void zza(zzhy paramzzhy, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzhy.versionCode);
    zzb.zza(paramParcel, 2, paramzzhy.zzzH, false);
    zzb.zzc(paramParcel, 3, paramzzhy.zzzI);
    zzb.zzc(paramParcel, 4, paramzzhy.zzzJ);
    zzb.zza(paramParcel, 5, paramzzhy.zzzK);
    zzb.zzH(paramParcel, i);
  }

  public zzhy[] zzB(int paramInt)
  {
    return new zzhy[paramInt];
  }

  public zzhy zzj(Parcel paramParcel)
  {
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    String str = null;
    int j = 0;
    int k = 0;
    int m = 0;
    while (paramParcel.dataPosition() < i)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        str = zza.zzo(paramParcel, n);
        break;
      case 3:
        k = zza.zzg(paramParcel, n);
        break;
      case 4:
        j = zza.zzg(paramParcel, n);
        break;
      case 5:
        bool = zza.zzc(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzhy(m, str, k, j, bool);
  }
}