package com.crashlytics.android;

import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import java.io.OutputStream;
import java.io.Writer;

final class ExceptionUtils
{
  private static String getMessage(Throwable paramThrowable)
  {
    String str = paramThrowable.getLocalizedMessage();
    if (str == null)
      return null;
    return str.replaceAll("(\r\n|\n|\f)", " ");
  }

  // ERROR //
  public static void writeStackTrace(android.content.Context paramContext, Throwable paramThrowable, String paramString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: new 32\011java/io/PrintWriter
    //   5: dup
    //   6: aload_0
    //   7: aload_2
    //   8: iconst_0
    //   9: invokevirtual 38\011android/content/Context:openFileOutput\011(Ljava/lang/String;I)Ljava/io/FileOutputStream;
    //   12: invokespecial 41\011java/io/PrintWriter:<init>\011(Ljava/io/OutputStream;)V
    //   15: astore 4
    //   17: aload_1
    //   18: aload 4
    //   20: invokestatic 44\011com/crashlytics/android/ExceptionUtils:writeStackTrace\011(Ljava/lang/Throwable;Ljava/io/Writer;)V
    //   23: aload 4
    //   25: ldc 46
    //   27: invokestatic 52\011io/fabric/sdk/android/services/common/CommonUtils:closeOrLog\011(Ljava/io/Closeable;Ljava/lang/String;)V
    //   30: return
    //   31: astore 5
    //   33: invokestatic 58\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   36: ldc 60
    //   38: ldc 62
    //   40: aload 5
    //   42: invokeinterface 68 4 0
    //   47: aload_3
    //   48: ldc 46
    //   50: invokestatic 52\011io/fabric/sdk/android/services/common/CommonUtils:closeOrLog\011(Ljava/io/Closeable;Ljava/lang/String;)V
    //   53: return
    //   54: astore 6
    //   56: aload_3
    //   57: ldc 46
    //   59: invokestatic 52\011io/fabric/sdk/android/services/common/CommonUtils:closeOrLog\011(Ljava/io/Closeable;Ljava/lang/String;)V
    //   62: aload 6
    //   64: athrow
    //   65: astore 6
    //   67: aload 4
    //   69: astore_3
    //   70: goto -14 -> 56
    //   73: astore 5
    //   75: aload 4
    //   77: astore_3
    //   78: goto -45 -> 33
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01117\01131\011java/lang/Exception
    //   2\01117\01154\011finally
    //   33\01147\01154\011finally
    //   17\01123\01165\011finally
    //   17\01123\01173\011java/lang/Exception
  }

  // ERROR //
  private static void writeStackTrace(Throwable paramThrowable, OutputStream paramOutputStream)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: new 32\011java/io/PrintWriter
    //   5: dup
    //   6: aload_1
    //   7: invokespecial 41\011java/io/PrintWriter:<init>\011(Ljava/io/OutputStream;)V
    //   10: astore_3
    //   11: aload_0
    //   12: aload_3
    //   13: invokestatic 44\011com/crashlytics/android/ExceptionUtils:writeStackTrace\011(Ljava/lang/Throwable;Ljava/io/Writer;)V
    //   16: aload_3
    //   17: ldc 46
    //   19: invokestatic 52\011io/fabric/sdk/android/services/common/CommonUtils:closeOrLog\011(Ljava/io/Closeable;Ljava/lang/String;)V
    //   22: return
    //   23: astore 4
    //   25: invokestatic 58\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   28: ldc 60
    //   30: ldc 62
    //   32: aload 4
    //   34: invokeinterface 68 4 0
    //   39: aload_2
    //   40: ldc 46
    //   42: invokestatic 52\011io/fabric/sdk/android/services/common/CommonUtils:closeOrLog\011(Ljava/io/Closeable;Ljava/lang/String;)V
    //   45: return
    //   46: astore 5
    //   48: aload_2
    //   49: ldc 46
    //   51: invokestatic 52\011io/fabric/sdk/android/services/common/CommonUtils:closeOrLog\011(Ljava/io/Closeable;Ljava/lang/String;)V
    //   54: aload 5
    //   56: athrow
    //   57: astore 5
    //   59: aload_3
    //   60: astore_2
    //   61: goto -13 -> 48
    //   64: astore 4
    //   66: aload_3
    //   67: astore_2
    //   68: goto -43 -> 25
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01111\01123\011java/lang/Exception
    //   2\01111\01146\011finally
    //   25\01139\01146\011finally
    //   11\01116\01157\011finally
    //   11\01116\01164\011java/lang/Exception
  }

  private static void writeStackTrace(Throwable paramThrowable, Writer paramWriter)
  {
    int i = 1;
    if (paramThrowable != null);
    while (true)
    {
      String str1;
      try
      {
        str1 = getMessage(paramThrowable);
        if (str1 == null)
          break label170;
        break label159;
        paramWriter.write(str2 + paramThrowable.getClass().getName() + ": " + str1 + "\n");
        StackTraceElement[] arrayOfStackTraceElement = paramThrowable.getStackTrace();
        int j = arrayOfStackTraceElement.length;
        int k = 0;
        if (k < j)
        {
          StackTraceElement localStackTraceElement = arrayOfStackTraceElement[k];
          paramWriter.write("\tat " + localStackTraceElement.toString() + "\n");
          k++;
          continue;
        }
        Throwable localThrowable = paramThrowable.getCause();
        paramThrowable = localThrowable;
        i = 0;
      }
      catch (Exception localException)
      {
        Fabric.getLogger().e("Fabric", "Could not write stack trace", localException);
      }
      return;
      while (true)
      {
        label159: if (i == 0)
          break label177;
        str2 = "";
        break;
        label170: str1 = "";
      }
      label177: String str2 = "Caused by: ";
    }
  }

  public static void writeStackTraceIfNotNull(Throwable paramThrowable, OutputStream paramOutputStream)
  {
    if (paramOutputStream != null)
      writeStackTrace(paramThrowable, paramOutputStream);
  }
}