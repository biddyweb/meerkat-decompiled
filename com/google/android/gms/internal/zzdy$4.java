package com.google.android.gms.internal;

import android.os.RemoteException;

class zzdy$4
  implements Runnable
{
  zzdy$4(zzdy paramzzdy)
  {
  }

  public void run()
  {
    try
    {
      zzdy.zza(this.zzsV).onAdClosed();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdClosed.", localRemoteException);
    }
  }
}