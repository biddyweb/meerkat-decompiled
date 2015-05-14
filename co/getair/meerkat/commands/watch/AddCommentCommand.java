package co.getair.meerkat.commands.watch;

import co.getair.meerkat.dtos.AddCommentParams;
import co.getair.meerkat.proxies.StreamCommentsProxy;
import co.getair.meerkat.proxies.WatchProxy;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class AddCommentCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    String str = (String)paramINotification.getBody();
    StreamCommentsProxy localStreamCommentsProxy = (StreamCommentsProxy)getFacade().retrieveProxy(StreamCommentsProxy.NAME());
    localStreamCommentsProxy.addCommentToStream(str, new RunnableWithResultObject()
    {
      public void run()
      {
        if (this.success)
        {
          WatchProxy localWatchProxy = (WatchProxy)AddCommentCommand.this.getFacade().retrieveProxy("watchProxy");
          if (localWatchProxy != null)
            localWatchProxy.setStreamCommented();
          AddCommentCommand.this.sendNotification("eventCommentAdded", this.val$addCommentParams, null);
          return;
        }
        AddCommentCommand.this.sendNotification("eventCommentAddedError", this.val$addCommentParams, null);
      }
    });
  }
}