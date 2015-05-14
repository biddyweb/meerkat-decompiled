package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zza
  implements Parcelable.Creator<Address>
{
  static void zza(Address paramAddress, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramAddress.getVersionCode());
    zzb.zza(paramParcel, 2, paramAddress.name, false);
    zzb.zza(paramParcel, 3, paramAddress.zzalu, false);
    zzb.zza(paramParcel, 4, paramAddress.zzalv, false);
    zzb.zza(paramParcel, 5, paramAddress.zzalw, false);
    zzb.zza(paramParcel, 6, paramAddress.zzyc, false);
    zzb.zza(paramParcel, 7, paramAddress.zzaCP, false);
    zzb.zza(paramParcel, 8, paramAddress.zzaCQ, false);
    zzb.zza(paramParcel, 9, paramAddress.zzalB, false);
    zzb.zza(paramParcel, 10, paramAddress.zzalD, false);
    zzb.zza(paramParcel, 11, paramAddress.zzalE);
    zzb.zza(paramParcel, 12, paramAddress.zzalF, false);
    zzb.zzH(paramParcel, i);
  }

  public Address zzeO(Parcel paramParcel)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    String str6 = null;
    String str7 = null;
    String str8 = null;
    String str9 = null;
    boolean bool = false;
    String str10 = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = com.google.android.gms.common.internal.safeparcel.zza.zzI(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzaP(k))
      {
      default:
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, k);
        break;
      case 1:
        j = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, k);
        break;
      case 2:
        str1 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 3:
        str2 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 4:
        str3 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 5:
        str4 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 6:
        str5 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 7:
        str6 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 8:
        str7 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 9:
        str8 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 10:
        str9 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
        break;
      case 11:
        bool = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, k);
        break;
      case 12:
        str10 = com.google.android.gms.common.internal.safeparcel.zza.zzo(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new Address(j, str1, str2, str3, str4, str5, str6, str7, str8, str9, bool, str10);
  }

  public Address[] zzhl(int paramInt)
  {
    return new Address[paramInt];
  }
}