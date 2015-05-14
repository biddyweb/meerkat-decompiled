package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzsj
  implements Parcelable.Creator<zzsi>
{
  static void zza(zzsi paramzzsi, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzsi.getVersionCode());
    zzb.zzc(paramParcel, 2, paramzzsi.getContentType());
    zzb.zza(paramParcel, 3, paramzzsi.getUri(), false);
    zzb.zza(paramParcel, 4, paramzzsi.getMimeType(), false);
    zzb.zza(paramParcel, 5, paramzzsi.getDomain(), false);
    zzb.zza(paramParcel, 6, paramzzsi.getType(), false);
    zzb.zza(paramParcel, 7, paramzzsi.getPayload(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzsi zzes(Parcel paramParcel)
  {
    int i = 0;
    byte[] arrayOfByte = null;
    int j = zza.zzJ(paramParcel);
    String str1 = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        i = zza.zzg(paramParcel, m);
        break;
      case 3:
        str4 = zza.zzo(paramParcel, m);
        break;
      case 4:
        str3 = zza.zzo(paramParcel, m);
        break;
      case 5:
        str2 = zza.zzo(paramParcel, m);
        break;
      case 6:
        str1 = zza.zzo(paramParcel, m);
        break;
      case 7:
        arrayOfByte = zza.zzr(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzsi(k, i, str4, str3, str2, str1, arrayOfByte);
  }

  public zzsi[] zzgE(int paramInt)
  {
    return new zzsi[paramInt];
  }
}