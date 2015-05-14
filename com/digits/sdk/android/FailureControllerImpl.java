package com.digits.sdk.android;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Intent;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.ResultReceiver;

class FailureControllerImpl
  implements FailureController
{
  final ActivityClassManager classManager;

  public FailureControllerImpl()
  {
    this(Digits.getInstance().getActivityClassManager());
  }

  public FailureControllerImpl(ActivityClassManager paramActivityClassManager)
  {
    this.classManager = paramActivityClassManager;
  }

  @TargetApi(11)
  int getFlags()
  {
    if (Build.VERSION.SDK_INT >= 11)
      return 268468224;
    return 335544320;
  }

  public void sendFailure(ResultReceiver paramResultReceiver, Exception paramException)
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("login_error", paramException.getLocalizedMessage());
    paramResultReceiver.send(400, localBundle);
  }

  public void tryAnotherNumber(Activity paramActivity, ResultReceiver paramResultReceiver)
  {
    Intent localIntent = new Intent(paramActivity, this.classManager.getPhoneNumberActivity());
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("receiver", paramResultReceiver);
    localIntent.putExtras(localBundle);
    localIntent.setFlags(getFlags());
    paramActivity.startActivity(localIntent);
  }
}