package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.ChangeSequenceNumber;
import com.google.android.gms.drive.DriveSpace;

public class zzad
  implements Parcelable.Creator<GetChangesRequest>
{
  static void zza(GetChangesRequest paramGetChangesRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramGetChangesRequest.zzFG);
    zzb.zza(paramParcel, 2, paramGetChangesRequest.zzUv, paramInt, false);
    zzb.zzc(paramParcel, 3, paramGetChangesRequest.zzUw);
    zzb.zzc(paramParcel, 4, paramGetChangesRequest.zzUx, false);
    zzb.zzH(paramParcel, i);
  }

  public GetChangesRequest zzaw(Parcel paramParcel)
  {
    Object localObject1 = null;
    int i = 0;
    int j = zza.zzJ(paramParcel);
    Object localObject2 = null;
    int k = 0;
    if (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      Object localObject3;
      int n;
      Object localObject4;
      int i1;
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        localObject3 = localObject1;
        n = i;
        localObject4 = localObject2;
        i1 = k;
      case 1:
      case 2:
      case 3:
      case 4:
      }
      while (true)
      {
        k = i1;
        localObject2 = localObject4;
        i = n;
        localObject1 = localObject3;
        break;
        int i4 = zza.zzg(paramParcel, m);
        Object localObject6 = localObject1;
        n = i;
        localObject4 = localObject2;
        i1 = i4;
        localObject3 = localObject6;
        continue;
        ChangeSequenceNumber localChangeSequenceNumber = (ChangeSequenceNumber)zza.zza(paramParcel, m, ChangeSequenceNumber.CREATOR);
        i1 = k;
        int i3 = i;
        localObject4 = localChangeSequenceNumber;
        localObject3 = localObject1;
        n = i3;
        continue;
        int i2 = zza.zzg(paramParcel, m);
        localObject4 = localObject2;
        i1 = k;
        Object localObject5 = localObject1;
        n = i2;
        localObject3 = localObject5;
        continue;
        localObject3 = zza.zzc(paramParcel, m, DriveSpace.CREATOR);
        n = i;
        localObject4 = localObject2;
        i1 = k;
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new GetChangesRequest(k, localObject2, i, localObject1);
  }

  public GetChangesRequest[] zzbP(int paramInt)
  {
    return new GetChangesRequest[paramInt];
  }
}