package com.google.android.gms.analytics;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzlv;
import com.google.android.gms.internal.zzlx;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.Set;

public class Tracker
{
  private final GoogleAnalytics zzBN;
  private final TrackerHandler zzFe;
  private final Map<String, String> zzFf = new HashMap();
  private final zzah zzFg;
  private final zza zzFh;
  private ExceptionReporter zzFi;
  private zzam zzFj;
  private final Map<String, String> zzsZ = new HashMap();

  Tracker(GoogleAnalytics paramGoogleAnalytics, String paramString, TrackerHandler paramTrackerHandler, zzah paramzzah)
  {
    zzx.zzl(paramGoogleAnalytics);
    this.zzBN = paramGoogleAnalytics;
    if (paramTrackerHandler == null)
    {
      this.zzFe = paramGoogleAnalytics;
      if (paramString != null)
        this.zzsZ.put("&tid", paramString);
      this.zzsZ.put("useSecure", "1");
      this.zzsZ.put("&a", Integer.toString(1 + new Random().nextInt(2147483647)));
      if (paramzzah != null)
        break label149;
    }
    label149: for (this.zzFg = new zzad("tracking"); ; this.zzFg = paramzzah)
    {
      this.zzFh = new zza();
      enableAdvertisingIdCollection(false);
      return;
      this.zzFe = paramTrackerHandler;
      break;
    }
  }

  private boolean zzgD()
  {
    return this.zzFi != null;
  }

  static String zzp(Activity paramActivity)
  {
    zzx.zzl(paramActivity);
    Intent localIntent = paramActivity.getIntent();
    if (localIntent == null);
    String str;
    do
    {
      return null;
      str = localIntent.getStringExtra("android.intent.extra.REFERRER_NAME");
    }
    while (TextUtils.isEmpty(str));
    return str;
  }

  public void enableAdvertisingIdCollection(boolean paramBoolean)
  {
    if (!paramBoolean)
    {
      this.zzsZ.put("&ate", null);
      this.zzsZ.put("&adid", null);
    }
    do
    {
      return;
      if (this.zzsZ.containsKey("&ate"))
        this.zzsZ.remove("&ate");
    }
    while (!this.zzsZ.containsKey("&adid"));
    this.zzsZ.remove("&adid");
  }

  public void enableAutoActivityTracking(boolean paramBoolean)
  {
    this.zzFh.enableAutoActivityTracking(paramBoolean);
  }

  public void enableExceptionReporting(boolean paramBoolean)
  {
    while (true)
    {
      try
      {
        if (zzgD() == paramBoolean)
          return;
        if (paramBoolean)
        {
          Context localContext = this.zzBN.getContext();
          this.zzFi = new ExceptionReporter(this, Thread.getDefaultUncaughtExceptionHandler(), localContext);
          Thread.setDefaultUncaughtExceptionHandler(this.zzFi);
          zzae.zzab("Uncaught exceptions will be reported to Google Analytics.");
          return;
        }
      }
      finally
      {
      }
      Thread.setDefaultUncaughtExceptionHandler(this.zzFi.zzfD());
      zzae.zzab("Uncaught exceptions will not be reported to Google Analytics.");
    }
  }

  public String get(String paramString)
  {
    zzy.zzfV().zza(zzy.zza.zzDe);
    if (TextUtils.isEmpty(paramString));
    zzg localzzg;
    do
    {
      return null;
      if (this.zzsZ.containsKey(paramString))
        return (String)this.zzsZ.get(paramString);
      if (paramString.equals("&ul"))
        return zzan.zza(Locale.getDefault());
      zzk localzzk = this.zzBN.zzgp();
      if (localzzk.zzaj(paramString))
        return localzzk.getValue(paramString);
      zzai localzzai = this.zzBN.zzgn();
      if (localzzai.zzaj(paramString))
        return localzzai.getValue(paramString);
      localzzg = this.zzBN.zzgo();
    }
    while (!localzzg.zzaj(paramString));
    return localzzg.getValue(paramString);
  }

  public void send(Map<String, String> paramMap)
  {
    zzy.zzfV().zza(zzy.zza.zzDg);
    HashMap localHashMap = new HashMap();
    localHashMap.putAll(this.zzsZ);
    if (paramMap != null)
      localHashMap.putAll(paramMap);
    Iterator localIterator = this.zzFf.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str3 = (String)localIterator.next();
      if (!localHashMap.containsKey(str3))
        localHashMap.put(str3, this.zzFf.get(str3));
    }
    this.zzFf.clear();
    if (TextUtils.isEmpty((CharSequence)localHashMap.get("&tid")))
      zzae.zzac(String.format("Missing tracking id (%s) parameter.", new Object[] { "&tid" }));
    String str1 = (String)localHashMap.get("&t");
    if (TextUtils.isEmpty(str1))
    {
      zzae.zzac(String.format("Missing hit type (%s) parameter.", new Object[] { "&t" }));
      str1 = "";
    }
    if (this.zzFh.zzgG())
      localHashMap.put("&sc", "start");
    String str2 = str1.toLowerCase();
    if (("screenview".equals(str2)) || ("pageview".equals(str2)) || ("appview".equals(str2)) || (TextUtils.isEmpty(str2)))
    {
      int i = 1 + Integer.parseInt((String)this.zzsZ.get("&a"));
      if (i >= 2147483647)
        i = 1;
      this.zzsZ.put("&a", Integer.toString(i));
    }
    if ((!str2.equals("transaction")) && (!str2.equals("item")) && (!this.zzFg.zzgv()))
    {
      zzae.zzac("Too many hits sent too quickly, rate limiting invoked.");
      return;
    }
    this.zzFe.zzx(localHashMap);
  }

  public void set(String paramString1, String paramString2)
  {
    zzx.zzb(paramString1, "Key should be non-null");
    zzy.zzfV().zza(zzy.zza.zzDf);
    this.zzsZ.put(paramString1, paramString2);
  }

  public void setAnonymizeIp(boolean paramBoolean)
  {
    set("&aip", zzan.zzG(paramBoolean));
  }

  public void setAppId(String paramString)
  {
    set("&aid", paramString);
  }

  public void setAppInstallerId(String paramString)
  {
    set("&aiid", paramString);
  }

  public void setAppName(String paramString)
  {
    set("&an", paramString);
  }

  public void setAppVersion(String paramString)
  {
    set("&av", paramString);
  }

  public void setCampaignParamsOnNextHit(Uri paramUri)
  {
    if ((paramUri == null) || (paramUri.isOpaque()));
    String str9;
    do
    {
      String str1;
      do
      {
        return;
        str1 = paramUri.getQueryParameter("referrer");
      }
      while (TextUtils.isEmpty(str1));
      Uri localUri = Uri.parse("http://hostname/?" + str1);
      String str2 = localUri.getQueryParameter("utm_id");
      if (str2 != null)
        this.zzFf.put("&ci", str2);
      String str3 = localUri.getQueryParameter("utm_campaign");
      if (str3 != null)
        this.zzFf.put("&cn", str3);
      String str4 = localUri.getQueryParameter("utm_content");
      if (str4 != null)
        this.zzFf.put("&cc", str4);
      String str5 = localUri.getQueryParameter("utm_medium");
      if (str5 != null)
        this.zzFf.put("&cm", str5);
      String str6 = localUri.getQueryParameter("utm_source");
      if (str6 != null)
        this.zzFf.put("&cs", str6);
      String str7 = localUri.getQueryParameter("utm_term");
      if (str7 != null)
        this.zzFf.put("&ck", str7);
      String str8 = localUri.getQueryParameter("dclid");
      if (str8 != null)
        this.zzFf.put("&dclid", str8);
      str9 = localUri.getQueryParameter("gclid");
    }
    while (str9 == null);
    this.zzFf.put("&gclid", str9);
  }

  public void setClientId(String paramString)
  {
    set("&cid", paramString);
  }

  public void setEncoding(String paramString)
  {
    set("&de", paramString);
  }

  public void setHostname(String paramString)
  {
    set("&dh", paramString);
  }

  public void setLanguage(String paramString)
  {
    set("&ul", paramString);
  }

  public void setLocation(String paramString)
  {
    set("&dl", paramString);
  }

  public void setPage(String paramString)
  {
    set("&dp", paramString);
  }

  public void setReferrer(String paramString)
  {
    set("&dr", paramString);
  }

  public void setSampleRate(double paramDouble)
  {
    set("&sf", Double.toString(paramDouble));
  }

  public void setScreenColors(String paramString)
  {
    set("&sd", paramString);
  }

  public void setScreenName(String paramString)
  {
    set("&cd", paramString);
  }

  public void setScreenResolution(int paramInt1, int paramInt2)
  {
    if ((paramInt1 < 0) && (paramInt2 < 0))
    {
      zzae.zzac("Invalid width or height. The values should be non-negative.");
      return;
    }
    set("&sr", paramInt1 + "x" + paramInt2);
  }

  public void setSessionTimeout(long paramLong)
  {
    this.zzFh.setSessionTimeout(1000L * paramLong);
  }

  public void setTitle(String paramString)
  {
    set("&dt", paramString);
  }

  public void setUseSecure(boolean paramBoolean)
  {
    set("useSecure", zzan.zzG(paramBoolean));
  }

  public void setViewportSize(String paramString)
  {
    set("&vp", paramString);
  }

  void zza(zzam paramzzam)
  {
    zzae.zzab("Loading Tracker config values.");
    this.zzFj = paramzzam;
    if (this.zzFj.zzgK())
    {
      String str2 = this.zzFj.zzgL();
      set("&tid", str2);
      zzae.zzab("[Tracker] trackingId loaded: " + str2);
    }
    if (this.zzFj.zzgM())
    {
      String str1 = Double.toString(this.zzFj.zzgN());
      set("&sf", str1);
      zzae.zzab("[Tracker] sample frequency loaded: " + str1);
    }
    if (this.zzFj.zzgO())
    {
      setSessionTimeout(this.zzFj.getSessionTimeout());
      zzae.zzab("[Tracker] session timeout loaded: " + zzgE());
    }
    if (this.zzFj.zzgP())
    {
      enableAutoActivityTracking(this.zzFj.zzgQ());
      zzae.zzab("[Tracker] auto activity tracking loaded: " + zzgF());
    }
    if (this.zzFj.zzgR())
    {
      if (this.zzFj.zzgS())
      {
        set("&aip", "1");
        zzae.zzab("[Tracker] anonymize ip loaded: true");
      }
      zzae.zzab("[Tracker] anonymize ip loaded: false");
    }
    enableExceptionReporting(this.zzFj.zzgT());
  }

  long zzgE()
  {
    return this.zzFh.zzgE();
  }

  boolean zzgF()
  {
    return this.zzFh.zzgF();
  }

  private class zza
    implements GoogleAnalytics.zza
  {
    private boolean zzFk;
    private int zzFl;
    private long zzFm = -1L;
    private boolean zzFn;
    private long zzFo;
    private zzlv zzmW = zzlx.zzkc();

    public zza()
    {
    }

    private void zzgH()
    {
      if ((this.zzFm >= 0L) || (this.zzFk))
      {
        Tracker.zzc(Tracker.this).zza(Tracker.zzb(Tracker.this));
        return;
      }
      Tracker.zzc(Tracker.this).zzb(Tracker.zzb(Tracker.this));
    }

    public void enableAutoActivityTracking(boolean paramBoolean)
    {
      this.zzFk = paramBoolean;
      zzgH();
    }

    public void setSessionTimeout(long paramLong)
    {
      this.zzFm = paramLong;
      zzgH();
    }

    public long zzgE()
    {
      return this.zzFm;
    }

    public boolean zzgF()
    {
      return this.zzFk;
    }

    public boolean zzgG()
    {
      boolean bool = this.zzFn;
      this.zzFn = false;
      return bool;
    }

    boolean zzgI()
    {
      return this.zzmW.elapsedRealtime() >= this.zzFo + Math.max(1000L, this.zzFm);
    }

    public void zzn(Activity paramActivity)
    {
      zzy.zzfV().zza(zzy.zza.zzEd);
      if ((this.zzFl == 0) && (zzgI()))
        this.zzFn = true;
      this.zzFl = (1 + this.zzFl);
      HashMap localHashMap;
      Tracker localTracker;
      if (this.zzFk)
      {
        Intent localIntent = paramActivity.getIntent();
        if (localIntent != null)
          Tracker.this.setCampaignParamsOnNextHit(localIntent.getData());
        localHashMap = new HashMap();
        localHashMap.put("&t", "screenview");
        zzy.zzfV().zzF(true);
        localTracker = Tracker.this;
        if (Tracker.zzd(Tracker.this) == null)
          break label187;
      }
      label187: for (String str1 = Tracker.zzd(Tracker.this).zzq(paramActivity); ; str1 = paramActivity.getClass().getCanonicalName())
      {
        localTracker.set("&cd", str1);
        if (TextUtils.isEmpty((CharSequence)localHashMap.get("&dr")))
        {
          String str2 = Tracker.zzp(paramActivity);
          if (!TextUtils.isEmpty(str2))
            localHashMap.put("&dr", str2);
        }
        Tracker.this.send(localHashMap);
        zzy.zzfV().zzF(false);
        return;
      }
    }

    public void zzo(Activity paramActivity)
    {
      zzy.zzfV().zza(zzy.zza.zzEe);
      this.zzFl = (-1 + this.zzFl);
      this.zzFl = Math.max(0, this.zzFl);
      if (this.zzFl == 0)
        this.zzFo = this.zzmW.elapsedRealtime();
    }
  }
}