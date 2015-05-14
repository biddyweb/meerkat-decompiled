package com.google.android.gms.internal;

import android.os.RemoteException;

class zzdy$9
  implements Runnable
{
  zzdy$9(zzdy paramzzdy)
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