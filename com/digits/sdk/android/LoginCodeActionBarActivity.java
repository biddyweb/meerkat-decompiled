package com.digits.sdk.android;

public class LoginCodeActionBarActivity extends DigitsActionBarActivity
{
  DigitsActivityDelegate getActivityDelegate()
  {
    return new LoginCodeActivityDelegate();
  }
}