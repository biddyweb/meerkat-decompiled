package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzj
  implements Parcelable.Creator<zzi>
{
  static void zza(zzi paramzzi, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzi.version);
    zzb.zzc(paramParcel, 2, paramzzi.zzPz);
    zzb.zzc(paramParcel, 3, paramzzi.zzPA);
    zzb.zza(paramParcel, 4, paramzzi.zzPB, false);
    zzb.zza(paramParcel, 5, paramzzi.zzPC, false);
    zzb.zza(paramParcel, 6, paramzzi.zzPD, paramInt, false);
    zzb.zza(paramParcel, 7, paramzzi.zzPE, false);
    zzb.zza(paramParcel, 8, paramzzi.zzPF, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzi zzE(Parcel paramParcel)
  {
    int i = 0;
    Account localAccount = null;
    int j = zza.zzJ(paramParcel);
    Bundle localBundle = null;
    Scope[] arrayOfScope = null;
    IBinder localIBinder = null;
    String str = null;
    int k = 0;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        k = zza.zzg(paramParcel, n);
        break;
      case 3:
        i = zza.zzg(paramParcel, n);
        break;
      case 4:
        str = zza.zzo(paramParcel, n);
        break;
      case 5:
        localIBinder = zza.zzp(paramParcel, n);
        break;
      case 6:
        arrayOfScope = (Scope[])zza.zzb(paramParcel, n, Scope.CREATOR);
        break;
      case 7:
        localBundle = zza.zzq(paramParcel, n);
        break;
      case 8:
        localAccount = (Account)zza.zza(paramParcel, n, Account.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzi(m, k, i, str, localIBinder, arrayOfScope, localBundle, localAccount);
  }

  public zzi[] zzaH(int paramInt)
  {
    return new zzi[paramInt];
  }
}