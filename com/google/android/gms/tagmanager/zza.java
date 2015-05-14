package com.google.android.gms.tagmanager;

import android.content.Context;
import android.os.Process;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.ads.identifier.AdvertisingIdClient.Info;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.internal.zzlv;
import com.google.android.gms.internal.zzlx;
import java.io.IOException;

class zza
{
  private static Object zzaxj = new Object();
  private static zza zzaxk;
  private volatile boolean mClosed = false;
  private final Context mContext;
  private volatile AdvertisingIdClient.Info zzAO;
  private volatile long zzaxf = 900000L;
  private volatile long zzaxg = 30000L;
  private volatile long zzaxh;
  private zza zzaxi = new zza()
  {
    public AdvertisingIdClient.Info zzsC()
    {
      try
      {
        AdvertisingIdClient.Info localInfo = AdvertisingIdClient.getAdvertisingIdInfo(zza.zza(zza.this));
        return localInfo;
      }
      catch (IllegalStateException localIllegalStateException)
      {
        zzbf.zzac("IllegalStateException getting Advertising Id Info");
        return null;
      }
      catch (GooglePlayServicesRepairableException localGooglePlayServicesRepairableException)
      {
        zzbf.zzac("GooglePlayServicesRepairableException getting Advertising Id Info");
        return null;
      }
      catch (IOException localIOException)
      {
        zzbf.zzac("IOException getting Ad Id Info");
        return null;
      }
      catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException)
      {
        zzbf.zzac("GooglePlayServicesNotAvailableException getting Advertising Id Info");
        return null;
      }
      catch (Exception localException)
      {
        zzbf.zzac("Unknown exception. Could not get the Advertising Id Info.");
      }
      return null;
    }
  };
  private final zzlv zzmW;
  private final Thread zzzi;

  private zza(Context paramContext)
  {
    this(paramContext, null, zzlx.zzkc());
  }

  zza(Context paramContext, zza paramzza, zzlv paramzzlv)
  {
    this.zzmW = paramzzlv;
    if (paramContext != null);
    for (this.mContext = paramContext.getApplicationContext(); ; this.mContext = paramContext)
    {
      if (paramzza != null)
        this.zzaxi = paramzza;
      this.zzzi = new Thread(new Runnable()
      {
        public void run()
        {
          zza.zzb(zza.this);
        }
      });
      return;
    }
  }

  static zza zzaj(Context paramContext)
  {
    if (zzaxk == null);
    synchronized (zzaxj)
    {
      if (zzaxk == null)
      {
        zzaxk = new zza(paramContext);
        zzaxk.start();
      }
      return zzaxk;
    }
  }

  private void zzsA()
  {
    Process.setThreadPriority(10);
    while (!this.mClosed)
      try
      {
        this.zzAO = this.zzaxi.zzsC();
        Thread.sleep(this.zzaxf);
      }
      catch (InterruptedException localInterruptedException)
      {
        zzbf.zzaa("sleep interrupted in AdvertiserDataPoller thread; continuing");
      }
  }

  private void zzsB()
  {
    if (this.zzmW.currentTimeMillis() - this.zzaxh < this.zzaxg)
      return;
    interrupt();
    this.zzaxh = this.zzmW.currentTimeMillis();
  }

  void interrupt()
  {
    this.zzzi.interrupt();
  }

  public boolean isLimitAdTrackingEnabled()
  {
    zzsB();
    if (this.zzAO == null)
      return true;
    return this.zzAO.isLimitAdTrackingEnabled();
  }

  void start()
  {
    this.zzzi.start();
  }

  public String zzsz()
  {
    zzsB();
    if (this.zzAO == null)
      return null;
    return this.zzAO.getId();
  }

  public static abstract interface zza
  {
    public abstract AdvertisingIdClient.Info zzsC();
  }
}