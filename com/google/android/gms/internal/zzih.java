package com.google.android.gms.internal;

import android.content.Context;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@zzgi
public class zzih extends zzid
{
  public zzih(zzic paramzzic, boolean paramBoolean)
  {
    super(paramzzic, paramBoolean);
  }

  public WebResourceResponse shouldInterceptRequest(WebView paramWebView, String paramString)
  {
    try
    {
      if (!"mraid.js".equalsIgnoreCase(new File(paramString).getName()))
        return super.shouldInterceptRequest(paramWebView, paramString);
      if (!(paramWebView instanceof zzic))
      {
        zzhx.zzac("Tried to intercept request from a WebView that wasn't an AdWebView.");
        return super.shouldInterceptRequest(paramWebView, paramString);
      }
      zzic localzzic = (zzic)paramWebView;
      localzzic.zzeG().zzde();
      String str;
      if (localzzic.zzad().zzpb)
        str = (String)zzca.zzqx.get();
      while (true)
      {
        zzhx.zzab("shouldInterceptRequest(" + str + ")");
        return zzd(localzzic.getContext(), this.zzmu.zzeJ().zzzH, str);
        if (localzzic.zzeK())
          str = (String)zzca.zzqw.get();
        else
          str = (String)zzca.zzqv.get();
      }
    }
    catch (IOException localIOException)
    {
      zzhx.zzac("Could not fetch MRAID JS. " + localIOException.getMessage());
    }
    return super.shouldInterceptRequest(paramWebView, paramString);
  }

  protected WebResourceResponse zzd(Context paramContext, String paramString1, String paramString2)
    throws IOException
  {
    HttpURLConnection localHttpURLConnection = (HttpURLConnection)new URL(paramString2).openConnection();
    try
    {
      zzab.zzaM().zza(paramContext, paramString1, true, localHttpURLConnection, true);
      localHttpURLConnection.addRequestProperty("Cache-Control", "max-stale=3600");
      localHttpURLConnection.connect();
      WebResourceResponse localWebResourceResponse = new WebResourceResponse("application/javascript", "UTF-8", new ByteArrayInputStream(zzab.zzaM().zza(new InputStreamReader(localHttpURLConnection.getInputStream())).getBytes("UTF-8")));
      return localWebResourceResponse;
    }
    finally
    {
      localHttpURLConnection.disconnect();
    }
  }
}