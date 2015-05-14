package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.DriveId;

public class zzbd
  implements Parcelable.Creator<OpenContentsRequest>
{
  static void zza(OpenContentsRequest paramOpenContentsRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramOpenContentsRequest.zzFG);
    zzb.zza(paramParcel, 2, paramOpenContentsRequest.zzTh, paramInt, false);
    zzb.zzc(paramParcel, 3, paramOpenContentsRequest.zzRW);
    zzb.zzc(paramParcel, 4, paramOpenContentsRequest.zzVb);
    zzb.zzH(paramParcel, i);
  }

  public OpenContentsRequest zzaQ(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    Object localObject1 = null;
    int k = 0;
    int m = 0;
    if (paramParcel.dataPosition() < j)
    {
      int n = zza.zzI(paramParcel);
      int i1;
      int i2;
      Object localObject2;
      int i3;
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        i1 = i;
        i2 = k;
        localObject2 = localObject1;
        i3 = m;
      case 1:
      case 2:
      case 3:
      case 4:
      }
      while (true)
      {
        m = i3;
        localObject1 = localObject2;
        k = i2;
        i = i1;
        break;
        int i7 = zza.zzg(paramParcel, n);
        int i8 = i;
        i2 = k;
        localObject2 = localObject1;
        i3 = i7;
        i1 = i8;
        continue;
        DriveId localDriveId = (DriveId)zza.zza(paramParcel, n, DriveId.CREATOR);
        i3 = m;
        int i6 = k;
        localObject2 = localDriveId;
        i1 = i;
        i2 = i6;
        continue;
        int i4 = zza.zzg(paramParcel, n);
        localObject2 = localObject1;
        i3 = m;
        int i5 = i;
        i2 = i4;
        i1 = i5;
        continue;
        i1 = zza.zzg(paramParcel, n);
        i2 = k;
        localObject2 = localObject1;
        i3 = m;
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new OpenContentsRequest(m, localObject1, k, i);
  }

  public OpenContentsRequest[] zzcj(int paramInt)
  {
    return new OpenContentsRequest[paramInt];
  }
}