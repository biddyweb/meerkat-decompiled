package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;

public class zzb
  implements Parcelable.Creator<ObjectChangedDetails>
{
  static void zza(ObjectChangedDetails paramObjectChangedDetails, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzK(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, paramObjectChangedDetails.zzFG);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 2, paramObjectChangedDetails.zzXf);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 3, paramObjectChangedDetails.zzXg);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }

  public ObjectChangedDetails zzbz(Parcel paramParcel)
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
    return new ObjectChangedDetails(m, k, i);
  }

  public ObjectChangedDetails[] zzcT(int paramInt)
  {
    return new ObjectChangedDetails[paramInt];
  }
}