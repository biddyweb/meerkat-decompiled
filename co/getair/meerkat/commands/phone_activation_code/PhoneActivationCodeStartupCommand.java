package co.getair.meerkat.commands.phone_activation_code;

import android.app.Activity;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.mediators.PhoneActivationCodeMediator;
import co.getair.meerkat.proxies.PhoneVerificationProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class PhoneActivationCodeStartupCommand extends SimpleCommand
{
  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  private void registerCommands()
  {
    getFacade().registerCommand("eventSendActivationCode", new PhoneActivationCodeSubmissionCommand());
  }

  private void registerMediators()
  {
    PhoneActivationCodeMediator localPhoneActivationCodeMediator = new PhoneActivationCodeMediator(PhoneActivationCodeMediator.getName(), getBaseFacade().getOwnerActivity().findViewById(2131624091));
    getFacade().registerMediator(localPhoneActivationCodeMediator);
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