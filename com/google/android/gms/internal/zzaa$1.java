package com.google.android.gms.internal;

import java.lang.ref.WeakReference;

class zzaa$1
  implements Runnable
{
  zzaa$1(zzaa paramzzaa, WeakReference paramWeakReference)
  {
  }

  public void run()
  {
    zzaa.zza(this.zzmM, false);
    zzt localzzt = (zzt)this.zzmL.get();
    if (localzzt != null)
      localzzt.zzb(zzaa.zza(this.zzmM));
  }
}