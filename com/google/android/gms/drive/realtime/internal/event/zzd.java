package com.google.android.gms.drive.realtime.internal.event;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzd
  implements Parcelable.Creator<ParcelableEventList>
{
  static void zza(ParcelableEventList paramParcelableEventList, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramParcelableEventList.zzFG);
    zzb.zzc(paramParcel, 2, paramParcelableEventList.zzmv, false);
    zzb.zza(paramParcel, 3, paramParcelableEventList.zzXv, paramInt, false);
    zzb.zza(paramParcel, 4, paramParcelableEventList.zzXw);
    zzb.zzb(paramParcel, 5, paramParcelableEventList.zzXx, false);
    zzb.zzH(paramParcel, i);
  }

  public ParcelableEventList zzbB(Parcel paramParcel)
  {
    boolean bool = false;
    ArrayList localArrayList1 = null;
    int i = zza.zzJ(paramParcel);
    DataHolder localDataHolder = null;
    ArrayList localArrayList2 = null;
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
        localArrayList2 = zza.zzc(paramParcel, k, ParcelableEvent.CREATOR);
        break;
      case 3:
        localDataHolder = (DataHolder)zza.zza(paramParcel, k, DataHolder.CREATOR);
        break;
      case 4:
        bool = zza.zzc(paramParcel, k);
        break;
      case 5:
        localArrayList1 = zza.zzC(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new ParcelableEventList(j, localArrayList2, localDataHolder, bool, localArrayList1);
  }

  public ParcelableEventList[] zzcV(int paramInt)
  {
    return new ParcelableEventList[paramInt];
  }
}