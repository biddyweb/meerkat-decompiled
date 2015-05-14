package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzad
  implements Parcelable.Creator<zzac>
{
  static void zza(zzac paramzzac, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzac.versionCode);
    zzb.zzc(paramParcel, 2, paramzzac.statusCode);
    zzb.zza(paramParcel, 3, paramzzac.zzaGm, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzac zzfD(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    ParcelFileDescriptor localParcelFileDescriptor = null;
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
        localParcelFileDescriptor = (ParcelFileDescriptor)zza.zza(paramParcel, m, ParcelFileDescriptor.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzac(k, i, localParcelFileDescriptor);
  }

  public zzac[] zzid(int paramInt)
  {
    return new zzac[paramInt];
  }
}