package com.mixpanel.android.java_websocket.exceptions;

public class NotSendableException extends RuntimeException
{
  private static final long serialVersionUID = -6468967874576651628L;

  public NotSendableException()
  {
  }

  public NotSendableException(String paramString)
  {
    super(paramString);
  }

  public NotSendableException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }

  public NotSendableException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}