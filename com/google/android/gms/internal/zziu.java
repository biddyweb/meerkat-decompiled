package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zziu
  implements Parcelable.Creator<zzit>
{
  static void zza(zzit paramzzit, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzit.id);
    zzb.zzc(paramParcel, 1000, paramzzit.zzFG);
    zzb.zza(paramParcel, 2, paramzzit.zzFX, false);
    zzb.zzH(paramParcel, i);
  }

  public zzit[] zzS(int paramInt)
  {
    return new zzit[paramInt];
  }

  public zzit zzo(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    Bundle localBundle = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        i = zza.zzg(paramParcel, m);
        break;
      case 1000:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        localBundle = zza.zzq(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzit(k, i, localBundle);
  }
}