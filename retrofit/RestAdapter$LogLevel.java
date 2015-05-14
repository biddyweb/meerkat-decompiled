package retrofit;

public enum RestAdapter$LogLevel
{
  static
  {
    BASIC = new LogLevel("BASIC", 1);
    HEADERS = new LogLevel("HEADERS", 2);
    FULL = new LogLevel("FULL", 3);
    LogLevel[] arrayOfLogLevel = new LogLevel[4];
    arrayOfLogLevel[0] = NONE;
    arrayOfLogLevel[1] = BASIC;
    arrayOfLogLevel[2] = HEADERS;
    arrayOfLogLevel[3] = FULL;
  }

  public boolean log()
  {
    return this != NONE;
  }
}