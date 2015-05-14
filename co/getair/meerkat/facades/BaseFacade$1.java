package co.getair.meerkat.facades;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class BaseFacade$1 extends BroadcastReceiver
{
  BaseFacade$1(BaseFacade paramBaseFacade)
  {
  }

  public void onReceive(Context paramContext, Intent paramIntent)
  {
    this.this$0.sendNotification("eventDismissBroadcastScreen", null, null);
  }
}