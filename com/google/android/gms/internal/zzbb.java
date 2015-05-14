package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzbb
  implements Parcelable.Creator<zzba>
{
  static void zza(zzba paramzzba, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzba.versionCode);
    zzb.zza(paramParcel, 2, paramzzba.zzpa, false);
    zzb.zzc(paramParcel, 3, paramzzba.height);
    zzb.zzc(paramParcel, 4, paramzzba.heightPixels);
    zzb.zza(paramParcel, 5, paramzzba.zzpb);
    zzb.zzc(paramParcel, 6, paramzzba.width);
    zzb.zzc(paramParcel, 7, paramzzba.widthPixels);
    zzb.zza(paramParcel, 8, paramzzba.zzpc, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzba zzc(Parcel paramParcel)
  {
    zzba[] arrayOfzzba = null;
    int i = 0;
    int j = zza.zzJ(paramParcel);
    int k = 0;
    boolean bool = false;
    int m = 0;
    int n = 0;
    String str = null;
    int i1 = 0;
    while (paramParcel.dataPosition() < j)
    {
      int i2 = zza.zzI(paramParcel);
      switch (zza.zzaP(i2))
      {
      default:
        zza.zzb(paramParcel, i2);
        break;
      case 1:
        i1 = zza.zzg(paramParcel, i2);
        break;
      case 2:
        str = zza.zzo(paramParcel, i2);
        break;
      case 3:
        n = zza.zzg(paramParcel, i2);
        break;
      case 4:
        m = zza.zzg(paramParcel, i2);
        break;
      case 5:
        bool = zza.zzc(paramParcel, i2);
        break;
      case 6:
        k = zza.zzg(paramParcel, i2);
        break;
      case 7:
        i = zza.zzg(paramParcel, i2);
        break;
      case 8:
        arrayOfzzba = (zzba[])zza.zzb(paramParcel, i2, zzba.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzba(i1, str, n, m, bool, k, i, arrayOfzzba);
  }

  public zzba[] zzg(int paramInt)
  {
    return new zzba[paramInt];
  }
}