package com.digits.sdk.android;

public class ConfirmationCodeActionBarActivity extends DigitsActionBarActivity
{
  DigitsActivityDelegate getActivityDelegate()
  {
    return new ConfirmationCodeActivityDelegate();
  }
}