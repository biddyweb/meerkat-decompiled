package co.getair.meerkat.mediators;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import co.getair.meerkat.activities.FeedActivity;
import co.getair.meerkat.dtos.OnActivityResultParams;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.utilities.MLog;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.TwitterSession;
import com.twitter.sdk.android.core.identity.TwitterLoginButton;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class LoginMediator extends Mediator
{
  private TwitterLoginButton twitterLoginButton;

  public LoginMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    this.twitterLoginButton = ((TwitterLoginButton)paramObject);
    this.twitterLoginButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        LoginMediator.this.getFacade().sendNotification("eventLoginSequenceStart", null, null);
        LoginMediator.this.twitterLoginButton.setVisibility(4);
      }
    });
    this.twitterLoginButton.setCallback(new Callback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        LoginMediator.this.getFacade().sendNotification("eventTwitterLoginError", null, null);
        LoginMediator.this.twitterLoginButton.setVisibility(0);
        MLog.d("FAILED TO LOG IN", paramAnonymousTwitterException.toString());
      }

      public void success(Result<TwitterSession> paramAnonymousResult)
      {
        LoginMediator.this.getFacade().sendNotification("startLoginSequenceCommand", null, null);
      }
    });
  }

  public void handleNotification(INotification paramINotification)
  {
    if (paramINotification.getName().equals("eventTwitterLoginDone"))
    {
      OnActivityResultParams localOnActivityResultParams = (OnActivityResultParams)paramINotification.getBody();
      this.twitterLoginButton.onActivityResult(localOnActivityResultParams.getRequestCode(), localOnActivityResultParams.getResultCode(), localOnActivityResultParams.getData());
    }
    if (paramINotification.getName().equals("eventSessionInvalid"))
      this.twitterLoginButton.setVisibility(0);
    if (paramINotification.getName().equals("eventSessionIsValid"))
    {
      this.twitterLoginButton.setVisibility(4);
      Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
      Intent localIntent = new Intent(localActivity, FeedActivity.class);
      ((BaseFacade)getFacade()).getOwnerActivity().startActivity(localIntent);
      localActivity.finish();
    }
    if (paramINotification.getName().equals("userDoesNotExist"))
      getFacade().sendNotification("getTwitterUser", null, null);
    if (paramINotification.getName().equals("eventTwitterUserArrived"))
      getFacade().sendNotification("startSignupSequenceCommand", paramINotification.getBody(), null);
    if (paramINotification.getName().equals("eventTwitterFriendsListArrived"))
      getFacade().sendNotification("uploadTwitterFriendsList", paramINotification.getBody(), null);
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "eventTwitterLoginDone", "eventSessionInvalid", "eventSessionIsValid", "eventTwitterUserArrived", "userDoesNotExist", "eventTwitterFriendsListArrived" };
  }
}