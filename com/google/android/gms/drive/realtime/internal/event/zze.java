package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zze
  implements Parcelable.Creator<ReferenceShiftedDetails>
{
  static void zza(ReferenceShiftedDetails paramReferenceShiftedDetails, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramReferenceShiftedDetails.zzFG);
    zzb.zza(paramParcel, 2, paramReferenceShiftedDetails.zzXy, false);
    zzb.zza(paramParcel, 3, paramReferenceShiftedDetails.zzXz, false);
    zzb.zzc(paramParcel, 4, paramReferenceShiftedDetails.zzXA);
    zzb.zzc(paramParcel, 5, paramReferenceShiftedDetails.zzXB);
    zzb.zzH(paramParcel, i);
  }

  public ReferenceShiftedDetails zzbC(Parcel paramParcel)
  {
    String str1 = null;
    int i = 0;
    int j = zza.zzJ(paramParcel);
    int k = 0;
    String str2 = null;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        str2 = zza.zzo(paramParcel, n);
        break;
      case 3:
        str1 = zza.zzo(paramParcel, n);
        break;
      case 4:
        k = zza.zzg(paramParcel, n);
        break;
      case 5:
        i = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new ReferenceShiftedDetails(m, str2, str1, k, i);
  }

  public ReferenceShiftedDetails[] zzcW(int paramInt)
  {
    return new ReferenceShiftedDetails[paramInt];
  }
}