package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzf
  implements Parcelable.Creator<zze>
{
  static void zza(zze paramzze, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzze.zzFG);
    zzb.zzc(paramParcel, 2, paramzze.getId());
    zzb.zza(paramParcel, 3, paramzze.zznE(), false);
    zzb.zza(paramParcel, 4, paramzze.zzvb(), false);
    zzb.zza(paramParcel, 5, paramzze.zzvc(), false);
    zzb.zza(paramParcel, 6, paramzze.getTitle(), false);
    zzb.zza(paramParcel, 7, paramzze.zzmV(), false);
    zzb.zza(paramParcel, 8, paramzze.getDisplayName(), false);
    zzb.zza(paramParcel, 9, paramzze.zzvd());
    zzb.zza(paramParcel, 10, paramzze.zzve());
    zzb.zza(paramParcel, 11, paramzze.zzvf());
    zzb.zza(paramParcel, 12, paramzze.zzvg());
    zzb.zzH(paramParcel, i);
  }

  public zze zzfv(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    int k = 0;
    String str1 = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    String str6 = null;
    byte b1 = 0;
    byte b2 = 0;
    byte b3 = 0;
    byte b4 = 0;
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
      case 2:
        k = zza.zzg(paramParcel, m);
        break;
      case 3:
        str1 = zza.zzo(paramParcel, m);
        break;
      case 4:
        str2 = zza.zzo(paramParcel, m);
        break;
      case 5:
        str3 = zza.zzo(paramParcel, m);
        break;
      case 6:
        str4 = zza.zzo(paramParcel, m);
        break;
      case 7:
        str5 = zza.zzo(paramParcel, m);
        break;
      case 8:
        str6 = zza.zzo(paramParcel, m);
        break;
      case 9:
        b1 = zza.zze(paramParcel, m);
        break;
      case 10:
        b2 = zza.zze(paramParcel, m);
        break;
      case 11:
        b3 = zza.zze(paramParcel, m);
        break;
      case 12:
        b4 = zza.zze(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zze(j, k, str1, str2, str3, str4, str5, str6, b1, b2, b3, b4);
  }

  public zze[] zzhV(int paramInt)
  {
    return new zze[paramInt];
  }
}