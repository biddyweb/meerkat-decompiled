package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzy
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzy> CREATOR = new zzz();
  final int zzFG;
  private final Account zzFN;
  private final int zzQs;

  zzy(int paramInt1, Account paramAccount, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzFN = paramAccount;
    this.zzQs = paramInt2;
  }

  public zzy(Account paramAccount, int paramInt)
  {
    this(1, paramAccount, paramInt);
  }

  public int describeContents()
  {
    return 0;
  }

  public Account getAccount()
  {
    return this.zzFN;
  }

  public int getSessionId()
  {
    return this.zzQs;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzz.zza(this, paramParcel, paramInt);
  }
}