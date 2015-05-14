package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzh
  implements Parcelable.Creator<CreateContentsRequest>
{
  static void zza(CreateContentsRequest paramCreateContentsRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramCreateContentsRequest.zzFG);
    zzb.zzc(paramParcel, 2, paramCreateContentsRequest.zzRW);
    zzb.zzH(paramParcel, i);
  }

  public CreateContentsRequest zzao(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    int k = 536870912;
    while (paramParcel.dataPosition() < i)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        j = zza.zzg(paramParcel, m);
        break;
      case 2:
        k = zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new CreateContentsRequest(j, k);
  }

  public CreateContentsRequest[] zzbC(int paramInt)
  {
    return new CreateContentsRequest[paramInt];
  }
}