package com.digits.sdk.android;

import android.app.Activity;
import android.os.ResultReceiver;

abstract interface FailureController
{
  public abstract void sendFailure(ResultReceiver paramResultReceiver, Exception paramException);

  public abstract void tryAnotherNumber(Activity paramActivity, ResultReceiver paramResultReceiver);
}