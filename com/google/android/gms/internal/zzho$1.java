package com.google.android.gms.internal;

import android.content.Context;

class zzho$1
  implements Runnable
{
  zzho$1(zzho paramzzho, Context paramContext)
  {
  }

  public void run()
  {
    synchronized (zzho.zza(this.zzzs))
    {
      zzho.zza(this.zzzs, this.zzzs.zzv(this.zznK));
      zzho.zza(this.zzzs).notifyAll();
      return;
    }
  }
}