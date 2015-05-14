package co.getair.meerkat.commands.feed;

import co.getair.meerkat.proxies.FeedProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class GetLiveFeedCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    GetLiveParams localGetLiveParams = (GetLiveParams)paramINotification.getBody();
    FeedProxy localFeedProxy = (FeedProxy)getFacade().retrieveProxy("feedProxy");
    localFeedProxy.requestLiveStreams(localGetLiveParams.shouldFilter);
    localFeedProxy.requestScheduledStreams(localGetLiveParams.shouldFilter);
  }
}