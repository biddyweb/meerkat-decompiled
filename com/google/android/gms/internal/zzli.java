package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzli
  implements Parcelable.Creator<zzlh>
{
  static void zza(zzlh paramzzlh, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzlh.getVersionCode());
    zzb.zzc(paramParcel, 2, paramzzlh.zzjO(), false);
    zzb.zza(paramParcel, 3, paramzzlh.zzjP(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzlh zzR(Parcel paramParcel)
  {
    String str = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList = null;
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
        localArrayList = zza.zzc(paramParcel, k, zzlh.zza.CREATOR);
        break;
      case 3:
        str = zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzlh(j, localArrayList, str);
  }

  public zzlh[] zzaX(int paramInt)
  {
    return new zzlh[paramInt];
  }
}