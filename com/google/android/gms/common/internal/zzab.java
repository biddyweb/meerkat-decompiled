package com.google.android.gms.common.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzab
  implements Parcelable.Creator<zzaa>
{
  static void zza(zzaa paramzzaa, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzaa.zzFG);
    zzb.zza(paramParcel, 2, paramzzaa.zzPn, false);
    zzb.zza(paramParcel, 3, paramzzaa.zzjo(), paramInt, false);
    zzb.zza(paramParcel, 4, paramzzaa.zzjp());
    zzb.zza(paramParcel, 5, paramzzaa.zzjq());
    zzb.zzH(paramParcel, i);
  }

  public zzaa zzG(Parcel paramParcel)
  {
    ConnectionResult localConnectionResult = null;
    boolean bool1 = false;
    int i = zza.zzJ(paramParcel);
    boolean bool2 = false;
    IBinder localIBinder = null;
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
        localIBinder = zza.zzp(paramParcel, k);
        break;
      case 3:
        localConnectionResult = (ConnectionResult)zza.zza(paramParcel, k, ConnectionResult.CREATOR);
        break;
      case 4:
        bool2 = zza.zzc(paramParcel, k);
        break;
      case 5:
        bool1 = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzaa(j, localIBinder, localConnectionResult, bool2, bool1);
  }

  public zzaa[] zzaN(int paramInt)
  {
    return new zzaa[paramInt];
  }
}