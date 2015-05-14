package com.google.android.gms.cast;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzc
  implements Parcelable.Creator<LaunchOptions>
{
  static void zza(LaunchOptions paramLaunchOptions, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramLaunchOptions.getVersionCode());
    zzb.zza(paramParcel, 2, paramLaunchOptions.getRelaunchIfRunning());
    zzb.zza(paramParcel, 3, paramLaunchOptions.getLanguage(), false);
    zzb.zzH(paramParcel, i);
  }

  public LaunchOptions[] zzae(int paramInt)
  {
    return new LaunchOptions[paramInt];
  }

  public LaunchOptions zzv(Parcel paramParcel)
  {
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    String str = null;
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
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        bool = zza.zzc(paramParcel, k);
        break;
      case 3:
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new LaunchOptions(j, bool, str);
  }
}