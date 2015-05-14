package com.google.android.gms.internal;

import java.util.Timer;
import java.util.TimerTask;

class zzdf$1
  implements zzah.zza
{
  zzdf$1(zzdf paramzzdf, zzia paramzzia)
  {
  }

  public void zzbk()
  {
    new Timer().schedule(new TimerTask()
    {
      public void run()
      {
        synchronized (zzdf.zza(zzdf.1.this.zzrZ))
        {
          if ((zzdf.1.this.zzrY.getStatus() == -1) || (zzdf.1.this.zzrY.getStatus() == 1))
            return;
          zzdf.zza(zzdf.1.this.zzrZ, 1);
          zzdf.1.this.zzrY.reject();
          return;
        }
      }
    }
    , zzdf.zza.zzsd);
  }
}