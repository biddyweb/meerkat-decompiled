package com.digits.sdk.android;

abstract interface ErrorCodes
{
  public abstract String getDefaultMessage();

  public abstract String getMessage(int paramInt);

  public abstract String getNetworkError();
}