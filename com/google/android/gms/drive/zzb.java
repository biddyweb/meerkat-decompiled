package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;

public class zzb
  implements Parcelable.Creator<Contents>
{
  static void zza(Contents paramContents, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzK(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, paramContents.zzFG);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, paramContents.zzOx, paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 3, paramContents.zzRV);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 4, paramContents.zzRW);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 5, paramContents.zzRX, paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 7, paramContents.zzRY);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }

  public Contents zzW(Parcel paramParcel)
  {
    DriveId localDriveId = null;
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    int k = 0;
    ParcelFileDescriptor localParcelFileDescriptor = null;
    int m = 0;
    while (paramParcel.dataPosition() < i)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      case 6:
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        localParcelFileDescriptor = (ParcelFileDescriptor)zza.zza(paramParcel, n, ParcelFileDescriptor.CREATOR);
        break;
      case 3:
        k = zza.zzg(paramParcel, n);
        break;
      case 4:
        j = zza.zzg(paramParcel, n);
        break;
      case 5:
        localDriveId = (DriveId)zza.zza(paramParcel, n, DriveId.CREATOR);
        break;
      case 7:
        bool = zza.zzc(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new Contents(m, localParcelFileDescriptor, k, j, localDriveId, bool);
  }

  public Contents[] zzbh(int paramInt)
  {
    return new Contents[paramInt];
  }
}