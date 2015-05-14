package co.getair.meerkat.facades;

import android.app.Activity;
import co.getair.meerkat.commands.login.HomeStartupCommand;
import java.util.Map;

public class HomeActivityFacade extends BaseFacade
{
  protected HomeActivityFacade(Activity paramActivity)
  {
    super(paramActivity);
  }

  public static HomeActivityFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new HomeActivityFacade(paramActivity));
    return (HomeActivityFacade)instanceMap.get(str);
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startup", new HomeStartupCommand());
  }
}