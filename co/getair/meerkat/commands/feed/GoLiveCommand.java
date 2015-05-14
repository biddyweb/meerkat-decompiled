package co.getair.meerkat.commands.feed;

import android.app.Activity;
import android.content.Intent;
import co.getair.meerkat.activities.BroadcastActivity;
import co.getair.meerkat.dtos.GoLiveParams;
import co.getair.meerkat.facades.BaseFacade;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

public class GoLiveCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
    Intent localIntent = new Intent(localActivity, BroadcastActivity.class);
    localIntent.putExtra("goLiveParams", (GoLiveParams)paramINotification.getBody());
    localActivity.startActivity(localIntent);
  }
}