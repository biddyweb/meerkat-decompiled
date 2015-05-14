package co.getair.meerkat.facades;

import android.app.Activity;
import co.getair.meerkat.commands.phone_verification.PhoneVerificationStartupCommand;
import java.util.Map;

public class PhoneVerificationActivityFacade extends BaseFacade
{
  protected PhoneVerificationActivityFacade(Activity paramActivity)
  {
    super(paramActivity);
  }

  public static PhoneVerificationActivityFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new PhoneVerificationActivityFacade(paramActivity));
    return (PhoneVerificationActivityFacade)instanceMap.get(str);
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startup", new PhoneVerificationStartupCommand());
  }
}