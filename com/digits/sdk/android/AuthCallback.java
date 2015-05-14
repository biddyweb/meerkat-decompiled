package com.digits.sdk.android;

public abstract interface AuthCallback
{
  public abstract void failure(DigitsException paramDigitsException);

  public abstract void success(DigitsSession paramDigitsSession, String paramString);
}