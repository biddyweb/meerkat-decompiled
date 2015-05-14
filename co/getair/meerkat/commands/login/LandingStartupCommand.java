package co.getair.meerkat.commands.login;

import android.app.Activity;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.commands.ValidateSessionCommand;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.mediators.LandingMediator;
import co.getair.meerkat.mediators.UserOverlookMediator;
import co.getair.meerkat.notifications.PendingNotificationsManager;
import co.getair.meerkat.proxies.SessionProxy;
import java.util.concurrent.Callable;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class LandingStartupCommand extends SimpleCommand
{
  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  private void registerCommands()
  {
    ValidateSessionCommand localValidateSessionCommand = new ValidateSessionCommand();
    getFacade().registerCommand("validateSession", localValidateSessionCommand);
    LoginCommand localLoginCommand = new LoginCommand();
    getFacade().registerCommand("startLoginSequenceCommand", localLoginCommand);
  }

  private void registerMediators()
  {
    LandingMediator localLandingMediator = new LandingMediator("landingMediator", getBaseFacade().getOwnerActivity().findViewById(2131624090));
    getFacade().registerMediator(localLandingMediator);
    getFacade().registerMediator(new UserOverlookMediator());
  }

  private void registerProxies()
  {
    SessionProxy localSessionProxy = (SessionProxy)ApiProxy.getInstance(getBaseFacade().getOwnerActivity().getApplicationContext()).retrieveProxy("sessionProxy", new Callable()
    {
      public Object call()
        throws Exception
      {
        return new SessionProxy("sessionProxy", LandingStartupCommand.this.getBaseFacade().getOwnerActivity().getApplicationContext());
      }
    });
    getFacade().registerProxy(localSessionProxy);
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    registerCommands();
    registerProxies();
    registerMediators();
    sendNotification("validateSession", null, null);
    PendingNotificationsManager.getInstance(getBaseFacade().getOwnerActivity()).cleanNotificationCenter();
  }
}