package com.digits.sdk.android;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

public abstract class DigitsActivity extends Activity
{
  static final int REQUEST_CODE = 140;
  static final int RESULT_FINISH_DIGITS = 200;
  DigitsActivityDelegate delegate;

  abstract DigitsActivityDelegate getActivityDelegate();

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((paramInt2 == 200) && (paramInt1 == 140))
      finish();
  }

  public void onCreate(Bundle paramBundle)
  {
    setTheme(Digits.getInstance().getTheme());
    super.onCreate(paramBundle);
    this.delegate = getActivityDelegate();
    Bundle localBundle = getIntent().getExtras();
    if (this.delegate.isValid(localBundle))
    {
      setContentView(this.delegate.getLayoutId());
      this.delegate.init(this, localBundle);
      return;
    }
    finish();
    throw new IllegalAccessError("This activity can only be started from Digits");
  }

  public void onDestroy()
  {
    this.delegate.onDestroy();
    super.onDestroy();
  }

  public void onResume()
  {
    super.onResume();
    this.delegate.onResume();
  }
}