package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzba
  implements Parcelable.Creator<zzaz>
{
  static void zza(zzaz paramzzaz, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzaz.versionCode);
    zzb.zzc(paramParcel, 2, paramzzaz.statusCode);
    zzb.zza(paramParcel, 3, paramzzaz.zzaGC);
    zzb.zzc(paramParcel, 4, paramzzaz.zzaGE, false);
    zzb.zzH(paramParcel, i);
  }

  public zzaz zzfL(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    long l = 0L;
    ArrayList localArrayList = null;
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
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        i = zza.zzg(paramParcel, m);
        break;
      case 3:
        l = zza.zzi(paramParcel, m);
        break;
      case 4:
        localArrayList = zza.zzc(paramParcel, m, zzaq.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzaz(k, i, l, localArrayList);
  }

  public zzaz[] zzil(int paramInt)
  {
    return new zzaz[paramInt];
  }
}