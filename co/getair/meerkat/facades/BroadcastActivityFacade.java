package co.getair.meerkat.facades;

import android.app.Activity;
import co.getair.meerkat.commands.broadcast.BroadcastStartupCommand;
import java.util.Map;

public class BroadcastActivityFacade extends BaseFacade
{
  protected BroadcastActivityFacade(Activity paramActivity)
  {
    super(paramActivity);
  }

  public static BroadcastActivityFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new BroadcastActivityFacade(paramActivity));
    return (BroadcastActivityFacade)instanceMap.get(str);
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startup", new BroadcastStartupCommand());
  }
}