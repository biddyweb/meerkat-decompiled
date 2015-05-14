package co.getair.meerkat.video.broadcast.googlecode.mp4parser.util;

public abstract class Logger
{
  public static Logger getLogger(Class paramClass)
  {
    if (System.getProperty("java.vm.name").equalsIgnoreCase("Dalvik"))
      return new AndroidLogger(paramClass.getSimpleName());
    return new JuliLogger(paramClass.getSimpleName());
  }

  public abstract void logDebug(String paramString);

  public abstract void logError(String paramString);

  public abstract void logWarn(String paramString);
}