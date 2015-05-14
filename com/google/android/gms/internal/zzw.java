package com.google.android.gms.internal;

import android.content.Context;
import android.view.MotionEvent;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

@zzgi
class zzw
  implements zzg, Runnable
{
  private zzt.zzb zzlE;
  private final List<Object[]> zzmv = new Vector();
  private final AtomicReference<zzg> zzmw = new AtomicReference();
  CountDownLatch zzmx = new CountDownLatch(1);

  public zzw(zzt.zzb paramzzb)
  {
    this.zzlE = paramzzb;
    if (zzbe.zzbD().zzeC())
    {
      zzhn.zzb(this);
      return;
    }
    run();
  }

  private void zzaD()
  {
    if (this.zzmv.isEmpty())
      return;
    Iterator localIterator = this.zzmv.iterator();
    while (localIterator.hasNext())
    {
      Object[] arrayOfObject = (Object[])localIterator.next();
      if (arrayOfObject.length == 1)
        ((Runnable)this.zzmw.get()).zza((MotionEvent)arrayOfObject[0]);
      else if (arrayOfObject.length == 3)
        ((Runnable)this.zzmw.get()).zza(((Integer)arrayOfObject[0]).intValue(), ((Integer)arrayOfObject[1]).intValue(), ((Integer)arrayOfObject[2]).intValue());
    }
    this.zzmv.clear();
  }

  private Context zzi(Context paramContext)
  {
    if (!((Boolean)zzca.zzqu.get()).booleanValue());
    Context localContext;
    do
    {
      return paramContext;
      localContext = paramContext.getApplicationContext();
    }
    while (localContext == null);
    return localContext;
  }

  public void run()
  {
    try
    {
      zza(zzj.zza(this.zzlE.zzlP.zzzH, zzi(this.zzlE.zzlN)));
      return;
    }
    finally
    {
      this.zzmx.countDown();
      this.zzlE = null;
    }
  }

  public String zza(Context paramContext)
  {
    if (zzaC())
    {
      zzg localzzg = (Runnable)this.zzmw.get();
      if (localzzg != null)
      {
        zzaD();
        return localzzg.zza(zzi(paramContext));
      }
    }
    return "";
  }

  public String zza(Context paramContext, String paramString)
  {
    if (zzaC())
    {
      zzg localzzg = (Runnable)this.zzmw.get();
      if (localzzg != null)
      {
        zzaD();
        return localzzg.zza(zzi(paramContext), paramString);
      }
    }
    return "";
  }

  public void zza(int paramInt1, int paramInt2, int paramInt3)
  {
    zzg localzzg = (Runnable)this.zzmw.get();
    if (localzzg != null)
    {
      zzaD();
      localzzg.zza(paramInt1, paramInt2, paramInt3);
      return;
    }
    List localList = this.zzmv;
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Integer.valueOf(paramInt1);
    arrayOfObject[1] = Integer.valueOf(paramInt2);
    arrayOfObject[2] = Integer.valueOf(paramInt3);
    localList.add(arrayOfObject);
  }

  public void zza(MotionEvent paramMotionEvent)
  {
    zzg localzzg = (Runnable)this.zzmw.get();
    if (localzzg != null)
    {
      zzaD();
      localzzg.zza(paramMotionEvent);
      return;
    }
    this.zzmv.add(new Object[] { paramMotionEvent });
  }

  protected void zza(zzg paramzzg)
  {
    this.zzmw.set(paramzzg);
  }

  protected boolean zzaC()
  {
    try
    {
      this.zzmx.await();
      return true;
    }
    catch (InterruptedException localInterruptedException)
    {
      zzhx.zzd("Interrupted during GADSignals creation.", localInterruptedException);
    }
    return false;
  }
}