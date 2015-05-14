package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class zzbp
  implements Parcelable.Creator<UpdateMetadataRequest>
{
  static void zza(UpdateMetadataRequest paramUpdateMetadataRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramUpdateMetadataRequest.zzFG);
    zzb.zza(paramParcel, 2, paramUpdateMetadataRequest.zzTh, paramInt, false);
    zzb.zza(paramParcel, 3, paramUpdateMetadataRequest.zzTi, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public UpdateMetadataRequest zzba(Parcel paramParcel)
  {
    Object localObject1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Object localObject2 = null;
    if (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      Object localObject3;
      Object localObject4;
      int m;
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        localObject3 = localObject1;
        localObject4 = localObject2;
        m = j;
      case 1:
      case 2:
      case 3:
      }
      while (true)
      {
        j = m;
        localObject2 = localObject4;
        localObject1 = localObject3;
        break;
        int n = zza.zzg(paramParcel, k);
        Object localObject5 = localObject1;
        localObject4 = localObject2;
        m = n;
        localObject3 = localObject5;
        continue;
        DriveId localDriveId = (DriveId)zza.zza(paramParcel, k, DriveId.CREATOR);
        m = j;
        localObject3 = localObject1;
        localObject4 = localDriveId;
        continue;
        localObject3 = (MetadataBundle)zza.zza(paramParcel, k, MetadataBundle.CREATOR);
        localObject4 = localObject2;
        m = j;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new UpdateMetadataRequest(j, localObject2, localObject1);
  }

  public UpdateMetadataRequest[] zzct(int paramInt)
  {
    return new UpdateMetadataRequest[paramInt];
  }
}