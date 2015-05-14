package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzan
  implements Parcelable.Creator<zzam>
{
  static void zza(zzam paramzzam, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzam.getName(), false);
    zzb.zzc(paramParcel, 1000, paramzzam.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzam.getIdentifier(), false);
    zzb.zza(paramParcel, 3, paramzzam.zzlQ(), false);
    zzb.zza(paramParcel, 4, paramzzam.getPackageName(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzam zzcw(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    IBinder localIBinder = null;
    String str2 = null;
    String str3 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 3:
        localIBinder = zza.zzp(paramParcel, k);
        break;
      case 4:
        str1 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzam(j, str3, str2, localIBinder, str1);
  }

  public zzam[] zzdV(int paramInt)
  {
    return new zzam[paramInt];
  }
}