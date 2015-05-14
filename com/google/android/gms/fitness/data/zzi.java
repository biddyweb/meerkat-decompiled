package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzi
  implements Parcelable.Creator<Device>
{
  static void zza(Device paramDevice, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramDevice.getManufacturer(), false);
    zzb.zzc(paramParcel, 1000, paramDevice.getVersionCode());
    zzb.zza(paramParcel, 2, paramDevice.getModel(), false);
    zzb.zza(paramParcel, 3, paramDevice.getVersion(), false);
    zzb.zza(paramParcel, 4, paramDevice.zzlF(), false);
    zzb.zzc(paramParcel, 5, paramDevice.getType());
    zzb.zzc(paramParcel, 6, paramDevice.zzlD());
    zzb.zzH(paramParcel, i);
  }

  public Device zzbQ(Parcel paramParcel)
  {
    int i = 0;
    String str1 = null;
    int j = zza.zzJ(paramParcel);
    int k = 0;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        str4 = zza.zzo(paramParcel, n);
        break;
      case 1000:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        str3 = zza.zzo(paramParcel, n);
        break;
      case 3:
        str2 = zza.zzo(paramParcel, n);
        break;
      case 4:
        str1 = zza.zzo(paramParcel, n);
        break;
      case 5:
        k = zza.zzg(paramParcel, n);
        break;
      case 6:
        i = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new Device(m, str4, str3, str2, str1, k, i);
  }

  public Device[] zzdn(int paramInt)
  {
    return new Device[paramInt];
  }
}