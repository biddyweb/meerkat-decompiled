package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class zzf
  implements Parcelable.Creator<CloseContentsAndUpdateMetadataRequest>
{
  static void zza(CloseContentsAndUpdateMetadataRequest paramCloseContentsAndUpdateMetadataRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramCloseContentsAndUpdateMetadataRequest.zzFG);
    zzb.zza(paramParcel, 2, paramCloseContentsAndUpdateMetadataRequest.zzTh, paramInt, false);
    zzb.zza(paramParcel, 3, paramCloseContentsAndUpdateMetadataRequest.zzTi, paramInt, false);
    zzb.zza(paramParcel, 4, paramCloseContentsAndUpdateMetadataRequest.zzTj, paramInt, false);
    zzb.zza(paramParcel, 5, paramCloseContentsAndUpdateMetadataRequest.zzSr);
    zzb.zza(paramParcel, 6, paramCloseContentsAndUpdateMetadataRequest.zzSq, false);
    zzb.zzc(paramParcel, 7, paramCloseContentsAndUpdateMetadataRequest.zzTk);
    zzb.zzH(paramParcel, i);
  }

  public CloseContentsAndUpdateMetadataRequest zzam(Parcel paramParcel)
  {
    int i = 0;
    String str = null;
    int j = zza.zzJ(paramParcel);
    boolean bool = false;
    Contents localContents = null;
    MetadataBundle localMetadataBundle = null;
    DriveId localDriveId = null;
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
        localDriveId = (DriveId)zza.zza(paramParcel, m, DriveId.CREATOR);
        break;
      case 3:
        localMetadataBundle = (MetadataBundle)zza.zza(paramParcel, m, MetadataBundle.CREATOR);
        break;
      case 4:
        localContents = (Contents)zza.zza(paramParcel, m, Contents.CREATOR);
        break;
      case 5:
        bool = zza.zzc(paramParcel, m);
        break;
      case 6:
        str = zza.zzo(paramParcel, m);
        break;
      case 7:
        i = zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new CloseContentsAndUpdateMetadataRequest(k, localDriveId, localMetadataBundle, localContents, bool, str, i);
  }

  public CloseContentsAndUpdateMetadataRequest[] zzbA(int paramInt)
  {
    return new CloseContentsAndUpdateMetadataRequest[paramInt];
  }
}