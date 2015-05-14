package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.Subscription;

public class zzau
  implements Parcelable.Creator<zzat>
{
  static void zza(zzat paramzzat, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzat.zzml(), paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzat.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzat.zzmm());
    zzb.zza(paramParcel, 3, paramzzat.zzlQ(), false);
    zzb.zza(paramParcel, 4, paramzzat.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzat zzcA(Parcel paramParcel)
  {
    boolean bool = false;
    String str = null;
    int i = zza.zzJ(paramParcel);
    IBinder localIBinder = null;
    Subscription localSubscription = null;
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
        localSubscription = (Subscription)zza.zza(paramParcel, k, Subscription.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        bool = zza.zzc(paramParcel, k);
        break;
      case 3:
        localIBinder = zza.zzp(paramParcel, k);
        break;
      case 4:
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzat(j, localSubscription, bool, localIBinder, str);
  }

  public zzat[] zzdZ(int paramInt)
  {
    return new zzat[paramInt];
  }
}