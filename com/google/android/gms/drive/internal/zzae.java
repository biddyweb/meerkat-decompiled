package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzae
  implements Parcelable.Creator<GetDriveIdFromUniqueIdentifierRequest>
{
  static void zza(GetDriveIdFromUniqueIdentifierRequest paramGetDriveIdFromUniqueIdentifierRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramGetDriveIdFromUniqueIdentifierRequest.zzFG);
    zzb.zza(paramParcel, 2, paramGetDriveIdFromUniqueIdentifierRequest.zzUz, false);
    zzb.zza(paramParcel, 3, paramGetDriveIdFromUniqueIdentifierRequest.zzUA);
    zzb.zzH(paramParcel, i);
  }

  public GetDriveIdFromUniqueIdentifierRequest zzax(Parcel paramParcel)
  {
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    String str = null;
    int j = 0;
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
        str = zza.zzo(paramParcel, k);
        break;
      case 3:
        bool = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new GetDriveIdFromUniqueIdentifierRequest(j, str, bool);
  }

  public GetDriveIdFromUniqueIdentifierRequest[] zzbQ(int paramInt)
  {
    return new GetDriveIdFromUniqueIdentifierRequest[paramInt];
  }
}