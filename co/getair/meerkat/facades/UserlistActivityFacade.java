package co.getair.meerkat.facades;

import android.app.Activity;
import co.getair.meerkat.commands.userlist.UserlistStartupCommand;
import java.util.Map;

public class UserlistActivityFacade extends BaseFacade
{
  protected UserlistActivityFacade(Activity paramActivity)
  {
    super(paramActivity);
  }

  public static UserlistActivityFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new UserlistActivityFacade(paramActivity));
    return (UserlistActivityFacade)instanceMap.get(str);
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startup", new UserlistStartupCommand());
  }
}