package com.digits.sdk.android;

import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;

public class FailureActionBarActivity extends ActionBarActivity
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