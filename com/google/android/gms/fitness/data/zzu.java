package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzu
  implements Parcelable.Creator<Value>
{
  static void zza(Value paramValue, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramValue.getFormat());
    zzb.zzc(paramParcel, 1000, paramValue.getVersionCode());
    zzb.zza(paramParcel, 2, paramValue.isSet());
    zzb.zza(paramParcel, 3, paramValue.zzlL());
    zzb.zzH(paramParcel, i);
  }

  public Value zzbY(Parcel paramParcel)
  {
    boolean bool = false;
    int i = zza.zzJ(paramParcel);
    float f = 0.0F;
    int j = 0;
    int k = 0;
    while (paramParcel.dataPosition() < i)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        j = zza.zzg(paramParcel, m);
        break;
      case 1000:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        bool = zza.zzc(paramParcel, m);
        break;
      case 3:
        f = zza.zzl(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new Value(k, j, bool, f);
  }

  public Value[] zzdw(int paramInt)
  {
    return new Value[paramInt];
  }
}