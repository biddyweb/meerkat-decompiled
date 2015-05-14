package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.fitness.data.DataType;
import java.util.ArrayList;

public class zzol
  implements Parcelable.Creator<zzok>
{
  static void zza(zzok paramzzok, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzok.getDataTypes(), false);
    zzb.zzc(paramParcel, 1000, paramzzok.getVersionCode());
    zzb.zzH(paramParcel, i);
  }

  public zzok zzbZ(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localArrayList = zza.zzc(paramParcel, k, DataType.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzok(j, localArrayList);
  }

  public zzok[] zzdx(int paramInt)
  {
    return new zzok[paramInt];
  }
}