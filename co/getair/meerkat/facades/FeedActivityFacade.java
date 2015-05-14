package co.getair.meerkat.facades;

import android.app.Activity;
import co.getair.meerkat.commands.feed.FeedStartupCommand;
import java.util.Map;

public class FeedActivityFacade extends BaseFacade
{
  protected FeedActivityFacade(Activity paramActivity)
  {
    super(paramActivity);
  }

  public static FeedActivityFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new FeedActivityFacade(paramActivity));
    return (FeedActivityFacade)instanceMap.get(str);
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startup", new FeedStartupCommand());
  }
}