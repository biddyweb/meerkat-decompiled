package com.google.android.gms.internal;

import android.os.RemoteException;

class zzdy$8
  implements Runnable
{
  zzdy$8(zzdy paramzzdy)
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