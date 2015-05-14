package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzsh
  implements Parcelable.Creator<zzsg>
{
  static void zza(zzsg paramzzsg, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzsg.versionCode);
    zzb.zza(paramParcel, 2, paramzzsg.zzrr(), false);
    zzb.zza(paramParcel, 3, paramzzsg.zzrq(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzsg zzer(Parcel paramParcel)
  {
    IBinder localIBinder1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    IBinder localIBinder2 = null;
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
        localIBinder2 = zza.zzp(paramParcel, k);
        break;
      case 3:
        localIBinder1 = zza.zzp(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzsg(j, localIBinder2, localIBinder1);
  }

  public zzsg[] zzgD(int paramInt)
  {
    return new zzsg[paramInt];
  }
}