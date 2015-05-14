package co.getair.meerkat.commands.phone_verification;

import co.getair.meerkat.proxies.PhoneVerificationProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class PhoneVerificationSubmissionCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    String str = (String)paramINotification.getBody();
    ((PhoneVerificationProxy)getFacade().retrieveProxy("phoneVerificationProxy")).verifyPhoneNumber(str);
  }
}