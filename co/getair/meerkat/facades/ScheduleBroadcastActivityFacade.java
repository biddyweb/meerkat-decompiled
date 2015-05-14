package co.getair.meerkat.facades;

import android.app.Activity;
import co.getair.meerkat.commands.ScheduleBroadcastStartupCommand;
import java.util.Map;

public class ScheduleBroadcastActivityFacade extends BaseFacade
{
  protected ScheduleBroadcastActivityFacade(Activity paramActivity)
  {
    super(paramActivity);
  }

  public static ScheduleBroadcastActivityFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new ScheduleBroadcastActivityFacade(paramActivity));
    return (ScheduleBroadcastActivityFacade)instanceMap.get(str);
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startup", new ScheduleBroadcastStartupCommand());
  }
}