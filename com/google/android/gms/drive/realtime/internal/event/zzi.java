package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzi
  implements Parcelable.Creator<ValuesAddedDetails>
{
  static void zza(ValuesAddedDetails paramValuesAddedDetails, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramValuesAddedDetails.zzFG);
    zzb.zzc(paramParcel, 2, paramValuesAddedDetails.mIndex);
    zzb.zzc(paramParcel, 3, paramValuesAddedDetails.zzXf);
    zzb.zzc(paramParcel, 4, paramValuesAddedDetails.zzXg);
    zzb.zza(paramParcel, 5, paramValuesAddedDetails.zzXD, false);
    zzb.zzc(paramParcel, 6, paramValuesAddedDetails.zzXE);
    zzb.zzH(paramParcel, i);
  }

  public ValuesAddedDetails zzbG(Parcel paramParcel)
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
    return new ValuesAddedDetails(i1, n, m, k, str, i);
  }

  public ValuesAddedDetails[] zzda(int paramInt)
  {
    return new ValuesAddedDetails[paramInt];
  }
}