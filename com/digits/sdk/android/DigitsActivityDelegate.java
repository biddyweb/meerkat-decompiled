package com.digits.sdk.android;

import android.app.Activity;
import android.os.Bundle;

public abstract interface DigitsActivityDelegate extends ActivityLifecycle
{
  public abstract int getLayoutId();

  public abstract void init(Activity paramActivity, Bundle paramBundle);

  public abstract boolean isValid(Bundle paramBundle);
}