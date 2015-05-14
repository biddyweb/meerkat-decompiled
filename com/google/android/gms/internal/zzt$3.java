package com.google.android.gms.internal;

import android.content.Intent;

class zzt$3
  implements Runnable
{
  zzt$3(zzt paramzzt, Intent paramIntent)
  {
  }

  public void run()
  {
    int i = zzab.zzaU().zzd(this.zzlK);
    zzab.zzaU();
    if ((i == 0) && (zzt.zza(this.zzlJ).zzlW != null) && (zzt.zza(this.zzlJ).zzlW.zzuq != null) && (zzt.zza(this.zzlJ).zzlW.zzuq.zzeF() != null))
      zzt.zza(this.zzlJ).zzlW.zzuq.zzeF().close();
    zzt.zza(this.zzlJ).zzmk = false;
  }
}