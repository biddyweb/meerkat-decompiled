package com.digits.sdk.android;

public class PhoneNumberActivity extends DigitsActivity
{
  DigitsActivityDelegate getActivityDelegate()
  {
    return new PhoneNumberActivityDelegate();
  }
}