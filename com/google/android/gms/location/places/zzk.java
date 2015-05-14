package com.google.android.gms.location.places;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzk
  implements Parcelable.Creator<zzj>
{
  static void zza(zzj paramzzj, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzj.zzxV, false);
    zzb.zzc(paramParcel, 1000, paramzzj.zzFG);
    zzb.zzc(paramParcel, 2, paramzzj.zzaoh);
    zzb.zzH(paramParcel, i);
  }

  public zzj zzdD(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    String str = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        str = zza.zzo(paramParcel, m);
        break;
      case 1000:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        i = zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzj(k, str, i);
  }

  public zzj[] zzfF(int paramInt)
  {
    return new zzj[paramInt];
  }
}