package com.google.android.gms.drive.query;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.drive.query.internal.FieldWithSortOrder;
import java.util.ArrayList;

public class zzb
  implements Parcelable.Creator<SortOrder>
{
  static void zza(SortOrder paramSortOrder, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzK(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1000, paramSortOrder.zzFG);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, paramSortOrder.zzWu, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, paramSortOrder.zzWv);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }

  public SortOrder zzbi(Parcel paramParcel)
  {
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    ArrayList localArrayList = null;
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
        localArrayList = zza.zzc(paramParcel, k, FieldWithSortOrder.CREATOR);
        break;
      case 2:
        bool = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new SortOrder(j, localArrayList, bool);
  }

  public SortOrder[] zzcB(int paramInt)
  {
    return new SortOrder[paramInt];
  }
}