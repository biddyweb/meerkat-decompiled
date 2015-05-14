package com.google.android.gms.wearable.internal;

import android.content.IntentFilter;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;

public class zzc
  implements Parcelable.Creator<zzb>
{
  static void zza(zzb paramzzb, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzK(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, paramzzb.zzFG);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, paramzzb.zzva(), false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 3, paramzzb.zzaFO, paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }

  public zzb zzfu(Parcel paramParcel)
  {
    IntentFilter[] arrayOfIntentFilter = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
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
        localIBinder = zza.zzp(paramParcel, k);
        break;
      case 3:
        arrayOfIntentFilter = (IntentFilter[])zza.zzb(paramParcel, k, IntentFilter.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzb(j, localIBinder, arrayOfIntentFilter);
  }

  public zzb[] zzhU(int paramInt)
  {
    return new zzb[paramInt];
  }
}