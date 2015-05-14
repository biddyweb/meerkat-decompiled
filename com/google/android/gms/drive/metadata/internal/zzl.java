package com.google.android.gms.drive.metadata.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzl
  implements Parcelable.Creator<PartialDriveId>
{
  static void zza(PartialDriveId paramPartialDriveId, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramPartialDriveId.zzFG);
    zzb.zza(paramParcel, 2, paramPartialDriveId.zzSh, false);
    zzb.zza(paramParcel, 3, paramPartialDriveId.zzSi);
    zzb.zzc(paramParcel, 4, paramPartialDriveId.zzSj);
    zzb.zzH(paramParcel, i);
  }

  public PartialDriveId zzbg(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str = null;
    long l = 0L;
    int k = -1;
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
        str = zza.zzo(paramParcel, m);
        break;
      case 3:
        l = zza.zzi(paramParcel, m);
        break;
      case 4:
        k = zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new PartialDriveId(j, str, l, k);
  }

  public PartialDriveId[] zzcz(int paramInt)
  {
    return new PartialDriveId[paramInt];
  }
}