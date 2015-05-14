package co.getair.meerkat.commands.watch;

import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import co.getair.meerkat.dtos.MixpanelEventParams;
import co.getair.meerkat.dtos.feed.LiveBroadcastSummary;
import co.getair.meerkat.dtos.watch_broadcast.Broadcaster;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.facades.WatchActivityFacade;
import co.getair.meerkat.proxies.WatchProxy;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import org.json.JSONException;
import org.json.JSONObject;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

public class ReportStreamCommand extends SimpleCommand
{
  private void report()
  {
    final WatchProxy localWatchProxy = (WatchProxy)((WatchActivityFacade)getFacade()).retrieveProxy("watchProxy");
    localWatchProxy.reportStream(new RunnableWithResultObject()
    {
      public void run()
      {
        if (this.success)
        {
          JSONObject localJSONObject = new JSONObject();
          try
          {
            localJSONObject.put("stream id", localWatchProxy.getBroadcastSummary().getId());
            localJSONObject.put("type", "broadcast");
            localJSONObject.put("streamer id", localWatchProxy.getBroadcastSummary().getBroadcaster().getId());
            MixpanelEventParams localMixpanelEventParams = new MixpanelEventParams("report", localJSONObject);
            ReportStreamCommand.this.sendNotification("trackMixpanelEvent", localMixpanelEventParams, null);
            ReportStreamCommand.this.sendNotification("eventStreamReported", null, null);
            return;
          }
          catch (JSONException localJSONException)
          {
            while (true)
              localJSONException.printStackTrace();
          }
        }
        ReportStreamCommand.this.sendNotification("eventStreamReportedError", null, null);
      }
    });
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    new AlertDialog.Builder(((BaseFacade)getFacade()).getOwnerActivity()).setTitle("Report Stream?").setMessage("Are you sure you want to report this stream?").setPositiveButton("Yeah", new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        ReportStreamCommand.this.report();
      }
    }).setNegativeButton("Nah", new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
      }
    }).show();
  }
}