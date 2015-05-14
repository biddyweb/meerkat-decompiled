package com.google.android.gms.auth;

import android.accounts.Account;
import android.os.Parcel;
import android.text.TextUtils;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class AccountChangeEventsRequest
  implements SafeParcelable
{
  public static final AccountChangeEventsRequestCreator CREATOR = new AccountChangeEventsRequestCreator();
  Account zzFN;
  final int zzHe;

  @Deprecated
  String zzHg;
  int zzHi;

  public AccountChangeEventsRequest()
  {
    this.zzHe = 1;
  }

  AccountChangeEventsRequest(int paramInt1, int paramInt2, String paramString, Account paramAccount)
  {
    this.zzHe = paramInt1;
    this.zzHi = paramInt2;
    this.zzHg = paramString;
    if ((paramAccount == null) && (!TextUtils.isEmpty(paramString)))
    {
      this.zzFN = new Account(paramString, "com.google");
      return;
    }
    this.zzFN = paramAccount;
  }

  public int describeContents()
  {
    return 0;
  }

  public Account getAccount()
  {
    return this.zzFN;
  }

  public String getAccountName()
  {
    return this.zzHg;
  }

  public int getEventIndex()
  {
    return this.zzHi;
  }

  public AccountChangeEventsRequest setAccount(Account paramAccount)
  {
    this.zzFN = paramAccount;
    return this;
  }

  public AccountChangeEventsRequest setAccountName(String paramString)
  {
    this.zzHg = paramString;
    return this;
  }

  public AccountChangeEventsRequest setEventIndex(int paramInt)
  {
    this.zzHi = paramInt;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    AccountChangeEventsRequestCreator.zza(this, paramParcel, paramInt);
  }
}