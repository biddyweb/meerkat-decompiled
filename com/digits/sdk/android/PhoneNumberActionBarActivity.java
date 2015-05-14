package com.digits.sdk.android;

public class PhoneNumberActionBarActivity extends DigitsActionBarActivity
{
  DigitsActivityDelegate getActivityDelegate()
  {
    return new PhoneNumberActivityDelegate();
  }
}