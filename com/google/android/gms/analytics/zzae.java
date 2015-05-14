package com.google.android.gms.analytics;

public class zzae
{
  private static volatile Logger zzEN;

  static
  {
    setLogger(new zzp());
  }

  static Logger getLogger()
  {
    return zzEN;
  }

  static void setLogger(Logger paramLogger)
  {
    zzEN = paramLogger;
  }

  public static void zzZ(String paramString)
  {
    Logger localLogger = getLogger();
    if (localLogger != null)
      localLogger.error(paramString);
  }

  public static void zzaa(String paramString)
  {
    Logger localLogger = getLogger();
    if (localLogger != null)
      localLogger.info(paramString);
  }

  public static void zzab(String paramString)
  {
    Logger localLogger = getLogger();
    if (localLogger != null)
      localLogger.verbose(paramString);
  }

  public static void zzac(String paramString)
  {
    Logger localLogger = getLogger();
    if (localLogger != null)
      localLogger.warn(paramString);
  }

  public static boolean zzgw()
  {
    Logger localLogger = getLogger();
    boolean bool = false;
    if (localLogger != null)
    {
      int i = getLogger().getLogLevel();
      bool = false;
      if (i == 0)
        bool = true;
    }
    return bool;
  }
}