package com.google.android.gms.analytics;

import android.content.Context;
import android.content.Intent;
import com.google.android.gms.internal.zzik;
import com.google.android.gms.internal.zzlv;
import com.google.android.gms.internal.zzlx;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Queue;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.LinkedBlockingQueue;

class zzw
  implements zzak, zzc.zzb, zzc.zzc
{
  private final Context mContext;
  private zzd zzBR;
  private final zzf zzBS;
  private boolean zzBV;
  private volatile long zzCh;
  private volatile zza zzCi;
  private volatile zzb zzCj;
  private zzd zzCk;
  private final GoogleAnalytics zzCl;
  private final Queue<zzd> zzCm = new ConcurrentLinkedQueue();
  private volatile int zzCn;
  private volatile Timer zzCo;
  private volatile Timer zzCp;
  private volatile Timer zzCq;
  private boolean zzCr;
  private boolean zzCs;
  private boolean zzCt;
  private long zzCu;
  private zzlv zzmW;

  zzw(Context paramContext, zzf paramzzf)
  {
    this(paramContext, paramzzf, null, GoogleAnalytics.getInstance(paramContext));
  }

  zzw(Context paramContext, zzf paramzzf, zzd paramzzd, GoogleAnalytics paramGoogleAnalytics)
  {
    this.zzCk = paramzzd;
    this.mContext = paramContext;
    this.zzBS = paramzzf;
    this.zzCl = paramGoogleAnalytics;
    this.zzCn = 0;
    this.zzCi = zza.zzCD;
    if (zzG(paramContext));
    for (this.zzCu = 10000L; ; this.zzCu = 300000L)
    {
      this.zzmW = zzlx.zzkc();
      return;
    }
  }

  private static boolean zzG(Context paramContext)
  {
    return (paramContext != null) && ("com.google.android.gms".equals(paramContext.getPackageName()));
  }

  private Timer zza(Timer paramTimer)
  {
    if (paramTimer != null)
      paramTimer.cancel();
    return null;
  }

  private void zzdJ()
  {
    try
    {
      if ((this.zzCj != null) && (this.zzCi == zza.zzCy))
      {
        this.zzCi = zza.zzCC;
        this.zzCj.disconnect();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private void zzfL()
  {
    this.zzCo = zza(this.zzCo);
    this.zzCp = zza(this.zzCp);
    this.zzCq = zza(this.zzCq);
  }

  private void zzfN()
  {
    while (true)
    {
      try
      {
        if (!Thread.currentThread().equals(this.zzBS.getThread()))
        {
          this.zzBS.zzfi().add(new Runnable()
          {
            public void run()
            {
              zzw.zza(zzw.this);
            }
          });
          return;
        }
        if (this.zzCr)
          zzfa();
        switch (2.zzCw[this.zzCi.ordinal()])
        {
        case 1:
          if (this.zzCm.isEmpty())
            break label212;
          zzd localzzd2 = (zzd)this.zzCm.poll();
          zzae.zzab("Sending hit to store  " + localzzd2);
          this.zzBR.zza(localzzd2.zzfS(), localzzd2.zzfT(), localzzd2.getPath(), localzzd2.zzfU());
          continue;
        case 7:
        case 2:
        case 6:
        case 3:
        case 4:
        case 5:
        }
      }
      finally
      {
      }
      zzae.zzab("Blocked. Dropping hits.");
      this.zzCm.clear();
      continue;
      label212: if (this.zzBV)
      {
        zzfO();
        continue;
        if (!this.zzCm.isEmpty())
        {
          zzd localzzd1 = (zzd)this.zzCm.peek();
          zzae.zzab("Sending hit to service   " + localzzd1);
          if (!this.zzCl.isDryRunEnabled())
            this.zzCj.zza(localzzd1.zzfS(), localzzd1.zzfT(), localzzd1.getPath(), localzzd1.zzfU());
          while (true)
          {
            this.zzCm.poll();
            break;
            zzae.zzab("Dry run enabled. Hit not actually sent to service.");
          }
        }
        this.zzCh = this.zzmW.elapsedRealtime();
        continue;
        zzae.zzab("Need to reconnect");
        if (!this.zzCm.isEmpty())
          zzfQ();
      }
    }
  }

  private void zzfO()
  {
    this.zzBR.dispatch();
    this.zzBV = false;
  }

  private void zzfP()
  {
    try
    {
      zza localzza1 = this.zzCi;
      zza localzza2 = zza.zzCz;
      if (localzza1 == localzza2);
      while (true)
      {
        return;
        if (!zzG(this.mContext))
          break;
        this.zzCi = zza.zzCA;
        this.zzCj.disconnect();
        zzae.zzac("Attempted to fall back to local store from service.");
      }
    }
    finally
    {
    }
    zzfL();
    zzae.zzab("falling back to local store");
    if (this.zzCk != null);
    zzv localzzv;
    for (this.zzBR = this.zzCk; ; this.zzBR = localzzv.zzE(null))
    {
      this.zzCi = zza.zzCz;
      zzfN();
      break;
      localzzv = zzv.zzfE();
      localzzv.zza(this.mContext, this.zzBS);
    }
  }

  private void zzfQ()
  {
    while (true)
    {
      try
      {
        if ((!this.zzCt) && (this.zzCj != null))
        {
          zza localzza1 = this.zzCi;
          zza localzza2 = zza.zzCz;
          if (localzza1 != localzza2)
            try
            {
              this.zzCn = (1 + this.zzCn);
              zza(this.zzCp);
              this.zzCi = zza.zzCx;
              this.zzCp = new Timer("Failed Connect");
              this.zzCp.schedule(new zzc(null), 3000L);
              zzae.zzab("connecting to Analytics service");
              this.zzCj.connect();
              return;
            }
            catch (SecurityException localSecurityException)
            {
              zzae.zzac("security exception on connectToService");
              zzfP();
              continue;
            }
        }
      }
      finally
      {
      }
      zzae.zzac("client not initialized.");
      zzfP();
    }
  }

  private void zzfR()
  {
    this.zzCo = zza(this.zzCo);
    this.zzCo = new Timer("Service Reconnect");
    this.zzCo.schedule(new zze(null), 5000L);
  }

  public void dispatch()
  {
    switch (2.zzCw[this.zzCi.ordinal()])
    {
    default:
      this.zzBV = true;
    case 2:
      return;
    case 1:
    }
    zzfO();
  }

  public void onConnected()
  {
    try
    {
      this.zzCp = zza(this.zzCp);
      this.zzCn = 0;
      zzae.zzab("Connected to service");
      this.zzCi = zza.zzCy;
      if (this.zzCs)
      {
        zzdJ();
        this.zzCs = false;
      }
      while (true)
      {
        return;
        zzfN();
        this.zzCq = zza(this.zzCq);
        this.zzCq = new Timer("disconnect check");
        this.zzCq.schedule(new zzb(null), this.zzCu);
      }
    }
    finally
    {
    }
  }

  public void onDisconnected()
  {
    while (true)
    {
      try
      {
        if (this.zzCi == zza.zzCA)
        {
          zzae.zzab("Service blocked.");
          zzfL();
          return;
        }
        if (this.zzCi == zza.zzCC)
        {
          zzae.zzab("Disconnected from service");
          zzfL();
          this.zzCi = zza.zzCD;
          continue;
        }
      }
      finally
      {
      }
      zzae.zzab("Unexpected disconnect.");
      this.zzCi = zza.zzCB;
      if (this.zzCn < 2)
        zzfR();
      else
        zzfP();
    }
  }

  public void zza(int paramInt, Intent paramIntent)
  {
    try
    {
      this.zzCi = zza.zzCB;
      if (this.zzCn < 2)
      {
        zzae.zzac("Service unavailable (code=" + paramInt + "), will retry.");
        zzfR();
      }
      while (true)
      {
        return;
        zzae.zzac("Service unavailable (code=" + paramInt + "), using local store.");
        zzfP();
      }
    }
    finally
    {
    }
  }

  public void zzb(Map<String, String> paramMap, long paramLong, String paramString, List<zzik> paramList)
  {
    zzae.zzab("putHit called");
    this.zzCm.add(new zzd(paramMap, paramLong, paramString, paramList));
    zzfN();
  }

  public void zzfM()
  {
    if (this.zzCj != null)
      return;
    this.zzCj = new zzc(this.mContext, this, this);
    zzfQ();
  }

  public void zzfa()
  {
    zzae.zzab("clearHits called");
    this.zzCm.clear();
    switch (2.zzCw[this.zzCi.ordinal()])
    {
    default:
      this.zzCr = true;
      return;
    case 1:
      this.zzBR.zzl(0L);
      this.zzCr = false;
      return;
    case 2:
    }
    this.zzCj.zzfa();
    this.zzCr = false;
  }

  public void zzfh()
  {
    while (true)
    {
      try
      {
        boolean bool = this.zzCt;
        if (bool)
          return;
        zzae.zzab("setForceLocalDispatch called.");
        this.zzCt = true;
        switch (2.zzCw[this.zzCi.ordinal()])
        {
        case 1:
        case 4:
        case 5:
        case 6:
        case 2:
          zzdJ();
          continue;
        case 3:
        }
      }
      finally
      {
      }
      this.zzCs = true;
    }
  }

  private static enum zza
  {
    static
    {
      zzCA = new zza("BLOCKED", 3);
      zzCB = new zza("PENDING_CONNECTION", 4);
      zzCC = new zza("PENDING_DISCONNECT", 5);
      zzCD = new zza("DISCONNECTED", 6);
      zza[] arrayOfzza = new zza[7];
      arrayOfzza[0] = zzCx;
      arrayOfzza[1] = zzCy;
      arrayOfzza[2] = zzCz;
      arrayOfzza[3] = zzCA;
      arrayOfzza[4] = zzCB;
      arrayOfzza[5] = zzCC;
      arrayOfzza[6] = zzCD;
    }
  }

  private class zzb extends TimerTask
  {
    private zzb()
    {
    }

    public void run()
    {
      if ((zzw.zzb(zzw.this) == zzw.zza.zzCy) && (zzw.zze(zzw.this).isEmpty()) && (zzw.zzf(zzw.this) + zzw.zzg(zzw.this) < zzw.zzh(zzw.this).elapsedRealtime()))
      {
        zzae.zzab("Disconnecting due to inactivity");
        zzw.zzi(zzw.this);
        return;
      }
      zzw.zzj(zzw.this).schedule(new zzb(zzw.this), zzw.zzg(zzw.this));
    }
  }

  private class zzc extends TimerTask
  {
    private zzc()
    {
    }

    public void run()
    {
      if (zzw.zzb(zzw.this) == zzw.zza.zzCx)
        zzw.zzc(zzw.this);
    }
  }

  private static class zzd
  {
    private final Map<String, String> zzCF;
    private final long zzCG;
    private final String zzCH;
    private final List<zzik> zzCI;

    public zzd(Map<String, String> paramMap, long paramLong, String paramString, List<zzik> paramList)
    {
      this.zzCF = paramMap;
      this.zzCG = paramLong;
      this.zzCH = paramString;
      this.zzCI = paramList;
    }

    public String getPath()
    {
      return this.zzCH;
    }

    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append("PATH: ");
      localStringBuilder.append(this.zzCH);
      if (this.zzCF != null)
      {
        localStringBuilder.append("  PARAMS: ");
        Iterator localIterator = this.zzCF.entrySet().iterator();
        while (localIterator.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          localStringBuilder.append((String)localEntry.getKey());
          localStringBuilder.append("=");
          localStringBuilder.append((String)localEntry.getValue());
          localStringBuilder.append(",  ");
        }
      }
      return localStringBuilder.toString();
    }

    public Map<String, String> zzfS()
    {
      return this.zzCF;
    }

    public long zzfT()
    {
      return this.zzCG;
    }

    public List<zzik> zzfU()
    {
      return this.zzCI;
    }
  }

  private class zze extends TimerTask
  {
    private zze()
    {
    }

    public void run()
    {
      zzw.zzd(zzw.this);
    }
  }
}