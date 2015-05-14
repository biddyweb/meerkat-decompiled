package com.google.android.gms.fitness.request;

import android.app.PendingIntent;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzaf
  implements Parcelable.Creator<zzae>
{
  static void zza(zzae paramzzae, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzae.zzmg(), false);
    zzb.zzc(paramParcel, 1000, paramzzae.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzae.zzmb(), paramInt, false);
    zzb.zza(paramParcel, 3, paramzzae.zzlQ(), false);
    zzb.zza(paramParcel, 4, paramzzae.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzae zzcr(Parcel paramParcel)
  {
    String str = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    IBinder localIBinder1 = null;
    PendingIntent localPendingIntent = null;
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
        localIBinder2 = zza.zzp(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localPendingIntent = (PendingIntent)zza.zza(paramParcel, k, PendingIntent.CREATOR);
        break;
      case 3:
        localIBinder1 = zza.zzp(paramParcel, k);
        break;
      case 4:
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzae(j, localIBinder2, localPendingIntent, localIBinder1, str);
  }

  public zzae[] zzdQ(int paramInt)
  {
    return new zzae[paramInt];
  }
}