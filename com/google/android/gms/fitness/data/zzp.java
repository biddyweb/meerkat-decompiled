package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzp
  implements Parcelable.Creator<Session>
{
  static void zza(Session paramSession, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramSession.zzlp());
    zzb.zzc(paramParcel, 1000, paramSession.getVersionCode());
    zzb.zza(paramParcel, 2, paramSession.zzlq());
    zzb.zza(paramParcel, 3, paramSession.getName(), false);
    zzb.zza(paramParcel, 4, paramSession.getIdentifier(), false);
    zzb.zza(paramParcel, 5, paramSession.getDescription(), false);
    zzb.zzc(paramParcel, 7, paramSession.zzln());
    zzb.zza(paramParcel, 8, paramSession.zzlz(), paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public Session zzbV(Parcel paramParcel)
  {
    long l1 = 0L;
    int i = 0;
    zza localzza = null;
    int j = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    String str1 = null;
    String str2 = null;
    String str3 = null;
    long l2 = l1;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = com.google.android.gms.common.internal.safeparcel.zza.zzI(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzaP(m))
      {
      default:
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, m);
        break;
      case 1:
        l2 = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, m);
        break;
      case 1000:
        k = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
        break;
      case 2:
        l1 = com.google.android.gms.common.internal.safeparcel.zza.zzi(paramParcel, m);
        break;
      case 3:
        str3 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 4:
        str2 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 5:
        str1 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, m);
        break;
      case 7:
        i = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
        break;
      case 8:
        localzza = (zza)com.google.android.gms.common.internal.safeparcel.zza.zza(paramParcel, m, zza.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new Session(k, l2, l1, str3, str2, str1, i, localzza);
  }

  public Session[] zzdt(int paramInt)
  {
    return new Session[paramInt];
  }
}