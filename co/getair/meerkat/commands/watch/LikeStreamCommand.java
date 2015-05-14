package co.getair.meerkat.commands.watch;

import co.getair.meerkat.facades.WatchActivityFacade;
import co.getair.meerkat.proxies.WatchProxy;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

public class LikeStreamCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    final WatchProxy localWatchProxy = (WatchProxy)((WatchActivityFacade)getFacade()).retrieveProxy("watchProxy");
    localWatchProxy.likeStream(new RunnableWithResultObject()
    {
      public void run()
      {
        if (this.success)
        {
          LikeStreamCommand.this.sendNotification("eventStreamLiked", localWatchProxy.getTweetId(), null);
          return;
        }
        LikeStreamCommand.this.sendNotification("eventStreamLikeError", localWatchProxy.getTweetId(), null);
      }
    });
  }
}