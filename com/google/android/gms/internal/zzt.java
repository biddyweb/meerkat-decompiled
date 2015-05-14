package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.graphics.Rect;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Bundle;
import android.os.Handler;
import android.os.Messenger;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.Window;
import android.widget.ViewSwitcher;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@zzgi
public class zzt extends zzbi.zza
  implements zzac, zzat, zzct, zzcw, zzcy, zzdl, zzeh, zzep, zzes, zzfk, zzgc.zza, zzgj.zza, zzhi, zzv
{
  private zzce zzlA;
  private zzce zzlB;
  private zzax zzlC;
  private final zzdr zzlD;
  private final zzb zzlE;
  private final zzaa zzlF;
  private final zzae zzlG;
  private boolean zzlH;
  private zzcf zzlz;

  public zzt(Context paramContext, zzba paramzzba, String paramString, zzdr paramzzdr, zzhy paramzzhy)
  {
    this(new zzb(paramContext, paramzzba, paramString, paramzzhy), paramzzdr, null);
  }

  zzt(zzb paramzzb, zzdr paramzzdr, zzaa paramzzaa)
  {
    zzca.zzl(paramzzb.zzlN);
    this.zzlE = paramzzb;
    this.zzlD = paramzzdr;
    if (paramzzaa != null);
    while (true)
    {
      this.zzlF = paramzzaa;
      zzab.zzaM().zzu(this.zzlE.zzlN);
      zzab.zzaP().zzb(this.zzlE.zzlN, this.zzlE.zzlP);
      this.zzlG = zzab.zzaP().zzel();
      return;
      paramzzaa = new zzaa(this);
    }
  }

  private zzgo.zza zza(zzax paramzzax, Bundle paramBundle)
  {
    ApplicationInfo localApplicationInfo = this.zzlE.zzlN.getApplicationInfo();
    try
    {
      PackageInfo localPackageInfo2 = this.zzlE.zzlN.getPackageManager().getPackageInfo(localApplicationInfo.packageName, 0);
      localPackageInfo1 = localPackageInfo2;
      localDisplayMetrics = this.zzlE.zzlN.getResources().getDisplayMetrics();
      boolean bool1 = this.zzlE.zzlV.zzpb;
      localBundle1 = null;
      if (!bool1)
      {
        ViewParent localViewParent = this.zzlE.zzlS.getParent();
        localBundle1 = null;
        if (localViewParent != null)
        {
          int[] arrayOfInt = new int[2];
          this.zzlE.zzlS.getLocationOnScreen(arrayOfInt);
          int j = arrayOfInt[0];
          int k = arrayOfInt[1];
          int m = this.zzlE.zzlS.getWidth();
          int n = this.zzlE.zzlS.getHeight();
          boolean bool4 = this.zzlE.zzlS.isShown();
          int i1 = 0;
          if (bool4)
          {
            int i2 = j + m;
            i1 = 0;
            if (i2 > 0)
            {
              int i3 = k + n;
              i1 = 0;
              if (i3 > 0)
              {
                int i4 = localDisplayMetrics.widthPixels;
                i1 = 0;
                if (j <= i4)
                {
                  int i5 = localDisplayMetrics.heightPixels;
                  i1 = 0;
                  if (k <= i5)
                    i1 = 1;
                }
              }
            }
          }
          localBundle1 = new Bundle(5);
          localBundle1.putInt("x", j);
          localBundle1.putInt("y", k);
          localBundle1.putInt("width", m);
          localBundle1.putInt("height", n);
          localBundle1.putInt("visible", i1);
        }
      }
      str1 = zzab.zzaP().zzee();
      this.zzlE.zzlY = new zzhf(str1, this.zzlE.zzlM);
      this.zzlE.zzlY.zze(paramzzax);
      str2 = zzab.zzaM().zza(this.zzlE.zzlN, this.zzlE.zzlS, this.zzlE.zzlV);
      i = zzz.zzj(this.zzlE.zzlN).zzaF();
      bool2 = zzz.zzj(this.zzlE.zzlN).isInitialized();
      l1 = 0L;
      if (this.zzlE.zzmm == null);
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      try
      {
        DisplayMetrics localDisplayMetrics;
        Bundle localBundle1;
        String str1;
        String str2;
        int i;
        boolean bool2;
        long l2 = this.zzlE.zzmm.getValue();
        long l1 = l2;
        String str3 = UUID.randomUUID().toString();
        Bundle localBundle2 = zzab.zzaP().zza(this.zzlE.zzlN, this, str1);
        zzba localzzba = this.zzlE.zzlV;
        String str4 = this.zzlE.zzlM;
        String str5 = zzab.zzaP().getSessionId();
        zzhy localzzhy = this.zzlE.zzlP;
        List localList = this.zzlE.zzmf;
        boolean bool3 = zzab.zzaP().zzei();
        Messenger localMessenger = new Messenger(new zzey(this.zzlE.zzlN));
        return new zzgo.zza(localBundle1, paramzzax, localzzba, str4, localApplicationInfo, localPackageInfo1, str1, str5, localzzhy, localBundle2, localList, paramBundle, bool3, localMessenger, localDisplayMetrics.widthPixels, localDisplayMetrics.heightPixels, localDisplayMetrics.density, str2, bool2, i, l1, str3);
        localNameNotFoundException = localNameNotFoundException;
        PackageInfo localPackageInfo1 = null;
      }
      catch (RemoteException localRemoteException)
      {
        while (true)
          zzhx.zzac("Cannot get correlation id, default to 0.");
      }
    }
  }

  private zzic zza(zzu paramzzu)
  {
    if (this.zzlE.zzlV.zzpb)
    {
      zzic localzzic2 = zzab.zzaN().zza(this.zzlE.zzlN, this.zzlE.zzlV, false, false, this.zzlE.zzlO, this.zzlE.zzlP);
      localzzic2.zzeG().zzb(this, null, this, this, ((Boolean)zzca.zzqJ.get()).booleanValue(), this, this, paramzzu, null);
      return localzzic2;
    }
    View localView = this.zzlE.zzlS.getNextView();
    zzic localzzic1;
    if ((localView instanceof zzic))
    {
      localzzic1 = (zzic)localView;
      localzzic1.zza(this.zzlE.zzlN, this.zzlE.zzlV);
    }
    while (true)
    {
      localzzic1.zzeG().zzb(this, this, this, this, false, this, null, paramzzu, this);
      return localzzic1;
      if (localView != null)
        this.zzlE.zzlS.removeView(localView);
      localzzic1 = zzab.zzaN().zza(this.zzlE.zzlN, this.zzlE.zzlV, false, false, this.zzlE.zzlO, this.zzlE.zzlP);
      if (this.zzlE.zzlV.zzpc == null)
        zzc(localzzic1.getWebView());
    }
  }

  private void zza(int paramInt)
  {
    zzhx.zzac("Failed to load ad: " + paramInt);
    if (this.zzlE.zzlT != null);
    try
    {
      this.zzlE.zzlT.onAdFailedToLoad(paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call AdListener.onAdFailedToLoad().", localRemoteException);
    }
  }

  private void zzap()
  {
    zzhx.zzaa("Ad closing.");
    if (this.zzlE.zzlT != null);
    try
    {
      this.zzlE.zzlT.onAdClosed();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call AdListener.onAdClosed().", localRemoteException);
    }
  }

  private void zzaq()
  {
    zzhx.zzaa("Ad leaving application.");
    if (this.zzlE.zzlT != null);
    try
    {
      this.zzlE.zzlT.onAdLeftApplication();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call AdListener.onAdLeftApplication().", localRemoteException);
    }
  }

  private void zzar()
  {
    zzhx.zzaa("Ad opening.");
    if (this.zzlE.zzlT != null);
    try
    {
      this.zzlE.zzlT.onAdOpened();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call AdListener.onAdOpened().", localRemoteException);
    }
  }

  private void zzas()
  {
    zzhx.zzaa("Ad finished loading.");
    if (this.zzlE.zzlT != null);
    try
    {
      this.zzlE.zzlT.onAdLoaded();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call AdListener.onAdLoaded().", localRemoteException);
    }
  }

  private void zzat()
  {
    try
    {
      if (((this.zzlE.zzlW.zzyx instanceof zzcl)) && (this.zzlE.zzmc != null))
        this.zzlE.zzmc.zza((zzcl)this.zzlE.zzlW.zzyx);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call OnAppInstallAdLoadedListener.onAppInstallAdLoaded().", localRemoteException);
    }
  }

  private void zzau()
  {
    try
    {
      if (((this.zzlE.zzlW.zzyx instanceof zzcm)) && (this.zzlE.zzmd != null))
        this.zzlE.zzmd.zza((zzcm)this.zzlE.zzlW.zzyx);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call OnContentAdLoadedListener.onContentAdLoaded().", localRemoteException);
    }
  }

  private void zzaw()
  {
    if (this.zzlE.zzmj == 0)
    {
      this.zzlE.zzay();
      this.zzlE.zzlW = null;
      this.zzlE.zzml = false;
    }
  }

  // ERROR //
  private boolean zzb(zzhe paramzzhe)
  {
    // Byte code:
    //   0: aload_1
    //   1: getfield 489\011com/google/android/gms/internal/zzhe:zzwI\011Z
    //   4: ifeq +190 -> 194
    //   7: aload_1
    //   8: getfield 493\011com/google/android/gms/internal/zzhe:zzsM\011Lcom/google/android/gms/internal/zzds;
    //   11: invokeinterface 499 1 0
    //   16: invokestatic 505\011com/google/android/gms/dynamic/zze:zzf\011(Lcom/google/android/gms/dynamic/zzd;)Ljava/lang/Object;
    //   19: checkcast 507\011android/view/View
    //   22: astore 4
    //   24: aload_0
    //   25: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   28: getfield 167\011com/google/android/gms/internal/zzt$zzb:zzlS\011Lcom/google/android/gms/internal/zzt$zza;
    //   31: invokevirtual 353\011com/google/android/gms/internal/zzt$zza:getNextView\011()Landroid/view/View;
    //   34: astore 5
    //   36: aload 5
    //   38: ifnull +33 -> 71
    //   41: aload 5
    //   43: instanceof 325
    //   46: ifeq +13 -> 59
    //   49: aload 5
    //   51: checkcast 325\011com/google/android/gms/internal/zzic
    //   54: invokeinterface 510 1 0
    //   59: aload_0
    //   60: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   63: getfield 167\011com/google/android/gms/internal/zzt$zzb:zzlS\011Lcom/google/android/gms/internal/zzt$zza;
    //   66: aload 5
    //   68: invokevirtual 360\011com/google/android/gms/internal/zzt$zza:removeView\011(Landroid/view/View;)V
    //   71: aload_0
    //   72: aload 4
    //   74: invokevirtual 371\011com/google/android/gms/internal/zzt:zzc\011(Landroid/view/View;)V
    //   77: aload_0
    //   78: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   81: getfield 167\011com/google/android/gms/internal/zzt$zzb:zzlS\011Lcom/google/android/gms/internal/zzt$zza;
    //   84: invokevirtual 513\011com/google/android/gms/internal/zzt$zza:getChildCount\011()I
    //   87: iconst_1
    //   88: if_icmple +13 -> 101
    //   91: aload_0
    //   92: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   95: getfield 167\011com/google/android/gms/internal/zzt$zzb:zzlS\011Lcom/google/android/gms/internal/zzt$zza;
    //   98: invokevirtual 516\011com/google/android/gms/internal/zzt$zza:showNext\011()V
    //   101: aload_0
    //   102: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   105: getfield 440\011com/google/android/gms/internal/zzt$zzb:zzlW\011Lcom/google/android/gms/internal/zzhe;
    //   108: ifnull +51 -> 159
    //   111: aload_0
    //   112: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   115: getfield 167\011com/google/android/gms/internal/zzt$zzb:zzlS\011Lcom/google/android/gms/internal/zzt$zza;
    //   118: invokevirtual 353\011com/google/android/gms/internal/zzt$zza:getNextView\011()Landroid/view/View;
    //   121: astore_2
    //   122: aload_2
    //   123: instanceof 325
    //   126: ifeq +148 -> 274
    //   129: aload_2
    //   130: checkcast 325\011com/google/android/gms/internal/zzic
    //   133: aload_0
    //   134: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   137: getfield 67\011com/google/android/gms/internal/zzt$zzb:zzlN\011Landroid/content/Context;
    //   140: aload_0
    //   141: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   144: getfield 158\011com/google/android/gms/internal/zzt$zzb:zzlV\011Lcom/google/android/gms/internal/zzba;
    //   147: invokeinterface 356 3 0
    //   152: aload_0
    //   153: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   156: invokevirtual 519\011com/google/android/gms/internal/zzt$zzb:zzaA\011()V
    //   159: aload_0
    //   160: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   163: getfield 167\011com/google/android/gms/internal/zzt$zzb:zzlS\011Lcom/google/android/gms/internal/zzt$zza;
    //   166: iconst_0
    //   167: invokevirtual 522\011com/google/android/gms/internal/zzt$zza:setVisibility\011(I)V
    //   170: iconst_1
    //   171: ireturn
    //   172: astore_3
    //   173: ldc_w 524
    //   176: aload_3
    //   177: invokestatic 400\011com/google/android/gms/internal/zzhx:zzd\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   180: iconst_0
    //   181: ireturn
    //   182: astore 6
    //   184: ldc_w 526
    //   187: aload 6
    //   189: invokestatic 400\011com/google/android/gms/internal/zzhx:zzd\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   192: iconst_0
    //   193: ireturn
    //   194: aload_1
    //   195: getfield 529\011com/google/android/gms/internal/zzhe:zzyu\011Lcom/google/android/gms/internal/zzba;
    //   198: ifnull -121 -> 77
    //   201: aload_1
    //   202: getfield 533\011com/google/android/gms/internal/zzhe:zzuq\011Lcom/google/android/gms/internal/zzic;
    //   205: aload_1
    //   206: getfield 529\011com/google/android/gms/internal/zzhe:zzyu\011Lcom/google/android/gms/internal/zzba;
    //   209: invokeinterface 536 2 0
    //   214: aload_0
    //   215: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   218: getfield 167\011com/google/android/gms/internal/zzt$zzb:zzlS\011Lcom/google/android/gms/internal/zzt$zza;
    //   221: invokevirtual 539\011com/google/android/gms/internal/zzt$zza:removeAllViews\011()V
    //   224: aload_0
    //   225: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   228: getfield 167\011com/google/android/gms/internal/zzt$zzb:zzlS\011Lcom/google/android/gms/internal/zzt$zza;
    //   231: aload_1
    //   232: getfield 529\011com/google/android/gms/internal/zzhe:zzyu\011Lcom/google/android/gms/internal/zzba;
    //   235: getfield 540\011com/google/android/gms/internal/zzba:widthPixels\011I
    //   238: invokevirtual 543\011com/google/android/gms/internal/zzt$zza:setMinimumWidth\011(I)V
    //   241: aload_0
    //   242: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   245: getfield 167\011com/google/android/gms/internal/zzt$zzb:zzlS\011Lcom/google/android/gms/internal/zzt$zza;
    //   248: aload_1
    //   249: getfield 529\011com/google/android/gms/internal/zzhe:zzyu\011Lcom/google/android/gms/internal/zzba;
    //   252: getfield 544\011com/google/android/gms/internal/zzba:heightPixels\011I
    //   255: invokevirtual 547\011com/google/android/gms/internal/zzt$zza:setMinimumHeight\011(I)V
    //   258: aload_0
    //   259: aload_1
    //   260: getfield 533\011com/google/android/gms/internal/zzhe:zzuq\011Lcom/google/android/gms/internal/zzic;
    //   263: invokeinterface 368 1 0
    //   268: invokevirtual 371\011com/google/android/gms/internal/zzt:zzc\011(Landroid/view/View;)V
    //   271: goto -194 -> 77
    //   274: aload_2
    //   275: ifnull -123 -> 152
    //   278: aload_0
    //   279: getfield 75\011com/google/android/gms/internal/zzt:zzlE\011Lcom/google/android/gms/internal/zzt$zzb;
    //   282: getfield 167\011com/google/android/gms/internal/zzt$zzb:zzlS\011Lcom/google/android/gms/internal/zzt$zza;
    //   285: aload_2
    //   286: invokevirtual 360\011com/google/android/gms/internal/zzt$zza:removeView\011(Landroid/view/View;)V
    //   289: goto -137 -> 152
    //
    // Exception table:
    //   from\011to\011target\011type
    //   7\01124\011172\011android/os/RemoteException
    //   71\01177\011182\011java/lang/Throwable
  }

  private void zze(boolean paramBoolean)
  {
    if (this.zzlE.zzlW == null)
      zzhx.zzac("Ad state was null when trying to ping impression URLs.");
    do
    {
      return;
      zzhx.zzY("Pinging Impression URLs.");
      this.zzlE.zzlY.zzdX();
      if (this.zzlE.zzlW.zzsu != null)
        zzab.zzaM().zza(this.zzlE.zzlN, this.zzlE.zzlP.zzzH, zzb(this.zzlE.zzlW.zzsu));
      if ((this.zzlE.zzlW.zzyt != null) && (this.zzlE.zzlW.zzyt.zzsu != null))
        zzab.zzaV().zza(this.zzlE.zzlN, this.zzlE.zzlP.zzzH, this.zzlE.zzlW, this.zzlE.zzlM, paramBoolean, zzb(this.zzlE.zzlW.zzyt.zzsu));
    }
    while ((this.zzlE.zzlW.zzsL == null) || (this.zzlE.zzlW.zzsL.zzsp == null));
    zzab.zzaV().zza(this.zzlE.zzlN, this.zzlE.zzlP.zzzH, this.zzlE.zzlW, this.zzlE.zzlM, paramBoolean, this.zzlE.zzlW.zzsL.zzsp);
  }

  public void destroy()
  {
    com.google.android.gms.common.internal.zzx.zzbd("destroy must be called on the main UI thread.");
    this.zzlF.cancel();
    this.zzlG.zze(this.zzlE.zzlW);
    this.zzlE.destroy();
  }

  public String getMediationAdapterClassName()
  {
    if (this.zzlE.zzlW != null)
      return this.zzlE.zzlW.zzsN;
    return null;
  }

  public boolean isReady()
  {
    com.google.android.gms.common.internal.zzx.zzbd("isLoaded must be called on the main UI thread.");
    return (this.zzlE.zzlQ == null) && (this.zzlE.zzlU == null) && (this.zzlE.zzlW != null);
  }

  public void onAdClicked()
  {
    recordClick();
  }

  public void onAppEvent(String paramString1, String paramString2)
  {
    if (this.zzlE.zzlZ != null);
    try
    {
      this.zzlE.zzlZ.onAppEvent(paramString1, paramString2);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call the AppEventListener.", localRemoteException);
    }
  }

  public void pause()
  {
    com.google.android.gms.common.internal.zzx.zzbd("pause must be called on the main UI thread.");
    if ((this.zzlE.zzlW != null) && (this.zzlE.zzmj == 0))
      zzab.zzaO().zza(this.zzlE.zzlW.zzuq.getWebView());
    if ((this.zzlE.zzlW != null) && (this.zzlE.zzlW.zzsM != null));
    try
    {
      this.zzlE.zzlW.zzsM.pause();
      this.zzlG.zzf(this.zzlE.zzlW);
      this.zzlF.pause();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      while (true)
        zzhx.zzac("Could not pause mediation adapter.");
    }
  }

  public void recordClick()
  {
    if (this.zzlE.zzlW == null)
      zzhx.zzac("Ad state was null when trying to ping click URLs.");
    do
    {
      return;
      zzhx.zzY("Pinging click URLs.");
      this.zzlE.zzlY.zzdY();
      if (this.zzlE.zzlW.zzst != null)
        zzab.zzaM().zza(this.zzlE.zzlN, this.zzlE.zzlP.zzzH, zzb(this.zzlE.zzlW.zzst));
      if ((this.zzlE.zzlW.zzyt != null) && (this.zzlE.zzlW.zzyt.zzst != null))
        zzab.zzaV().zza(this.zzlE.zzlN, this.zzlE.zzlP.zzzH, this.zzlE.zzlW, this.zzlE.zzlM, false, zzb(this.zzlE.zzlW.zzyt.zzst));
    }
    while (this.zzlE.zzlR == null);
    try
    {
      this.zzlE.zzlR.onAdClicked();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not notify onAdClicked event.", localRemoteException);
    }
  }

  public void recordImpression()
  {
    zze(false);
  }

  public void resume()
  {
    com.google.android.gms.common.internal.zzx.zzbd("resume must be called on the main UI thread.");
    if ((this.zzlE.zzlW != null) && (this.zzlE.zzmj == 0))
      zzab.zzaO().zzb(this.zzlE.zzlW.zzuq.getWebView());
    if ((this.zzlE.zzlW != null) && (this.zzlE.zzlW.zzsM != null));
    try
    {
      this.zzlE.zzlW.zzsM.resume();
      this.zzlF.resume();
      this.zzlG.zzg(this.zzlE.zzlW);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      while (true)
        zzhx.zzac("Could not resume mediation adapter.");
    }
  }

  public void showInterstitial()
  {
    com.google.android.gms.common.internal.zzx.zzbd("showInterstitial must be called on the main UI thread.");
    if (!this.zzlE.zzlV.zzpb)
      zzhx.zzac("Cannot call showInterstitial on a banner ad.");
    do
    {
      return;
      if (this.zzlE.zzlW == null)
      {
        zzhx.zzac("The interstitial has not loaded.");
        return;
      }
    }
    while (this.zzlE.zzmj == 1);
    if (this.zzlE.zzlW.zzuq.zzeK())
    {
      zzhx.zzac("The interstitial is already showing.");
      return;
    }
    this.zzlE.zzlW.zzuq.zzA(true);
    if ((this.zzlE.zzlW.zzuq.zzeG().zzba()) || (this.zzlE.zzlW.zzys != null))
    {
      zzaf localzzaf = this.zzlG.zza(this.zzlE.zzlV, this.zzlE.zzlW);
      if ((this.zzlE.zzlW.zzuq.zzeG().zzba()) && (localzzaf != null))
        localzzaf.zza(this);
    }
    if (this.zzlE.zzlW.zzwI)
      try
      {
        this.zzlE.zzlW.zzsM.showInterstitial();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        zzhx.zzd("Could not show interstitial.", localRemoteException);
        zzaw();
        return;
      }
    zzx localzzx = new zzx(this.zzlE.zzml, zzao());
    int i = this.zzlE.zzlW.zzuq.getRequestedOrientation();
    if (i == -1)
      i = this.zzlE.zzlW.orientation;
    zzeo localzzeo = new zzeo(this, this, this, this.zzlE.zzlW.zzuq, i, this.zzlE.zzlP, this.zzlE.zzlW.zzwN, localzzx);
    zzab.zzaK().zza(this.zzlE.zzlN, localzzeo);
  }

  public void stopLoading()
  {
    com.google.android.gms.common.internal.zzx.zzbd("stopLoading must be called on the main UI thread.");
    this.zzlE.zzf(true);
  }

  Bundle zza(zzan paramzzan)
  {
    if (paramzzan == null);
    while (true)
    {
      return null;
      if (paramzzan.zzbx())
        paramzzan.wakeup();
      zzak localzzak = paramzzan.zzbv();
      String str;
      if (localzzak != null)
      {
        str = localzzak.zzbm();
        zzhx.zzY("In AdManger: loadAd, " + localzzak.toString());
      }
      while (str != null)
      {
        Bundle localBundle = new Bundle(1);
        localBundle.putString("fingerprint", str);
        localBundle.putInt("v", 1);
        return localBundle;
        str = null;
      }
    }
  }

  public String zza(String paramString1, String paramString2, int paramInt)
  {
    if ((((Boolean)zzca.zzqL.get()).booleanValue()) && (zzz.zzj(this.zzlE.zzlN).isInitialized()) && (!TextUtils.isEmpty(paramString1)))
      paramString1 = Uri.parse(paramString1).buildUpon().appendQueryParameter("ga_cid", paramString2).appendQueryParameter("ga_hid", String.valueOf(paramInt)).build().toString();
    return paramString1;
  }

  public void zza(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    zzar();
  }

  public void zza(zzaf paramzzaf, boolean paramBoolean)
  {
    HashMap localHashMap;
    if ((this.zzlE.zzlW != null) && (this.zzlE.zzlW.zzuq != null))
    {
      localHashMap = new HashMap();
      if (!paramBoolean)
        break label72;
    }
    label72: for (String str = "1"; ; str = "0")
    {
      localHashMap.put("isVisible", str);
      this.zzlE.zzlW.zzuq.zzb("onAdVisibilityChanged", localHashMap);
      return;
    }
  }

  public void zza(zzba paramzzba)
  {
    com.google.android.gms.common.internal.zzx.zzbd("setAdSize must be called on the main UI thread.");
    this.zzlE.zzlV = paramzzba;
    if ((this.zzlE.zzlW != null) && (this.zzlE.zzmj == 0))
      this.zzlE.zzlW.zzuq.zza(paramzzba);
    if (this.zzlE.zzlS.getChildCount() > 1)
      this.zzlE.zzlS.removeView(this.zzlE.zzlS.getNextView());
    this.zzlE.zzlS.setMinimumWidth(paramzzba.widthPixels);
    this.zzlE.zzlS.setMinimumHeight(paramzzba.heightPixels);
    this.zzlE.zzlS.requestLayout();
  }

  public void zza(zzbg paramzzbg)
  {
    com.google.android.gms.common.internal.zzx.zzbd("setAdListener must be called on the main UI thread.");
    this.zzlE.zzlR = paramzzbg;
  }

  public void zza(zzbh paramzzbh)
  {
    com.google.android.gms.common.internal.zzx.zzbd("setAdListener must be called on the main UI thread.");
    this.zzlE.zzlT = paramzzbh;
  }

  public void zza(zzbk paramzzbk)
  {
    com.google.android.gms.common.internal.zzx.zzbd("setAppEventListener must be called on the main UI thread.");
    this.zzlE.zzlZ = paramzzbk;
  }

  public void zza(zzbl paramzzbl)
  {
    com.google.android.gms.common.internal.zzx.zzbd("setCorrelationIdProvider must be called on the main UI thread");
    this.zzlE.zzmm = paramzzbl;
  }

  public void zza(zzcj paramzzcj)
  {
    com.google.android.gms.common.internal.zzx.zzbd("setOnCustomRenderedAdLoadedListener must be called on the main UI thread.");
    this.zzlE.zzme = paramzzcj;
  }

  public void zza(zzfo paramzzfo)
  {
    com.google.android.gms.common.internal.zzx.zzbd("setInAppPurchaseListener must be called on the main UI thread.");
    this.zzlE.zzmb = paramzzfo;
  }

  public void zza(zzfs paramzzfs, String paramString)
  {
    com.google.android.gms.common.internal.zzx.zzbd("setPlayStorePurchaseParams must be called on the main UI thread.");
    this.zzlE.zzmg = new zzfl(paramString);
    this.zzlE.zzma = paramzzfs;
    if ((!zzab.zzaP().zzeh()) && (paramzzfs != null))
      new zzfd(this.zzlE.zzlN, this.zzlE.zzma, this.zzlE.zzmg).start();
  }

  public void zza(zzhe.zza paramzza)
  {
    this.zzlz.zza(this.zzlA, new String[] { "arf" });
    this.zzlB = this.zzlz.zzcq();
    this.zzlE.zzlQ = null;
    this.zzlE.zzlX = paramzza;
    zza(null);
    zzic localzzic;
    if (!paramzza.zzyz.zzwS)
    {
      zzu localzzu = new zzu();
      localzzic = zza(localzzu);
      localzzu.zza(new zzu.zzb(paramzza, localzzic));
      localzzic.setOnTouchListener(new zzt.1(this, localzzu));
      localzzic.setOnClickListener(new zzt.2(this, localzzu));
    }
    while (true)
    {
      if (paramzza.zzlV != null)
        this.zzlE.zzlV = paramzza.zzlV;
      if (paramzza.errorCode != -2)
      {
        zza(new zzhe(paramzza, localzzic, null, null, null, null, null));
        return;
      }
      if ((!paramzza.zzyz.zzwI) && (paramzza.zzyz.zzwR))
      {
        String str1 = paramzza.zzyz.zzus;
        String str2 = null;
        if (str1 != null)
          str2 = Uri.parse(paramzza.zzyz.zzus).buildUpon().query(null).build().toString();
        zzcg localzzcg = new zzcg(this, str2, paramzza.zzyz.zzwG);
        try
        {
          if (this.zzlE.zzme != null)
          {
            this.zzlE.zzmj = 1;
            this.zzlE.zzme.zza(localzzcg);
            return;
          }
        }
        catch (RemoteException localRemoteException)
        {
          zzhx.zzd("Could not call the onCustomRenderedAdLoadedListener.", localRemoteException);
        }
      }
      this.zzlE.zzmj = 0;
      zzb localzzb = this.zzlE;
      zzgc localzzgc = zzab.zzaL();
      Context localContext = this.zzlE.zzlN;
      zzdr localzzdr = this.zzlD;
      localzzb.zzlU = localzzgc.zza(localContext, this, paramzza, localzzic, localzzdr, this);
      zzhx.zzY("AdRenderer: " + this.zzlE.zzlU.getClass().getName());
      return;
      localzzic = null;
    }
  }

  public void zza(zzhe paramzzhe)
  {
    this.zzlz.zza(this.zzlB, new String[] { "awr" });
    this.zzlz.zza(this.zzlA, new String[] { "ttc" });
    this.zzlE.zzlU = null;
    if (paramzzhe.zzyx != null);
    for (boolean bool = true; ; bool = false)
    {
      if ((paramzzhe.errorCode != -2) && (paramzzhe.errorCode != 3))
        zzab.zzaP().zzb(this.zzlE.zzax());
      if (paramzzhe.errorCode != -1)
        break;
      return;
    }
    if (zza(paramzzhe, bool))
      zzhx.zzY("Ad refresh scheduled.");
    if ((paramzzhe.errorCode == 3) && (paramzzhe.zzyt != null) && (paramzzhe.zzyt.zzsv != null))
    {
      zzhx.zzY("Pinging no fill URLs.");
      zzab.zzaV().zza(this.zzlE.zzlN, this.zzlE.zzlP.zzzH, paramzzhe, this.zzlE.zzlM, false, paramzzhe.zzyt.zzsv);
    }
    if (paramzzhe.errorCode != -2)
    {
      zza(paramzzhe.errorCode);
      return;
    }
    if ((!this.zzlE.zzlV.zzpb) && (!bool) && (this.zzlE.zzmj == 0))
    {
      if (!zzb(paramzzhe))
      {
        zza(0);
        return;
      }
      if (this.zzlE.zzlS != null)
        zza.zza(this.zzlE.zzlS).zzV(paramzzhe.zzwN);
    }
    if ((this.zzlE.zzlW != null) && (this.zzlE.zzlW.zzsO != null))
      this.zzlE.zzlW.zzsO.zza(null);
    if (paramzzhe.zzsO != null)
      paramzzhe.zzsO.zza(this);
    this.zzlG.zzd(this.zzlE.zzlW);
    this.zzlE.zzlW = paramzzhe;
    this.zzlE.zzlY.zzj(paramzzhe.zzyv);
    this.zzlE.zzlY.zzk(paramzzhe.zzyw);
    this.zzlE.zzlY.zzx(this.zzlE.zzlV.zzpb);
    this.zzlE.zzlY.zzy(paramzzhe.zzwI);
    if ((!this.zzlE.zzlV.zzpb) && (!bool) && (this.zzlE.zzmj == 0))
      zze(false);
    if (this.zzlE.zzmh == null)
      this.zzlE.zzmh = new zzhj(this.zzlE.zzlM);
    int j;
    int i;
    if (paramzzhe.zzyt != null)
    {
      j = paramzzhe.zzyt.zzsy;
      i = paramzzhe.zzyt.zzsz;
    }
    while (true)
    {
      this.zzlE.zzmh.zzg(j, i);
      zzcn.zza localzza;
      if (this.zzlE.zzmj == 0)
      {
        if ((!this.zzlE.zzlV.zzpb) && (paramzzhe.zzuq != null) && ((paramzzhe.zzuq.zzeG().zzba()) || (paramzzhe.zzys != null)))
        {
          zzaf localzzaf = this.zzlG.zza(this.zzlE.zzlV, this.zzlE.zzlW);
          if ((paramzzhe.zzuq.zzeG().zzba()) && (localzzaf != null))
            localzzaf.zza(this);
        }
        if (this.zzlE.zzlW.zzuq != null)
          this.zzlE.zzlW.zzuq.zzeG().zzeR();
        if (bool)
        {
          localzza = paramzzhe.zzyx;
          if (((localzza instanceof zzcm)) && (this.zzlE.zzmd != null))
            zzau();
        }
        else
        {
          zzas();
        }
      }
      while (true)
      {
        if (zzab.zzaP().zzeg() == null)
          break label796;
        zzab.zzaP().zzeg().zza(this.zzlz);
        return;
        if (((localzza instanceof zzcl)) && (this.zzlE.zzmc != null))
        {
          zzat();
          break;
        }
        zzhx.zzac("No matching listener for retrieved native ad template.");
        zza(0);
        return;
        if ((this.zzlE.zzmi != null) && (paramzzhe.zzys != null))
          this.zzlG.zza(this.zzlE.zzlV, this.zzlE.zzlW, this.zzlE.zzmi);
      }
      label796: break;
      i = 0;
      j = 0;
    }
  }

  public void zza(String paramString, ArrayList<String> paramArrayList)
  {
    zzfe localzzfe = new zzfe(paramString, paramArrayList, this.zzlE.zzlN, this.zzlE.zzlP.zzzH);
    if (this.zzlE.zzmb == null)
    {
      zzhx.zzac("InAppPurchaseListener is not set. Try to launch default purchase flow.");
      if (!zzbe.zzbD().zzA(this.zzlE.zzlN))
      {
        zzhx.zzac("Google Play Service unavailable, cannot launch default purchase flow.");
        return;
      }
      if (this.zzlE.zzma == null)
      {
        zzhx.zzac("PlayStorePurchaseListener is not set.");
        return;
      }
      if (this.zzlE.zzmg == null)
      {
        zzhx.zzac("PlayStorePurchaseVerifier is not initialized.");
        return;
      }
      if (this.zzlE.zzmk)
      {
        zzhx.zzac("An in-app purchase request is already in progress, abort");
        return;
      }
      this.zzlE.zzmk = true;
      try
      {
        if (!this.zzlE.zzma.isValidPurchase(paramString))
        {
          this.zzlE.zzmk = false;
          return;
        }
      }
      catch (RemoteException localRemoteException2)
      {
        zzhx.zzac("Could not start In-App purchase.");
        this.zzlE.zzmk = false;
        return;
      }
      zzab.zzaU().zza(this.zzlE.zzlN, this.zzlE.zzlP.zzzK, new zzfb(this.zzlE.zzlN, this.zzlE.zzmg, localzzfe, this));
      return;
    }
    try
    {
      this.zzlE.zzmb.zza(localzzfe);
      return;
    }
    catch (RemoteException localRemoteException1)
    {
      zzhx.zzac("Could not start In-App purchase.");
    }
  }

  public void zza(String paramString, boolean paramBoolean, int paramInt, Intent paramIntent, zzfg paramzzfg)
  {
    try
    {
      if (this.zzlE.zzma != null)
        this.zzlE.zzma.zza(new zzfh(this.zzlE.zzlN, paramString, paramBoolean, paramInt, paramIntent, paramzzfg));
      zzhw.zzzG.postDelayed(new zzt.3(this, paramIntent), 500L);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      while (true)
        zzhx.zzac("Fail to invoke PlayStorePurchaseListener.");
    }
  }

  public void zza(HashSet<zzhf> paramHashSet)
  {
    this.zzlE.zza(paramHashSet);
  }

  public void zza(List<String> paramList)
  {
    com.google.android.gms.common.internal.zzx.zzbd("setNativeTemplates must be called on the main UI thread.");
    this.zzlE.zzmf = paramList;
  }

  public boolean zza(zzax paramzzax)
  {
    com.google.android.gms.common.internal.zzx.zzbd("loadAd must be called on the main UI thread.");
    if ((this.zzlE.zzlQ != null) || (this.zzlE.zzlU != null))
    {
      if (this.zzlC != null)
        zzhx.zzac("Aborting last ad request since another ad request is already in progress. The current request object will still be cached for future refreshes.");
      this.zzlC = paramzzax;
    }
    do
    {
      return false;
      if ((this.zzlE.zzlV.zzpb) && (this.zzlE.zzlW != null))
      {
        zzhx.zzac("An interstitial is already loading. Aborting.");
        return false;
      }
    }
    while (!zzav());
    zzhx.zzaa("Starting ad request.");
    zzab();
    this.zzlA = this.zzlz.zzcq();
    if (!paramzzax.zzoO)
      zzhx.zzaa("Use AdRequest.Builder.addTestDevice(\"" + zzbe.zzbD().zzz(this.zzlE.zzlN) + "\") to get test ads on this device.");
    Bundle localBundle = zza(zzab.zzaP().zzo(this.zzlE.zzlN));
    this.zzlF.cancel();
    this.zzlE.zzmj = 0;
    zzgo.zza localzza = zza(paramzzax, localBundle);
    this.zzlE.zzlQ = zzab.zzaI().zza(this.zzlE.zzlN, localzza, this.zzlE.zzlO, this);
    return true;
  }

  boolean zza(zzhe paramzzhe, boolean paramBoolean)
  {
    boolean bool1 = false;
    zzax localzzax;
    boolean bool2;
    if (this.zzlC != null)
    {
      localzzax = this.zzlC;
      this.zzlC = null;
      bool2 = bool1 | paramBoolean;
      if (!this.zzlE.zzlV.zzpb)
        break label108;
      if (this.zzlE.zzmj == 0)
        zzab.zzaO().zza(paramzzhe.zzuq.getWebView());
    }
    while (true)
    {
      return this.zzlF.zzaG();
      localzzax = paramzzhe.zzwn;
      Bundle localBundle = localzzax.extras;
      bool1 = false;
      if (localBundle == null)
        break;
      bool1 = localzzax.extras.getBoolean("_noRefresh", false);
      break;
      label108: if ((!bool2) && (this.zzlE.zzmj == 0))
        if (paramzzhe.zzsx > 0L)
          this.zzlF.zza(localzzax, paramzzhe.zzsx);
        else if ((paramzzhe.zzyt != null) && (paramzzhe.zzyt.zzsx > 0L))
          this.zzlF.zza(localzzax, paramzzhe.zzyt.zzsx);
        else if ((!paramzzhe.zzwI) && (paramzzhe.errorCode == 2))
          this.zzlF.zzc(localzzax);
    }
  }

  void zzab()
  {
    this.zzlz = new zzcf("load_ad");
    this.zzlA = new zzce(-1L, null, null);
    this.zzlB = new zzce(-1L, null, null);
  }

  public zzd zzac()
  {
    com.google.android.gms.common.internal.zzx.zzbd("getAdFrame must be called on the main UI thread.");
    return zze.zzn(this.zzlE.zzlS);
  }

  public zzba zzad()
  {
    com.google.android.gms.common.internal.zzx.zzbd("getAdSize must be called on the main UI thread.");
    return this.zzlE.zzlV;
  }

  public void zzae()
  {
    zzaq();
  }

  public void zzaf()
  {
    this.zzlG.zzd(this.zzlE.zzlW);
    if (this.zzlE.zzlV.zzpb)
      zzaw();
    this.zzlH = false;
    zzap();
    this.zzlE.zzlY.zzdZ();
  }

  public void zzag()
  {
    if (this.zzlE.zzlV.zzpb)
      zze(false);
    this.zzlH = true;
    zzar();
  }

  public void zzah()
  {
    onAdClicked();
  }

  public void zzai()
  {
    zzaf();
  }

  public void zzaj()
  {
    zzae();
  }

  public void zzak()
  {
    zzag();
  }

  public void zzal()
  {
    if (this.zzlE.zzlW != null)
      zzhx.zzac("Mediation adapter " + this.zzlE.zzlW.zzsN + " refreshed, but mediation adapters should never refresh.");
    zze(true);
    zzas();
  }

  public void zzam()
  {
    zzap();
  }

  public void zzan()
  {
    com.google.android.gms.common.internal.zzx.zzbd("recordManualImpression must be called on the main UI thread.");
    if (this.zzlE.zzlW == null)
      zzhx.zzac("Ad state was null when trying to ping manual tracking URLs.");
    do
    {
      return;
      zzhx.zzY("Pinging manual tracking URLs.");
    }
    while (this.zzlE.zzlW.zzwK == null);
    zzab.zzaM().zza(this.zzlE.zzlN, this.zzlE.zzlP.zzzH, this.zzlE.zzlW.zzwK);
  }

  protected boolean zzao()
  {
    if (!(this.zzlE.zzlN instanceof Activity));
    Window localWindow;
    do
    {
      return false;
      localWindow = ((Activity)this.zzlE.zzlN).getWindow();
    }
    while ((localWindow == null) || (localWindow.getDecorView() == null));
    Rect localRect1 = new Rect();
    Rect localRect2 = new Rect();
    localWindow.getDecorView().getGlobalVisibleRect(localRect1, null);
    localWindow.getDecorView().getWindowVisibleDisplayFrame(localRect2);
    if ((localRect1.bottom != 0) && (localRect2.bottom != 0) && (localRect1.top == localRect2.top));
    for (boolean bool = true; ; bool = false)
      return bool;
  }

  public boolean zzav()
  {
    boolean bool = true;
    if (!zzab.zzaM().zza(this.zzlE.zzlN.getPackageManager(), this.zzlE.zzlN.getPackageName(), "android.permission.INTERNET"))
    {
      if (!this.zzlE.zzlV.zzpb)
        zzbe.zzbD().zza(this.zzlE.zzlS, this.zzlE.zzlV, "Missing internet permission in AndroidManifest.xml.", "Missing internet permission in AndroidManifest.xml. You must have the following declaration: <uses-permission android:name=\"android.permission.INTERNET\" />");
      bool = false;
    }
    if (!zzab.zzaM().zzt(this.zzlE.zzlN))
    {
      if (!this.zzlE.zzlV.zzpb)
        zzbe.zzbD().zza(this.zzlE.zzlS, this.zzlE.zzlV, "Missing AdActivity with android:configChanges in AndroidManifest.xml.", "Missing AdActivity with android:configChanges in AndroidManifest.xml. You must have the following declaration within the <application> element: <activity android:name=\"com.google.android.gms.ads.AdActivity\" android:configChanges=\"keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize\" />");
      bool = false;
    }
    if ((!bool) && (!this.zzlE.zzlV.zzpb))
      this.zzlE.zzlS.setVisibility(0);
    return bool;
  }

  public ArrayList<String> zzb(List<String> paramList)
  {
    String str = this.zzlE.zzlW.zzwD;
    int i = zzz.zzj(this.zzlE.zzlN).zzaF();
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
      localArrayList.add(zza((String)localIterator.next(), str, i));
    return localArrayList;
  }

  public void zzb(View paramView)
  {
    this.zzlE.zzmi = paramView;
    zza(new zzhe(this.zzlE.zzlX, null, null, null, null, null, null));
  }

  public void zzb(zzax paramzzax)
  {
    ViewParent localViewParent = this.zzlE.zzlS.getParent();
    if (((localViewParent instanceof View)) && (((View)localViewParent).isShown()) && (zzab.zzaM().zzes()) && (!this.zzlH))
    {
      zza(paramzzax);
      return;
    }
    zzhx.zzaa("Ad is not visible. Not refreshing ad.");
    this.zzlF.zzc(paramzzax);
  }

  protected void zzc(View paramView)
  {
    ViewGroup.LayoutParams localLayoutParams = new ViewGroup.LayoutParams(-2, -2);
    this.zzlE.zzlS.addView(paramView, localLayoutParams);
  }

  public void zzd(boolean paramBoolean)
  {
    this.zzlE.zzml = paramBoolean;
  }

  @zzgi
  public static final class zza extends ViewSwitcher
  {
    private final zzhs zzlL;

    public zza(Context paramContext)
    {
      super();
      this.zzlL = new zzhs(paramContext);
    }

    public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
    {
      this.zzlL.zzc(paramMotionEvent);
      return false;
    }

    public void removeAllViews()
    {
      for (int i = 0; i < getChildCount(); i++)
      {
        View localView = getChildAt(i);
        if ((localView != null) && ((localView instanceof zzic)))
          ((zzic)localView).destroy();
      }
      super.removeAllViews();
    }
  }

  @zzgi
  static class zzb
    implements ViewTreeObserver.OnGlobalLayoutListener
  {
    public final String zzlM;
    public final Context zzlN;
    public final zzk zzlO;
    public final zzhy zzlP;
    public zzhl zzlQ;
    public zzbg zzlR;
    public zzt.zza zzlS;
    public zzbh zzlT;
    public zzhl zzlU;
    public zzba zzlV;
    public zzhe zzlW;
    public zzhe.zza zzlX;
    public zzhf zzlY;
    public zzbk zzlZ;
    public zzfs zzma;
    public zzfo zzmb;
    public zzcq zzmc;
    public zzcr zzmd;
    public zzcj zzme;
    public List<String> zzmf;
    public zzfl zzmg;
    public zzhj zzmh = null;
    public View zzmi = null;
    public int zzmj = 0;
    public boolean zzmk = false;
    public boolean zzml = false;
    public zzbl zzmm;
    private HashSet<zzhf> zzmn = null;
    private int zzmo = -1;
    private int zzmp = -1;

    public zzb(Context paramContext, zzba paramzzba, String paramString, zzhy paramzzhy)
    {
      this(paramContext, paramzzba, paramString, paramzzhy, null);
    }

    zzb(Context paramContext, zzba paramzzba, String paramString, zzhy paramzzhy, zzk paramzzk)
    {
      if (paramzzba.zzpb)
      {
        this.zzlS = null;
        if ((paramContext != null) && ((paramContext instanceof Activity)) && (this.zzlS != null))
          zzab.zzaM().zza((Activity)paramContext, this);
        this.zzlV = paramzzba;
        this.zzlM = paramString;
        this.zzlN = paramContext;
        this.zzlP = paramzzhy;
        if (paramzzk == null)
          break label163;
      }
      while (true)
      {
        this.zzlO = paramzzk;
        return;
        this.zzlS = new zzt.zza(paramContext);
        this.zzlS.setMinimumWidth(paramzzba.widthPixels);
        this.zzlS.setMinimumHeight(paramzzba.heightPixels);
        this.zzlS.setVisibility(4);
        break;
        label163: paramzzk = new zzk(new zzw(this));
      }
    }

    public void destroy()
    {
      this.zzlT = null;
      this.zzlZ = null;
      this.zzma = null;
      this.zzmb = null;
      this.zzme = null;
      this.zzmm = null;
      if ((this.zzlN != null) && ((this.zzlN instanceof Activity)) && (this.zzlS != null))
        zzab.zzaO().zzb((Activity)this.zzlN, this);
      zzf(false);
      if (this.zzlS != null)
        this.zzlS.removeAllViews();
      zzay();
      zzaA();
      this.zzlW = null;
    }

    public void onGlobalLayout()
    {
      if ((this.zzlS == null) || (this.zzlW == null) || (this.zzlW.zzuq == null) || (!this.zzlW.zzuq.zzeG().zzba()));
      int i;
      int j;
      do
      {
        return;
        int[] arrayOfInt = new int[2];
        this.zzlS.getLocationOnScreen(arrayOfInt);
        i = zzbe.zzbD().zzc(this.zzlN, arrayOfInt[0]);
        j = zzbe.zzbD().zzc(this.zzlN, arrayOfInt[1]);
      }
      while ((i == this.zzmo) && (j == this.zzmp));
      this.zzmo = i;
      this.zzmp = j;
      this.zzlW.zzuq.zzeG().zzb(this.zzmo, this.zzmp);
    }

    public void zza(HashSet<zzhf> paramHashSet)
    {
      this.zzmn = paramHashSet;
    }

    public void zzaA()
    {
      if ((this.zzlW != null) && (this.zzlW.zzsM != null));
      try
      {
        this.zzlW.zzsM.destroy();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        zzhx.zzac("Could not destroy mediation adapter.");
      }
    }

    public HashSet<zzhf> zzax()
    {
      return this.zzmn;
    }

    public void zzay()
    {
      if ((this.zzlW != null) && (this.zzlW.zzuq != null))
        this.zzlW.zzuq.destroy();
    }

    public void zzaz()
    {
      if ((this.zzlW != null) && (this.zzlW.zzuq != null))
        this.zzlW.zzuq.stopLoading();
    }

    public void zzf(boolean paramBoolean)
    {
      if (this.zzmj == 0)
        zzaz();
      if (this.zzlQ != null)
        this.zzlQ.cancel();
      if (this.zzlU != null)
        this.zzlU.cancel();
      if (paramBoolean)
        this.zzlW = null;
    }
  }
}