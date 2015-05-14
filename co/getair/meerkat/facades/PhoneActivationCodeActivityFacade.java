package co.getair.meerkat.facades;

import android.app.Activity;
import co.getair.meerkat.commands.phone_activation_code.PhoneActivationCodeStartupCommand;
import java.util.Map;

public class PhoneActivationCodeActivityFacade extends BaseFacade
{
  protected PhoneActivationCodeActivityFacade(Activity paramActivity)
  {
    super(paramActivity);
  }

  public static PhoneActivationCodeActivityFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new PhoneActivationCodeActivityFacade(paramActivity));
    return (PhoneActivationCodeActivityFacade)instanceMap.get(str);
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startup", new PhoneActivationCodeStartupCommand());
  }
}