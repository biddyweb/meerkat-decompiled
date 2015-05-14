package co.getair.meerkat.commands.profile;

import android.app.Activity;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.commands.login.LogoutCommand;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.mediators.ProfileMediator;
import co.getair.meerkat.proxies.ProfileProxy;
import co.getair.meerkat.proxies.SessionProxy;
import java.util.concurrent.Callable;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class ProfileStartupCommand extends SimpleCommand
{
  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  private void registerCommands()
  {
    LogoutCommand localLogoutCommand = new LogoutCommand();
    getFacade().registerCommand("userLogout", localLogoutCommand);
    ProfileUpdateFollowingFollowers localProfileUpdateFollowingFollowers = new ProfileUpdateFollowingFollowers();
    getFacade().registerCommand("profileUserLoaded", localProfileUpdateFollowingFollowers);
  }

  private void registerMediators()
  {
    ProfileMediator localProfileMediator = new ProfileMediator("feedMediator", getBaseFacade().getOwnerActivity().findViewById(2131624106));
    getFacade().registerMediator(localProfileMediator);
  }

  private void registerProxies()
  {
    ProfileProxy localProfileProxy = new ProfileProxy("profileProxy", getBaseFacade().getOwnerActivity().getApplicationContext());
    getFacade().registerProxy(localProfileProxy);
    SessionProxy localSessionProxy = (SessionProxy)ApiProxy.getInstance(getBaseFacade().getOwnerActivity().getApplicationContext()).retrieveProxy("sessionProxy", new Callable()
    {
      public Object call()
        throws Exception
      {
        return new SessionProxy("sessionProxy", ProfileStartupCommand.this.getBaseFacade().getOwnerActivity().getApplicationContext());
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
    getFacade().sendNotification("profileUserLoaded", null, null);
  }
}