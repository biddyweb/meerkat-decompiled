package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzk
  implements Parcelable.Creator<MatchAllFilter>
{
  static void zza(MatchAllFilter paramMatchAllFilter, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1000, paramMatchAllFilter.zzFG);
    zzb.zzH(paramParcel, i);
  }

  public MatchAllFilter zzbr(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new MatchAllFilter(j);
  }

  public MatchAllFilter[] zzcK(int paramInt)
  {
    return new MatchAllFilter[paramInt];
  }
}