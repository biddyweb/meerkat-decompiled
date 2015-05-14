package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

@zzgi
public class zzid extends WebViewClient
{
  protected final zzic zzmu;
  private boolean zzng;
  private final Object zznh = new Object();
  private zzat zzoJ;
  private zzcy zzrJ;
  private zzu zzrK;
  private zzeb zzrL;
  private zzcw zzrN;
  private zzct zzry;
  private zzeh zztq;
  private zzid.zza zzvD;
  private final HashMap<String, List<zzcv>> zzzQ = new HashMap();
  private zzep zzzR;
  private boolean zzzS = false;
  private zzes zzzT;
  private final zzef zzzU;
  private boolean zzzV;
  private boolean zzzW;
  private int zzzX;

  public zzid(zzic paramzzic, boolean paramBoolean)
  {
    this(paramzzic, paramBoolean, new zzef(paramzzic, paramzzic.zzeE(), new zzbu(paramzzic.getContext())));
  }

  zzid(zzic paramzzic, boolean paramBoolean, zzef paramzzef)
  {
    this.zzmu = paramzzic;
    this.zzng = paramBoolean;
    this.zzzU = paramzzef;
  }

  private void zzeN()
  {
    this.zzzX = (1 + this.zzzX);
    zzeQ();
  }

  private void zzeO()
  {
    this.zzzX = (-1 + this.zzzX);
    zzeQ();
  }

  private void zzeP()
  {
    this.zzzW = true;
    zzeQ();
  }

  private static boolean zzf(Uri paramUri)
  {
    String str = paramUri.getScheme();
    return ("http".equalsIgnoreCase(str)) || ("https".equalsIgnoreCase(str));
  }

  private void zzg(Uri paramUri)
  {
    String str1 = paramUri.getPath();
    List localList = (List)this.zzzQ.get(str1);
    if (localList != null)
    {
      Map localMap = zzab.zzaM().zzd(paramUri);
      if (zzhx.zzA(2))
      {
        zzhx.zzab("Received GMSG: " + str1);
        Iterator localIterator2 = localMap.keySet().iterator();
        while (localIterator2.hasNext())
        {
          String str2 = (String)localIterator2.next();
          zzhx.zzab("  " + str2 + ": " + (String)localMap.get(str2));
        }
      }
      Iterator localIterator1 = localList.iterator();
      while (localIterator1.hasNext())
        ((zzcv)localIterator1.next()).zza(this.zzmu, localMap);
    }
    zzhx.zzab("No GMSG handler found for GMSG: " + paramUri);
  }

  public final void onLoadResource(WebView paramWebView, String paramString)
  {
    zzhx.zzab("Loading resource: " + paramString);
    Uri localUri = Uri.parse(paramString);
    if (("gmsg".equalsIgnoreCase(localUri.getScheme())) && ("mobileads.google.com".equalsIgnoreCase(localUri.getHost())))
      zzg(localUri);
  }

  public final void onPageFinished(WebView paramWebView, String paramString)
  {
    this.zzzV = true;
    zzeQ();
  }

  public final void reset()
  {
    synchronized (this.zznh)
    {
      this.zzzQ.clear();
      this.zzoJ = null;
      this.zzzR = null;
      this.zzvD = null;
      this.zzry = null;
      this.zzzS = false;
      this.zzng = false;
      this.zzrN = null;
      this.zzzT = null;
      if (this.zzrL != null)
      {
        this.zzrL.zzm(true);
        this.zzrL = null;
      }
      return;
    }
  }

  public final boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
  {
    zzhx.zzab("AdWebView shouldOverrideUrlLoading: " + paramString);
    Object localObject1 = Uri.parse(paramString);
    if (("gmsg".equalsIgnoreCase(((Uri)localObject1).getScheme())) && ("mobileads.google.com".equalsIgnoreCase(((Uri)localObject1).getHost())))
      zzg((Uri)localObject1);
    while (true)
    {
      return true;
      if ((this.zzzS) && (paramWebView == this.zzmu) && (zzf((Uri)localObject1)))
        return super.shouldOverrideUrlLoading(paramWebView, paramString);
      if (!this.zzmu.willNotDraw())
        try
        {
          zzk localzzk = this.zzmu.zzeI();
          if ((localzzk != null) && (localzzk.zzb((Uri)localObject1)))
          {
            Uri localUri = localzzk.zza((Uri)localObject1, this.zzmu.getContext());
            localObject1 = localUri;
          }
          localObject2 = localObject1;
          if ((this.zzrK == null) || (this.zzrK.zzaB()))
            zza(new zzek("android.intent.action.VIEW", localObject2.toString(), null, null, null, null, null));
        }
        catch (zzl localzzl)
        {
          while (true)
          {
            zzhx.zzac("Unable to append parameter to URL: " + paramString);
            Object localObject2 = localObject1;
          }
          this.zzrK.zzd(paramString);
        }
      else
        zzhx.zzac("AdWebView unable to handle URL: " + paramString);
    }
  }

  public void zzC(boolean paramBoolean)
  {
    this.zzzS = paramBoolean;
  }

  public final void zza(zzek paramzzek)
  {
    boolean bool = this.zzmu.zzeK();
    zzat localzzat;
    zzep localzzep;
    if ((bool) && (!this.zzmu.zzad().zzpb))
    {
      localzzat = null;
      localzzep = null;
      if (!bool)
        break label75;
    }
    while (true)
    {
      zza(new zzeo(paramzzek, localzzat, localzzep, this.zzzT, this.zzmu.zzeJ()));
      return;
      localzzat = this.zzoJ;
      break;
      label75: localzzep = this.zzzR;
    }
  }

  public void zza(zzeo paramzzeo)
  {
    if (this.zzrL != null);
    for (boolean bool1 = this.zzrL.zzcP(); ; bool1 = false)
    {
      zzem localzzem = zzab.zzaK();
      Context localContext = this.zzmu.getContext();
      boolean bool2 = false;
      if (!bool1)
        bool2 = true;
      localzzem.zza(localContext, paramzzeo, bool2);
      return;
    }
  }

  public void zza(zzid.zza paramzza)
  {
    this.zzvD = paramzza;
  }

  public final void zza(String paramString, zzcv paramzzcv)
  {
    synchronized (this.zznh)
    {
      Object localObject3 = (List)this.zzzQ.get(paramString);
      if (localObject3 == null)
      {
        localObject3 = new ArrayList();
        this.zzzQ.put(paramString, localObject3);
      }
      ((List)localObject3).add(paramzzcv);
      return;
    }
  }

  public final void zza(boolean paramBoolean, int paramInt)
  {
    if ((this.zzmu.zzeK()) && (!this.zzmu.zzad().zzpb));
    for (zzat localzzat = null; ; localzzat = this.zzoJ)
    {
      zza(new zzeo(localzzat, this.zzzR, this.zzzT, this.zzmu, paramBoolean, paramInt, this.zzmu.zzeJ()));
      return;
    }
  }

  public final void zza(boolean paramBoolean, int paramInt, String paramString)
  {
    boolean bool = this.zzmu.zzeK();
    zzat localzzat;
    zzep localzzep;
    if ((bool) && (!this.zzmu.zzad().zzpb))
    {
      localzzat = null;
      localzzep = null;
      if (!bool)
        break label95;
    }
    while (true)
    {
      zza(new zzeo(localzzat, localzzep, this.zzry, this.zzzT, this.zzmu, paramBoolean, paramInt, paramString, this.zzmu.zzeJ(), this.zzrN));
      return;
      localzzat = this.zzoJ;
      break;
      label95: localzzep = this.zzzR;
    }
  }

  public final void zza(boolean paramBoolean, int paramInt, String paramString1, String paramString2)
  {
    boolean bool = this.zzmu.zzeK();
    zzat localzzat;
    if ((bool) && (!this.zzmu.zzad().zzpb))
    {
      localzzat = null;
      if (!bool)
        break label97;
    }
    label97: for (zzep localzzep = null; ; localzzep = this.zzzR)
    {
      zza(new zzeo(localzzat, localzzep, this.zzry, this.zzzT, this.zzmu, paramBoolean, paramInt, paramString1, paramString2, this.zzmu.zzeJ(), this.zzrN));
      return;
      localzzat = this.zzoJ;
      break;
    }
  }

  public void zzb(int paramInt1, int paramInt2)
  {
    this.zzzU.zzf(paramInt1, paramInt2);
    if (this.zzrL != null)
      this.zzrL.zzb(paramInt1, paramInt2);
  }

  public void zzb(zzat paramzzat, zzep paramzzep, zzct paramzzct, zzes paramzzes, boolean paramBoolean, zzcw paramzzcw, zzcy paramzzcy, zzu paramzzu, zzeh paramzzeh)
  {
    if (paramzzu == null)
      paramzzu = new zzu(false);
    this.zzrL = new zzeb(this.zzmu, paramzzeh);
    zza("/appEvent", new zzcs(paramzzct));
    zza("/canOpenURLs", zzcu.zzrA);
    zza("/canOpenIntents", zzcu.zzrB);
    zza("/click", zzcu.zzrC);
    zza("/close", zzcu.zzrD);
    zza("/customClose", zzcu.zzrE);
    zza("/delayPageLoaded", new zzid.zzb(this, null));
    zza("/httpTrack", zzcu.zzrF);
    zza("/log", zzcu.zzrG);
    zza("/mraid", new zzcz(paramzzu, this.zzrL));
    zza("/open", new zzda(paramzzcw, paramzzu, this.zzrL));
    zza("/touch", zzcu.zzrH);
    zza("/video", zzcu.zzrI);
    if (paramzzcy != null)
      zza("/setInterstitialProperties", new zzcx(paramzzcy));
    this.zzoJ = paramzzat;
    this.zzzR = paramzzep;
    this.zzry = paramzzct;
    this.zzrN = paramzzcw;
    this.zzzT = paramzzes;
    this.zzrK = paramzzu;
    this.zztq = paramzzeh;
    this.zzrJ = paramzzcy;
    zzC(paramBoolean);
  }

  public final void zzb(String paramString, zzcv paramzzcv)
  {
    synchronized (this.zznh)
    {
      List localList = (List)this.zzzQ.get(paramString);
      if (localList == null)
        return;
      localList.remove(paramzzcv);
      return;
    }
  }

  public boolean zzba()
  {
    synchronized (this.zznh)
    {
      boolean bool = this.zzng;
      return bool;
    }
  }

  public final void zzde()
  {
    synchronized (this.zznh)
    {
      this.zzzS = false;
      this.zzng = true;
      this.zzmu.zzeL();
      zzel localzzel = this.zzmu.zzeF();
      if (localzzel != null)
      {
        if (!zzbe.zzbD().zzeC())
          zzhw.zzzG.post(new zzid.1(this, localzzel));
      }
      else
        return;
      localzzel.zzde();
    }
  }

  public void zze(int paramInt1, int paramInt2)
  {
    if (this.zzrL != null)
      this.zzrL.zze(paramInt1, paramInt2);
  }

  public zzu zzeM()
  {
    return this.zzrK;
  }

  public final void zzeQ()
  {
    zzid.zza localzza;
    zzic localzzic;
    if ((this.zzvD != null) && (((this.zzzV) && (this.zzzX == 0)) || (this.zzzW)))
    {
      localzza = this.zzvD;
      localzzic = this.zzmu;
      if (this.zzzW)
        break label61;
    }
    label61: for (boolean bool = true; ; bool = false)
    {
      localzza.zza(localzzic, bool);
      this.zzvD = null;
      return;
    }
  }

  public void zzeR()
  {
    if (zzba())
      this.zzzU.zzcV();
  }
}