package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzf
  implements Parcelable.Creator<TextDeletedDetails>
{
  static void zza(TextDeletedDetails paramTextDeletedDetails, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramTextDeletedDetails.zzFG);
    zzb.zzc(paramParcel, 2, paramTextDeletedDetails.mIndex);
    zzb.zzc(paramParcel, 3, paramTextDeletedDetails.zzXC);
    zzb.zzH(paramParcel, i);
  }

  public TextDeletedDetails zzbD(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    int k = 0;
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
        k = zza.zzg(paramParcel, n);
        break;
      case 3:
        i = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new TextDeletedDetails(m, k, i);
  }

  public TextDeletedDetails[] zzcX(int paramInt)
  {
    return new TextDeletedDetails[paramInt];
  }
}