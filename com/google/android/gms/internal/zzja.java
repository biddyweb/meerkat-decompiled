package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzja
  implements Parcelable.Creator<zziz>
{
  static void zza(zziz paramzziz, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzziz.name, false);
    zzb.zzc(paramParcel, 1000, paramzziz.zzFG);
    zzb.zza(paramParcel, 2, paramzziz.zzGh, false);
    zzb.zza(paramParcel, 3, paramzziz.zzGi);
    zzb.zzc(paramParcel, 4, paramzziz.weight);
    zzb.zza(paramParcel, 5, paramzziz.zzGj);
    zzb.zza(paramParcel, 6, paramzziz.zzGk, false);
    zzb.zza(paramParcel, 7, paramzziz.zzGl, paramInt, false);
    zzb.zza(paramParcel, 8, paramzziz.zzGm, false);
    zzb.zza(paramParcel, 11, paramzziz.zzGn, false);
    zzb.zzH(paramParcel, i);
  }

  public zziz[] zzX(int paramInt)
  {
    return new zziz[paramInt];
  }

  public zziz zzr(Parcel paramParcel)
  {
    boolean bool1 = false;
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 1;
    int[] arrayOfInt = null;
    zzit[] arrayOfzzit = null;
    String str2 = null;
    boolean bool2 = false;
    String str3 = null;
    String str4 = null;
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
        str4 = zza.zzo(paramParcel, m);
        break;
      case 1000:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        str3 = zza.zzo(paramParcel, m);
        break;
      case 3:
        bool2 = zza.zzc(paramParcel, m);
        break;
      case 4:
        j = zza.zzg(paramParcel, m);
        break;
      case 5:
        bool1 = zza.zzc(paramParcel, m);
        break;
      case 6:
        str2 = zza.zzo(paramParcel, m);
        break;
      case 7:
        arrayOfzzit = (zzit[])zza.zzb(paramParcel, m, zzit.CREATOR);
        break;
      case 8:
        arrayOfInt = zza.zzu(paramParcel, m);
        break;
      case 11:
        str1 = zza.zzo(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zziz(k, str4, str3, bool2, j, bool1, str2, arrayOfzzit, arrayOfInt, str1);
  }
}