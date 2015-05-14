package com.google.android.gms.tagmanager;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.KeyguardManager;
import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.PowerManager;
import android.os.Process;
import android.text.TextUtils;
import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

class zzda extends zzaj
{
  private static final String ID = zza.zzba.toString();
  private static final String NAME = zzb.zzdB.toString();
  private static final String zzaAV = zzb.zzdh.toString();
  private static final String zzaAW = zzb.zzdp.toString();
  private static final String zzaAX = zzb.zzeV.toString();
  private final Context mContext;
  private Handler mHandler;
  private boolean zzaAY;
  private boolean zzaAZ;
  private final HandlerThread zzaBa;
  private final Set<String> zzaBb = new HashSet();
  private DataLayer zzaxx;

  public zzda(Context paramContext, DataLayer paramDataLayer)
  {
    super(str, arrayOfString);
    this.mContext = paramContext;
    this.zzaxx = paramDataLayer;
    this.zzaBa = new HandlerThread("Google GTM SDK Timer", 10);
    this.zzaBa.start();
    this.mHandler = new Handler(this.zzaBa.getLooper());
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    String str1 = zzde.zzg((zzd.zza)paramMap.get(NAME));
    String str2 = zzde.zzg((zzd.zza)paramMap.get(zzaAX));
    String str3 = zzde.zzg((zzd.zza)paramMap.get(zzaAV));
    String str4 = zzde.zzg((zzd.zza)paramMap.get(zzaAW));
    try
    {
      long l4 = Long.parseLong(str3);
      l1 = l4;
    }
    catch (NumberFormatException localNumberFormatException1)
    {
      try
      {
        while (true)
        {
          long l3 = Long.parseLong(str4);
          l2 = l3;
          if ((l1 > 0L) && (!TextUtils.isEmpty(str1)))
          {
            if ((str2 == null) || (str2.isEmpty()))
              str2 = "0";
            if (!this.zzaBb.contains(str2))
            {
              if (!"0".equals(str2))
                this.zzaBb.add(str2);
              this.mHandler.postDelayed(new zza(str1, str2, l1, l2), l1);
            }
          }
          return zzde.zzuf();
          localNumberFormatException1 = localNumberFormatException1;
          long l1 = 0L;
        }
      }
      catch (NumberFormatException localNumberFormatException2)
      {
        while (true)
          long l2 = 0L;
      }
    }
  }

  public boolean zzsD()
  {
    return false;
  }

  private final class zza
    implements Runnable
  {
    private final String zzaBc;
    private final String zzaBd;
    private final long zzaBe;
    private final long zzaBf;
    private long zzaBg;
    private final long zzamf;

    zza(String paramString1, String paramLong1, long arg4, long arg6)
    {
      this.zzaBc = paramString1;
      this.zzaBd = paramLong1;
      this.zzamf = ???;
      Object localObject;
      this.zzaBe = localObject;
      this.zzaBf = System.currentTimeMillis();
    }

    public void run()
    {
      if ((this.zzaBe > 0L) && (this.zzaBg >= this.zzaBe))
      {
        if (!"0".equals(this.zzaBd))
          zzda.zza(zzda.this).remove(this.zzaBd);
        return;
      }
      this.zzaBg = (1L + this.zzaBg);
      if (zzbu())
      {
        long l = System.currentTimeMillis();
        DataLayer localDataLayer = zzda.zzb(zzda.this);
        Object[] arrayOfObject = new Object[16];
        arrayOfObject[0] = "event";
        arrayOfObject[1] = this.zzaBc;
        arrayOfObject[2] = "gtm.timerInterval";
        arrayOfObject[3] = String.valueOf(this.zzamf);
        arrayOfObject[4] = "gtm.timerLimit";
        arrayOfObject[5] = String.valueOf(this.zzaBe);
        arrayOfObject[6] = "gtm.timerStartTime";
        arrayOfObject[7] = String.valueOf(this.zzaBf);
        arrayOfObject[8] = "gtm.timerCurrentTime";
        arrayOfObject[9] = String.valueOf(l);
        arrayOfObject[10] = "gtm.timerElapsedTime";
        arrayOfObject[11] = String.valueOf(l - this.zzaBf);
        arrayOfObject[12] = "gtm.timerEventNumber";
        arrayOfObject[13] = String.valueOf(this.zzaBg);
        arrayOfObject[14] = "gtm.triggers";
        arrayOfObject[15] = this.zzaBd;
        localDataLayer.push(DataLayer.mapOf(arrayOfObject));
      }
      zzda.zzc(zzda.this).postDelayed(this, this.zzamf);
    }

    protected boolean zzbu()
    {
      if (zzda.zzd(zzda.this))
        return zzda.zze(zzda.this);
      ActivityManager localActivityManager = (ActivityManager)zzda.zzf(zzda.this).getSystemService("activity");
      KeyguardManager localKeyguardManager = (KeyguardManager)zzda.zzf(zzda.this).getSystemService("keyguard");
      PowerManager localPowerManager = (PowerManager)zzda.zzf(zzda.this).getSystemService("power");
      Iterator localIterator = localActivityManager.getRunningAppProcesses().iterator();
      while (localIterator.hasNext())
      {
        ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)localIterator.next();
        if ((Process.myPid() == localRunningAppProcessInfo.pid) && (localRunningAppProcessInfo.importance == 100) && (!localKeyguardManager.inKeyguardRestrictedInputMode()) && (localPowerManager.isScreenOn()))
          return true;
      }
      return false;
    }
  }
}