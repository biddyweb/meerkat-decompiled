package co.getair.meerkat.mediators;

import android.os.Bundle;
import android.view.View;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import co.getair.meerkat.views.NavigationBar;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class WebViewMediator extends Mediator
{
  private final NavigationBar navigationBar;
  private final WebView webView;

  public WebViewMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    View localView = (View)paramObject;
    this.webView = ((WebView)localView.findViewById(2131624158));
    this.navigationBar = ((NavigationBar)localView.findViewById(2131624157));
  }

  public void handleNotification(INotification paramINotification)
  {
    if (paramINotification.getName().equals("webviewOpen"))
    {
      Bundle localBundle = (Bundle)paramINotification.getBody();
      this.navigationBar.setTitle(localBundle.getString("title"));
      this.webView.loadUrl(localBundle.getString("url"));
    }
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "webviewOpen" };
  }

  public void onRegister()
  {
    super.onRegister();
    this.navigationBar.setTitle("");
    this.navigationBar.setProfileInfoVisible(Boolean.valueOf(false));
    this.navigationBar.setLeaderboardVisible(Boolean.valueOf(false));
    this.navigationBar.setLogoVisible(Boolean.valueOf(false));
    this.navigationBar.setSearchVisible(Boolean.valueOf(false));
    this.navigationBar.setFacade(getFacade());
    WebSettings localWebSettings = this.webView.getSettings();
    localWebSettings.setDomStorageEnabled(true);
    localWebSettings.setJavaScriptEnabled(true);
    this.webView.setWebViewClient(new WebViewClient()
    {
      public boolean shouldOverrideUrlLoading(WebView paramAnonymousWebView, String paramAnonymousString)
      {
        return false;
      }
    });
  }
}