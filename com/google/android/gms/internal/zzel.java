package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.Window;
import android.webkit.WebChromeClient.CustomViewCallback;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;

@zzgi
public class zzel extends zzev.zza
  implements zzet
{
  static final int zztV = Color.argb(0, 0, 0, 0);
  zzic zzmu;
  private final Activity zzoi;
  zzeo zztW;
  zzeq zztX;
  zzc zztY;
  zzer zztZ;
  RelativeLayout zzts;
  boolean zzua = false;
  FrameLayout zzub;
  WebChromeClient.CustomViewCallback zzuc;
  boolean zzud = false;
  boolean zzue = false;
  boolean zzuf = false;
  int zzug = 0;
  private boolean zzuh;
  private boolean zzui = false;
  private boolean zzuj = true;

  public zzel(Activity paramActivity)
  {
    this.zzoi = paramActivity;
  }

  static RelativeLayout.LayoutParams zzd(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(paramInt3, paramInt4);
    localLayoutParams.setMargins(paramInt1, paramInt2, 0, 0);
    localLayoutParams.addRule(10);
    localLayoutParams.addRule(9);
    return localLayoutParams;
  }

  public void close()
  {
    this.zzug = 2;
    this.zzoi.finish();
  }

  public void onCreate(Bundle paramBundle)
  {
    boolean bool = false;
    if (paramBundle != null)
      bool = paramBundle.getBoolean("com.google.android.gms.ads.internal.overlay.hasResumed", false);
    this.zzud = bool;
    do
    {
      try
      {
        this.zztW = zzeo.zzb(this.zzoi.getIntent());
        if (this.zztW == null)
          throw new zza("Could not get info for ad overlay.");
      }
      catch (zza localzza)
      {
        zzhx.zzac(localzza.getMessage());
        this.zzug = 3;
        this.zzoi.finish();
        return;
      }
      if (this.zzoi.getIntent() != null)
        this.zzuj = this.zzoi.getIntent().getBooleanExtra("shouldCallOnOverlayOpened", true);
      if (this.zztW.zzuz != null);
      for (this.zzue = this.zztW.zzuz.zzml; ; this.zzue = false)
      {
        if (paramBundle == null)
        {
          if ((this.zztW.zzup != null) && (this.zzuj))
            this.zztW.zzup.zzag();
          if ((this.zztW.zzuw != 1) && (this.zztW.zzuo != null))
            this.zztW.zzuo.onAdClicked();
        }
        this.zzts = new zzb(this.zzoi, this.zztW.zzuy);
        switch (this.zztW.zzuw)
        {
        default:
          throw new zza("Could not determine ad overlay type.");
        case 1:
        case 2:
        case 3:
        case 4:
        }
      }
      zzt(false);
      return;
      this.zztY = new zzc(this.zztW.zzuq);
      zzt(false);
      return;
      zzt(true);
      return;
      if (this.zzud)
      {
        this.zzug = 3;
        this.zzoi.finish();
        return;
      }
    }
    while (zzab.zzaJ().zza(this.zzoi, this.zztW.zzun, this.zztW.zzuv));
    this.zzug = 3;
    this.zzoi.finish();
  }

  public void onDestroy()
  {
    if (this.zztX != null)
      this.zztX.destroy();
    if (this.zzmu != null)
      this.zzts.removeView(this.zzmu.getWebView());
    zzdf();
  }

  public void onPause()
  {
    if (this.zztX != null)
      this.zztX.pause();
    zzdc();
    if ((this.zzmu != null) && ((!this.zzoi.isFinishing()) || (this.zztY == null)))
      zzab.zzaO().zza(this.zzmu.getWebView());
    zzdf();
  }

  public void onRestart()
  {
  }

  public void onResume()
  {
    if ((this.zztW != null) && (this.zztW.zzuw == 4))
    {
      if (!this.zzud)
        break label73;
      this.zzug = 3;
      this.zzoi.finish();
    }
    while ((this.zzmu != null) && (!this.zzmu.isDestroyed()))
    {
      zzab.zzaO().zzb(this.zzmu.getWebView());
      return;
      label73: this.zzud = true;
    }
    zzhx.zzac("The webview does not exit. Ignoring action.");
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    paramBundle.putBoolean("com.google.android.gms.ads.internal.overlay.hasResumed", this.zzud);
  }

  public void onStart()
  {
  }

  public void onStop()
  {
    zzdf();
  }

  public void setRequestedOrientation(int paramInt)
  {
    this.zzoi.setRequestedOrientation(paramInt);
  }

  public void zzX()
  {
    this.zzuh = true;
  }

  public void zza(View paramView, WebChromeClient.CustomViewCallback paramCustomViewCallback)
  {
    this.zzub = new FrameLayout(this.zzoi);
    this.zzub.setBackgroundColor(-16777216);
    this.zzub.addView(paramView, -1, -1);
    this.zzoi.setContentView(this.zzub);
    zzX();
    this.zzuc = paramCustomViewCallback;
    this.zzua = true;
  }

  public void zza(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (this.zztZ != null)
      this.zztZ.zza(paramBoolean1, paramBoolean2);
  }

  public zzeq zzdb()
  {
    return this.zztX;
  }

  public void zzdc()
  {
    if ((this.zztW != null) && (this.zzua))
      setRequestedOrientation(this.zztW.orientation);
    if (this.zzub != null)
    {
      this.zzoi.setContentView(this.zzts);
      zzX();
      this.zzub.removeAllViews();
      this.zzub = null;
    }
    if (this.zzuc != null)
    {
      this.zzuc.onCustomViewHidden();
      this.zzuc = null;
    }
    this.zzua = false;
  }

  public void zzdd()
  {
    this.zzug = 1;
    this.zzoi.finish();
  }

  public void zzde()
  {
    this.zzts.removeView(this.zztZ);
    zzs(true);
  }

  protected void zzdf()
  {
    if ((!this.zzoi.isFinishing()) || (this.zzui));
    do
    {
      do
      {
        return;
        this.zzui = true;
      }
      while (!this.zzoi.isFinishing());
      if (this.zzmu != null)
      {
        zzp(this.zzug);
        this.zzts.removeView(this.zzmu.getWebView());
        if (this.zztY != null)
        {
          this.zzmu.setContext(this.zztY.zzlN);
          this.zzmu.zzA(false);
          this.zztY.zzum.addView(this.zzmu.getWebView(), this.zztY.index, this.zztY.zzul);
          this.zztY = null;
        }
      }
    }
    while ((this.zztW == null) || (this.zztW.zzup == null));
    this.zztW.zzup.zzaf();
  }

  public void zzdg()
  {
    if (this.zzuf)
    {
      this.zzuf = false;
      zzdh();
    }
  }

  protected void zzdh()
  {
    this.zzmu.zzdh();
  }

  public void zze(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (this.zztX != null)
      this.zztX.setLayoutParams(zzd(paramInt1, paramInt2, paramInt3, paramInt4));
  }

  public void zzf(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (this.zztX == null)
    {
      this.zztX = new zzeq(this.zzoi, this.zzmu);
      this.zzts.addView(this.zztX, 0, zzd(paramInt1, paramInt2, paramInt3, paramInt4));
      this.zzmu.zzeG().zzC(false);
    }
  }

  protected void zzp(int paramInt)
  {
    this.zzmu.zzp(paramInt);
  }

  public void zzs(boolean paramBoolean)
  {
    int i;
    RelativeLayout.LayoutParams localLayoutParams;
    if (paramBoolean)
    {
      i = 50;
      this.zztZ = new zzer(this.zzoi, i, this);
      localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(10);
      if (!paramBoolean)
        break label90;
    }
    label90: for (int j = 11; ; j = 9)
    {
      localLayoutParams.addRule(j);
      this.zztZ.zza(paramBoolean, this.zztW.zzut);
      this.zzts.addView(this.zztZ, localLayoutParams);
      return;
      i = 32;
      break;
    }
  }

  protected void zzt(boolean paramBoolean)
    throws zzel.zza
  {
    if (!this.zzuh)
      this.zzoi.requestWindowFeature(1);
    Window localWindow = this.zzoi.getWindow();
    if (localWindow == null)
      throw new zza("Invalid activity, no window available.");
    if ((!this.zzue) || ((this.zztW.zzuz != null) && (this.zztW.zzuz.zzmy)))
      localWindow.setFlags(1024, 1024);
    this.zzuf = false;
    boolean bool3;
    label126: boolean bool2;
    if (this.zztW.orientation == zzab.zzaO().zzex())
      if (this.zzoi.getResources().getConfiguration().orientation == 1)
      {
        bool3 = true;
        this.zzuf = bool3;
        zzhx.zzY("Delay onShow to next orientation change: " + this.zzuf);
        setRequestedOrientation(this.zztW.orientation);
        if (zzab.zzaO().zza(localWindow))
          zzhx.zzY("Hardware acceleration on the AdActivity window enabled.");
        if (this.zzue)
          break label551;
        this.zzts.setBackgroundColor(-16777216);
        label196: this.zzoi.setContentView(this.zzts);
        zzX();
        bool2 = this.zztW.zzuq.zzeG().zzba();
        if (!paramBoolean)
          break label618;
        this.zzmu = zzab.zzaN().zza(this.zzoi, this.zztW.zzuq.zzad(), true, bool2, null, this.zztW.zzlP);
        this.zzmu.zzeG().zzb(null, null, this.zztW.zzur, this.zztW.zzuv, true, this.zztW.zzux, null, this.zztW.zzuq.zzeG().zzeM(), null);
        this.zzmu.zzeG().zza(new zzel.1(this));
        if (this.zztW.zztR == null)
          break label564;
        this.zzmu.loadUrl(this.zztW.zztR);
      }
    while (true)
    {
      this.zzmu.zza(this);
      ViewParent localViewParent = this.zzmu.getParent();
      if ((localViewParent != null) && ((localViewParent instanceof ViewGroup)))
        ((ViewGroup)localViewParent).removeView(this.zzmu.getWebView());
      if (this.zzue)
        this.zzmu.setBackgroundColor(zztV);
      this.zzts.addView(this.zzmu.getWebView(), -1, -1);
      if ((!paramBoolean) && (!this.zzuf))
        zzdh();
      zzs(bool2);
      if (this.zzmu.zzeH())
        zza(bool2, true);
      return;
      bool3 = false;
      break;
      if (this.zztW.orientation != zzab.zzaO().zzey())
        break label126;
      if (this.zzoi.getResources().getConfiguration().orientation == 2);
      for (boolean bool1 = true; ; bool1 = false)
      {
        this.zzuf = bool1;
        break;
      }
      label551: this.zzts.setBackgroundColor(zztV);
      break label196;
      label564: if (this.zztW.zzuu != null)
      {
        this.zzmu.loadDataWithBaseURL(this.zztW.zzus, this.zztW.zzuu, "text/html", "UTF-8", null);
      }
      else
      {
        throw new zza("No URL or HTML to display in ad overlay.");
        label618: this.zzmu = this.zztW.zzuq;
        this.zzmu.setContext(this.zzoi);
      }
    }
  }

  @zzgi
  private static final class zza extends Exception
  {
    public zza(String paramString)
    {
      super();
    }
  }

  @zzgi
  static final class zzb extends RelativeLayout
  {
    zzhs zzlL;

    public zzb(Context paramContext, String paramString)
    {
      super();
      this.zzlL = new zzhs(paramContext, paramString);
    }

    public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
    {
      this.zzlL.zzc(paramMotionEvent);
      return false;
    }
  }

  @zzgi
  public static class zzc
  {
    public final int index;
    public final Context zzlN;
    public final ViewGroup.LayoutParams zzul;
    public final ViewGroup zzum;

    public zzc(zzic paramzzic)
      throws zzel.zza
    {
      this.zzul = paramzzic.getLayoutParams();
      ViewParent localViewParent = paramzzic.getParent();
      this.zzlN = paramzzic.zzeE();
      if ((localViewParent != null) && ((localViewParent instanceof ViewGroup)))
      {
        this.zzum = ((ViewGroup)localViewParent);
        this.index = this.zzum.indexOfChild(paramzzic.getWebView());
        this.zzum.removeView(paramzzic.getWebView());
        paramzzic.zzA(true);
        return;
      }
      throw new zzel.zza("Could not get the parent of the WebView for an overlay.");
    }
  }
}