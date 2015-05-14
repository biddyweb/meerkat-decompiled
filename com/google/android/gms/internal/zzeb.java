package com.google.android.gms.internal;

import android.app.Activity;
import android.graphics.Bitmap;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.Window;
import android.webkit.WebView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.google.android.gms.ads.AdSize;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@zzgi
public class zzeb extends zzeg
{
  static final Set<String> zztg = new HashSet(Arrays.asList(new String[] { "top-left", "top-right", "top-center", "center", "bottom-left", "bottom-right", "bottom-center" }));
  private int zzli = -1;
  private int zzlj = -1;
  private final zzic zzmu;
  private final Object zznh = new Object();
  private zzba zzsF;
  private String zzth = "top-right";
  private boolean zzti = true;
  private int zztj = 0;
  private int zztk = 0;
  private int zztl = 0;
  private int zztm = 0;
  private final Activity zztn;
  private ImageView zzto;
  private LinearLayout zztp;
  private zzeh zztq;
  private PopupWindow zztr;
  private RelativeLayout zzts;
  private ViewGroup zztt;

  public zzeb(zzic paramzzic, zzeh paramzzeh)
  {
    super(paramzzic, "resize");
    this.zzmu = paramzzic;
    this.zztn = paramzzic.zzeD();
    this.zztq = paramzzeh;
  }

  private int[] zzcO()
  {
    if (!zzcQ())
      return null;
    if (this.zzti)
    {
      int[] arrayOfInt3 = new int[2];
      arrayOfInt3[0] = (this.zztj + this.zztl);
      arrayOfInt3[1] = (this.zztk + this.zztm);
      return arrayOfInt3;
    }
    int[] arrayOfInt1 = zzab.zzaM().zzh(this.zztn);
    int[] arrayOfInt2 = zzab.zzaM().zzj(this.zztn);
    int i = arrayOfInt1[0];
    int j = this.zztj + this.zztl;
    int k = this.zztk + this.zztm;
    if (j < 0)
    {
      j = 0;
      if (k >= arrayOfInt2[0])
        break label155;
      k = arrayOfInt2[0];
    }
    while (true)
    {
      return new int[] { j, k };
      if (j + this.zzli <= i)
        break;
      j = i - this.zzli;
      break;
      label155: if (k + this.zzlj > arrayOfInt2[1])
        k = arrayOfInt2[1] - this.zzlj;
    }
  }

  private void zzf(Map<String, String> paramMap)
  {
    if (!TextUtils.isEmpty((CharSequence)paramMap.get("width")))
      this.zzli = zzab.zzaM().zzT((String)paramMap.get("width"));
    if (!TextUtils.isEmpty((CharSequence)paramMap.get("height")))
      this.zzlj = zzab.zzaM().zzT((String)paramMap.get("height"));
    if (!TextUtils.isEmpty((CharSequence)paramMap.get("offsetX")))
      this.zztl = zzab.zzaM().zzT((String)paramMap.get("offsetX"));
    if (!TextUtils.isEmpty((CharSequence)paramMap.get("offsetY")))
      this.zztm = zzab.zzaM().zzT((String)paramMap.get("offsetY"));
    if (!TextUtils.isEmpty((CharSequence)paramMap.get("allowOffscreen")))
      this.zzti = Boolean.parseBoolean((String)paramMap.get("allowOffscreen"));
    String str = (String)paramMap.get("customClosePosition");
    if (!TextUtils.isEmpty(str))
      this.zzth = str;
  }

  public void zzb(int paramInt1, int paramInt2)
  {
    synchronized (this.zznh)
    {
      this.zztj = paramInt1;
      this.zztk = paramInt2;
      if (this.zztr != null)
      {
        int[] arrayOfInt = zzcO();
        if (arrayOfInt != null)
        {
          this.zztr.update(zzbe.zzbD().zzb(this.zztn, arrayOfInt[0]), zzbe.zzbD().zzb(this.zztn, arrayOfInt[1]), this.zztr.getWidth(), this.zztr.getHeight());
          zzd(arrayOfInt[0], arrayOfInt[1]);
        }
      }
      else
      {
        return;
      }
      zzm(true);
    }
  }

  void zzc(int paramInt1, int paramInt2)
  {
    if (this.zztq != null)
      this.zztq.zza(paramInt1, paramInt2, this.zzli, this.zzlj);
  }

  boolean zzcN()
  {
    return (this.zzli > -1) && (this.zzlj > -1);
  }

  public boolean zzcP()
  {
    while (true)
    {
      synchronized (this.zznh)
      {
        if (this.zztr != null)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }

  boolean zzcQ()
  {
    int[] arrayOfInt1 = zzab.zzaM().zzh(this.zztn);
    int[] arrayOfInt2 = zzab.zzaM().zzj(this.zztn);
    int i = arrayOfInt1[0];
    int j = arrayOfInt1[1];
    if ((this.zzli < 50) || (this.zzli > i))
    {
      zzhx.zzac("Width is too small or too large.");
      return false;
    }
    if ((this.zzlj < 50) || (this.zzlj > j))
    {
      zzhx.zzac("Height is too small or too large.");
      return false;
    }
    if ((this.zzlj == j) && (this.zzli == i))
    {
      zzhx.zzac("Cannot resize to a full-screen ad.");
      return false;
    }
    String str;
    int k;
    label184: int m;
    int n;
    if (this.zzti)
    {
      str = this.zzth;
      k = -1;
      switch (str.hashCode())
      {
      default:
        switch (k)
        {
        default:
          m = -50 + (this.zztj + this.zztl + this.zzli);
          n = this.zztk + this.zztm;
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        }
        break;
      case -1012429441:
      case 1755462605:
      case -1364013995:
      case -655373719:
      case 1288627767:
      case 1163912186:
      }
    }
    while ((m >= 0) && (m + 50 <= i) && (n >= arrayOfInt2[0]) && (n + 50 <= arrayOfInt2[1]))
    {
      return true;
      if (!str.equals("top-left"))
        break label184;
      k = 0;
      break label184;
      if (!str.equals("top-center"))
        break label184;
      k = 1;
      break label184;
      if (!str.equals("center"))
        break label184;
      k = 2;
      break label184;
      if (!str.equals("bottom-left"))
        break label184;
      k = 3;
      break label184;
      if (!str.equals("bottom-center"))
        break label184;
      k = 4;
      break label184;
      if (!str.equals("bottom-right"))
        break label184;
      k = 5;
      break label184;
      m = this.zztj + this.zztl;
      n = this.zztk + this.zztm;
      continue;
      m = -25 + (this.zztj + this.zztl + this.zzli / 2);
      n = this.zztk + this.zztm;
      continue;
      m = -25 + (this.zztj + this.zztl + this.zzli / 2);
      n = -25 + (this.zztk + this.zztm + this.zzlj / 2);
      continue;
      m = this.zztj + this.zztl;
      n = -50 + (this.zztk + this.zztm + this.zzlj);
      continue;
      m = -25 + (this.zztj + this.zztl + this.zzli / 2);
      n = -50 + (this.zztk + this.zztm + this.zzlj);
      continue;
      m = -50 + (this.zztj + this.zztl + this.zzli);
      n = -50 + (this.zztk + this.zztm + this.zzlj);
    }
  }

  void zzd(int paramInt1, int paramInt2)
  {
    zzb(paramInt1, paramInt2 - zzab.zzaM().zzj(this.zztn)[0], this.zzli, this.zzlj);
  }

  public void zze(int paramInt1, int paramInt2)
  {
    this.zztj = paramInt1;
    this.zztk = paramInt2;
  }

  public void zzg(Map<String, String> paramMap)
  {
    synchronized (this.zznh)
    {
      if (this.zztn == null)
      {
        zzH("Not an activity context. Cannot resize.");
        return;
      }
      if (this.zzmu.zzad() == null)
      {
        zzH("Webview is not yet available, size is not set.");
        return;
      }
    }
    if (this.zzmu.zzad().zzpb)
    {
      zzH("Is interstitial. Cannot resize an interstitial.");
      return;
    }
    if (this.zzmu.zzeK())
    {
      zzH("Cannot resize an expanded banner.");
      return;
    }
    zzf(paramMap);
    if (!zzcN())
    {
      zzH("Invalid width and height options. Cannot resize.");
      return;
    }
    Window localWindow = this.zztn.getWindow();
    if ((localWindow == null) || (localWindow.getDecorView() == null))
    {
      zzH("Activity context is not ready, cannot get window or decor view.");
      return;
    }
    int[] arrayOfInt = zzcO();
    if (arrayOfInt == null)
    {
      zzH("Resize location out of screen or close button is not visible.");
      return;
    }
    int i = zzbe.zzbD().zzb(this.zztn, this.zzli);
    int j = zzbe.zzbD().zzb(this.zztn, this.zzlj);
    ViewParent localViewParent = this.zzmu.getWebView().getParent();
    label328: PopupWindow localPopupWindow;
    if ((localViewParent != null) && ((localViewParent instanceof ViewGroup)))
    {
      ((ViewGroup)localViewParent).removeView(this.zzmu.getWebView());
      if (this.zztr == null)
      {
        this.zztt = ((ViewGroup)localViewParent);
        Bitmap localBitmap = zzab.zzaM().zzh(this.zzmu.getWebView());
        this.zzto = new ImageView(this.zztn);
        this.zzto.setImageBitmap(localBitmap);
        this.zzsF = this.zzmu.zzad();
        this.zztt.addView(this.zzto);
        this.zzts = new RelativeLayout(this.zztn);
        this.zzts.setBackgroundColor(0);
        this.zzts.setLayoutParams(new ViewGroup.LayoutParams(i, j));
        this.zztr = zzab.zzaM().zza(this.zzts, i, j, false);
        this.zztr.setOutsideTouchable(true);
        this.zztr.setTouchable(true);
        localPopupWindow = this.zztr;
        if (this.zzti)
          break label1076;
      }
    }
    label1036: label1076: for (boolean bool = true; ; bool = false)
    {
      while (true)
      {
        localPopupWindow.setClippingEnabled(bool);
        this.zzts.addView(this.zzmu.getWebView(), -1, -1);
        this.zztp = new LinearLayout(this.zztn);
        RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(zzbe.zzbD().zzb(this.zztn, 50), zzbe.zzbD().zzb(this.zztn, 50));
        String str = this.zzth;
        switch (str.hashCode())
        {
        case -1012429441:
          localLayoutParams.addRule(10);
          localLayoutParams.addRule(11);
          this.zztp.setOnClickListener(new zzeb.1(this));
          this.zztp.setContentDescription("Close button");
          this.zzts.addView(this.zztp, localLayoutParams);
        case 1755462605:
        case -1364013995:
        case -655373719:
        case 1288627767:
        case 1163912186:
          try
          {
            label578: this.zztr.showAtLocation(localWindow.getDecorView(), 0, zzbe.zzbD().zzb(this.zztn, arrayOfInt[0]), zzbe.zzbD().zzb(this.zztn, arrayOfInt[1]));
            zzc(arrayOfInt[0], arrayOfInt[1]);
            this.zzmu.zza(new zzba(this.zztn, new AdSize(this.zzli, this.zzlj)));
            zzd(arrayOfInt[0], arrayOfInt[1]);
            zzJ("resized");
            return;
            this.zztr.dismiss();
            break label328;
            zzH("Webview is detached, probably in the middle of a resize or expand.");
            return;
            if (str.equals("top-left"))
            {
              k = 0;
              break label1036;
              if (str.equals("top-center"))
              {
                k = 1;
                break label1036;
                if (str.equals("center"))
                {
                  k = 2;
                  break label1036;
                  if (str.equals("bottom-left"))
                  {
                    k = 3;
                    break label1036;
                    if (str.equals("bottom-center"))
                    {
                      k = 4;
                      break label1036;
                      if (str.equals("bottom-right"))
                      {
                        k = 5;
                        break label1036;
                        localLayoutParams.addRule(10);
                        localLayoutParams.addRule(9);
                        break label578;
                        localLayoutParams.addRule(10);
                        localLayoutParams.addRule(14);
                        break label578;
                        localLayoutParams.addRule(13);
                        break label578;
                        localLayoutParams.addRule(12);
                        localLayoutParams.addRule(9);
                        break label578;
                        localLayoutParams.addRule(12);
                        localLayoutParams.addRule(14);
                        break label578;
                        localLayoutParams.addRule(12);
                        localLayoutParams.addRule(11);
                      }
                    }
                  }
                }
              }
            }
          }
          catch (RuntimeException localRuntimeException)
          {
            zzH("Cannot show popup window: " + localRuntimeException.getMessage());
            this.zzts.removeView(this.zzmu.getWebView());
            if (this.zztt != null)
            {
              this.zztt.removeView(this.zzto);
              this.zztt.addView(this.zzmu.getWebView());
              this.zzmu.zza(this.zzsF);
            }
            return;
          }
        }
      }
      int k = -1;
      switch (k)
      {
      default:
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      }
    }
  }

  public void zzm(boolean paramBoolean)
  {
    synchronized (this.zznh)
    {
      if (this.zztr != null)
      {
        this.zztr.dismiss();
        this.zzts.removeView(this.zzmu.getWebView());
        if (this.zztt != null)
        {
          this.zztt.removeView(this.zzto);
          this.zztt.addView(this.zzmu.getWebView());
          this.zzmu.zza(this.zzsF);
        }
        if (paramBoolean)
        {
          zzJ("default");
          if (this.zztq != null)
            this.zztq.zzam();
        }
        this.zztr = null;
        this.zzts = null;
        this.zztt = null;
        this.zztp = null;
      }
      return;
    }
  }
}