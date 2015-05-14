package co.getair.meerkat.mediators;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import co.getair.meerkat.activities.FeedActivity;
import co.getair.meerkat.activities.HomeActivity;
import co.getair.meerkat.activities.PhoneVerificationActivity;
import co.getair.meerkat.activities.WatchActivity;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.facades.LandingActivityFacade;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class LandingMediator extends Mediator
{
  View rootView;

  public LandingMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    this.rootView = ((View)paramObject);
  }

  private ScreenToOpen parseCallingIntentExtras(Bundle paramBundle)
  {
    if (paramBundle.getString("broadcastId") != null)
      return ScreenToOpen.WATCH;
    return ScreenToOpen.FEED;
  }

  private void pushFeedActivity()
  {
    Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
    localActivity.startActivity(new Intent(localActivity, FeedActivity.class));
  }

  private void pushPhoneVerificationActivity()
  {
    Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
    localActivity.startActivity(new Intent(localActivity, PhoneVerificationActivity.class));
  }

  private void pushWatchActivity(Bundle paramBundle)
  {
    Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
    Intent localIntent = new Intent(localActivity, WatchActivity.class);
    localIntent.putExtras(paramBundle);
    localActivity.startActivity(localIntent);
  }

  private void redirectToIntentActivity(Intent paramIntent)
  {
    try
    {
      Bundle localBundle = paramIntent.getExtras();
      ScreenToOpen localScreenToOpen = parseCallingIntentExtras(localBundle);
      switch (1.$SwitchMap$co$getair$meerkat$mediators$LandingMediator$ScreenToOpen[localScreenToOpen.ordinal()])
      {
      case 1:
        pushFeedActivity();
        pushWatchActivity(localBundle);
        return;
      case 2:
      }
    }
    catch (Exception localException)
    {
      pushFeedActivity();
      return;
    }
    pushFeedActivity();
  }

  public void handleNotification(INotification paramINotification)
  {
    Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
    if (paramINotification.getName().equals("eventSessionInvalid"))
      localActivity.startActivity(new Intent(localActivity, HomeActivity.class));
    if (paramINotification.getName().equals("eventSessionIsValid"))
      sendNotification("eventStartUserOverlook");
    if (paramINotification.getName().equals("eventAskForPhoneVerification"))
      pushPhoneVerificationActivity();
    if (paramINotification.getName().equals("eventUserOverlookFlowCompleted"))
      redirectToIntentActivity(((LandingActivityFacade)getFacade()).getCallingIntent());
    localActivity.finish();
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "eventSessionInvalid", "eventSessionIsValid", "eventAskForPhoneVerification", "eventAskForAddressBookUpload", "eventUserOverlookFlowCompleted" };
  }

  private static enum ScreenToOpen
  {
    static
    {
      PHONE_VERIFICATION = new ScreenToOpen("PHONE_VERIFICATION", 2);
      ADDRESS_BOOK = new ScreenToOpen("ADDRESS_BOOK", 3);
      ScreenToOpen[] arrayOfScreenToOpen = new ScreenToOpen[4];
      arrayOfScreenToOpen[0] = FEED;
      arrayOfScreenToOpen[1] = WATCH;
      arrayOfScreenToOpen[2] = PHONE_VERIFICATION;
      arrayOfScreenToOpen[3] = ADDRESS_BOOK;
    }
  }
}