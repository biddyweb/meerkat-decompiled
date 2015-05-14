package com.digits.sdk.android;

public class ConfirmationCodeActivity extends DigitsActivity
{
  DigitsActivityDelegate getActivityDelegate()
  {
    return new ConfirmationCodeActivityDelegate();
  }
}