package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzc
  implements Parcelable.Creator<BleDevice>
{
  static void zza(BleDevice paramBleDevice, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramBleDevice.getAddress(), false);
    zzb.zzc(paramParcel, 1000, paramBleDevice.getVersionCode());
    zzb.zza(paramParcel, 2, paramBleDevice.getName(), false);
    zzb.zzb(paramParcel, 3, paramBleDevice.getSupportedProfiles(), false);
    zzb.zzc(paramParcel, 4, paramBleDevice.getDataTypes(), false);
    zzb.zzH(paramParcel, i);
  }

  public BleDevice zzbK(Parcel paramParcel)
  {
    ArrayList localArrayList1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList2 = null;
    String str1 = null;
    String str2 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str1 = zza.zzo(paramParcel, k);
        break;
      case 3:
        localArrayList2 = zza.zzC(paramParcel, k);
        break;
      case 4:
        localArrayList1 = zza.zzc(paramParcel, k, DataType.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new BleDevice(j, str2, str1, localArrayList2, localArrayList1);
  }

  public BleDevice[] zzdf(int paramInt)
  {
    return new BleDevice[paramInt];
  }
}