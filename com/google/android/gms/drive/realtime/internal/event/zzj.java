package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzj
  implements Parcelable.Creator<ValuesRemovedDetails>
{
  static void zza(ValuesRemovedDetails paramValuesRemovedDetails, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramValuesRemovedDetails.zzFG);
    zzb.zzc(paramParcel, 2, paramValuesRemovedDetails.mIndex);
    zzb.zzc(paramParcel, 3, paramValuesRemovedDetails.zzXf);
    zzb.zzc(paramParcel, 4, paramValuesRemovedDetails.zzXg);
    zzb.zza(paramParcel, 5, paramValuesRemovedDetails.zzXF, false);
    zzb.zzc(paramParcel, 6, paramValuesRemovedDetails.zzXG);
    zzb.zzH(paramParcel, i);
  }

  public ValuesRemovedDetails zzbH(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    String str = null;
    int k = 0;
    int m = 0;
    int n = 0;
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
        n = zza.zzg(paramParcel, i2);
        break;
      case 3:
        m = zza.zzg(paramParcel, i2);
        break;
      case 4:
        k = zza.zzg(paramParcel, i2);
        break;
      case 5:
        str = zza.zzo(paramParcel, i2);
        break;
      case 6:
        i = zza.zzg(paramParcel, i2);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new ValuesRemovedDetails(i1, n, m, k, str, i);
  }

  public ValuesRemovedDetails[] zzdb(int paramInt)
  {
    return new ValuesRemovedDetails[paramInt];
  }
}