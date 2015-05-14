package com.google.android.gms.internal;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.MutableContextWrapper;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.net.Uri;
import android.os.Build.VERSION;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.MotionEvent;
import android.view.View.MeasureSpec;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.WindowManager;
import android.webkit.DownloadListener;
import android.webkit.ValueCallback;
import android.webkit.WebSettings;
import android.webkit.WebView;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public class zzif extends WebView
  implements ViewTreeObserver.OnGlobalLayoutListener, DownloadListener, zzic
{
  private final zza zzAa;
  private zzel zzAb;
  private boolean zzAc;
  private boolean zzAd;
  private boolean zzAe;
  private boolean zzAf;
  private boolean zzAg;
  private int zzAh;
  boolean zzAi;
  private final Object zznh = new Object();
  private final zzhy zznl;
  private final WindowManager zznu;
  private zzba zzsF;
  private int zztI = -1;
  private int zztJ = -1;
  private int zztL = -1;
  private int zztM = -1;
  private final zzid zzvy;
  private final zzk zzwg;
  private Boolean zzyV;

  protected zzif(zza paramzza, zzba paramzzba, boolean paramBoolean1, boolean paramBoolean2, zzk paramzzk, zzhy paramzzhy)
  {
    super(paramzza);
    this.zzAa = paramzza;
    this.zzsF = paramzzba;
    this.zzAe = paramBoolean1;
    this.zzAg = false;
    this.zzAh = -1;
    this.zzwg = paramzzk;
    this.zznl = paramzzhy;
    this.zznu = ((WindowManager)getContext().getSystemService("window"));
    setBackgroundColor(0);
    WebSettings localWebSettings = getSettings();
    localWebSettings.setJavaScriptEnabled(true);
    localWebSettings.setSavePassword(false);
    localWebSettings.setSupportMultipleWindows(true);
    localWebSettings.setJavaScriptCanOpenWindowsAutomatically(true);
    if (Build.VERSION.SDK_INT >= 21)
      localWebSettings.setMixedContentMode(0);
    zzab.zzaM().zza(paramzza, paramzzhy.zzzH, localWebSettings);
    zzab.zzaO().zza(getContext(), localWebSettings);
    setDownloadListener(this);
    this.zzvy = zzab.zzaO().zzb(this, paramBoolean2);
    setWebViewClient(this.zzvy);
    setWebChromeClient(zzab.zzaO().zzb(this));
    zzeW();
  }

  static zzif zzb(Context paramContext, zzba paramzzba, boolean paramBoolean1, boolean paramBoolean2, zzk paramzzk, zzhy paramzzhy)
  {
    return new zzif(new zza(paramContext), paramzzba, paramBoolean1, paramBoolean2, paramzzk, paramzzhy);
  }

  private void zzeT()
  {
    synchronized (this.zznh)
    {
      this.zzyV = zzab.zzaP().zzek();
      Boolean localBoolean = this.zzyV;
      if (localBoolean == null);
      try
      {
        evaluateJavascript("(function(){})()", null);
        zzb(Boolean.valueOf(true));
        return;
      }
      catch (IllegalStateException localIllegalStateException)
      {
        while (true)
          zzb(Boolean.valueOf(false));
      }
    }
  }

  private void zzeU()
  {
    Activity localActivity = zzeD();
    if ((this.zzAg) && (localActivity != null))
    {
      zzab.zzaO().zzb(localActivity, this);
      this.zzAg = false;
    }
  }

  private void zzeW()
  {
    while (true)
    {
      synchronized (this.zznh)
      {
        if ((this.zzAe) || (this.zzsF.zzpb))
        {
          if (Build.VERSION.SDK_INT < 14)
          {
            zzhx.zzY("Disabling hardware acceleration on an overlay.");
            zzeX();
            return;
          }
          zzhx.zzY("Enabling hardware acceleration on an overlay.");
          zzeY();
        }
      }
      if (Build.VERSION.SDK_INT < 18)
      {
        zzhx.zzY("Disabling hardware acceleration on an AdView.");
        zzeX();
      }
      else
      {
        zzhx.zzY("Enabling hardware acceleration on an AdView.");
        zzeY();
      }
    }
  }

  private void zzeX()
  {
    synchronized (this.zznh)
    {
      if (!this.zzAf)
        zzab.zzaO().zzk(this);
      this.zzAf = true;
      return;
    }
  }

  private void zzeY()
  {
    synchronized (this.zznh)
    {
      if (this.zzAf)
        zzab.zzaO().zzj(this);
      this.zzAf = false;
      return;
    }
  }

  public void destroy()
  {
    synchronized (this.zznh)
    {
      zzeU();
      if (this.zzAb != null)
      {
        this.zzAb.close();
        this.zzAb.onDestroy();
        this.zzAb = null;
      }
      this.zzvy.reset();
      if (this.zzAd)
        return;
      this.zzAd = true;
      super.destroy();
      return;
    }
  }

  public void evaluateJavascript(String paramString, ValueCallback<String> paramValueCallback)
  {
    synchronized (this.zznh)
    {
      if (isDestroyed())
      {
        zzhx.zzac("The webview is destroyed. Ignoring action.");
        if (paramValueCallback != null)
          paramValueCallback.onReceiveValue(null);
        return;
      }
      super.evaluateJavascript(paramString, paramValueCallback);
      return;
    }
  }

  public int getRequestedOrientation()
  {
    synchronized (this.zznh)
    {
      int i = this.zzAh;
      return i;
    }
  }

  public WebView getWebView()
  {
    return this;
  }

  public boolean isDestroyed()
  {
    synchronized (this.zznh)
    {
      boolean bool = this.zzAd;
      return bool;
    }
  }

  public void loadData(String paramString1, String paramString2, String paramString3)
  {
    synchronized (this.zznh)
    {
      if (!isDestroyed())
      {
        super.loadData(paramString1, paramString2, paramString3);
        return;
      }
      zzhx.zzac("The webview is destroyed. Ignoring action.");
    }
  }

  public void loadDataWithBaseURL(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    synchronized (this.zznh)
    {
      if (!isDestroyed())
      {
        super.loadDataWithBaseURL(paramString1, paramString2, paramString3, paramString4, paramString5);
        return;
      }
      zzhx.zzac("The webview is destroyed. Ignoring action.");
    }
  }

  protected void onAttachedToWindow()
  {
    synchronized (this.zznh)
    {
      super.onAttachedToWindow();
      this.zzAi = true;
      if (this.zzvy.zzba())
        zzeV();
      return;
    }
  }

  protected void onDetachedFromWindow()
  {
    synchronized (this.zznh)
    {
      zzeU();
      this.zzAi = false;
      super.onDetachedFromWindow();
      return;
    }
  }

  public void onDownloadStart(String paramString1, String paramString2, String paramString3, String paramString4, long paramLong)
  {
    try
    {
      Intent localIntent = new Intent("android.intent.action.VIEW");
      localIntent.setDataAndType(Uri.parse(paramString1), paramString4);
      getContext().startActivity(localIntent);
      return;
    }
    catch (ActivityNotFoundException localActivityNotFoundException)
    {
      zzhx.zzY("Couldn't find an Activity to view url/mimetype: " + paramString1 + " / " + paramString4);
    }
  }

  protected void onDraw(Canvas paramCanvas)
  {
    if ((Build.VERSION.SDK_INT == 21) && (paramCanvas.isHardwareAccelerated()) && (!isAttachedToWindow()))
      return;
    super.onDraw(paramCanvas);
  }

  public void onGlobalLayout()
  {
    boolean bool = zzeS();
    zzel localzzel = zzeF();
    if ((localzzel != null) && (bool))
      localzzel.zzdg();
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = 2147483647;
    synchronized (this.zznh)
    {
      if ((isInEditMode()) || (this.zzAe))
      {
        super.onMeasure(paramInt1, paramInt2);
        return;
      }
      if (this.zzsF.zzpb)
      {
        DisplayMetrics localDisplayMetrics = new DisplayMetrics();
        this.zznu.getDefaultDisplay().getMetrics(localDisplayMetrics);
        setMeasuredDimension(localDisplayMetrics.widthPixels, localDisplayMetrics.heightPixels);
        return;
      }
    }
    int j = View.MeasureSpec.getMode(paramInt1);
    int k = View.MeasureSpec.getSize(paramInt1);
    int m = View.MeasureSpec.getMode(paramInt2);
    int n = View.MeasureSpec.getSize(paramInt2);
    if (j != -2147483648)
      if (j == 1073741824)
        break label335;
    while (true)
    {
      if ((this.zzsF.widthPixels > i1) || (this.zzsF.heightPixels > i))
      {
        float f = this.zzAa.getResources().getDisplayMetrics().density;
        zzhx.zzac("Not enough space to show ad. Needs " + (int)(this.zzsF.widthPixels / f) + "x" + (int)(this.zzsF.heightPixels / f) + " dp, but only has " + (int)(k / f) + "x" + (int)(n / f) + " dp.");
        if (getVisibility() != 8)
          setVisibility(4);
        setMeasuredDimension(0, 0);
      }
      while (true)
      {
        return;
        if (getVisibility() != 8)
          setVisibility(0);
        setMeasuredDimension(this.zzsF.widthPixels, this.zzsF.heightPixels);
      }
      int i1 = i;
      break label339;
      label335: i1 = k;
      label339: if ((m == -2147483648) || (m == 1073741824))
        i = n;
    }
  }

  public void onPause()
  {
    if (isDestroyed())
      return;
    try
    {
      super.onPause();
      return;
    }
    catch (Exception localException)
    {
      zzhx.zzb("Could not pause webview.", localException);
    }
  }

  public void onResume()
  {
    if (isDestroyed())
      return;
    try
    {
      super.onResume();
      return;
    }
    catch (Exception localException)
    {
      zzhx.zzb("Could not resume webview.", localException);
    }
  }

  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (this.zzwg != null)
      this.zzwg.zza(paramMotionEvent);
    return super.onTouchEvent(paramMotionEvent);
  }

  public void setContext(Context paramContext)
  {
    this.zzAa.setBaseContext(paramContext);
  }

  public void setRequestedOrientation(int paramInt)
  {
    synchronized (this.zznh)
    {
      this.zzAh = paramInt;
      if (this.zzAb != null)
        this.zzAb.setRequestedOrientation(this.zzAh);
      return;
    }
  }

  public void stopLoading()
  {
    if (isDestroyed())
      return;
    try
    {
      super.stopLoading();
      return;
    }
    catch (Exception localException)
    {
      zzhx.zzb("Could not stop loading webview.", localException);
    }
  }

  public void zzA(boolean paramBoolean)
  {
    synchronized (this.zznh)
    {
      this.zzAe = paramBoolean;
      zzeW();
      return;
    }
  }

  public void zzB(boolean paramBoolean)
  {
    synchronized (this.zznh)
    {
      if (this.zzAb != null)
      {
        this.zzAb.zza(this.zzvy.zzba(), paramBoolean);
        return;
      }
      this.zzAc = paramBoolean;
    }
  }

  public void zza(Context paramContext, zzba paramzzba)
  {
    synchronized (this.zznh)
    {
      zzeU();
      setContext(paramContext);
      this.zzAb = null;
      this.zzsF = paramzzba;
      this.zzAe = false;
      this.zzAc = false;
      this.zzAh = -1;
      zzab.zzaO().zzb(this);
      loadUrl("about:blank");
      this.zzvy.reset();
      setOnTouchListener(null);
      setOnClickListener(null);
      return;
    }
  }

  public void zza(zzba paramzzba)
  {
    synchronized (this.zznh)
    {
      this.zzsF = paramzzba;
      requestLayout();
      return;
    }
  }

  public void zza(zzel paramzzel)
  {
    synchronized (this.zznh)
    {
      this.zzAb = paramzzel;
      return;
    }
  }

  protected void zza(String paramString, ValueCallback<String> paramValueCallback)
  {
    synchronized (this.zznh)
    {
      if (!isDestroyed())
        evaluateJavascript(paramString, paramValueCallback);
      do
      {
        return;
        zzhx.zzac("The webview is destroyed. Ignoring action.");
      }
      while (paramValueCallback == null);
      paramValueCallback.onReceiveValue(null);
    }
  }

  public void zza(String paramString, JSONObject paramJSONObject)
  {
    if (paramJSONObject == null)
      paramJSONObject = new JSONObject();
    zzb(paramString, paramJSONObject.toString());
  }

  public zzba zzad()
  {
    synchronized (this.zznh)
    {
      zzba localzzba = this.zzsF;
      return localzzba;
    }
  }

  protected void zzad(String paramString)
  {
    synchronized (this.zznh)
    {
      if (!isDestroyed())
      {
        loadUrl(paramString);
        return;
      }
      zzhx.zzac("The webview is destroyed. Ignoring action.");
    }
  }

  protected void zzae(String paramString)
  {
    if (zzme.zzkj())
    {
      if (zzek() == null)
        zzeT();
      if (zzek().booleanValue())
      {
        zza(paramString, null);
        return;
      }
      zzad("javascript:" + paramString);
      return;
    }
    zzad("javascript:" + paramString);
  }

  void zzb(Boolean paramBoolean)
  {
    this.zzyV = paramBoolean;
    zzab.zzaP().zzb(paramBoolean);
  }

  public void zzb(String paramString1, String paramString2)
  {
    zzae(paramString1 + "(" + paramString2 + ");");
  }

  public void zzb(String paramString, Map<String, ?> paramMap)
  {
    try
    {
      JSONObject localJSONObject = zzab.zzaM().zzw(paramMap);
      zzb(paramString, localJSONObject);
      return;
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzac("Could not convert parameters to JSON.");
    }
  }

  public void zzb(String paramString, JSONObject paramJSONObject)
  {
    if (paramJSONObject == null)
      paramJSONObject = new JSONObject();
    String str = paramJSONObject.toString();
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("AFMA_ReceiveMessage('");
    localStringBuilder.append(paramString);
    localStringBuilder.append("'");
    localStringBuilder.append(",");
    localStringBuilder.append(str);
    localStringBuilder.append(");");
    zzhx.zzab("Dispatching AFMA event: " + localStringBuilder.toString());
    zzae(localStringBuilder.toString());
  }

  public void zzdh()
  {
    HashMap localHashMap = new HashMap(1);
    localHashMap.put("version", this.zznl.zzzH);
    zzb("onshow", localHashMap);
  }

  public Activity zzeD()
  {
    return this.zzAa.zzeD();
  }

  public Context zzeE()
  {
    return this.zzAa.zzeE();
  }

  public zzel zzeF()
  {
    synchronized (this.zznh)
    {
      zzel localzzel = this.zzAb;
      return localzzel;
    }
  }

  public zzid zzeG()
  {
    return this.zzvy;
  }

  public boolean zzeH()
  {
    return this.zzAc;
  }

  public zzk zzeI()
  {
    return this.zzwg;
  }

  public zzhy zzeJ()
  {
    return this.zznl;
  }

  public boolean zzeK()
  {
    synchronized (this.zznh)
    {
      boolean bool = this.zzAe;
      return bool;
    }
  }

  public void zzeL()
  {
    synchronized (this.zznh)
    {
      zzeV();
      return;
    }
  }

  public boolean zzeS()
  {
    if (!zzeG().zzba())
      return false;
    DisplayMetrics localDisplayMetrics = zzab.zzaM().zza(this.zznu);
    int i = zzbe.zzbD().zzb(localDisplayMetrics, localDisplayMetrics.widthPixels);
    int j = zzbe.zzbD().zzb(localDisplayMetrics, localDisplayMetrics.heightPixels);
    Activity localActivity = zzeD();
    int k;
    int m;
    if ((localActivity == null) || (localActivity.getWindow() == null))
    {
      k = j;
      m = i;
      label72: if ((this.zztI == i) && (this.zztJ == j) && (this.zztL == m) && (this.zztM == k))
        break label220;
      if ((this.zztI == i) && (this.zztJ == j))
        break label222;
    }
    label220: label222: for (boolean bool = true; ; bool = false)
    {
      this.zztI = i;
      this.zztJ = j;
      this.zztL = m;
      this.zztM = k;
      new zzeg(this).zza(i, j, m, k, localDisplayMetrics.density, this.zznu.getDefaultDisplay().getRotation());
      return bool;
      int[] arrayOfInt = zzab.zzaM().zzg(localActivity);
      m = zzbe.zzbD().zzb(localDisplayMetrics, arrayOfInt[0]);
      k = zzbe.zzbD().zzb(localDisplayMetrics, arrayOfInt[1]);
      break label72;
      break;
    }
  }

  void zzeV()
  {
    Activity localActivity = zzeD();
    if ((!this.zzAg) && (localActivity != null) && (this.zzAi))
    {
      zzab.zzaM().zza(localActivity, this);
      this.zzAg = true;
    }
  }

  Boolean zzek()
  {
    synchronized (this.zznh)
    {
      Boolean localBoolean = this.zzyV;
      return localBoolean;
    }
  }

  public void zzp(int paramInt)
  {
    HashMap localHashMap = new HashMap(1);
    localHashMap.put("closetype", String.valueOf(paramInt));
    localHashMap.put("version", this.zznl.zzzH);
    zzb("onhide", localHashMap);
  }

  @zzgi
  public static class zza extends MutableContextWrapper
  {
    private Activity zzAj;
    private Context zzAk;
    private Context zznk;

    public zza(Context paramContext)
    {
      super();
      setBaseContext(paramContext);
    }

    public Object getSystemService(String paramString)
    {
      return this.zzAk.getSystemService(paramString);
    }

    public void setBaseContext(Context paramContext)
    {
      this.zznk = paramContext.getApplicationContext();
      if ((paramContext instanceof Activity));
      for (Activity localActivity = (Activity)paramContext; ; localActivity = null)
      {
        this.zzAj = localActivity;
        this.zzAk = paramContext;
        super.setBaseContext(this.zznk);
        return;
      }
    }

    public void startActivity(Intent paramIntent)
    {
      if ((this.zzAj != null) && (!zzme.zzkk()))
      {
        this.zzAj.startActivity(paramIntent);
        return;
      }
      paramIntent.setFlags(268435456);
      this.zznk.startActivity(paramIntent);
    }

    public Activity zzeD()
    {
      return this.zzAj;
    }

    public Context zzeE()
    {
      return this.zzAk;
    }
  }
}