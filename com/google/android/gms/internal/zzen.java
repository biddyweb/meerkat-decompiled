package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzen
  implements Parcelable.Creator<zzeo>
{
  static void zza(zzeo paramzzeo, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzeo.versionCode);
    zzb.zza(paramParcel, 2, paramzzeo.zzun, paramInt, false);
    zzb.zza(paramParcel, 3, paramzzeo.zzdi(), false);
    zzb.zza(paramParcel, 4, paramzzeo.zzdj(), false);
    zzb.zza(paramParcel, 5, paramzzeo.zzdk(), false);
    zzb.zza(paramParcel, 6, paramzzeo.zzdl(), false);
    zzb.zza(paramParcel, 7, paramzzeo.zzus, false);
    zzb.zza(paramParcel, 8, paramzzeo.zzut);
    zzb.zza(paramParcel, 9, paramzzeo.zzuu, false);
    zzb.zza(paramParcel, 10, paramzzeo.zzdn(), false);
    zzb.zzc(paramParcel, 11, paramzzeo.orientation);
    zzb.zzc(paramParcel, 12, paramzzeo.zzuw);
    zzb.zza(paramParcel, 13, paramzzeo.zztR, false);
    zzb.zza(paramParcel, 14, paramzzeo.zzlP, paramInt, false);
    zzb.zza(paramParcel, 15, paramzzeo.zzdm(), false);
    zzb.zza(paramParcel, 17, paramzzeo.zzuz, paramInt, false);
    zzb.zza(paramParcel, 16, paramzzeo.zzuy, false);
    zzb.zzH(paramParcel, i);
  }

  public zzeo zzf(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    zzek localzzek = null;
    IBinder localIBinder1 = null;
    IBinder localIBinder2 = null;
    IBinder localIBinder3 = null;
    IBinder localIBinder4 = null;
    String str1 = null;
    boolean bool = false;
    String str2 = null;
    IBinder localIBinder5 = null;
    int k = 0;
    int m = 0;
    String str3 = null;
    zzhy localzzhy = null;
    IBinder localIBinder6 = null;
    String str4 = null;
    zzx localzzx = null;
    while (paramParcel.dataPosition() < i)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        j = zza.zzg(paramParcel, n);
        break;
      case 2:
        localzzek = (zzek)zza.zza(paramParcel, n, zzek.CREATOR);
        break;
      case 3:
        localIBinder1 = zza.zzp(paramParcel, n);
        break;
      case 4:
        localIBinder2 = zza.zzp(paramParcel, n);
        break;
      case 5:
        localIBinder3 = zza.zzp(paramParcel, n);
        break;
      case 6:
        localIBinder4 = zza.zzp(paramParcel, n);
        break;
      case 7:
        str1 = zza.zzo(paramParcel, n);
        break;
      case 8:
        bool = zza.zzc(paramParcel, n);
        break;
      case 9:
        str2 = zza.zzo(paramParcel, n);
        break;
      case 10:
        localIBinder5 = zza.zzp(paramParcel, n);
        break;
      case 11:
        k = zza.zzg(paramParcel, n);
        break;
      case 12:
        m = zza.zzg(paramParcel, n);
        break;
      case 13:
        str3 = zza.zzo(paramParcel, n);
        break;
      case 14:
        localzzhy = (zzhy)zza.zza(paramParcel, n, zzhy.CREATOR);
        break;
      case 15:
        localIBinder6 = zza.zzp(paramParcel, n);
        break;
      case 17:
        localzzx = (zzx)zza.zza(paramParcel, n, zzx.CREATOR);
        break;
      case 16:
        str4 = zza.zzo(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzeo(j, localzzek, localIBinder1, localIBinder2, localIBinder3, localIBinder4, str1, bool, str2, localIBinder5, k, m, str3, localzzhy, localIBinder6, str4, localzzx);
  }

  public zzeo[] zzq(int paramInt)
  {
    return new zzeo[paramInt];
  }
}