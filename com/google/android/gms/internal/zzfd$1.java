package com.google.android.gms.internal;

import android.content.Intent;
import android.os.RemoteException;

class zzfd$1
  implements Runnable
{
  zzfd$1(zzfd paramzzfd, zzfg paramzzfg, Intent paramIntent)
  {
  }

  public void run()
  {
    try
    {
      if (zzfd.zza(this.zzve).zza(this.zzvc.zzvn, -1, this.zzvd))
      {
        zzfd.zzc(this.zzve).zza(new zzfh(zzfd.zzb(this.zzve), this.zzvc.zzvo, true, -1, this.zzvd, this.zzvc));
        return;
      }
      zzfd.zzc(this.zzve).zza(new zzfh(zzfd.zzb(this.zzve), this.zzvc.zzvo, false, -1, this.zzvd, this.zzvc));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzac("Fail to verify and dispatch pending transaction");
    }
  }
}