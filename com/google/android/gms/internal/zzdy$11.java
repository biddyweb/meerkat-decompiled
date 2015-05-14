package com.google.android.gms.internal;

import android.os.RemoteException;

class zzdy$11
  implements Runnable
{
  zzdy$11(zzdy paramzzdy)
  {
  }

  public void run()
  {
    try
    {
      zzdy.zza(this.zzsV).onAdLeftApplication();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdLeftApplication.", localRemoteException);
    }
  }
}