package com.google.android.gms.internal;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.os.AsyncTask;
import android.os.Handler;
import android.view.View.MeasureSpec;
import android.webkit.WebView;

public final class zzfz$zza extends AsyncTask<Void, Void, Boolean>
{
  private final WebView zzvG;
  private Bitmap zzvH;

  public zzfz$zza(zzfz paramzzfz, WebView paramWebView)
  {
    this.zzvG = paramWebView;
  }

  protected void onPreExecute()
  {
    try
    {
      this.zzvH = Bitmap.createBitmap(zzfz.zza(this.zzvI), zzfz.zzb(this.zzvI), Bitmap.Config.ARGB_8888);
      this.zzvG.setVisibility(0);
      this.zzvG.measure(View.MeasureSpec.makeMeasureSpec(zzfz.zza(this.zzvI), 0), View.MeasureSpec.makeMeasureSpec(zzfz.zzb(this.zzvI), 0));
      this.zzvG.layout(0, 0, zzfz.zza(this.zzvI), zzfz.zzb(this.zzvI));
      Canvas localCanvas = new Canvas(this.zzvH);
      this.zzvG.draw(localCanvas);
      this.zzvG.invalidate();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  protected Boolean zza(Void[] paramArrayOfVoid)
  {
    while (true)
    {
      int k;
      int n;
      try
      {
        int i = this.zzvH.getWidth();
        int j = this.zzvH.getHeight();
        Object localObject2;
        if ((i == 0) || (j == 0))
        {
          Boolean localBoolean1 = Boolean.valueOf(false);
          localObject2 = localBoolean1;
          return localObject2;
        }
        k = 0;
        int m = 0;
        if (k < i)
        {
          n = 0;
          if (n >= j)
            break label139;
          if (this.zzvH.getPixel(k, n) != 0)
            m++;
        }
        else
        {
          if (m / (i * j / 100.0D) > 0.1D)
          {
            bool = true;
            Boolean localBoolean2 = Boolean.valueOf(bool);
            localObject2 = localBoolean2;
            continue;
          }
          boolean bool = false;
          continue;
        }
      }
      finally
      {
      }
      n += 10;
      continue;
      label139: k += 10;
    }
  }

  protected void zza(Boolean paramBoolean)
  {
    zzfz.zzc(this.zzvI);
    if ((paramBoolean.booleanValue()) || (this.zzvI.zzdE()) || (zzfz.zzd(this.zzvI) <= 0L))
    {
      this.zzvI.zzvF = paramBoolean.booleanValue();
      zzfz.zze(this.zzvI).zza(this.zzvI.zzmu, true);
    }
    while (zzfz.zzd(this.zzvI) <= 0L)
      return;
    if (zzhx.zzA(2))
      zzhx.zzY("Ad not detected, scheduling another run.");
    zzfz.zzg(this.zzvI).postDelayed(this.zzvI, zzfz.zzf(this.zzvI));
  }
}