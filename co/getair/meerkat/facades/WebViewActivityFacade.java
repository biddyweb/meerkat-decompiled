package co.getair.meerkat.facades;

import android.app.Activity;
import co.getair.meerkat.commands.webview.WebViewStartupCommand;
import java.util.Map;

public class WebViewActivityFacade extends BaseFacade
{
  protected WebViewActivityFacade(Activity paramActivity)
  {
    super(paramActivity);
  }

  public static WebViewActivityFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new WebViewActivityFacade(paramActivity));
    return (WebViewActivityFacade)instanceMap.get(str);
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startup", new WebViewStartupCommand());
  }
}