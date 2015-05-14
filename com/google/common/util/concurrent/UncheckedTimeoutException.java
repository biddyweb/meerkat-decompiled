package com.google.common.util.concurrent;

import javax.annotation.Nullable;

public class UncheckedTimeoutException extends RuntimeException
{
  private static final long serialVersionUID;

  public UncheckedTimeoutException()
  {
  }

  public UncheckedTimeoutException(@Nullable String paramString)
  {
    super(paramString);
  }

  public UncheckedTimeoutException(@Nullable String paramString, @Nullable Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }

  public UncheckedTimeoutException(@Nullable Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}