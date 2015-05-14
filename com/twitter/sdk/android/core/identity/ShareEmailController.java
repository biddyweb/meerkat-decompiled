package com.twitter.sdk.android.core.identity;

import android.os.Bundle;
import android.os.ResultReceiver;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.models.User;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;

class ShareEmailController
{
  private static final String EMPTY_EMAIL = "";
  private final ShareEmailClient emailClient;
  private final ResultReceiver resultReceiver;

  public ShareEmailController(ShareEmailClient paramShareEmailClient, ResultReceiver paramResultReceiver)
  {
    this.emailClient = paramShareEmailClient;
    this.resultReceiver = paramResultReceiver;
  }

  public void cancelRequest()
  {
    Bundle localBundle = new Bundle();
    localBundle.putSerializable("msg", "The user chose not to share their email address at this time.");
    this.resultReceiver.send(0, localBundle);
  }

  public void executeRequest()
  {
    this.emailClient.getEmail(newCallback());
  }

  void handleSuccess(User paramUser)
  {
    if (paramUser.email == null)
    {
      sendResultCodeError(new TwitterException("Your application may not have access to email addresses or the user may not have an email address. To request access, please visit https://support.twitter.com/forms/platform."));
      return;
    }
    if ("".equals(paramUser.email))
    {
      sendResultCodeError(new TwitterException("This user does not have an email address."));
      return;
    }
    sendResultCodeOk(paramUser.email);
  }

  Callback<User> newCallback()
  {
    return new Callback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        Fabric.getLogger().e("Twitter", "Failed to get email address.", paramAnonymousTwitterException);
        ShareEmailController.this.sendResultCodeError(new TwitterException("Failed to get email address."));
      }

      public void success(Result<User> paramAnonymousResult)
      {
        ShareEmailController.this.handleSuccess((User)paramAnonymousResult.data);
      }
    };
  }

  void sendResultCodeError(TwitterException paramTwitterException)
  {
    Bundle localBundle = new Bundle();
    localBundle.putSerializable("error", paramTwitterException);
    this.resultReceiver.send(1, localBundle);
  }

  void sendResultCodeOk(String paramString)
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("email", paramString);
    this.resultReceiver.send(-1, localBundle);
  }
}