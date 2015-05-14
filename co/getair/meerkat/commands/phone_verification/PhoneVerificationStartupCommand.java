package co.getair.meerkat.commands.phone_verification;

import android.app.Activity;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.mediators.PhoneVerificationMediator;
import co.getair.meerkat.proxies.PhoneVerificationProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class PhoneVerificationStartupCommand extends SimpleCommand
{
  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  private void registerCommands()
  {
    getFacade().registerCommand("eventSendPhoneNumberForVerification", new PhoneVerificationSubmissionCommand());
  }

  private void registerMediators()
  {
    PhoneVerificationMediator localPhoneVerificationMediator = new PhoneVerificationMediator(PhoneVerificationMediator.getName(), getBaseFacade().getOwnerActivity().findViewById(2131624099));
    getFacade().registerMediator(localPhoneVerificationMediator);
  }

  private void registerProxies()
  {
    getFacade().registerProxy(new PhoneVerificationProxy("phoneVerificationProxy", getBaseFacade().getOwnerActivity()));
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    registerCommands();
    registerProxies();
    registerMediators();
  }
}