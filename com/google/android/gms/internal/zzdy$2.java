package com.google.android.gms.internal;

import android.os.RemoteException;

class zzdy$2
  implements Runnable
{
  zzdy$2(zzdy paramzzdy)
  {
  }

  public void run()
  {
    try
    {
      zzdy.zza(this.zzsV).onAdOpened();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdOpened.", localRemoteException);
    }
  }
}