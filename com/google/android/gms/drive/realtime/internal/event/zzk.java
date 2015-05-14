package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzk
  implements Parcelable.Creator<ValuesSetDetails>
{
  static void zza(ValuesSetDetails paramValuesSetDetails, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramValuesSetDetails.zzFG);
    zzb.zzc(paramParcel, 2, paramValuesSetDetails.mIndex);
    zzb.zzc(paramParcel, 3, paramValuesSetDetails.zzXf);
    zzb.zzc(paramParcel, 4, paramValuesSetDetails.zzXg);
    zzb.zzH(paramParcel, i);
  }

  public ValuesSetDetails zzbI(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    int k = 0;
    int m = 0;
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
        m = zza.zzg(paramParcel, i1);
        break;
      case 3:
        k = zza.zzg(paramParcel, i1);
        break;
      case 4:
        i = zza.zzg(paramParcel, i1);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new ValuesSetDetails(n, m, k, i);
  }

  public ValuesSetDetails[] zzdc(int paramInt)
  {
    return new ValuesSetDetails[paramInt];
  }
}