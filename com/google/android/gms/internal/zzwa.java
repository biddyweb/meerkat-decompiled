package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzwa
  implements Parcelable.Creator<zzvz>
{
  static void zza(zzvz paramzzvz, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzvz.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzvz.zzaEr, false);
    zzb.zza(paramParcel, 3, paramzzvz.zzaEs, false);
    zzb.zzH(paramParcel, i);
  }

  public zzvz zzfe(Parcel paramParcel)
  {
    String[] arrayOfString = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    byte[][] arrayOfByte = (byte[][])null;
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
        arrayOfString = zza.zzA(paramParcel, k);
        break;
      case 3:
        arrayOfByte = zza.zzs(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzvz(j, arrayOfString, arrayOfByte);
  }

  public zzvz[] zzhB(int paramInt)
  {
    return new zzvz[paramInt];
  }
}