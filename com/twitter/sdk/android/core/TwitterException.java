package com.twitter.sdk.android.core;

public class TwitterException extends RuntimeException
{
  public TwitterException(String paramString)
  {
    super(paramString);
  }

  public TwitterException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
}