package io.fabric.sdk.android.services.common;

public abstract class Crash
{
  private final String sessionId;

  public Crash(String paramString)
  {
    this.sessionId = paramString;
  }

  public String getSessionId()
  {
    return this.sessionId;
  }

  public static class FatalException extends Crash
  {
    public FatalException(String paramString)
    {
      super();
    }
  }

  public static class LoggedException extends Crash
  {
    public LoggedException(String paramString)
    {
      super();
    }
  }
}