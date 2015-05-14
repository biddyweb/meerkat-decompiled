package co.getair.meerkat.commands.watch;

import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import co.getair.meerkat.activities.WatchActivity;
import co.getair.meerkat.dtos.MixpanelEventParams;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.facades.WatchActivityFacade;
import co.getair.meerkat.proxies.WatchProxy;
import co.getair.meerkat.utilities.ApplicationPreferences;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import org.json.JSONException;
import org.json.JSONObject;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

public class RestreamCommand extends SimpleCommand
{
  private void restream()
  {
    WatchActivityFacade localWatchActivityFacade = (WatchActivityFacade)getFacade();
    final WatchProxy localWatchProxy = (WatchProxy)localWatchActivityFacade.retrieveProxy("watchProxy");
    localWatchProxy.restreamVideo(((WatchActivity)localWatchActivityFacade.getOwnerActivity()).streamId, new RunnableWithResultObject()
    {
      public void run()
      {
        if (this.success)
        {
          JSONObject localJSONObject = new JSONObject();
          try
          {
            localJSONObject.put("type", "live");
            MixpanelEventParams localMixpanelEventParams = new MixpanelEventParams("restream", localJSONObject);
            RestreamCommand.this.sendNotification("trackMixpanelEvent", localMixpanelEventParams, null);
            RestreamCommand.this.sendNotification("eventStreamRestreamed", localWatchProxy.getTweetId(), null);
            return;
          }
          catch (JSONException localJSONException)
          {
            while (true)
              localJSONException.printStackTrace();
          }
        }
        RestreamCommand.this.sendNotification("eventStreamRestreamError", localWatchProxy.getTweetId(), null);
      }
    });
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    ApplicationPreferences localApplicationPreferences = new ApplicationPreferences(((WatchActivityFacade)getFacade()).getOwnerActivity());
    if (localApplicationPreferences.isFirstTimeRetweetStream())
      new AlertDialog.Builder(((BaseFacade)getFacade()).getOwnerActivity()).setTitle("Restream?").setMessage("This will also retweet it").setPositiveButton("Ok", new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          RestreamCommand.this.restream();
        }
      }).setNegativeButton("Not Now", new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
        }
      }).show();
    while (true)
    {
      localApplicationPreferences.saveIsFirstTimeRetweetStream(false);
      return;
      restream();
    }
  }
}