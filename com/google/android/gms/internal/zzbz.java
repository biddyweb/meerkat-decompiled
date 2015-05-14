package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Future;

@zzgi
public class zzbz
  implements zzdc.zzb
{
  private boolean zzmE = false;
  private final Object zznh = new Object();
  private final zzhq<Bundle> zzqh = new zzhq();
  private final List<Runnable> zzqi = new ArrayList();
  private boolean zzqj = false;

  public void zza(Runnable paramRunnable)
  {
    synchronized (this.zznh)
    {
      if (!this.zzqj)
      {
        this.zzqi.add(paramRunnable);
        return;
      }
      paramRunnable.run();
      return;
    }
  }

  public Future<Bundle> zzcc()
  {
    return this.zzqh;
  }

  public void zze(Bundle paramBundle)
  {
    synchronized (this.zznh)
    {
      if (this.zzqj)
        return;
      this.zzqj = true;
      this.zzqh.zzb(paramBundle);
      Iterator localIterator = this.zzqi.iterator();
      if (localIterator.hasNext())
        ((Runnable)localIterator.next()).run();
    }
    this.zzqi.clear();
  }

  public void zzl(Context paramContext)
  {
    synchronized (this.zznh)
    {
      if (this.zzmE)
        return;
      zzdc.zza(paramContext, this);
      this.zzmE = true;
      return;
    }
  }
}