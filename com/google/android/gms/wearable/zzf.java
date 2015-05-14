package com.google.android.gms.wearable;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzf
  implements Parcelable.Creator<zze>
{
  static void zza(zze paramzze, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzze.zzFG);
    zzb.zza(paramParcel, 2, paramzze.getName(), false);
    zzb.zza(paramParcel, 3, paramzze.getAddress(), false);
    zzb.zzc(paramParcel, 4, paramzze.getType());
    zzb.zzc(paramParcel, 5, paramzze.getRole());
    zzb.zza(paramParcel, 6, paramzze.isEnabled());
    zzb.zza(paramParcel, 7, paramzze.isConnected());
    zzb.zza(paramParcel, 8, paramzze.zzuX(), false);
    zzb.zzH(paramParcel, i);
  }

  public zze zzfs(Parcel paramParcel)
  {
    String str1 = null;
    boolean bool1 = false;
    int i = zza.zzJ(paramParcel);
    boolean bool2 = false;
    int j = 0;
    int k = 0;
    String str2 = null;
    String str3 = null;
    int m = 0;
    while (paramParcel.dataPosition() < i)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        str3 = zza.zzo(paramParcel, n);
        break;
      case 3:
        str2 = zza.zzo(paramParcel, n);
        break;
      case 4:
        k = zza.zzg(paramParcel, n);
        break;
      case 5:
        j = zza.zzg(paramParcel, n);
        break;
      case 6:
        bool2 = zza.zzc(paramParcel, n);
        break;
      case 7:
        bool1 = zza.zzc(paramParcel, n);
        break;
      case 8:
        str1 = zza.zzo(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zze(m, str3, str2, k, j, bool2, bool1, str1);
  }

  public zze[] zzhS(int paramInt)
  {
    return new zze[paramInt];
  }
}