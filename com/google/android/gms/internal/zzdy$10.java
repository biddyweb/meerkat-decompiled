package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.ads.AdRequest.ErrorCode;

class zzdy$10
  implements Runnable
{
  zzdy$10(zzdy paramzzdy, AdRequest.ErrorCode paramErrorCode)
  {
  }

  public void run()
  {
    try
    {
      zzdy.zza(this.zzsV).onAdFailedToLoad(zzdz.zza(this.zzsW));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdFailedToLoad.", localRemoteException);
    }
  }
}