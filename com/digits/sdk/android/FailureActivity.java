package com.digits.sdk.android;

import android.app.Activity;
import android.os.Bundle;

public class FailureActivity extends Activity
{
  FailureActivityDelegateImpl delegate;

  public void onCreate(Bundle paramBundle)
  {
    setTheme(Digits.getInstance().getTheme());
    super.onCreate(paramBundle);
    this.delegate = new FailureActivityDelegateImpl(this);
    this.delegate.init();
  }
}