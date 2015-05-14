package com.google.android.gms.internal;

import java.util.TimerTask;

class zzdf$4 extends TimerTask
{
  zzdf$4(zzdf paramzzdf, zzia paramzzia)
  {
  }

  public void run()
  {
    synchronized (zzdf.zza(this.zzrZ))
    {
      if ((this.zzrY.getStatus() == -1) || (this.zzrY.getStatus() == 1))
        return;
      zzdf.zza(this.zzrZ, 1);
      this.zzrY.reject();
      return;
    }
  }
}