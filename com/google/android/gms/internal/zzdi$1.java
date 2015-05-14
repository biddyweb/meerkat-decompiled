package com.google.android.gms.internal;

import android.os.RemoteException;

class zzdi$1
  implements Runnable
{
  zzdi$1(zzdi paramzzdi, zzdo paramzzdo)
  {
  }

  public void run()
  {
    try
    {
      this.zzsi.zzsM.destroy();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not destroy mediation adapter.", localRemoteException);
    }
  }
}