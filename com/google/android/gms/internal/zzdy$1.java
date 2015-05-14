package com.google.android.gms.internal;

import android.os.RemoteException;

class zzdy$1
  implements Runnable
{
  zzdy$1(zzdy paramzzdy)
  {
  }

  public void run()
  {
    try
    {
      zzdy.zza(this.zzsV).onAdClicked();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdClicked.", localRemoteException);
    }
  }
}