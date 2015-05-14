package com.twitter.sdk.android.core;

public class TwitterAuthException extends TwitterException
{
  private static final long serialVersionUID = 577033016879783994L;

  public TwitterAuthException(String paramString)
  {
    super(paramString);
  }

  public TwitterAuthException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
}