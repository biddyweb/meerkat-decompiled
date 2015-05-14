package co.getair.meerkat.utilities;

import android.util.Log;
import java.lang.reflect.Field;

public class MLog
{
  private static int LOGGER_STACKTRACE_INDEX = 1;

  public static void d(String paramString)
  {
    if (isDebug())
    {
      String str = getClassName();
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = getCurrentFilename();
      arrayOfObject[1] = Integer.valueOf(getLineNumber());
      arrayOfObject[2] = paramString;
      Log.d(str, String.format("( %s:%d ) %s", arrayOfObject));
    }
  }

  public static void d(String paramString1, String paramString2)
  {
    if (isDebug())
    {
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = getCurrentFilename();
      arrayOfObject[1] = Integer.valueOf(getLineNumber());
      arrayOfObject[2] = paramString2;
      Log.d(paramString1, String.format("( %s:%d ) %s", arrayOfObject));
    }
  }

  public static void e(String paramString)
  {
    if (isDebug())
    {
      String str = getClassName();
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = getCurrentFilename();
      arrayOfObject[1] = Integer.valueOf(getLineNumber());
      arrayOfObject[2] = paramString;
      Log.e(str, String.format("( %s:%d ) %s", arrayOfObject));
    }
  }

  public static void e(String paramString1, String paramString2)
  {
    if (isDebug())
    {
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = getCurrentFilename();
      arrayOfObject[1] = Integer.valueOf(getLineNumber());
      arrayOfObject[2] = paramString2;
      Log.e(paramString1, String.format("( %s:%d ) %s", arrayOfObject));
    }
  }

  public static String getClassName()
  {
    return Thread.currentThread().getStackTrace()[getFirsPackageRowInStackTrace()].getClassName();
  }

  public static String getCurrentFilename()
  {
    return Thread.currentThread().getStackTrace()[getFirsPackageRowInStackTrace()].getFileName();
  }

  private static int getFirsPackageRowInStackTrace()
  {
    int i = 0;
    String[] arrayOfString = MLog.class.getPackage().getName().split("\\.");
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = arrayOfString[0];
    arrayOfObject[1] = arrayOfString[1];
    String str = String.format("%s.%s", arrayOfObject);
    StackTraceElement[] arrayOfStackTraceElement = Thread.currentThread().getStackTrace();
    int j = 0;
    int k = arrayOfStackTraceElement.length;
    while (true)
    {
      StackTraceElement localStackTraceElement;
      if (i < k)
        localStackTraceElement = arrayOfStackTraceElement[i];
      try
      {
        Field localField = localStackTraceElement.getClass().getDeclaredField("declaringClass");
        localField.setAccessible(true);
        if (((String)localField.get(localStackTraceElement)).contains(str))
        {
          boolean bool = localStackTraceElement.getClassName().equals(MLog.class.getName());
          if (!bool)
            return j;
        }
      }
      catch (Exception localException)
      {
        return j;
      }
      j++;
      i++;
    }
  }

  public static int getLineNumber()
  {
    return Thread.currentThread().getStackTrace()[getFirsPackageRowInStackTrace()].getLineNumber();
  }

  public static String getMethodName()
  {
    return Thread.currentThread().getStackTrace()[getFirsPackageRowInStackTrace()].getMethodName();
  }

  public static void i(String paramString)
  {
    if (isDebug())
    {
      String str = getClassName();
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = getCurrentFilename();
      arrayOfObject[1] = Integer.valueOf(getLineNumber());
      arrayOfObject[2] = paramString;
      Log.i(str, String.format("( %s:%d ) %s", arrayOfObject));
    }
  }

  public static void i(String paramString1, String paramString2)
  {
    if (isDebug())
    {
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = getCurrentFilename();
      arrayOfObject[1] = Integer.valueOf(getLineNumber());
      arrayOfObject[2] = paramString2;
      Log.i(paramString1, String.format("( %s:%d ) %s", arrayOfObject));
    }
  }

  public static boolean isDebug()
  {
    return false;
  }

  public static void v(String paramString)
  {
    if (isDebug())
    {
      String str = getClassName();
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = getCurrentFilename();
      arrayOfObject[1] = Integer.valueOf(getLineNumber());
      arrayOfObject[2] = paramString;
      Log.v(str, String.format("( %s:%d ) %s", arrayOfObject));
    }
  }

  public static void v(String paramString1, String paramString2)
  {
    if (isDebug())
    {
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = getCurrentFilename();
      arrayOfObject[1] = Integer.valueOf(getLineNumber());
      arrayOfObject[2] = paramString2;
      Log.v(paramString1, String.format("( %s:%d ) %s", arrayOfObject));
    }
  }

  public static void w(String paramString)
  {
    if (isDebug())
    {
      String str = getClassName();
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = getCurrentFilename();
      arrayOfObject[1] = Integer.valueOf(getLineNumber());
      arrayOfObject[2] = paramString;
      Log.e(str, String.format("( %s:%d ) %s", arrayOfObject));
    }
  }

  public static void w(String paramString1, String paramString2)
  {
    if (isDebug())
    {
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = getCurrentFilename();
      arrayOfObject[1] = Integer.valueOf(getLineNumber());
      arrayOfObject[2] = paramString2;
      Log.e(paramString1, String.format("( %s:%d ) %s", arrayOfObject));
    }
  }
}