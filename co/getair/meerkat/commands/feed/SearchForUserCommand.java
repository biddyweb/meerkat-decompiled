package co.getair.meerkat.commands.feed;

import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.dtos.User;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.proxies.SearchProxy;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import java.util.ArrayList;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class SearchForUserCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    String str = (String)paramINotification.getBody();
    ((SearchProxy)getFacade().retrieveProxy("searchProxy")).searchForUser(str, new RunnableWithResultObject()
    {
      public void run()
      {
        if (this.resultObject != null);
        try
        {
          ArrayList localArrayList = (ArrayList)this.resultObject;
          if (localArrayList.size() > 0)
          {
            String str = (String)localArrayList.get(0);
            User.fetchUser(((BaseFacade)SearchForUserCommand.this.getFacade()).getOwnerActivity(), str, new RunnableWithResultObject()
            {
              public void run()
              {
                if (this.resultObject != null)
                {
                  User localUser = (User)this.resultObject;
                  ApplicationFacade.getInst(MeerkatApplication.getName()).sendNotification("followUserCommand", localUser, null);
                }
              }
            });
          }
          return;
        }
        catch (Exception localException)
        {
          MLog.d("search results corrupted");
        }
      }
    });
  }
}