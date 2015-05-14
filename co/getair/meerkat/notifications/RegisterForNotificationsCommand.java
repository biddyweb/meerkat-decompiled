package co.getair.meerkat.notifications;

import android.app.Activity;
import android.app.Dialog;
import android.os.AsyncTask;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.proxies.AuthorizeProxy;
import co.getair.meerkat.proxies.AuthorizeProxy.AuthorizeType;
import co.getair.meerkat.utilities.ApplicationPreferences;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.gcm.GoogleCloudMessaging;
import java.io.IOException;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class RegisterForNotificationsCommand extends SimpleCommand
{
  private static final int PLAY_SERVICES_RESOLUTION_REQUEST = 9000;
  private static final String PROPERTY_APP_VERSION = "appVersion";
  public static final String PROPERTY_REG_ID = "registration_id";
  private static String SENDER_ID = "416405205913";

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    final Activity localActivity = ((RegisterForNotificationsParams)paramINotification.getBody()).getCallingActivity();
    int i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(localActivity);
    if (i != 0)
    {
      if (GooglePlayServicesUtil.isUserRecoverableError(i))
        GooglePlayServicesUtil.getErrorDialog(i, localActivity, 9000).show();
      while (true)
      {
        getFacade().sendNotification("commandGoogleServicesApkNotFound", null, null);
        return;
        localActivity.finish();
      }
    }
    GoogleCloudMessaging.getInstance(localActivity);
    new AsyncTask()
    {
      protected String doInBackground(Void[] paramAnonymousArrayOfVoid)
      {
        try
        {
          GoogleCloudMessaging localGoogleCloudMessaging = GoogleCloudMessaging.getInstance(localActivity);
          String[] arrayOfString = new String[1];
          arrayOfString[0] = RegisterForNotificationsCommand.SENDER_ID;
          String str1 = localGoogleCloudMessaging.register(arrayOfString);
          String str2 = "and - " + str1;
          ApplicationPreferences localApplicationPreferences = new ApplicationPreferences(localActivity);
          String str3 = localApplicationPreferences.getNotificationsToken();
          if ((str3.isEmpty()) || (!str3.equals(str2)))
          {
            localApplicationPreferences.saveNotificationsToken(str2);
            ((AuthorizeProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("authorizeProxy")).authorizeWithNewToken(Boolean.valueOf(false), AuthorizeProxy.AuthorizeType.PERIODIC, new RunnableWithResultObject()
            {
              public void run()
              {
                if ((this.success) && ((RegisterForNotificationsCommand.this.getFacade() instanceof BaseFacade)))
                  ((BaseFacade)RegisterForNotificationsCommand.this.getFacade()).getOwnerActivity().runOnUiThread(new Runnable()
                  {
                    public void run()
                    {
                      RegisterForNotificationsCommand.this.getFacade().sendNotification("eventSessionIsValid", RegisterForNotificationsCommand.1.1.this.resultObject, null);
                    }
                  });
              }
            });
          }
          return "";
        }
        catch (IOException localIOException)
        {
          return "Error :" + localIOException.getMessage();
        }
      }
    }
    .execute(new Void[] { null, null, null });
  }
}