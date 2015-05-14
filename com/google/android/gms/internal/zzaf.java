package com.google.android.gms.internal;

import android.app.KeyguardManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.PowerManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.ViewTreeObserver.OnScrollChangedListener;
import android.view.WindowManager;
import java.lang.ref.WeakReference;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public class zzaf
  implements ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener
{
  private boolean zzmJ = false;
  private boolean zznA;
  private boolean zznB;
  private BroadcastReceiver zznC;
  private final HashSet<zzac> zznD = new HashSet();
  private final zzcv zznE = new zzaf.7(this);
  private final zzcv zznF = new zzaf.8(this);
  private final zzcv zznG = new zzaf.9(this);
  private final Object zznh = new Object();
  private final Context zznk;
  private final WeakReference<zzhe> zznn;
  private WeakReference<ViewTreeObserver> zzno;
  private final WeakReference<View> zznp;
  private final zzad zznq;
  private final zzdf zznr;
  private final zzia<zzah> zzns;
  private boolean zznt;
  private final WindowManager zznu;
  private final PowerManager zznv;
  private final KeyguardManager zznw;
  private zzag zznx;
  private boolean zzny = false;
  private long zznz = -9223372036854775808L;

  public zzaf(zzba paramzzba, zzhe paramzzhe, zzhy paramzzhy, View paramView, zzdf paramzzdf)
  {
    this.zznr = paramzzdf;
    this.zznn = new WeakReference(paramzzhe);
    this.zznp = new WeakReference(paramView);
    this.zzno = new WeakReference(null);
    this.zznA = true;
    this.zznq = new zzad(UUID.randomUUID().toString(), paramzzhy, paramzzba.zzpa, paramzzhe.zzys, paramzzhe.zzba());
    this.zzns = this.zznr.zzcJ();
    this.zznu = ((WindowManager)paramView.getContext().getSystemService("window"));
    this.zznv = ((PowerManager)paramView.getContext().getApplicationContext().getSystemService("power"));
    this.zznw = ((KeyguardManager)paramView.getContext().getSystemService("keyguard"));
    this.zznk = paramView.getContext().getApplicationContext();
    try
    {
      JSONObject localJSONObject = zzd(paramView);
      this.zzns.zza(new zzaf.1(this, localJSONObject), new zzaf.3(this));
      label269: this.zzns.zza(new zzaf.4(this), new zzaf.5(this));
      zzhx.zzY("Tracking ad unit: " + this.zznq.zzaZ());
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      while (true)
        zzhx.zzb("Failure while processing active view data.", localRuntimeException);
    }
    catch (JSONException localJSONException)
    {
      break label269;
    }
  }

  protected void destroy()
  {
    synchronized (this.zznh)
    {
      zzbh();
      zzbc();
      this.zznA = false;
      zzbe();
      this.zznr.zzb(this.zzns);
      return;
    }
  }

  public void onGlobalLayout()
  {
    zzh(false);
  }

  public void onScrollChanged()
  {
    zzh(true);
  }

  public void pause()
  {
    synchronized (this.zznh)
    {
      this.zzmJ = true;
      zzh(false);
      return;
    }
  }

  public void resume()
  {
    synchronized (this.zznh)
    {
      this.zzmJ = false;
      zzh(false);
      return;
    }
  }

  public void stop()
  {
    synchronized (this.zznh)
    {
      this.zzny = true;
      zzh(false);
      return;
    }
  }

  protected int zza(int paramInt, DisplayMetrics paramDisplayMetrics)
  {
    float f = paramDisplayMetrics.density;
    return (int)(paramInt / f);
  }

  protected void zza(View paramView, Map<String, String> paramMap)
  {
    zzh(false);
  }

  public void zza(zzac paramzzac)
  {
    this.zznD.add(paramzzac);
  }

  public void zza(zzag paramzzag)
  {
    synchronized (this.zznh)
    {
      this.zznx = paramzzag;
      return;
    }
  }

  protected void zza(zzah paramzzah)
  {
    paramzzah.zza("/updateActiveView", this.zznE);
    paramzzah.zza("/untrackActiveViewUnit", this.zznF);
    paramzzah.zza("/visibilityChanged", this.zznG);
  }

  protected void zza(JSONObject paramJSONObject)
  {
    try
    {
      JSONArray localJSONArray = new JSONArray();
      JSONObject localJSONObject = new JSONObject();
      localJSONArray.put(paramJSONObject);
      localJSONObject.put("units", localJSONArray);
      this.zzns.zza(new zzaf.10(this, localJSONObject), new zzaf.2(this));
      return;
    }
    catch (Throwable localThrowable)
    {
      zzhx.zzb("Skipping active view message.", localThrowable);
    }
  }

  protected boolean zza(Map<String, String> paramMap)
  {
    if (paramMap == null)
      return false;
    String str = (String)paramMap.get("hashCode");
    if ((!TextUtils.isEmpty(str)) && (str.equals(this.zznq.zzaZ())));
    for (boolean bool = true; ; bool = false)
      return bool;
  }

  protected void zzbb()
  {
    synchronized (this.zznh)
    {
      if (this.zznC != null)
        return;
      IntentFilter localIntentFilter = new IntentFilter();
      localIntentFilter.addAction("android.intent.action.SCREEN_ON");
      localIntentFilter.addAction("android.intent.action.SCREEN_OFF");
      this.zznC = new zzaf.6(this);
      this.zznk.registerReceiver(this.zznC, localIntentFilter);
      return;
    }
  }

  protected void zzbc()
  {
    synchronized (this.zznh)
    {
      if (this.zznC != null)
      {
        this.zznk.unregisterReceiver(this.zznC);
        this.zznC = null;
      }
      return;
    }
  }

  public void zzbd()
  {
    synchronized (this.zznh)
    {
      if (this.zznA)
        this.zznB = true;
    }
    try
    {
      zza(zzbj());
      zzhx.zzY("Untracking ad unit: " + this.zznq.zzaZ());
      return;
    }
    catch (JSONException localJSONException)
    {
      while (true)
        zzhx.zzb("JSON failure while processing active view data.", localJSONException);
      localObject2 = finally;
      throw localObject2;
    }
    catch (RuntimeException localRuntimeException)
    {
      while (true)
        zzhx.zzb("Failure while processing active view data.", localRuntimeException);
    }
  }

  protected void zzbe()
  {
    if (this.zznx != null)
      this.zznx.zza(this);
  }

  public boolean zzbf()
  {
    synchronized (this.zznh)
    {
      boolean bool = this.zznA;
      return bool;
    }
  }

  protected void zzbg()
  {
    View localView = (View)this.zznp.get();
    if (localView == null);
    ViewTreeObserver localViewTreeObserver1;
    ViewTreeObserver localViewTreeObserver2;
    do
    {
      return;
      localViewTreeObserver1 = (ViewTreeObserver)this.zzno.get();
      localViewTreeObserver2 = localView.getViewTreeObserver();
    }
    while (localViewTreeObserver2 == localViewTreeObserver1);
    this.zzno = new WeakReference(localViewTreeObserver2);
    localViewTreeObserver2.addOnScrollChangedListener(this);
    localViewTreeObserver2.addOnGlobalLayoutListener(this);
  }

  protected void zzbh()
  {
    ViewTreeObserver localViewTreeObserver = (ViewTreeObserver)this.zzno.get();
    if ((localViewTreeObserver == null) || (!localViewTreeObserver.isAlive()))
      return;
    localViewTreeObserver.removeOnScrollChangedListener(this);
    localViewTreeObserver.removeGlobalOnLayoutListener(this);
  }

  protected JSONObject zzbi()
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    localJSONObject.put("afmaVersion", this.zznq.zzaX()).put("activeViewJSON", this.zznq.zzaY()).put("timestamp", zzab.zzaQ().elapsedRealtime()).put("adFormat", this.zznq.zzaW()).put("hashCode", this.zznq.zzaZ()).put("isMraid", this.zznq.zzba());
    return localJSONObject;
  }

  protected JSONObject zzbj()
    throws JSONException
  {
    JSONObject localJSONObject = zzbi();
    localJSONObject.put("doneReasonCode", "u");
    return localJSONObject;
  }

  protected JSONObject zzd(View paramView)
    throws JSONException
  {
    boolean bool1 = zzab.zzaO().zzi(paramView);
    int[] arrayOfInt1 = new int[2];
    int[] arrayOfInt2 = new int[2];
    try
    {
      paramView.getLocationOnScreen(arrayOfInt1);
      paramView.getLocationInWindow(arrayOfInt2);
      DisplayMetrics localDisplayMetrics = paramView.getContext().getResources().getDisplayMetrics();
      Rect localRect1 = new Rect();
      localRect1.left = arrayOfInt1[0];
      localRect1.top = arrayOfInt1[1];
      localRect1.right = (localRect1.left + paramView.getWidth());
      localRect1.bottom = (localRect1.top + paramView.getHeight());
      Rect localRect2 = new Rect();
      localRect2.right = this.zznu.getDefaultDisplay().getWidth();
      localRect2.bottom = this.zznu.getDefaultDisplay().getHeight();
      Rect localRect3 = new Rect();
      boolean bool2 = paramView.getGlobalVisibleRect(localRect3, null);
      Rect localRect4 = new Rect();
      boolean bool3 = paramView.getLocalVisibleRect(localRect4);
      Rect localRect5 = new Rect();
      paramView.getHitRect(localRect5);
      JSONObject localJSONObject = zzbi();
      localJSONObject.put("windowVisibility", paramView.getWindowVisibility()).put("isStopped", this.zzny).put("isPaused", this.zzmJ).put("isAttachedToWindow", bool1).put("viewBox", new JSONObject().put("top", zza(localRect2.top, localDisplayMetrics)).put("bottom", zza(localRect2.bottom, localDisplayMetrics)).put("left", zza(localRect2.left, localDisplayMetrics)).put("right", zza(localRect2.right, localDisplayMetrics))).put("adBox", new JSONObject().put("top", zza(localRect1.top, localDisplayMetrics)).put("bottom", zza(localRect1.bottom, localDisplayMetrics)).put("left", zza(localRect1.left, localDisplayMetrics)).put("right", zza(localRect1.right, localDisplayMetrics))).put("globalVisibleBox", new JSONObject().put("top", zza(localRect3.top, localDisplayMetrics)).put("bottom", zza(localRect3.bottom, localDisplayMetrics)).put("left", zza(localRect3.left, localDisplayMetrics)).put("right", zza(localRect3.right, localDisplayMetrics))).put("globalVisibleBoxVisible", bool2).put("localVisibleBox", new JSONObject().put("top", zza(localRect4.top, localDisplayMetrics)).put("bottom", zza(localRect4.bottom, localDisplayMetrics)).put("left", zza(localRect4.left, localDisplayMetrics)).put("right", zza(localRect4.right, localDisplayMetrics))).put("localVisibleBoxVisible", bool3).put("hitBox", new JSONObject().put("top", zza(localRect5.top, localDisplayMetrics)).put("bottom", zza(localRect5.bottom, localDisplayMetrics)).put("left", zza(localRect5.left, localDisplayMetrics)).put("right", zza(localRect5.right, localDisplayMetrics))).put("screenDensity", localDisplayMetrics.density).put("isVisible", zze(paramView));
      return localJSONObject;
    }
    catch (Exception localException)
    {
      while (true)
        zzhx.zzb("Failure getting view location.", localException);
    }
  }

  protected boolean zze(View paramView)
  {
    return (paramView.getVisibility() == 0) && (paramView.isShown()) && (this.zznv.isScreenOn()) && ((!this.zznw.inKeyguardRestrictedInputMode()) || (zzab.zzaM().zzes()));
  }

  protected void zzg(boolean paramBoolean)
  {
    Iterator localIterator = this.zznD.iterator();
    while (localIterator.hasNext())
      ((zzac)localIterator.next()).zza(this, paramBoolean);
  }

  protected void zzh(boolean paramBoolean)
  {
    long l;
    synchronized (this.zznh)
    {
      if ((!this.zznt) || (!this.zznA))
        return;
      l = zzab.zzaQ().elapsedRealtime();
      if ((paramBoolean) && (200L + this.zznz > l))
        return;
    }
    this.zznz = l;
    zzhe localzzhe = (zzhe)this.zznn.get();
    View localView = (View)this.zznp.get();
    if (localView != null)
      if (localzzhe == null)
        break label168;
    while (true)
    {
      int i;
      if (i != 0)
      {
        zzbd();
        return;
        i = 0;
      }
      else
      {
        try
        {
          zza(zzd(localView));
          zzbg();
          zzbe();
          return;
        }
        catch (JSONException localJSONException)
        {
          while (true)
            zzhx.zza("Active view update failed.", localJSONException);
        }
        catch (RuntimeException localRuntimeException)
        {
          while (true)
            zzhx.zza("Active view update failed.", localRuntimeException);
        }
        label168: i = 1;
      }
    }
  }
}