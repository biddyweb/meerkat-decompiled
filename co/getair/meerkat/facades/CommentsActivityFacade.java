package co.getair.meerkat.facades;

import android.app.Activity;
import co.getair.meerkat.commands.comments.CommentsStartupCommand;
import java.util.Map;

public class CommentsActivityFacade extends BaseFacade
{
  protected CommentsActivityFacade(Activity paramActivity)
  {
    super(paramActivity);
  }

  public static CommentsActivityFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new CommentsActivityFacade(paramActivity));
    return (CommentsActivityFacade)instanceMap.get(str);
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startup", new CommentsStartupCommand());
  }
}