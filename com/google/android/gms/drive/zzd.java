package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzd
  implements Parcelable.Creator<DriveId>
{
  static void zza(DriveId paramDriveId, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramDriveId.zzFG);
    zzb.zza(paramParcel, 2, paramDriveId.zzSh, false);
    zzb.zza(paramParcel, 3, paramDriveId.zzSi);
    zzb.zza(paramParcel, 4, paramDriveId.zzRS);
    zzb.zzc(paramParcel, 5, paramDriveId.zzSj);
    zzb.zzH(paramParcel, i);
  }

  public DriveId zzX(Parcel paramParcel)
  {
    long l1 = 0L;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str = null;
    int k = -1;
    long l2 = l1;
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
        l2 = zza.zzi(paramParcel, m);
        break;
      case 4:
        l1 = zza.zzi(paramParcel, m);
        break;
      case 5:
        k = zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new DriveId(j, str, l2, l1, k);
  }

  public DriveId[] zzbi(int paramInt)
  {
    return new DriveId[paramInt];
  }
}