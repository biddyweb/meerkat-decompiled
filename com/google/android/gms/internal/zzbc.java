package com.google.android.gms.internal;

import com.google.android.gms.ads.doubleclick.AppEventListener;

@zzgi
public final class zzbc extends zzbk.zza
{
  private final AppEventListener zzpd;

  public zzbc(AppEventListener paramAppEventListener)
  {
    this.zzpd = paramAppEventListener;
  }

  public void onAppEvent(String paramString1, String paramString2)
  {
    this.zzpd.onAppEvent(paramString1, paramString2);
  }
}