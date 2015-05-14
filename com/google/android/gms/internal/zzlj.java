package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzlj
  implements Parcelable.Creator<zzlh.zza>
{
  static void zza(zzlh.zza paramzza, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzza.versionCode);
    zzb.zza(paramParcel, 2, paramzza.className, false);
    zzb.zzc(paramParcel, 3, paramzza.zzRc, false);
    zzb.zzH(paramParcel, i);
  }

  public zzlh.zza zzS(Parcel paramParcel)
  {
    ArrayList localArrayList = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str = null;
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
        str = zza.zzo(paramParcel, k);
        break;
      case 3:
        localArrayList = zza.zzc(paramParcel, k, zzlh.zzb.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzlh.zza(j, str, localArrayList);
  }

  public zzlh.zza[] zzaY(int paramInt)
  {
    return new zzlh.zza[paramInt];
  }
}