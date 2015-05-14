package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzh
  implements Parcelable.Creator<RealtimeDocumentSyncRequest>
{
  static void zza(RealtimeDocumentSyncRequest paramRealtimeDocumentSyncRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramRealtimeDocumentSyncRequest.zzFG);
    zzb.zzb(paramParcel, 2, paramRealtimeDocumentSyncRequest.zzSB, false);
    zzb.zzb(paramParcel, 3, paramRealtimeDocumentSyncRequest.zzSC, false);
    zzb.zzH(paramParcel, i);
  }

  public RealtimeDocumentSyncRequest zzaa(Parcel paramParcel)
  {
    ArrayList localArrayList1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList2 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        localArrayList2 = zza.zzC(paramParcel, k);
        break;
      case 3:
        localArrayList1 = zza.zzC(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new RealtimeDocumentSyncRequest(j, localArrayList2, localArrayList1);
  }

  public RealtimeDocumentSyncRequest[] zzbn(int paramInt)
  {
    return new RealtimeDocumentSyncRequest[paramInt];
  }
}