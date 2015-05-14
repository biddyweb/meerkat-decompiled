package co.getair.meerkat.commands;

import android.graphics.Bitmap;
import co.getair.meerkat.proxies.SessionProxy;
import co.getair.meerkat.proxies.TwitterProxy;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import com.twitter.sdk.android.core.models.User;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class UploadProfileImageCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    final TwitterProxy localTwitterProxy = (TwitterProxy)getFacade().retrieveProxy("twitterProxy");
    localTwitterProxy.getTwitterUser(new RunnableWithResultObject()
    {
      public void run()
      {
        if (this.success)
        {
          User localUser = (User)this.resultObject;
          localTwitterProxy.getUserProfileImage(localUser, new RunnableWithResultObject()
          {
            public void run()
            {
              if (this.success)
                new Thread(new Runnable()
                {
                  public void run()
                  {
                    try
                    {
                      ((SessionProxy)UploadProfileImageCommand.this.getFacade().retrieveProxy("sessionProxy")).uploadProfileImage(this.val$imageBitmap);
                      return;
                    }
                    catch (Exception localException)
                    {
                      localException.printStackTrace();
                    }
                  }
                }).start();
            }
          });
        }
      }
    });
  }
}