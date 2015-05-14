package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.cast.ApplicationMetadata;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzjx
  implements Parcelable.Creator<zzjw>
{
  static void zza(zzjw paramzzjw, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzjw.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzjw.zzhs());
    zzb.zza(paramParcel, 3, paramzzjw.zzhA());
    zzb.zzc(paramParcel, 4, paramzzjw.zzhB());
    zzb.zza(paramParcel, 5, paramzzjw.getApplicationMetadata(), paramInt, false);
    zzb.zzc(paramParcel, 6, paramzzjw.zzhC());
    zzb.zzH(paramParcel, i);
  }

  public zzjw[] zzam(int paramInt)
  {
    return new zzjw[paramInt];
  }

  public zzjw zzx(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    double d = 0.0D;
    ApplicationMetadata localApplicationMetadata = null;
    int k = 0;
    boolean bool = false;
    int m = 0;
    while (paramParcel.dataPosition() < j)
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
        d = zza.zzm(paramParcel, n);
        break;
      case 3:
        bool = zza.zzc(paramParcel, n);
        break;
      case 4:
        k = zza.zzg(paramParcel, n);
        break;
      case 5:
        localApplicationMetadata = (ApplicationMetadata)zza.zza(paramParcel, n, ApplicationMetadata.CREATOR);
        break;
      case 6:
        i = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzjw(m, d, bool, k, localApplicationMetadata, i);
  }
}