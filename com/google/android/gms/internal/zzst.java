package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzst
  implements Parcelable.Creator<zzss>
{
  static void zza(zzss paramzzss, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzss.versionCode);
    zzb.zza(paramParcel, 2, paramzzss.zzatv);
    zzb.zza(paramParcel, 3, paramzzss.zzrq(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzss zzeu(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    long l = 0L;
    IBinder localIBinder = null;
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
        l = zza.zzi(paramParcel, k);
        break;
      case 3:
        localIBinder = zza.zzp(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzss(j, l, localIBinder);
  }

  public zzss[] zzgG(int paramInt)
  {
    return new zzss[paramInt];
  }
}