package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzi
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzi> CREATOR = new zzj();
  final int version;
  int zzPA;
  String zzPB;
  IBinder zzPC;
  Scope[] zzPD;
  Bundle zzPE;
  Account zzPF;
  final int zzPz;

  public zzi(int paramInt)
  {
    this.version = 2;
    this.zzPA = 7095000;
    this.zzPz = paramInt;
  }

  zzi(int paramInt1, int paramInt2, int paramInt3, String paramString, IBinder paramIBinder, Scope[] paramArrayOfScope, Bundle paramBundle, Account paramAccount)
  {
    this.version = paramInt1;
    this.zzPz = paramInt2;
    this.zzPA = paramInt3;
    this.zzPB = paramString;
    if (paramInt1 < 2);
    for (this.zzPF = zzQ(paramIBinder); ; this.zzPF = paramAccount)
    {
      this.zzPD = paramArrayOfScope;
      this.zzPE = paramBundle;
      return;
      this.zzPC = paramIBinder;
    }
  }

  private Account zzQ(IBinder paramIBinder)
  {
    Account localAccount = null;
    if (paramIBinder != null)
      localAccount = zza.zzc(zzq.zza.zzR(paramIBinder));
    return localAccount;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzj.zza(this, paramParcel, paramInt);
  }

  public zzi zza(Scope[] paramArrayOfScope)
  {
    this.zzPD = paramArrayOfScope;
    return this;
  }

  public zzi zzb(Account paramAccount)
  {
    this.zzPF = paramAccount;
    return this;
  }

  public zzi zzbg(String paramString)
  {
    this.zzPB = paramString;
    return this;
  }

  public zzi zzd(zzq paramzzq)
  {
    if (paramzzq != null)
      this.zzPC = paramzzq.asBinder();
    return this;
  }

  public zzi zzi(Bundle paramBundle)
  {
    this.zzPE = paramBundle;
    return this;
  }
}