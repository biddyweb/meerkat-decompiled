package co.getair.meerkat.facades;

import android.app.Activity;
import co.getair.meerkat.commands.watch.WatchStartupCommand;
import java.util.Map;

public class WatchActivityFacade extends BaseFacade
{
  protected WatchActivityFacade(Activity paramActivity)
  {
    super(paramActivity);
  }

  public static WatchActivityFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new WatchActivityFacade(paramActivity));
    return (WatchActivityFacade)instanceMap.get(str);
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startup", new WatchStartupCommand());
  }
}