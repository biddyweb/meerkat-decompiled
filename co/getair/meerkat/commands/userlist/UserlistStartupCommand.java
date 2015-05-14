package co.getair.meerkat.commands.userlist;

import android.app.Activity;
import co.getair.meerkat.activities.UserListActivity;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.mediators.UserlistMediator;
import co.getair.meerkat.proxies.UserlistProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class UserlistStartupCommand extends SimpleCommand
{
  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  private UserListActivity getOwnerActivity()
  {
    return (UserListActivity)getBaseFacade().getOwnerActivity();
  }

  private void registerCommands()
  {
    LoadUserListCommand localLoadUserListCommand = new LoadUserListCommand();
    getFacade().registerCommand("userlistLoad", localLoadUserListCommand);
  }

  private void registerMediators()
  {
    UserlistMediator localUserlistMediator = new UserlistMediator("userListMediator", getBaseFacade().getOwnerActivity().findViewById(2131624125));
    localUserlistMediator.setTitle(getOwnerActivity().getListTitle());
    localUserlistMediator.setShowScore(getOwnerActivity().getShowScore());
    getFacade().registerMediator(localUserlistMediator);
  }

  private void registerProxies()
  {
    UserlistProxy localUserlistProxy = new UserlistProxy("userlistProxy", getBaseFacade().getOwnerActivity().getApplicationContext());
    getFacade().registerProxy(localUserlistProxy);
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    registerCommands();
    registerProxies();
    registerMediators();
    sendNotification("userlistLoad", getOwnerActivity().getListSource(), null);
  }
}