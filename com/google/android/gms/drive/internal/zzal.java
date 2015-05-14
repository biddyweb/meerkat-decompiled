package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.DriveId;

public class zzal
  implements Parcelable.Creator<LoadRealtimeRequest>
{
  static void zza(LoadRealtimeRequest paramLoadRealtimeRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramLoadRealtimeRequest.zzFG);
    zzb.zza(paramParcel, 2, paramLoadRealtimeRequest.zzRX, paramInt, false);
    zzb.zza(paramParcel, 3, paramLoadRealtimeRequest.zzUD);
    zzb.zzb(paramParcel, 4, paramLoadRealtimeRequest.zzUE, false);
    zzb.zzH(paramParcel, i);
  }

  public LoadRealtimeRequest zzaA(Parcel paramParcel)
  {
    Object localObject1 = null;
    boolean bool1 = false;
    int i = zza.zzJ(paramParcel);
    Object localObject2 = null;
    int j = 0;
    if (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      Object localObject3;
      boolean bool2;
      Object localObject4;
      int m;
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        localObject3 = localObject1;
        bool2 = bool1;
        localObject4 = localObject2;
        m = j;
      case 1:
      case 2:
      case 3:
      case 4:
      }
      while (true)
      {
        j = m;
        localObject2 = localObject4;
        bool1 = bool2;
        localObject1 = localObject3;
        break;
        int n = zza.zzg(paramParcel, k);
        Object localObject6 = localObject1;
        bool2 = bool1;
        localObject4 = localObject2;
        m = n;
        localObject3 = localObject6;
        continue;
        DriveId localDriveId = (DriveId)zza.zza(paramParcel, k, DriveId.CREATOR);
        m = j;
        boolean bool4 = bool1;
        localObject4 = localDriveId;
        localObject3 = localObject1;
        bool2 = bool4;
        continue;
        boolean bool3 = zza.zzc(paramParcel, k);
        localObject4 = localObject2;
        m = j;
        Object localObject5 = localObject1;
        bool2 = bool3;
        localObject3 = localObject5;
        continue;
        localObject3 = zza.zzC(paramParcel, k);
        bool2 = bool1;
        localObject4 = localObject2;
        m = j;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new LoadRealtimeRequest(j, localObject2, bool1, localObject1);
  }

  public LoadRealtimeRequest[] zzbT(int paramInt)
  {
    return new LoadRealtimeRequest[paramInt];
  }
}