package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.content.Context;
import android.os.Binder;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.GooglePlayServicesUtil;

public class zza extends zzq.zza
{
  private Context mContext;
  private Account zzFN;
  int zzPm;

  public static Account zzc(zzq paramzzq)
  {
    Object localObject1 = null;
    long l;
    if (paramzzq != null)
      l = Binder.clearCallingIdentity();
    try
    {
      Account localAccount = paramzzq.getAccount();
      localObject1 = localAccount;
      return localObject1;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("AccountAccessor", "Remote account accessor probably died");
      return null;
    }
    finally
    {
      Binder.restoreCallingIdentity(l);
    }
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject)
      return true;
    if (!(paramObject instanceof zza))
      return false;
    return this.zzFN.equals(((zza)paramObject).zzFN);
  }

  public Account getAccount()
  {
    int i = Binder.getCallingUid();
    if (i == this.zzPm)
      return this.zzFN;
    if (GooglePlayServicesUtil.zzd(this.mContext, i))
    {
      this.zzPm = i;
      return this.zzFN;
    }
    throw new SecurityException("Caller is not GooglePlayServices");
  }
}