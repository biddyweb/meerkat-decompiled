package co.getair.meerkat.commands.login;

import android.app.Activity;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.proxies.AuthorizeProxy;
import co.getair.meerkat.proxies.AuthorizeProxy.AuthorizeType;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class AuthorizeCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    AuthorizeProxy.AuthorizeType localAuthorizeType = (AuthorizeProxy.AuthorizeType)paramINotification.getBody();
    ((AuthorizeProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("authorizeProxy")).authorizeWithNewToken(Boolean.valueOf(false), localAuthorizeType, new RunnableWithResultObject()
    {
      public void run()
      {
        if ((this.success) && ((AuthorizeCommand.this.getFacade() instanceof BaseFacade)))
        {
          ((BaseFacade)AuthorizeCommand.this.getFacade()).getOwnerActivity().runOnUiThread(new Runnable()
          {
            public void run()
            {
              AuthorizeCommand.this.getFacade().sendNotification("eventSessionIsValid", AuthorizeCommand.1.this.resultObject, null);
            }
          });
          return;
        }
        ((BaseFacade)AuthorizeCommand.this.getFacade()).getOwnerActivity().runOnUiThread(new Runnable()
        {
          public void run()
          {
            AuthorizeCommand.this.getFacade().sendNotification("eventSessionInvalid", AuthorizeCommand.1.this.resultObject, null);
          }
        });
      }
    });
  }
}