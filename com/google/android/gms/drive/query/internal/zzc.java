package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzc
  implements Parcelable.Creator<FieldWithSortOrder>
{
  static void zza(FieldWithSortOrder paramFieldWithSortOrder, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1000, paramFieldWithSortOrder.zzFG);
    zzb.zza(paramParcel, 1, paramFieldWithSortOrder.zzVg, false);
    zzb.zza(paramParcel, 2, paramFieldWithSortOrder.zzWz);
    zzb.zzH(paramParcel, i);
  }

  public FieldWithSortOrder zzbl(Parcel paramParcel)
  {
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    String str = null;
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 1:
        str = zza.zzo(paramParcel, k);
        break;
      case 2:
        bool = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new FieldWithSortOrder(j, str, bool);
  }

  public FieldWithSortOrder[] zzcE(int paramInt)
  {
    return new FieldWithSortOrder[paramInt];
  }
}