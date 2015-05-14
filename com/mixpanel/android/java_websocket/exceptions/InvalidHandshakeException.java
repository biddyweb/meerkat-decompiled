package com.mixpanel.android.java_websocket.exceptions;

public class InvalidHandshakeException extends InvalidDataException
{
  private static final long serialVersionUID = -1426533877490484964L;

  public InvalidHandshakeException()
  {
    super(1002);
  }

  public InvalidHandshakeException(String paramString)
  {
    super(1002, paramString);
  }

  public InvalidHandshakeException(String paramString, Throwable paramThrowable)
  {
    super(1002, paramString, paramThrowable);
  }

  public InvalidHandshakeException(Throwable paramThrowable)
  {
    super(1002, paramThrowable);
  }
}