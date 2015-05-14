package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzz
  implements Parcelable.Creator<zzy>
{
  static void zza(zzy paramzzy, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzy.zzFG);
    zzb.zza(paramParcel, 2, paramzzy.getAccount(), paramInt, false);
    zzb.zzc(paramParcel, 3, paramzzy.getSessionId());
    zzb.zzH(paramParcel, i);
  }

  public zzy zzF(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    Object localObject1 = null;
    int k = 0;
    if (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      int n;
      Object localObject2;
      int i1;
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        n = i;
        localObject2 = localObject1;
        i1 = k;
      case 1:
      case 2:
      case 3:
      }
      while (true)
      {
        k = i1;
        localObject1 = localObject2;
        i = n;
        break;
        int i2 = zza.zzg(paramParcel, m);
        int i3 = i;
        localObject2 = localObject1;
        i1 = i2;
        n = i3;
        continue;
        Account localAccount = (Account)zza.zza(paramParcel, m, Account.CREATOR);
        i1 = k;
        n = i;
        localObject2 = localAccount;
        continue;
        n = zza.zzg(paramParcel, m);
        localObject2 = localObject1;
        i1 = k;
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new zzy(k, localObject1, i);
  }

  public zzy[] zzaM(int paramInt)
  {
    return new zzy[paramInt];
  }
}