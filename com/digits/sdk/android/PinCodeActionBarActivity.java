package com.digits.sdk.android;

public class PinCodeActionBarActivity extends DigitsActionBarActivity
{
  DigitsActivityDelegate getActivityDelegate()
  {
    return new PinCodeActivityDelegate();
  }
}