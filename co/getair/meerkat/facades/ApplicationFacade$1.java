package co.getair.meerkat.facades;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class ApplicationFacade$1 extends BroadcastReceiver
{
  ApplicationFacade$1(ApplicationFacade paramApplicationFacade)
  {
  }

  public void onReceive(Context paramContext, Intent paramIntent)
  {
    this.this$0.sendNotification("authorizationStart", null, null);
  }
}