package com.twitter.sdk.android.core.identity;

import android.net.http.SslError;
import android.os.Bundle;
import android.webkit.SslErrorHandler;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import io.fabric.sdk.android.services.network.UrlUtils;
import java.net.URI;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;

class OAuthWebViewClient extends WebViewClient
{
  private final String completeUrl;
  private final Listener listener;

  public OAuthWebViewClient(String paramString, Listener paramListener)
  {
    this.completeUrl = paramString;
    this.listener = paramListener;
  }

  public void onPageFinished(WebView paramWebView, String paramString)
  {
    super.onPageFinished(paramWebView, paramString);
    this.listener.onPageFinished(paramWebView, paramString);
  }

  public void onReceivedError(WebView paramWebView, int paramInt, String paramString1, String paramString2)
  {
    super.onReceivedError(paramWebView, paramInt, paramString1, paramString2);
    this.listener.onError(new WebViewException(paramInt, paramString1, paramString2));
  }

  public void onReceivedSslError(WebView paramWebView, SslErrorHandler paramSslErrorHandler, SslError paramSslError)
  {
    super.onReceivedSslError(paramWebView, paramSslErrorHandler, paramSslError);
    this.listener.onError(new WebViewException(paramSslError.getPrimaryError(), null, null));
  }

  public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
  {
    if (paramString.startsWith(this.completeUrl))
    {
      TreeMap localTreeMap = UrlUtils.getQueryParams(URI.create(paramString), false);
      Bundle localBundle = new Bundle(localTreeMap.size());
      Iterator localIterator = localTreeMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        localBundle.putString((String)localEntry.getKey(), (String)localEntry.getValue());
      }
      this.listener.onSuccess(localBundle);
      return true;
    }
    return super.shouldOverrideUrlLoading(paramWebView, paramString);
  }

  static abstract interface Listener
  {
    public abstract void onError(WebViewException paramWebViewException);

    public abstract void onPageFinished(WebView paramWebView, String paramString);

    public abstract void onSuccess(Bundle paramBundle);
  }
}