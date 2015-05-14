package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzvy
  implements Parcelable.Creator<zzvx>
{
  static void zza(zzvx paramzzvx, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzvx.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzvx.zzaEq, false);
    zzb.zzH(paramParcel, i);
  }

  public zzvx zzfd(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    int[] arrayOfInt = null;
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
        arrayOfInt = zza.zzu(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzvx(j, arrayOfInt);
  }

  public zzvx[] zzhA(int paramInt)
  {
    return new zzvx[paramInt];
  }
}