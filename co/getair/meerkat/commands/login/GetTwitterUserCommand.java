package co.getair.meerkat.commands.login;

import co.getair.meerkat.proxies.TwitterProxy;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class GetTwitterUserCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    ((TwitterProxy)getFacade().retrieveProxy("twitterProxy")).getTwitterUser(new RunnableWithResultObject()
    {
      public void run()
      {
        if (this.success)
          GetTwitterUserCommand.this.getFacade().sendNotification("eventTwitterUserArrived", this.resultObject, null);
      }
    });
  }
}