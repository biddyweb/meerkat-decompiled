package co.getair.meerkat.commands.phone_activation_code;

import co.getair.meerkat.dtos.ActivationCodeParams;
import co.getair.meerkat.proxies.PhoneVerificationProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class PhoneActivationCodeSubmissionCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    ActivationCodeParams localActivationCodeParams = (ActivationCodeParams)paramINotification.getBody();
    ((PhoneVerificationProxy)getFacade().retrieveProxy("phoneVerificationProxy")).verifyActivationCode(localActivationCodeParams);
  }
}