package com.google.android.gms.internal;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.KeyguardManager;
import android.content.Context;
import android.os.PowerManager;
import android.os.Process;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.webkit.WebView;
import android.widget.EditText;
import android.widget.TextView;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public class zzan extends Thread
{
  private boolean mStarted = false;
  private final int zznW;
  private final int zznY;
  private final Object zznh;
  private boolean zzoj = false;
  private boolean zzok = false;
  private final zzam zzol;
  private final zzal zzom;
  private final zzgh zzon;
  private final int zzoo;
  private final int zzop;
  private final int zzoq;

  public zzan(zzam paramzzam, zzal paramzzal, zzgh paramzzgh)
  {
    this.zzol = paramzzam;
    this.zzom = paramzzal;
    this.zzon = paramzzgh;
    this.zznh = new Object();
    this.zznW = ((Integer)zzca.zzqC.get()).intValue();
    this.zzop = ((Integer)zzca.zzqD.get()).intValue();
    this.zznY = ((Integer)zzca.zzqE.get()).intValue();
    this.zzoq = ((Integer)zzca.zzqF.get()).intValue();
    this.zzoo = ((Integer)zzca.zzqG.get()).intValue();
    setName("ContentFetchTask");
  }

  public void run()
  {
    while (!this.zzok)
      try
      {
        if (zzbu())
        {
          localActivity = this.zzol.getActivity();
          if (localActivity == null)
            zzhx.zzY("ContentFetchThread: no activity");
        }
      }
      catch (Throwable localThrowable)
      {
        Activity localActivity;
        zzhx.zzb("Error in ContentFetchTask", localThrowable);
        this.zzon.zzb(localThrowable);
        synchronized (this.zznh)
        {
          while (true)
          {
            boolean bool = this.zzoj;
            if (!bool)
              break;
            try
            {
              zzhx.zzY("ContentFetchTask: waiting");
              this.zznh.wait();
            }
            catch (InterruptedException localInterruptedException)
            {
            }
          }
          zza(localActivity);
          while (true)
          {
            Thread.sleep(1000 * this.zzoo);
            break;
            zzhx.zzY("ContentFetchTask: sleeping");
            zzbw();
          }
        }
      }
  }

  public void wakeup()
  {
    synchronized (this.zznh)
    {
      this.zzoj = false;
      this.zznh.notifyAll();
      zzhx.zzY("ContentFetchThread: wakeup");
      return;
    }
  }

  zza zza(View paramView, zzak paramzzak)
  {
    int i = 0;
    if (paramView == null)
      return new zza(0, 0);
    if (((paramView instanceof TextView)) && (!(paramView instanceof EditText)))
    {
      CharSequence localCharSequence = ((TextView)paramView).getText();
      if (!TextUtils.isEmpty(localCharSequence))
      {
        paramzzak.zzi(localCharSequence.toString());
        return new zza(1, 0);
      }
      return new zza(0, 0);
    }
    if (((paramView instanceof WebView)) && (!(paramView instanceof zzic)))
    {
      paramzzak.zzbp();
      if (zza((WebView)paramView, paramzzak))
        return new zza(0, 1);
      return new zza(0, 0);
    }
    if ((paramView instanceof ViewGroup))
    {
      ViewGroup localViewGroup = (ViewGroup)paramView;
      int j = 0;
      int k = 0;
      while (i < localViewGroup.getChildCount())
      {
        zza localzza = zza(localViewGroup.getChildAt(i), paramzzak);
        k += localzza.zzox;
        j += localzza.zzoy;
        i++;
      }
      return new zza(k, j);
    }
    return new zza(0, 0);
  }

  void zza(Activity paramActivity)
  {
    if (paramActivity == null);
    View localView1;
    do
    {
      return;
      Window localWindow = paramActivity.getWindow();
      localView1 = null;
      if (localWindow != null)
      {
        View localView2 = paramActivity.getWindow().getDecorView();
        localView1 = null;
        if (localView2 != null)
          localView1 = paramActivity.getWindow().getDecorView().findViewById(16908290);
      }
    }
    while (localView1 == null);
    zzf(localView1);
  }

  void zza(zzak paramzzak, WebView paramWebView, String paramString)
  {
    paramzzak.zzbo();
    try
    {
      String str;
      if (!TextUtils.isEmpty(paramString))
      {
        str = new JSONObject(paramString).optString("text");
        if (TextUtils.isEmpty(paramWebView.getTitle()))
          break label85;
        paramzzak.zzh(paramWebView.getTitle() + "\n" + str);
      }
      while (paramzzak.zzbl())
      {
        this.zzom.zzb(paramzzak);
        return;
        label85: paramzzak.zzh(str);
      }
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzY("Json string may be malformed.");
      return;
    }
    catch (Throwable localThrowable)
    {
      zzhx.zza("Failed to get webview content.", localThrowable);
      this.zzon.zzb(localThrowable);
    }
  }

  boolean zza(WebView paramWebView, zzak paramzzak)
  {
    if (!zzme.zzkj())
      return false;
    paramzzak.zzbp();
    paramWebView.post(new zzan.2(this, paramzzak, paramWebView));
    return true;
  }

  public void zzbt()
  {
    synchronized (this.zznh)
    {
      if (this.mStarted)
      {
        zzhx.zzY("Content hash thread already started, quiting...");
        return;
      }
      this.mStarted = true;
      start();
      return;
    }
  }

  boolean zzbu()
  {
    try
    {
      Context localContext = this.zzol.getContext();
      if (localContext == null)
        return false;
      ActivityManager localActivityManager = (ActivityManager)localContext.getSystemService("activity");
      KeyguardManager localKeyguardManager = (KeyguardManager)localContext.getSystemService("keyguard");
      if ((localActivityManager != null) && (localKeyguardManager != null))
      {
        List localList = localActivityManager.getRunningAppProcesses();
        if (localList == null)
          return false;
        Iterator localIterator = localList.iterator();
        while (localIterator.hasNext())
        {
          ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)localIterator.next();
          if (Process.myPid() == localRunningAppProcessInfo.pid)
            if ((localRunningAppProcessInfo.importance == 100) && (!localKeyguardManager.inKeyguardRestrictedInputMode()))
            {
              boolean bool = zzk(localContext);
              if (bool)
                return true;
            }
        }
        return false;
      }
    }
    catch (Throwable localThrowable)
    {
      return false;
    }
    return false;
  }

  public zzak zzbv()
  {
    return this.zzom.zzbs();
  }

  public void zzbw()
  {
    synchronized (this.zznh)
    {
      this.zzoj = true;
      zzhx.zzY("ContentFetchThread: paused, mPause = " + this.zzoj);
      return;
    }
  }

  public boolean zzbx()
  {
    return this.zzoj;
  }

  boolean zzf(View paramView)
  {
    if (paramView == null)
      return false;
    paramView.post(new zzan.1(this, paramView));
    return true;
  }

  void zzg(View paramView)
  {
    try
    {
      zzak localzzak = new zzak(this.zznW, this.zzop, this.zznY, this.zzoq);
      zza localzza = zza(paramView, localzzak);
      localzzak.zzbq();
      if ((localzza.zzox == 0) && (localzza.zzoy == 0))
        return;
      if (((localzza.zzoy != 0) || (localzzak.zzbr() != 0)) && ((localzza.zzoy != 0) || (!this.zzom.zza(localzzak))))
      {
        this.zzom.zzc(localzzak);
        return;
      }
    }
    catch (Exception localException)
    {
      zzhx.zzb("Exception in fetchContentOnUIThread", localException);
      this.zzon.zzb(localException);
    }
  }

  boolean zzk(Context paramContext)
  {
    PowerManager localPowerManager = (PowerManager)paramContext.getSystemService("power");
    if (localPowerManager == null)
      return false;
    return localPowerManager.isScreenOn();
  }

  @zzgi
  class zza
  {
    final int zzox;
    final int zzoy;

    zza(int paramInt1, int arg3)
    {
      this.zzox = paramInt1;
      int i;
      this.zzoy = i;
    }
  }
}