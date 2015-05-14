package co.getair.meerkat.facades;

import android.app.Activity;
import android.content.Intent;
import co.getair.meerkat.commands.login.LandingStartupCommand;
import java.util.Map;

public class LandingActivityFacade extends BaseFacade
{
  private Intent callingIntent = null;

  protected LandingActivityFacade(Activity paramActivity)
  {
    super(paramActivity);
  }

  public static LandingActivityFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new LandingActivityFacade(paramActivity));
    return (LandingActivityFacade)instanceMap.get(str);
  }

  public Intent getCallingIntent()
  {
    return this.callingIntent;
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startup", new LandingStartupCommand());
  }

  public void startup(Intent paramIntent)
  {
    this.callingIntent = paramIntent;
    super.startup();
  }
}