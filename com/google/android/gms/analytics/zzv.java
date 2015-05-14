package com.google.android.gms.analytics;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.os.SystemClock;

class zzv extends zzaj
{
  private static final Object zzBQ = new Object();
  private static zzv zzCf;
  private Context mContext;
  private Handler mHandler;
  private zzd zzBR;
  private volatile zzf zzBS;
  private int zzBT = 1800;
  private long zzBU = -9223372036854775808L;
  private boolean zzBV = true;
  private boolean zzBW;
  private String zzBX;
  private boolean zzBY = false;
  private boolean zzBZ = true;
  private boolean zzBs = false;
  private boolean zzCa = true;
  private zze zzCb = new zze()
  {
    public void zzD(boolean paramAnonymousBoolean)
    {
      zzv.this.zzb(paramAnonymousBoolean, zzv.zza(zzv.this));
    }
  };
  private boolean zzCc;
  private zzu zzCd;
  private boolean zzCe = false;

  public static zzv zzfE()
  {
    if (zzCf == null)
      zzCf = new zzv();
    return zzCf;
  }

  private void zzfF()
  {
    this.zzCd = new zzu(this);
    this.zzCd.zzD(this.mContext);
  }

  private PendingIntent zzfG()
  {
    Intent localIntent = new Intent(this.mContext.getApplicationContext(), AnalyticsReceiver.class);
    localIntent.setAction("com.google.android.gms.analytics.ANALYTICS_DISPATCH");
    return PendingIntent.getBroadcast(this.mContext, 0, localIntent, 0);
  }

  private AlarmManager zzfH()
  {
    PendingIntent localPendingIntent = zzfG();
    AlarmManager localAlarmManager = (AlarmManager)this.mContext.getApplicationContext().getSystemService("alarm");
    localAlarmManager.cancel(localPendingIntent);
    return localAlarmManager;
  }

  private void zzfI()
  {
    try
    {
      zzfH();
      ActivityInfo localActivityInfo = this.mContext.getPackageManager().getReceiverInfo(new ComponentName(this.mContext, AnalyticsReceiver.class), 2);
      if ((localActivityInfo != null) && (localActivityInfo.enabled) && (this.zzBT > 0))
      {
        zzh(this.zzBT, this.zzBT);
        zzae.zzab("Using a receiver for local dispatch.");
        this.zzCc = true;
        return;
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      do
      {
        zzae.zzab("Receiver for local dispatch not registered. For more reliable analytics, please see http://goo.gl/8Rd3yj for instructions.");
        this.mHandler = new Handler(this.mContext.getMainLooper(), new Handler.Callback()
        {
          public boolean handleMessage(Message paramAnonymousMessage)
          {
            if ((1 == paramAnonymousMessage.what) && (zzv.zzfK().equals(paramAnonymousMessage.obj)))
            {
              long l = SystemClock.elapsedRealtime();
              if (l >= zzv.zzb(zzv.this) + 1000 * zzv.zzc(zzv.this))
              {
                zzy.zzfV().zzF(true);
                zzv.this.dispatchLocalHits();
                zzy.zzfV().zzF(false);
                zzv.zza(zzv.this, l);
              }
              if ((zzv.zzc(zzv.this) > 0) && (!zzv.zzd(zzv.this)))
                zzv.zze(zzv.this).sendMessageDelayed(zzv.zze(zzv.this).obtainMessage(1, zzv.zzfK()), 1000 * Math.min(60, zzv.zzc(zzv.this)));
            }
            return true;
          }
        });
      }
      while (this.zzBT <= 0);
      this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(1, zzBQ), 1000 * Math.min(60, this.zzBT));
    }
  }

  private void zzh(int paramInt1, int paramInt2)
  {
    if (!this.zzBY)
    {
      if (paramInt1 < 1800)
        paramInt1 = 1800;
      if (paramInt2 < 1800)
        paramInt2 = 1800;
    }
    zzfH().setInexactRepeating(2, paramInt1 * 1000, paramInt2 * 1000, zzfG());
  }

  void dispatchLocalHits()
  {
    try
    {
      zzF(null);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void setLocalDispatchPeriod(int paramInt)
  {
    try
    {
      if ((this.mHandler == null) && (!this.zzCc))
      {
        zzae.zzab("Dispatch period set with null handler and no receiver. Dispatch will run once initialization is complete.");
        this.zzBT = paramInt;
        AnalyticsService.zzC(paramInt);
      }
      while (true)
      {
        return;
        zzy.zzfV().zza(zzy.zza.zzDO);
        if ((!this.zzCe) && (this.zzBZ) && (this.zzBT > 0))
        {
          if (this.mHandler != null)
            this.mHandler.removeMessages(1, zzBQ);
          if (this.zzCc)
            zzfH();
        }
        this.zzBT = paramInt;
        AnalyticsService.zzC(paramInt);
        if ((paramInt > 0) && (!this.zzCe) && (this.zzBZ))
        {
          if (this.mHandler != null)
            this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(1, zzBQ), 1000 * Math.min(60, this.zzBT));
          if (this.zzCc)
            zzh(paramInt, paramInt);
        }
      }
    }
    finally
    {
    }
  }

  zzd zzE(Context paramContext)
  {
    if (paramContext != null);
    try
    {
      if (this.mContext == null)
        this.mContext = paramContext;
      if (this.zzBR != null)
        break label116;
      if (this.mContext == null)
        throw new IllegalStateException("Cant get a store unless we have a context");
    }
    finally
    {
    }
    this.zzBR = new zzag(this.zzCb, this.mContext, new zzj());
    this.zzBR.setDryRun(this.zzBs);
    if (this.zzBX != null)
    {
      this.zzBR.zzff().zzak(this.zzBX);
      this.zzBX = null;
    }
    label116: if ((this.mHandler == null) && (!this.zzCc))
      zzfI();
    if ((this.zzCd == null) && (this.zzCa))
      zzfF();
    zzd localzzd = this.zzBR;
    return localzzd;
  }

  void zzE(boolean paramBoolean)
  {
    try
    {
      zzb(this.zzCe, paramBoolean);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void zzF(Context paramContext)
  {
    try
    {
      zzf localzzf;
      if (this.zzBS != null)
      {
        localzzf = this.zzBS;
        if (localzzf != null)
          break label72;
        zzae.zzab("Dispatch call queued. Dispatch will run once initialization is complete.");
        this.zzBV = true;
      }
      while (true)
      {
        return;
        if (paramContext != null)
        {
          localzzf = GoogleAnalytics.getInstance(paramContext).zzgm();
          break;
        }
        GoogleAnalytics localGoogleAnalytics = GoogleAnalytics.zzgj();
        localzzf = null;
        if (localGoogleAnalytics == null)
          break;
        localzzf = GoogleAnalytics.zzgj().zzgm();
        break;
        label72: zzy.zzfV().zza(zzy.zza.zzDN);
        localzzf.dispatch();
      }
    }
    finally
    {
    }
  }

  void zza(Context paramContext, zzf paramzzf)
  {
    try
    {
      Context localContext = this.mContext;
      if (localContext != null);
      while (true)
      {
        return;
        this.mContext = paramContext.getApplicationContext();
        if (this.zzBS == null)
        {
          this.zzBS = paramzzf;
          if (this.zzBV)
          {
            dispatchLocalHits();
            this.zzBV = false;
          }
          if (this.zzBW)
          {
            zzfh();
            this.zzBW = false;
          }
        }
      }
    }
    finally
    {
    }
  }

  void zzb(boolean paramBoolean1, boolean paramBoolean2)
  {
    while (true)
    {
      try
      {
        if (this.zzCe == paramBoolean1)
        {
          boolean bool = this.zzBZ;
          if (bool == paramBoolean2)
            return;
        }
        if (((paramBoolean1) || (!paramBoolean2)) && (this.zzBT > 0))
        {
          if (this.mHandler != null)
            this.mHandler.removeMessages(1, zzBQ);
          if (this.zzCc)
            zzfH();
        }
        if ((!paramBoolean1) && (paramBoolean2) && (this.zzBT > 0))
        {
          if (this.mHandler != null)
            this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(1, zzBQ), 1000 * Math.min(60, this.zzBT));
          if (this.zzCc)
            zzh(this.zzBT, this.zzBT);
        }
        StringBuilder localStringBuilder = new StringBuilder().append("PowerSaveMode ");
        if (paramBoolean1)
          break label209;
        if (!paramBoolean2)
        {
          break label209;
          zzae.zzab(str);
          this.zzCe = paramBoolean1;
          this.zzBZ = paramBoolean2;
          continue;
        }
      }
      finally
      {
      }
      String str = "terminated.";
      continue;
      label209: str = "initiated.";
    }
  }

  void zzfJ()
  {
    try
    {
      if ((!this.zzCe) && (this.zzBZ) && (this.zzBT > 0))
      {
        if (this.mHandler != null)
        {
          this.mHandler.removeMessages(1, zzBQ);
          this.zzBU = -9223372036854775808L;
          this.mHandler.sendMessage(this.mHandler.obtainMessage(1, zzBQ));
        }
        if (this.zzCc)
          zzh(0, this.zzBT);
      }
      return;
    }
    finally
    {
    }
  }

  void zzfh()
  {
    if (this.zzBS == null)
    {
      zzae.zzab("setForceLocalDispatch() queued. It will be called once initialization is complete.");
      this.zzBW = true;
      return;
    }
    zzy.zzfV().zza(zzy.zza.zzEa);
    this.zzBS.zzfh();
  }
}