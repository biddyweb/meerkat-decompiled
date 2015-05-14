package com.google.android.gms.internal;

import android.webkit.ValueCallback;
import android.webkit.WebSettings;
import android.webkit.WebView;

class zzan$2
  implements Runnable
{
  ValueCallback<String> zzot = new ValueCallback()
  {
    public void zzk(String paramAnonymousString)
    {
      zzan.2.this.zzos.zza(zzan.2.this.zzou, zzan.2.this.zzov, paramAnonymousString);
    }
  };

  zzan$2(zzan paramzzan, zzak paramzzak, WebView paramWebView)
  {
  }

  public void run()
  {
    if (this.zzov.getSettings().getJavaScriptEnabled());
    try
    {
      this.zzov.evaluateJavascript("(function() { return  {text:document.body.innerText}})();", this.zzot);
      return;
    }
    catch (Throwable localThrowable)
    {
      this.zzot.onReceiveValue("");
    }
  }
}