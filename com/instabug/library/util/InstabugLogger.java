package com.instabug.library.util;

import android.util.Log;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class InstabugLogger
{
  private static final String LOG_FORMAT = "%1$s\n%2$s";
  private static InstabugLogger mInstance;
  private final SimpleDateFormat dateFormatter = new SimpleDateFormat("MM-dd HH:MM:SS.sss", Locale.US);
  private StringBuilder sb = new StringBuilder();

  public static void clear()
  {
    getInstance().sb = new StringBuilder();
  }

  public static void d(String paramString)
  {
    getInstance().log(3, null, null, paramString);
  }

  public static void d(String paramString1, String paramString2)
  {
    getInstance().log(3, null, paramString1, paramString2);
  }

  public static void e(String paramString)
  {
    getInstance().log(6, null, null, paramString);
  }

  public static void e(String paramString1, String paramString2)
  {
    getInstance().log(6, null, paramString1, paramString2);
  }

  public static void e(String paramString1, String paramString2, Throwable paramThrowable)
  {
    getInstance().log(6, paramThrowable, paramString1, paramString2);
  }

  public static void e(String paramString, Throwable paramThrowable)
  {
    getInstance().log(6, paramThrowable, null, paramString);
  }

  public static void e(Throwable paramThrowable)
  {
    getInstance().log(6, paramThrowable, null, null);
  }

  public static String getInstabugLog()
  {
    return getInstance().getLog();
  }

  private static InstabugLogger getInstance()
  {
    try
    {
      if (mInstance == null)
        mInstance = new InstabugLogger();
      InstabugLogger localInstabugLogger = mInstance;
      return localInstabugLogger;
    }
    finally
    {
    }
  }

  public static void i(String paramString)
  {
    getInstance().log(4, null, null, paramString);
  }

  private void log(int paramInt, Throwable paramThrowable, String paramString1, String paramString2)
  {
    while (true)
    {
      try
      {
        this.sb.append(this.dateFormatter.format(new Date(System.currentTimeMillis())));
        this.sb.append("     ");
        switch (paramInt)
        {
        default:
          if (paramString1 != null)
          {
            this.sb.append(paramString1);
            this.sb.append(": ");
          }
          if (paramThrowable != null)
            break;
          this.sb.append(paramString2);
          this.sb.append("\n");
          return;
        case 6:
          this.sb.append("E/ ");
          continue;
        case 3:
        case 7:
        case 4:
        case 5:
        case 2:
        }
      }
      finally
      {
      }
      this.sb.append("D/ ");
      continue;
      this.sb.append("A/ ");
      continue;
      this.sb.append("I/ ");
      continue;
      this.sb.append("W/ ");
      continue;
      this.sb.append("V/ ");
      continue;
      if (paramString2 == null)
        paramString2 = paramThrowable.getMessage();
      String str = Log.getStackTraceString(paramThrowable);
      this.sb.append(String.format("%1$s\n%2$s", new Object[] { paramString2, str }));
      this.sb.append("\n");
    }
  }

  public static void log(String paramString)
  {
    getInstance().logMessage(paramString);
  }

  private void logMessage(String paramString)
  {
    try
    {
      this.sb.append(this.dateFormatter.format(new Date(System.currentTimeMillis())));
      this.sb.append(": ");
      this.sb.append(paramString);
      this.sb.append("\n");
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public static void w(String paramString)
  {
    getInstance().log(5, null, null, paramString);
  }

  public String getLog()
  {
    return this.sb.toString();
  }
}