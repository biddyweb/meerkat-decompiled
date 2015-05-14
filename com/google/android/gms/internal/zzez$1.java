package com.google.android.gms.internal;

import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.util.Set;

class zzez$1
  implements Runnable
{
  zzez$1(zzez paramzzez, String paramString1, String paramString2)
  {
  }

  public void run()
  {
    final WebView localWebView = this.zzuQ.zzdr();
    localWebView.setWebViewClient(new WebViewClient()
    {
      public void onPageFinished(WebView paramAnonymousWebView, String paramAnonymousString)
      {
        zzhx.zzY("Loading assets have finished");
        zzez.1.this.zzuQ.zzuN.remove(localWebView);
      }

      public void onReceivedError(WebView paramAnonymousWebView, int paramAnonymousInt, String paramAnonymousString1, String paramAnonymousString2)
      {
        zzhx.zzac("Loading assets have failed.");
        zzez.1.this.zzuQ.zzuN.remove(localWebView);
      }
    });
    this.zzuQ.zzuN.add(localWebView);
    localWebView.loadDataWithBaseURL(this.zzuO, this.zzuP, "text/html", "UTF-8", null);
    zzhx.zzY("Fetching assets finished.");
  }
}