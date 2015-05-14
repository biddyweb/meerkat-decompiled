package co.getair.meerkat.commands.login;

import android.app.Activity;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.commands.UploadProfileImageCommand;
import co.getair.meerkat.commands.ValidateSessionCommand;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.mediators.HomeMediator;
import co.getair.meerkat.mediators.LoginMediator;
import co.getair.meerkat.proxies.SessionProxy;
import java.util.concurrent.Callable;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class HomeStartupCommand extends SimpleCommand
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
    GetTwitterUserCommand localGetTwitterUserCommand = new GetTwitterUserCommand();
    getFacade().registerCommand("getTwitterUser", localGetTwitterUserCommand);
    SignupCommand localSignupCommand = new SignupCommand();
    getFacade().registerCommand("startSignupSequenceCommand", localSignupCommand);
    UploadProfileImageCommand localUploadProfileImageCommand = new UploadProfileImageCommand();
    getFacade().registerCommand("uploadProfileImage", localUploadProfileImageCommand);
    UploadTwitterFriendsListCommand localUploadTwitterFriendsListCommand = new UploadTwitterFriendsListCommand();
    getFacade().registerCommand("uploadTwitterFriendsList", localUploadTwitterFriendsListCommand);
  }

  private void registerMediators()
  {
    LoginMediator localLoginMediator = new LoginMediator("loginMediator", getBaseFacade().getOwnerActivity().findViewById(2131624087));
    getFacade().registerMediator(localLoginMediator);
    HomeMediator localHomeMediator = new HomeMediator("homeMediator", getBaseFacade().getOwnerActivity().findViewById(2131624083));
    getFacade().registerMediator(localHomeMediator);
  }

  private void registerProxies()
  {
    SessionProxy localSessionProxy = (SessionProxy)ApiProxy.getInstance(getBaseFacade().getOwnerActivity().getApplicationContext()).retrieveProxy("sessionProxy", new Callable()
    {
      public Object call()
        throws Exception
      {
        return new SessionProxy("sessionProxy", HomeStartupCommand.this.getBaseFacade().getOwnerActivity().getApplicationContext());
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
  }
}