package co.getair.meerkat.notifications;

import android.app.Activity;

public class RegisterForNotificationsParams
{
  private Activity callingActivity;

  public RegisterForNotificationsParams(Activity paramActivity)
  {
    this.callingActivity = paramActivity;
  }

  public Activity getCallingActivity()
  {
    return this.callingActivity;
  }
}