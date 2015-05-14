package com.digits.sdk.android;

public class PinCodeActivity extends DigitsActivity
{
  DigitsActivityDelegate getActivityDelegate()
  {
    return new PinCodeActivityDelegate();
  }
}