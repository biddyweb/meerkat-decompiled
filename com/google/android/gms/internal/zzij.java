package com.google.android.gms.internal;

import android.text.TextUtils;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.google.android.gms.common.internal.zzw;
import java.net.URI;
import java.net.URISyntaxException;

@zzgi
public class zzij extends WebViewClient
{
  private final String zzAp = zzag(paramString);
  private boolean zzAq = false;
  private final zzfz zzAr;
  private final zzic zzmu;

  public zzij(zzfz paramzzfz, zzic paramzzic, String paramString)
  {
    this.zzmu = paramzzic;
    this.zzAr = paramzzfz;
  }

  private String zzag(String paramString)
  {
    if (TextUtils.isEmpty(paramString));
    while (true)
    {
      return paramString;
      try
      {
        if (paramString.endsWith("/"))
        {
          String str = paramString.substring(0, -1 + paramString.length());
          return str;
        }
      }
      catch (IndexOutOfBoundsException localIndexOutOfBoundsException)
      {
        zzhx.zzZ(localIndexOutOfBoundsException.getMessage());
      }
    }
    return paramString;
  }

  public void onLoadResource(WebView paramWebView, String paramString)
  {
    zzhx.zzY("JavascriptAdWebViewClient::onLoadResource: " + paramString);
    if (!zzaf(paramString))
      this.zzmu.zzeG().onLoadResource(this.zzmu.getWebView(), paramString);
  }

  public void onPageFinished(WebView paramWebView, String paramString)
  {
    zzhx.zzY("JavascriptAdWebViewClient::onPageFinished: " + paramString);
    if (!this.zzAq)
    {
      this.zzAr.zzdC();
      this.zzAq = true;
    }
  }

  public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
  {
    zzhx.zzY("JavascriptAdWebViewClient::shouldOverrideUrlLoading: " + paramString);
    if (zzaf(paramString))
    {
      zzhx.zzY("shouldOverrideUrlLoading: received passback url");
      return true;
    }
    return this.zzmu.zzeG().shouldOverrideUrlLoading(this.zzmu.getWebView(), paramString);
  }

  protected boolean zzaf(String paramString)
  {
    String str1 = zzag(paramString);
    if (TextUtils.isEmpty(str1));
    while (true)
    {
      return false;
      try
      {
        URI localURI1 = new URI(str1);
        if ("passback".equals(localURI1.getScheme()))
        {
          zzhx.zzY("Passback received");
          this.zzAr.zzdD();
          return true;
        }
        if (!TextUtils.isEmpty(this.zzAp))
        {
          URI localURI2 = new URI(this.zzAp);
          String str2 = localURI2.getHost();
          String str3 = localURI1.getHost();
          String str4 = localURI2.getPath();
          String str5 = localURI1.getPath();
          if ((zzw.equal(str2, str3)) && (zzw.equal(str4, str5)))
          {
            zzhx.zzY("Passback received");
            this.zzAr.zzdD();
            return true;
          }
        }
      }
      catch (URISyntaxException localURISyntaxException)
      {
        zzhx.zzZ(localURISyntaxException.getMessage());
      }
    }
    return false;
  }
}