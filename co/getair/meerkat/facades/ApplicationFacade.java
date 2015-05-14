package co.getair.meerkat.facades;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.support.v4.content.LocalBroadcastManager;
import co.getair.meerkat.commands.ApplicationFacadeStartupCommand;
import co.getair.meerkat.commands.FollowUserCommand;
import co.getair.meerkat.commands.GetInboxCommand;
import co.getair.meerkat.commands.UnfollowUserCommand;
import co.getair.meerkat.commands.login.AuthorizeCommand;
import java.util.Map;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class ApplicationFacade extends Facade
{
  private BroadcastReceiver doAuthorize = new ApplicationFacade.1(this);

  protected ApplicationFacade(String paramString)
  {
    super(paramString);
  }

  public static ApplicationFacade getInst(String paramString)
  {
    if (instanceMap.get(paramString) == null)
      instanceMap.put(paramString, new ApplicationFacade(paramString));
    return (ApplicationFacade)instanceMap.get(paramString);
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startupApplicationFacade", new ApplicationFacadeStartupCommand());
    registerCommand("commandGetInbox", new GetInboxCommand());
    registerCommand("followUserCommand", new FollowUserCommand());
    registerCommand("unfollowUserCommand", new UnfollowUserCommand());
    registerCommand("authorizationStart", new AuthorizeCommand());
  }

  public void startup(Context paramContext)
  {
    LocalBroadcastManager.getInstance(paramContext).registerReceiver(this.doAuthorize, new IntentFilter("notificationDoAuthorize"));
    sendNotification("startupApplicationFacade", paramContext, null);
  }
}