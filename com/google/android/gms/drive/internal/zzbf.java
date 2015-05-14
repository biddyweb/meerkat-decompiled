package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.DriveId;

public class zzbf
  implements Parcelable.Creator<OpenFileIntentSenderRequest>
{
  static void zza(OpenFileIntentSenderRequest paramOpenFileIntentSenderRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramOpenFileIntentSenderRequest.zzFG);
    zzb.zza(paramParcel, 2, paramOpenFileIntentSenderRequest.zzSy, false);
    zzb.zza(paramParcel, 3, paramOpenFileIntentSenderRequest.zzSz, false);
    zzb.zza(paramParcel, 4, paramOpenFileIntentSenderRequest.zzSA, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public OpenFileIntentSenderRequest zzaR(Parcel paramParcel)
  {
    DriveId localDriveId = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String[] arrayOfString = null;
    String str = null;
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
        arrayOfString = zza.zzA(paramParcel, k);
        break;
      case 4:
        localDriveId = (DriveId)zza.zza(paramParcel, k, DriveId.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new OpenFileIntentSenderRequest(j, str, arrayOfString, localDriveId);
  }

  public OpenFileIntentSenderRequest[] zzck(int paramInt)
  {
    return new OpenFileIntentSenderRequest[paramInt];
  }
}