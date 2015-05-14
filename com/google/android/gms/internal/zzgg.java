package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@zzgi
public class zzgg extends zzhl
{
  private final Object zznh = new Object();
  private final zzgc.zza zzvL;
  private final zzhe.zza zzvN;
  private final zzgq zzvO;
  private final zzgt zzvY;
  private Future<zzhe> zzvZ;

  public zzgg(Context paramContext, zzt paramzzt, zzai paramzzai, zzhe.zza paramzza, zzgc.zza paramzza1)
  {
    this(paramzza, paramzza1, new zzgt(paramContext, paramzzt, paramzzai, new zzht(), paramzza));
  }

  zzgg(zzhe.zza paramzza, zzgc.zza paramzza1, zzgt paramzzgt)
  {
    this.zzvN = paramzza;
    this.zzvO = paramzza.zzyz;
    this.zzvL = paramzza1;
    this.zzvY = paramzzgt;
  }

  private zzhe zzu(int paramInt)
  {
    return new zzhe(this.zzvN.zzyy.zzwn, null, null, paramInt, null, null, this.zzvO.orientation, this.zzvO.zzsx, this.zzvN.zzyy.zzwq, false, null, null, null, null, null, this.zzvO.zzwJ, this.zzvN.zzlV, this.zzvO.zzwH, this.zzvN.zzyv, this.zzvO.zzwM, this.zzvO.zzwN, this.zzvN.zzys, null, this.zzvN.zzyy.zzwD);
  }

  public void onStop()
  {
    synchronized (this.zznh)
    {
      if (this.zzvZ != null)
        this.zzvZ.cancel(true);
      return;
    }
  }

  public void zzdw()
  {
    try
    {
      synchronized (this.zznh)
      {
        this.zzvZ = zzhn.submit(this.zzvY);
        localzzhe = (zzhe)this.zzvZ.get(60000L, TimeUnit.MILLISECONDS);
        i = -2;
        if (localzzhe != null)
        {
          zzhw.zzzG.post(new zzgg.1(this, localzzhe));
          return;
        }
      }
    }
    catch (TimeoutException localTimeoutException)
    {
      while (true)
      {
        zzhx.zzac("Timed out waiting for native ad.");
        i = 2;
        localzzhe = null;
      }
    }
    catch (ExecutionException localExecutionException)
    {
      while (true)
      {
        localzzhe = null;
        i = 0;
      }
    }
    catch (InterruptedException localInterruptedException)
    {
      while (true)
      {
        i = -1;
        localzzhe = null;
      }
    }
    catch (CancellationException localCancellationException)
    {
      while (true)
      {
        int i = -1;
        zzhe localzzhe = null;
        continue;
        localzzhe = zzu(i);
      }
    }
  }
}