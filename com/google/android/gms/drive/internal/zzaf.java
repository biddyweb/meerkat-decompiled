package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.DriveId;

public class zzaf
  implements Parcelable.Creator<GetMetadataRequest>
{
  static void zza(GetMetadataRequest paramGetMetadataRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramGetMetadataRequest.zzFG);
    zzb.zza(paramParcel, 2, paramGetMetadataRequest.zzTh, paramInt, false);
    zzb.zza(paramParcel, 3, paramGetMetadataRequest.zzUB);
    zzb.zzH(paramParcel, i);
  }

  public GetMetadataRequest zzay(Parcel paramParcel)
  {
    boolean bool1 = false;
    int i = zza.zzJ(paramParcel);
    Object localObject1 = null;
    int j = 0;
    if (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      boolean bool2;
      Object localObject2;
      int m;
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        bool2 = bool1;
        localObject2 = localObject1;
        m = j;
      case 1:
      case 2:
      case 3:
      }
      while (true)
      {
        j = m;
        localObject1 = localObject2;
        bool1 = bool2;
        break;
        int n = zza.zzg(paramParcel, k);
        boolean bool3 = bool1;
        localObject2 = localObject1;
        m = n;
        bool2 = bool3;
        continue;
        DriveId localDriveId = (DriveId)zza.zza(paramParcel, k, DriveId.CREATOR);
        m = j;
        bool2 = bool1;
        localObject2 = localDriveId;
        continue;
        bool2 = zza.zzc(paramParcel, k);
        localObject2 = localObject1;
        m = j;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new GetMetadataRequest(j, localObject1, bool1);
  }

  public GetMetadataRequest[] zzbR(int paramInt)
  {
    return new GetMetadataRequest[paramInt];
  }
}