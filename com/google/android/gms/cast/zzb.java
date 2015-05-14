package com.google.android.gms.cast;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.images.WebImage;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import java.util.ArrayList;

public class zzb
  implements Parcelable.Creator<CastDevice>
{
  static void zza(CastDevice paramCastDevice, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzK(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, paramCastDevice.getVersionCode());
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, paramCastDevice.getDeviceId(), false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 3, paramCastDevice.zzIF, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 4, paramCastDevice.getFriendlyName(), false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 5, paramCastDevice.getModelName(), false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 6, paramCastDevice.getDeviceVersion(), false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 7, paramCastDevice.getServicePort());
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 8, paramCastDevice.getIcons(), false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 9, paramCastDevice.getCapabilities());
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 10, paramCastDevice.getStatus());
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }

  public CastDevice[] zzad(int paramInt)
  {
    return new CastDevice[paramInt];
  }

  public CastDevice zzu(Parcel paramParcel)
  {
    int i = 0;
    ArrayList localArrayList = null;
    int j = zza.zzJ(paramParcel);
    int k = 0;
    int m = 0;
    String str1 = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    int n = 0;
    while (paramParcel.dataPosition() < j)
    {
      int i1 = zza.zzI(paramParcel);
      switch (zza.zzaP(i1))
      {
      default:
        zza.zzb(paramParcel, i1);
        break;
      case 1:
        n = zza.zzg(paramParcel, i1);
        break;
      case 2:
        str5 = zza.zzo(paramParcel, i1);
        break;
      case 3:
        str4 = zza.zzo(paramParcel, i1);
        break;
      case 4:
        str3 = zza.zzo(paramParcel, i1);
        break;
      case 5:
        str2 = zza.zzo(paramParcel, i1);
        break;
      case 6:
        str1 = zza.zzo(paramParcel, i1);
        break;
      case 7:
        m = zza.zzg(paramParcel, i1);
        break;
      case 8:
        localArrayList = zza.zzc(paramParcel, i1, WebImage.CREATOR);
        break;
      case 9:
        k = zza.zzg(paramParcel, i1);
        break;
      case 10:
        i = zza.zzg(paramParcel, i1);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new CastDevice(n, str5, str4, str3, str2, str1, m, localArrayList, k, i);
  }
}