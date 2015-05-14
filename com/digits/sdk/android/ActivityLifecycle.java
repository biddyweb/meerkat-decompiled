package com.digits.sdk.android;

abstract interface ActivityLifecycle
{
  public abstract void onDestroy();

  public abstract void onResume();
}