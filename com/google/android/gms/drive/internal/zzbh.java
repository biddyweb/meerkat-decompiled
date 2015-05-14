package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.DriveId;

public class zzbh
  implements Parcelable.Creator<RemoveEventListenerRequest>
{
  static void zza(RemoveEventListenerRequest paramRemoveEventListenerRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramRemoveEventListenerRequest.zzFG);
    zzb.zza(paramParcel, 2, paramRemoveEventListenerRequest.zzRX, paramInt, false);
    zzb.zzc(paramParcel, 3, paramRemoveEventListenerRequest.zzTe);
    zzb.zzH(paramParcel, i);
  }

  public RemoveEventListenerRequest zzaT(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    Object localObject1 = null;
    int k = 0;
    if (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      int n;
      Object localObject2;
      int i1;
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        n = i;
        localObject2 = localObject1;
        i1 = k;
      case 1:
      case 2:
      case 3:
      }
      while (true)
      {
        k = i1;
        localObject1 = localObject2;
        i = n;
        break;
        int i2 = zza.zzg(paramParcel, m);
        int i3 = i;
        localObject2 = localObject1;
        i1 = i2;
        n = i3;
        continue;
        DriveId localDriveId = (DriveId)zza.zza(paramParcel, m, DriveId.CREATOR);
        i1 = k;
        n = i;
        localObject2 = localDriveId;
        continue;
        n = zza.zzg(paramParcel, m);
        localObject2 = localObject1;
        i1 = k;
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new RemoveEventListenerRequest(k, localObject1, i);
  }

  public RemoveEventListenerRequest[] zzcm(int paramInt)
  {
    return new RemoveEventListenerRequest[paramInt];
  }
}