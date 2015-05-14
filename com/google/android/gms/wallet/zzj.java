package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzj
  implements Parcelable.Creator<LineItem>
{
  static void zza(LineItem paramLineItem, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramLineItem.getVersionCode());
    zzb.zza(paramParcel, 2, paramLineItem.description, false);
    zzb.zza(paramParcel, 3, paramLineItem.zzaDt, false);
    zzb.zza(paramParcel, 4, paramLineItem.zzaDu, false);
    zzb.zza(paramParcel, 5, paramLineItem.zzaCR, false);
    zzb.zzc(paramParcel, 6, paramLineItem.zzaDv);
    zzb.zza(paramParcel, 7, paramLineItem.zzaCS, false);
    zzb.zzH(paramParcel, i);
  }

  public LineItem zzeW(Parcel paramParcel)
  {
    int i = 0;
    String str1 = null;
    int j = zza.zzJ(paramParcel);
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
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
        str5 = zza.zzo(paramParcel, m);
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
        i = zza.zzg(paramParcel, m);
        break;
      case 7:
        str1 = zza.zzo(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new LineItem(k, str5, str4, str3, str2, i, str1);
  }

  public LineItem[] zzht(int paramInt)
  {
    return new LineItem[paramInt];
  }
}