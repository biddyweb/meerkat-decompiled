package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class zzk
  implements Parcelable.Creator<CreateFileRequest>
{
  static void zza(CreateFileRequest paramCreateFileRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramCreateFileRequest.zzFG);
    zzb.zza(paramParcel, 2, paramCreateFileRequest.zzTr, paramInt, false);
    zzb.zza(paramParcel, 3, paramCreateFileRequest.zzTp, paramInt, false);
    zzb.zza(paramParcel, 4, paramCreateFileRequest.zzTj, paramInt, false);
    zzb.zza(paramParcel, 5, paramCreateFileRequest.zzTq, false);
    zzb.zza(paramParcel, 6, paramCreateFileRequest.zzTs);
    zzb.zza(paramParcel, 7, paramCreateFileRequest.zzSq, false);
    zzb.zzc(paramParcel, 8, paramCreateFileRequest.zzTt);
    zzb.zzc(paramParcel, 9, paramCreateFileRequest.zzTu);
    zzb.zzH(paramParcel, i);
  }

  public CreateFileRequest zzaq(Parcel paramParcel)
  {
    int i = 0;
    String str = null;
    int j = zza.zzJ(paramParcel);
    int k = 0;
    boolean bool = false;
    Integer localInteger = null;
    Contents localContents = null;
    MetadataBundle localMetadataBundle = null;
    DriveId localDriveId = null;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        localDriveId = (DriveId)zza.zza(paramParcel, n, DriveId.CREATOR);
        break;
      case 3:
        localMetadataBundle = (MetadataBundle)zza.zza(paramParcel, n, MetadataBundle.CREATOR);
        break;
      case 4:
        localContents = (Contents)zza.zza(paramParcel, n, Contents.CREATOR);
        break;
      case 5:
        localInteger = zza.zzh(paramParcel, n);
        break;
      case 6:
        bool = zza.zzc(paramParcel, n);
        break;
      case 7:
        str = zza.zzo(paramParcel, n);
        break;
      case 8:
        k = zza.zzg(paramParcel, n);
        break;
      case 9:
        i = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new CreateFileRequest(m, localDriveId, localMetadataBundle, localContents, localInteger, bool, str, k, i);
  }

  public CreateFileRequest[] zzbF(int paramInt)
  {
    return new CreateFileRequest[paramInt];
  }
}