package co.getair.meerkat.facades;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class BaseFacade$2 extends BroadcastReceiver
{
  BaseFacade$2(BaseFacade paramBaseFacade)
  {
  }

  public void onReceive(Context paramContext, Intent paramIntent)
  {
    this.this$0.sendNotification("eventDismissWatchScreen", null, null);
  }
}