package com.google.android.gms.tagmanager;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.AbstractPendingResult;
import com.google.android.gms.common.api.Releasable;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzc.zzf;
import com.google.android.gms.internal.zzc.zzj;
import com.google.android.gms.internal.zzlv;
import com.google.android.gms.internal.zzlx;
import com.google.android.gms.internal.zzvd.zza;
import com.google.android.gms.internal.zzvg;
import com.google.android.gms.internal.zzvg.zza;
import com.google.android.gms.internal.zzvk;
import com.google.android.gms.internal.zzvk.zza;
import com.google.android.gms.internal.zzvl.zzc;

public class zzo extends AbstractPendingResult<ContainerHolder>
{
  private final Context mContext;
  private final Looper zzMc;
  private long zzaxB;
  private final TagManager zzaxI;
  private final zzd zzaxL;
  private final zzcc zzaxM;
  private final int zzaxN;
  private zzf zzaxO;
  private zzvg zzaxP;
  private volatile zzn zzaxQ;
  private volatile boolean zzaxR;
  private zzc.zzj zzaxS;
  private String zzaxT;
  private zze zzaxU;
  private zza zzaxV;
  private final String zzaxw;
  private final zzlv zzmW;

  zzo(Context paramContext, TagManager paramTagManager, Looper paramLooper, String paramString, int paramInt, zzf paramzzf, zze paramzze, zzvg paramzzvg, zzlv paramzzlv, zzcc paramzzcc)
  {
  }

  public zzo(Context paramContext, TagManager paramTagManager, Looper paramLooper, String paramString, int paramInt, zzr paramzzr)
  {
    this(paramContext, paramTagManager, paramLooper, paramString, paramInt, new zzcm(paramContext, paramString), new zzcl(paramContext, paramString, paramzzr), new zzvg(paramContext), zzlx.zzkc(), new zzbd(30, 900000L, 5000L, "refreshing", zzlx.zzkc()));
    this.zzaxP.zzdx(paramzzr.zzsT());
  }

  private void zzF(long paramLong)
  {
    try
    {
      if (this.zzaxU == null)
        zzbf.zzac("Refresh requested, but no network load scheduler.");
      while (true)
      {
        return;
        this.zzaxU.zze(paramLong, this.zzaxS.zzgt);
      }
    }
    finally
    {
    }
  }

  private void zza(zzc.zzj paramzzj)
  {
    try
    {
      if (this.zzaxO != null)
      {
        zzvd.zza localzza = new zzvd.zza();
        localzza.zzaBK = this.zzaxB;
        localzza.zzgs = new zzc.zzf();
        localzza.zzaBL = paramzzj;
        this.zzaxO.zzb(localzza);
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private void zza(zzc.zzj paramzzj, long paramLong, boolean paramBoolean)
  {
    if (paramBoolean);
    while (true)
    {
      Container localContainer;
      try
      {
        boolean bool = this.zzaxR;
        if (bool)
          return;
        if ((isReady()) && (this.zzaxQ == null));
        this.zzaxS = paramzzj;
        this.zzaxB = paramLong;
        zzF(Math.max(0L, Math.min(43200000L, 43200000L + this.zzaxB - this.zzmW.currentTimeMillis())));
        localContainer = new Container(this.mContext, this.zzaxI.getDataLayer(), this.zzaxw, paramLong, paramzzj);
        if (this.zzaxQ == null)
        {
          this.zzaxQ = new zzn(this.zzaxI, this.zzMc, localContainer, this.zzaxL);
          if ((isReady()) || (!this.zzaxV.zzb(localContainer)))
            continue;
          setResult(this.zzaxQ);
          continue;
        }
      }
      finally
      {
      }
      this.zzaxQ.zza(localContainer);
    }
  }

  private void zzag(final boolean paramBoolean)
  {
    this.zzaxO.zza(new zzb(null));
    this.zzaxU.zza(new zzc(null));
    zzvl.zzc localzzc = this.zzaxO.zzhc(this.zzaxN);
    if (localzzc != null)
      this.zzaxQ = new zzn(this.zzaxI, this.zzMc, new Container(this.mContext, this.zzaxI.getDataLayer(), this.zzaxw, 0L, localzzc), this.zzaxL);
    this.zzaxV = new zza()
    {
      public boolean zzb(Container paramAnonymousContainer)
      {
        if (paramBoolean)
          if (43200000L + paramAnonymousContainer.getLastRefreshTime() < zzo.zzg(zzo.this).currentTimeMillis());
        while (!paramAnonymousContainer.isDefault())
        {
          return true;
          return false;
        }
        return false;
      }
    };
    if (zzsQ())
    {
      this.zzaxU.zze(0L, "");
      return;
    }
    this.zzaxO.zzsS();
  }

  private boolean zzsQ()
  {
    zzca localzzca = zzca.zztx();
    return ((localzzca.zzty() == zzca.zza.zzazC) || (localzzca.zzty() == zzca.zza.zzazD)) && (this.zzaxw.equals(localzzca.getContainerId()));
  }

  public void load(final String paramString)
  {
    if (this.zzaxN != -1);
    for (Integer localInteger = Integer.valueOf(this.zzaxN); ; localInteger = null)
    {
      this.zzaxP.zza(this.zzaxw, localInteger, paramString, new zzvg.zza()
      {
        public void zza(zzvk paramAnonymouszzvk)
        {
          if (paramAnonymouszzvk.getStatus() != Status.zzNo)
          {
            zzbf.zzZ("Load request failed for the container " + zzo.zza(zzo.this));
            zzo.this.setResult(zzo.this.zzaN(Status.zzNq));
            return;
          }
          zzvl.zzc localzzc = paramAnonymouszzvk.zzuo().zzus();
          if (localzzc == null)
          {
            zzbf.zzZ("Response doesn't have the requested container");
            zzo.this.setResult(zzo.this.zzaN(new Status(8, "Response doesn't have the requested container", null)));
            return;
          }
          long l = paramAnonymouszzvk.zzuo().zzut();
          zzo.zza(zzo.this, new zzn(zzo.zzb(zzo.this), zzo.zzc(zzo.this), new Container(zzo.zzd(zzo.this), zzo.zzb(zzo.this).getDataLayer(), zzo.zza(zzo.this), l, localzzc), new zzn.zza()
          {
            public void zzcQ(String paramAnonymous2String)
            {
              zzo.this.zzcQ(paramAnonymous2String);
            }

            public String zzsK()
            {
              return zzo.this.zzsK();
            }

            public void zzsM()
            {
              if (zzo.zze(zzo.this).zzgv())
                zzo.this.load(zzo.1.this.zzaxW);
            }
          }));
          zzo.this.setResult(zzo.zzf(zzo.this));
        }
      });
      return;
    }
  }

  protected ContainerHolder zzaN(Status paramStatus)
  {
    if (this.zzaxQ != null)
      return this.zzaxQ;
    if (paramStatus == Status.zzNr)
      zzbf.zzZ("timer expired: setting result to failure");
    return new zzn(paramStatus);
  }

  void zzcQ(String paramString)
  {
    try
    {
      this.zzaxT = paramString;
      if (this.zzaxU != null)
        this.zzaxU.zzcT(paramString);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  String zzsK()
  {
    try
    {
      String str = this.zzaxT;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void zzsN()
  {
    zzvl.zzc localzzc = this.zzaxO.zzhc(this.zzaxN);
    if (localzzc != null)
    {
      Container localContainer = new Container(this.mContext, this.zzaxI.getDataLayer(), this.zzaxw, 0L, localzzc);
      setResult(new zzn(this.zzaxI, this.zzMc, localContainer, new zzn.zza()
      {
        public void zzcQ(String paramAnonymousString)
        {
          zzo.this.zzcQ(paramAnonymousString);
        }

        public String zzsK()
        {
          return zzo.this.zzsK();
        }

        public void zzsM()
        {
          zzbf.zzac("Refresh ignored: container loaded as default only.");
        }
      }));
    }
    while (true)
    {
      this.zzaxU = null;
      this.zzaxO = null;
      return;
      zzbf.zzZ("Default was requested, but no default container was found");
      setResult(zzaN(new Status(10, "Default was requested, but no default container was found", null)));
    }
  }

  public void zzsO()
  {
    zzag(false);
  }

  public void zzsP()
  {
    zzag(true);
  }

  static abstract interface zza
  {
    public abstract boolean zzb(Container paramContainer);
  }

  private class zzb
    implements zzbe<zzvd.zza>
  {
    private zzb()
    {
    }

    public void zza(zzvd.zza paramzza)
    {
      zzc.zzj localzzj;
      if (paramzza.zzaBL != null)
        localzzj = paramzza.zzaBL;
      while (true)
      {
        zzo.zza(zzo.this, localzzj, paramzza.zzaBK, true);
        return;
        zzc.zzf localzzf = paramzza.zzgs;
        localzzj = new zzc.zzj();
        localzzj.zzgs = localzzf;
        localzzj.zzgr = null;
        localzzj.zzgt = localzzf.version;
      }
    }

    public void zza(zzbe.zza paramzza)
    {
      if (!zzo.zzh(zzo.this))
        zzo.zza(zzo.this, 0L);
    }

    public void zzsR()
    {
    }
  }

  private class zzc
    implements zzbe<zzc.zzj>
  {
    private zzc()
    {
    }

    public void zza(zzbe.zza paramzza)
    {
      synchronized (zzo.this)
      {
        if (!zzo.this.isReady())
        {
          if (zzo.zzf(zzo.this) != null)
            zzo.this.setResult(zzo.zzf(zzo.this));
        }
        else
        {
          zzo.zza(zzo.this, 3600000L);
          return;
        }
        zzo.this.setResult(zzo.this.zzaN(Status.zzNr));
      }
    }

    public void zzb(zzc.zzj paramzzj)
    {
      synchronized (zzo.this)
      {
        if (paramzzj.zzgs == null)
        {
          if (zzo.zzi(zzo.this).zzgs == null)
          {
            zzbf.zzZ("Current resource is null; network resource is also null");
            zzo.zza(zzo.this, 3600000L);
            return;
          }
          paramzzj.zzgs = zzo.zzi(zzo.this).zzgs;
        }
        zzo.zza(zzo.this, paramzzj, zzo.zzg(zzo.this).currentTimeMillis(), false);
        zzbf.zzab("setting refresh time to current time: " + zzo.zzj(zzo.this));
        if (!zzo.zzk(zzo.this))
          zzo.zza(zzo.this, paramzzj);
        return;
      }
    }

    public void zzsR()
    {
    }
  }

  private class zzd
    implements zzn.zza
  {
    private zzd()
    {
    }

    public void zzcQ(String paramString)
    {
      zzo.this.zzcQ(paramString);
    }

    public String zzsK()
    {
      return zzo.this.zzsK();
    }

    public void zzsM()
    {
      if (zzo.zze(zzo.this).zzgv())
        zzo.zza(zzo.this, 0L);
    }
  }

  static abstract interface zze extends Releasable
  {
    public abstract void zza(zzbe<zzc.zzj> paramzzbe);

    public abstract void zzcT(String paramString);

    public abstract void zze(long paramLong, String paramString);
  }

  static abstract interface zzf extends Releasable
  {
    public abstract void zza(zzbe<zzvd.zza> paramzzbe);

    public abstract void zzb(zzvd.zza paramzza);

    public abstract zzvl.zzc zzhc(int paramInt);

    public abstract void zzsS();
  }
}