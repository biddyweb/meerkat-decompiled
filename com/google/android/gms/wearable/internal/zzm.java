package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzm
  implements Parcelable.Creator<DataItemAssetParcelable>
{
  static void zza(DataItemAssetParcelable paramDataItemAssetParcelable, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramDataItemAssetParcelable.zzFG);
    zzb.zza(paramParcel, 2, paramDataItemAssetParcelable.getId(), false);
    zzb.zza(paramParcel, 3, paramDataItemAssetParcelable.getDataItemKey(), false);
    zzb.zzH(paramParcel, i);
  }

  public DataItemAssetParcelable zzfw(Parcel paramParcel)
  {
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str2 = null;
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
        str2 = zza.zzo(paramParcel, k);
        break;
      case 3:
        str1 = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new DataItemAssetParcelable(j, str2, str1);
  }

  public DataItemAssetParcelable[] zzhW(int paramInt)
  {
    return new DataItemAssetParcelable[paramInt];
  }
}