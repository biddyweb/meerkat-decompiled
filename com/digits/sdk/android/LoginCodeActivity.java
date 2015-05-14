package com.digits.sdk.android;

public class LoginCodeActivity extends DigitsActivity
{
  DigitsActivityDelegate getActivityDelegate()
  {
    return new LoginCodeActivityDelegate();
  }
}