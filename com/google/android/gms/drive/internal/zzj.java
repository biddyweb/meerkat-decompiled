package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class zzj
  implements Parcelable.Creator<CreateFileIntentSenderRequest>
{
  static void zza(CreateFileIntentSenderRequest paramCreateFileIntentSenderRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramCreateFileIntentSenderRequest.zzFG);
    zzb.zza(paramParcel, 2, paramCreateFileIntentSenderRequest.zzTp, paramInt, false);
    zzb.zzc(paramParcel, 3, paramCreateFileIntentSenderRequest.zzRV);
    zzb.zza(paramParcel, 4, paramCreateFileIntentSenderRequest.zzSy, false);
    zzb.zza(paramParcel, 5, paramCreateFileIntentSenderRequest.zzSA, paramInt, false);
    zzb.zza(paramParcel, 6, paramCreateFileIntentSenderRequest.zzTq, false);
    zzb.zzH(paramParcel, i);
  }

  public CreateFileIntentSenderRequest zzap(Parcel paramParcel)
  {
    int i = 0;
    Integer localInteger = null;
    int j = zza.zzJ(paramParcel);
    DriveId localDriveId = null;
    String str = null;
    MetadataBundle localMetadataBundle = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        localMetadataBundle = (MetadataBundle)zza.zza(paramParcel, m, MetadataBundle.CREATOR);
        break;
      case 3:
        i = zza.zzg(paramParcel, m);
        break;
      case 4:
        str = zza.zzo(paramParcel, m);
        break;
      case 5:
        localDriveId = (DriveId)zza.zza(paramParcel, m, DriveId.CREATOR);
        break;
      case 6:
        localInteger = zza.zzh(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new CreateFileIntentSenderRequest(k, localMetadataBundle, i, str, localDriveId, localInteger);
  }

  public CreateFileIntentSenderRequest[] zzbE(int paramInt)
  {
    return new CreateFileIntentSenderRequest[paramInt];
  }
}