package com.twitter.sdk.android.core.identity;

import android.content.Intent;
import android.os.Bundle;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.TwitterAuthException;
import com.twitter.sdk.android.core.TwitterAuthToken;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.internal.oauth.OAuth1aService;
import com.twitter.sdk.android.core.internal.oauth.OAuthResponse;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;

class OAuthController
  implements OAuthWebViewClient.Listener
{
  private final TwitterAuthConfig authConfig;
  final Listener listener;
  private final OAuth1aService oAuth1aService;
  TwitterAuthToken requestToken;
  private final ProgressBar spinner;
  private final WebView webView;

  OAuthController(ProgressBar paramProgressBar, WebView paramWebView, TwitterAuthConfig paramTwitterAuthConfig, OAuth1aService paramOAuth1aService, Listener paramListener)
  {
    this.spinner = paramProgressBar;
    this.webView = paramWebView;
    this.authConfig = paramTwitterAuthConfig;
    this.oAuth1aService = paramOAuth1aService;
    this.listener = paramListener;
  }

  private void dismissSpinner()
  {
    this.spinner.setVisibility(8);
  }

  private void dismissWebView()
  {
    this.webView.stopLoading();
    dismissSpinner();
  }

  private void handleWebViewError(WebViewException paramWebViewException)
  {
    Fabric.getLogger().e("Twitter", "OAuth web view completed with an error", paramWebViewException);
    handleAuthError(1, new TwitterAuthException("OAuth web view completed with an error"));
  }

  private void handleWebViewSuccess(Bundle paramBundle)
  {
    Fabric.getLogger().d("Twitter", "OAuth web view completed successfully");
    if (paramBundle != null)
    {
      String str = paramBundle.getString("oauth_verifier");
      if (str != null)
      {
        Fabric.getLogger().d("Twitter", "Converting the request token to an access token.");
        this.oAuth1aService.requestAccessToken(newRequestAccessTokenCallback(), this.requestToken, str);
        return;
      }
    }
    Fabric.getLogger().e("Twitter", "Failed to get authorization, bundle incomplete " + paramBundle, null);
    handleAuthError(1, new TwitterAuthException("Failed to get authorization, bundle incomplete"));
  }

  protected void handleAuthError(int paramInt, TwitterAuthException paramTwitterAuthException)
  {
    Intent localIntent = new Intent();
    localIntent.putExtra("auth_error", paramTwitterAuthException);
    this.listener.onComplete(paramInt, localIntent);
  }

  Callback<OAuthResponse> newRequestAccessTokenCallback()
  {
    return new Callback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        Fabric.getLogger().e("Twitter", "Failed to get access token", paramAnonymousTwitterException);
        OAuthController.this.handleAuthError(1, new TwitterAuthException("Failed to get access token"));
      }

      public void success(Result<OAuthResponse> paramAnonymousResult)
      {
        Intent localIntent = new Intent();
        OAuthResponse localOAuthResponse = (OAuthResponse)paramAnonymousResult.data;
        localIntent.putExtra("screen_name", localOAuthResponse.userName);
        localIntent.putExtra("user_id", localOAuthResponse.userId);
        localIntent.putExtra("tk", localOAuthResponse.authToken.token);
        localIntent.putExtra("ts", localOAuthResponse.authToken.secret);
        OAuthController.this.listener.onComplete(-1, localIntent);
      }
    };
  }

  Callback<OAuthResponse> newRequestTempTokenCallback()
  {
    return new Callback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        Fabric.getLogger().e("Twitter", "Failed to get request token", paramAnonymousTwitterException);
        OAuthController.this.handleAuthError(1, new TwitterAuthException("Failed to get request token"));
      }

      public void success(Result<OAuthResponse> paramAnonymousResult)
      {
        OAuthController.this.requestToken = ((OAuthResponse)paramAnonymousResult.data).authToken;
        String str = OAuthController.this.oAuth1aService.getAuthorizeUrl(OAuthController.this.requestToken);
        Fabric.getLogger().d("Twitter", "Redirecting user to web view to complete authorization flow");
        OAuthController.this.setUpWebView(OAuthController.this.webView, new OAuthWebViewClient(OAuthController.this.oAuth1aService.buildCallbackUrl(OAuthController.this.authConfig), OAuthController.this), str, new OAuthWebChromeClient());
      }
    };
  }

  public void onError(WebViewException paramWebViewException)
  {
    handleWebViewError(paramWebViewException);
    dismissWebView();
  }

  public void onPageFinished(WebView paramWebView, String paramString)
  {
    dismissSpinner();
    paramWebView.setVisibility(0);
  }

  public void onSuccess(Bundle paramBundle)
  {
    handleWebViewSuccess(paramBundle);
    dismissWebView();
  }

  void setUpWebView(WebView paramWebView, WebViewClient paramWebViewClient, String paramString, WebChromeClient paramWebChromeClient)
  {
    WebSettings localWebSettings = paramWebView.getSettings();
    localWebSettings.setAllowFileAccess(false);
    localWebSettings.setJavaScriptEnabled(false);
    paramWebView.setVerticalScrollBarEnabled(false);
    paramWebView.setHorizontalScrollBarEnabled(false);
    paramWebView.setWebViewClient(paramWebViewClient);
    paramWebView.loadUrl(paramString);
    paramWebView.setVisibility(4);
    paramWebView.setWebChromeClient(paramWebChromeClient);
  }

  void startAuth()
  {
    Fabric.getLogger().d("Twitter", "Obtaining request token to start the sign in flow");
    this.oAuth1aService.requestTempToken(newRequestTempTokenCallback());
  }

  static abstract interface Listener
  {
    public abstract void onComplete(int paramInt, Intent paramIntent);
  }
}