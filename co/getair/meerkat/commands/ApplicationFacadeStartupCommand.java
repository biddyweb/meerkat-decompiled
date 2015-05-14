package co.getair.meerkat.commands;

import android.content.Context;
import co.getair.meerkat.proxies.AuthorizeProxy;
import co.getair.meerkat.proxies.GraphProxy;
import co.getair.meerkat.proxies.InboxProxy;
import co.getair.meerkat.proxies.ResourcesProxy;
import co.getair.meerkat.proxies.TwitterProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class ApplicationFacadeStartupCommand extends SimpleCommand
{
  private void registerProxies(Context paramContext)
  {
    Facade localFacade = getFacade();
    localFacade.registerProxy(new GraphProxy("graphProxy", paramContext));
    localFacade.registerProxy(new InboxProxy("inboxProxy", paramContext));
    localFacade.registerProxy(new TwitterProxy("twitterProxy", paramContext));
    localFacade.registerProxy(new AuthorizeProxy("authorizeProxy", paramContext));
    localFacade.registerProxy(new ResourcesProxy(ResourcesProxy.NAME()));
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    registerProxies((Context)paramINotification.getBody());
  }
}