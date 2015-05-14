package com.digits.sdk.android;

import android.app.Activity;

public abstract interface ActivityClassManager
{
  public abstract Class<? extends Activity> getConfirmationActivity();

  public abstract Class<? extends Activity> getContactsActivity();

  public abstract Class<? extends Activity> getFailureActivity();

  public abstract Class<? extends Activity> getLoginCodeActivity();

  public abstract Class<? extends Activity> getPhoneNumberActivity();

  public abstract Class<? extends Activity> getPinCodeActivity();
}