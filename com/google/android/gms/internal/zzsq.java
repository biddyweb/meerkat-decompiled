package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzsq
  implements Parcelable.Creator<zzsp>
{
  static void zza(zzsp paramzzsp, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzsp.versionCode);
    zzb.zza(paramParcel, 2, paramzzsp.zzats, false);
    zzb.zza(paramParcel, 3, paramzzsp.zzru(), false);
    zzb.zzc(paramParcel, 4, paramzzsp.zzatu, false);
    zzb.zza(paramParcel, 5, paramzzsp.zzatv);
    zzb.zza(paramParcel, 6, paramzzsp.zzrq(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzsp zzet(Parcel paramParcel)
  {
    IBinder localIBinder1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    long l = 0L;
    ArrayList localArrayList = null;
    IBinder localIBinder2 = null;
    IBinder localIBinder3 = null;
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
        localIBinder3 = zza.zzp(paramParcel, k);
        break;
      case 3:
        localIBinder2 = zza.zzp(paramParcel, k);
        break;
      case 4:
        localArrayList = zza.zzc(paramParcel, k, zzsi.CREATOR);
        break;
      case 5:
        l = zza.zzi(paramParcel, k);
        break;
      case 6:
        localIBinder1 = zza.zzp(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzsp(j, localIBinder3, localIBinder2, localArrayList, l, localIBinder1);
  }

  public zzsp[] zzgF(int paramInt)
  {
    return new zzsp[paramInt];
  }
}