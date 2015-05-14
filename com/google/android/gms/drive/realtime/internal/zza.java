package com.google.android.gms.drive.realtime.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<BeginCompoundOperationRequest>
{
  static void zza(BeginCompoundOperationRequest paramBeginCompoundOperationRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramBeginCompoundOperationRequest.zzFG);
    zzb.zza(paramParcel, 2, paramBeginCompoundOperationRequest.zzWV);
    zzb.zza(paramParcel, 3, paramBeginCompoundOperationRequest.mName, false);
    zzb.zza(paramParcel, 4, paramBeginCompoundOperationRequest.zzWW);
    zzb.zzH(paramParcel, i);
  }

  public BeginCompoundOperationRequest zzbu(Parcel paramParcel)
  {
    boolean bool1 = false;
    int i = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    String str = null;
    boolean bool2 = true;
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = com.google.android.gms.common.internal.safeparcel.zza.zzI(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzaP(k))
      {
      default:
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, k);
        break;
      case 1:
        j = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, k);
        break;
      case 2:
        bool1 = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, k);
        break;
      case 3:
        str = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 4:
        bool2 = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new BeginCompoundOperationRequest(j, bool1, str, bool2);
  }

  public BeginCompoundOperationRequest[] zzcN(int paramInt)
  {
    return new BeginCompoundOperationRequest[paramInt];
  }
}