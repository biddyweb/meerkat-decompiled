package com.google.android.gms.internal;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzio
  implements Parcelable.Creator<zzin>
{
  static void zza(zzin paramzzin, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzin.zzFH, paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzzin.zzFG);
    zzb.zza(paramParcel, 2, paramzzin.zzFI, false);
    zzb.zza(paramParcel, 3, paramzzin.zzFJ);
    zzb.zza(paramParcel, 4, paramzzin.account, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzin[] zzP(int paramInt)
  {
    return new zzin[paramInt];
  }

  public zzin zzl(Parcel paramParcel)
  {
    boolean bool = false;
    Account localAccount = null;
    int i = zza.zzJ(paramParcel);
    String str = null;
    zzir[] arrayOfzzir = null;
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        arrayOfzzir = (zzir[])zza.zzb(paramParcel, k, zzir.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str = zza.zzo(paramParcel, k);
        break;
      case 3:
        bool = zza.zzc(paramParcel, k);
        break;
      case 4:
        localAccount = (Account)zza.zza(paramParcel, k, Account.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzin(j, arrayOfzzir, str, bool, localAccount);
  }
}