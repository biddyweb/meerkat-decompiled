package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import android.webkit.WebSettings;
import android.webkit.WebView;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@zzgi
public class zzez
  implements zzex
{
  private final Context mContext;
  final Set<WebView> zzuN = Collections.synchronizedSet(new HashSet());

  public zzez(Context paramContext)
  {
    this.mContext = paramContext;
  }

  public void zza(String paramString1, String paramString2, String paramString3)
  {
    zzhx.zzY("Fetching assets for the given html");
    zzhw.zzzG.post(new zzez.1(this, paramString2, paramString3));
  }

  public WebView zzdr()
  {
    WebView localWebView = new WebView(this.mContext);
    localWebView.getSettings().setJavaScriptEnabled(true);
    return localWebView;
  }
}