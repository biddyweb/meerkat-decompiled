package com.google.android.gms.internal;

import android.os.RemoteException;

class zzdy$3
  implements Runnable
{
  zzdy$3(zzdy paramzzdy)
  {
  }

  public void run()
  {
    try
    {
      zzdy.zza(this.zzsV).onAdLoaded();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdLoaded.", localRemoteException);
    }
  }
}