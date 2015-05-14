package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.ChangeSequenceNumber;
import com.google.android.gms.drive.DriveId;
import java.util.ArrayList;

public class zzao
  implements Parcelable.Creator<OnChangesResponse>
{
  static void zza(OnChangesResponse paramOnChangesResponse, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramOnChangesResponse.zzFG);
    zzb.zza(paramParcel, 2, paramOnChangesResponse.zzUL, paramInt, false);
    zzb.zzc(paramParcel, 3, paramOnChangesResponse.zzUM, false);
    zzb.zza(paramParcel, 4, paramOnChangesResponse.zzUN, paramInt, false);
    zzb.zza(paramParcel, 5, paramOnChangesResponse.zzUO);
    zzb.zzH(paramParcel, i);
  }

  public OnChangesResponse zzaB(Parcel paramParcel)
  {
    boolean bool = false;
    ChangeSequenceNumber localChangeSequenceNumber = null;
    int i = zza.zzJ(paramParcel);
    ArrayList localArrayList = null;
    DataHolder localDataHolder = null;
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
        localDataHolder = (DataHolder)zza.zza(paramParcel, k, DataHolder.CREATOR);
        break;
      case 3:
        localArrayList = zza.zzc(paramParcel, k, DriveId.CREATOR);
        break;
      case 4:
        localChangeSequenceNumber = (ChangeSequenceNumber)zza.zza(paramParcel, k, ChangeSequenceNumber.CREATOR);
        break;
      case 5:
        bool = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new OnChangesResponse(j, localDataHolder, localArrayList, localChangeSequenceNumber, bool);
  }

  public OnChangesResponse[] zzbU(int paramInt)
  {
    return new OnChangesResponse[paramInt];
  }
}