package co.getair.meerkat.facades;

import android.app.Activity;
import co.getair.meerkat.commands.profile.ProfileStartupCommand;
import java.util.Map;

public class ProfileActivityFacade extends BaseFacade
{
  protected ProfileActivityFacade(Activity paramActivity)
  {
    super(paramActivity);
  }

  public static ProfileActivityFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new ProfileActivityFacade(paramActivity));
    return (ProfileActivityFacade)instanceMap.get(str);
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startup", new ProfileStartupCommand());
  }
}