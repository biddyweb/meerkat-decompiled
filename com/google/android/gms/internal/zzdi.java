package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import java.util.Iterator;
import java.util.List;

@zzgi
public final class zzdi
{
  private final Context mContext;
  private final zzdr zzlD;
  private final Object zznh = new Object();
  private final zzgo zzse;
  private final zzdk zzsf;
  private boolean zzsg = false;
  private zzdn zzsh;

  public zzdi(Context paramContext, zzgo paramzzgo, zzdr paramzzdr, zzdk paramzzdk)
  {
    this.mContext = paramContext;
    this.zzse = paramzzgo;
    this.zzlD = paramzzdr;
    this.zzsf = paramzzdk;
  }

  public void cancel()
  {
    synchronized (this.zznh)
    {
      this.zzsg = true;
      if (this.zzsh != null)
        this.zzsh.cancel();
      return;
    }
  }

  public zzdo zza(long paramLong1, long paramLong2)
  {
    zzhx.zzY("Starting mediation.");
    Iterator localIterator1 = this.zzsf.zzsr.iterator();
    while (localIterator1.hasNext())
    {
      zzdj localzzdj = (zzdj)localIterator1.next();
      zzhx.zzaa("Trying mediation network: " + localzzdj.zzsl);
      Iterator localIterator2 = localzzdj.zzsm.iterator();
      while (localIterator2.hasNext())
      {
        String str = (String)localIterator2.next();
        zzdo localzzdo2;
        synchronized (this.zznh)
        {
          if (this.zzsg)
          {
            zzdo localzzdo1 = new zzdo(-1);
            return localzzdo1;
          }
          this.zzsh = new zzdn(this.mContext, str, this.zzlD, this.zzsf, localzzdj, this.zzse.zzwn, this.zzse.zzlV, this.zzse.zzlP);
          localzzdo2 = this.zzsh.zzb(paramLong1, paramLong2);
          if (localzzdo2.zzsK == 0)
          {
            zzhx.zzY("Adapter succeeded.");
            return localzzdo2;
          }
        }
        if (localzzdo2.zzsM != null)
          zzhw.zzzG.post(new zzdi.1(this, localzzdo2));
      }
    }
    return new zzdo(1);
  }
}