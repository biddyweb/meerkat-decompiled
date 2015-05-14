package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzux
  implements Parcelable.Creator<zzuw>
{
  static void zza(zzuw paramzzuw, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzuw.zzFG);
    zzb.zza(paramParcel, 2, paramzzuw.zzawX);
    zzb.zzc(paramParcel, 3, paramzzuw.zzawY, false);
    zzb.zzH(paramParcel, i);
  }

  public zzuw zzeN(Parcel paramParcel)
  {
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    ArrayList localArrayList = null;
    int j = 0;
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
        bool = zza.zzc(paramParcel, k);
        break;
      case 3:
        localArrayList = zza.zzc(paramParcel, k, Scope.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzuw(j, bool, localArrayList);
  }

  public zzuw[] zzha(int paramInt)
  {
    return new zzuw[paramInt];
  }
}