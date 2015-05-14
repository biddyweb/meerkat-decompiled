package com.google.android.gms.internal;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zziw
  implements Parcelable.Creator<zziv.zza>
{
  static void zza(zziv.zza paramzza, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzza.zzFY, paramInt, false);
    zzb.zzc(paramParcel, 1000, paramzza.zzFG);
    zzb.zza(paramParcel, 2, paramzza.zzFZ);
    zzb.zza(paramParcel, 3, paramzza.zzGa);
    zzb.zza(paramParcel, 4, paramzza.zzGb);
    zzb.zzH(paramParcel, i);
  }

  public zziv.zza[] zzT(int paramInt)
  {
    return new zziv.zza[paramInt];
  }

  public zziv.zza zzp(Parcel paramParcel)
  {
    boolean bool1 = false;
    int i = zza.zzJ(paramParcel);
    Account localAccount = null;
    boolean bool2 = false;
    boolean bool3 = false;
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
        localAccount = (Account)zza.zza(paramParcel, k, Account.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        bool3 = zza.zzc(paramParcel, k);
        break;
      case 3:
        bool2 = zza.zzc(paramParcel, k);
        break;
      case 4:
        bool1 = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zziv.zza(j, localAccount, bool3, bool2, bool1);
  }
}