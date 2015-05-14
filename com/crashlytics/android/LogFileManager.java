package com.crashlytics.android;

import android.content.Context;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import io.fabric.sdk.android.services.common.QueueFile;
import io.fabric.sdk.android.services.common.QueueFile.ElementReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;

class LogFileManager
{
  static final int MAX_LOG_SIZE = 65536;
  private final Context context;
  private final File filesDir;
  private QueueFile logFile;

  public LogFileManager(Context paramContext, File paramFile)
  {
    this.context = paramContext;
    this.filesDir = paramFile;
  }

  static ByteString getByteStringForLog(QueueFile paramQueueFile)
  {
    if (paramQueueFile == null)
      return null;
    final int[] arrayOfInt = { 0 };
    byte[] arrayOfByte = new byte[paramQueueFile.usedBytes()];
    try
    {
      paramQueueFile.forEach(new QueueFile.ElementReader()
      {
        public void read(InputStream paramAnonymousInputStream, int paramAnonymousInt)
          throws IOException
        {
          try
          {
            paramAnonymousInputStream.read(this.val$logBytes, arrayOfInt[0], paramAnonymousInt);
            int[] arrayOfInt = arrayOfInt;
            arrayOfInt[0] = (paramAnonymousInt + arrayOfInt[0]);
            return;
          }
          finally
          {
            paramAnonymousInputStream.close();
          }
        }
      });
      return ByteString.copyFrom(arrayOfByte, 0, arrayOfInt[0]);
    }
    catch (IOException localIOException)
    {
      while (true)
        Fabric.getLogger().e("Fabric", "A problem occurred while reading the Crashlytics log file.", localIOException);
    }
  }

  // ERROR //
  private boolean initLogFile()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 20\011com/crashlytics/android/LogFileManager:context\011Landroid/content/Context;
    //   4: ldc 69
    //   6: iconst_1
    //   7: invokestatic 75\011io/fabric/sdk/android/services/common/CommonUtils:getBooleanResourceValue\011(Landroid/content/Context;Ljava/lang/String;Z)Z
    //   10: ifne +17 -> 27
    //   13: invokestatic 53\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   16: ldc 55
    //   18: ldc 77
    //   20: invokeinterface 81 3 0
    //   25: iconst_0
    //   26: ireturn
    //   27: aload_0
    //   28: getfield 83\011com/crashlytics/android/LogFileManager:logFile\011Lio/fabric/sdk/android/services/common/QueueFile;
    //   31: new 85\011java/lang/StringBuilder
    //   34: dup
    //   35: invokespecial 86\011java/lang/StringBuilder:<init>\011()V
    //   38: ldc 88
    //   40: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   43: aload_0
    //   44: getfield 83\011com/crashlytics/android/LogFileManager:logFile\011Lio/fabric/sdk/android/services/common/QueueFile;
    //   47: invokevirtual 95\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   50: invokevirtual 99\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   53: invokestatic 103\011io/fabric/sdk/android/services/common/CommonUtils:closeOrLog\011(Ljava/io/Closeable;Ljava/lang/String;)V
    //   56: aconst_null
    //   57: astore_1
    //   58: new 85\011java/lang/StringBuilder
    //   61: dup
    //   62: invokespecial 86\011java/lang/StringBuilder:<init>\011()V
    //   65: ldc 105
    //   67: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   70: invokestatic 111\011java/util/UUID:randomUUID\011()Ljava/util/UUID;
    //   73: invokevirtual 112\011java/util/UUID:toString\011()Ljava/lang/String;
    //   76: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   79: ldc 114
    //   81: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   84: invokevirtual 99\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   87: astore_3
    //   88: new 116\011java/io/File
    //   91: dup
    //   92: aload_0
    //   93: getfield 22\011com/crashlytics/android/LogFileManager:filesDir\011Ljava/io/File;
    //   96: aload_3
    //   97: invokespecial 119\011java/io/File:<init>\011(Ljava/io/File;Ljava/lang/String;)V
    //   100: astore 4
    //   102: aload_0
    //   103: new 28\011io/fabric/sdk/android/services/common/QueueFile
    //   106: dup
    //   107: aload 4
    //   109: invokespecial 122\011io/fabric/sdk/android/services/common/QueueFile:<init>\011(Ljava/io/File;)V
    //   112: putfield 83\011com/crashlytics/android/LogFileManager:logFile\011Lio/fabric/sdk/android/services/common/QueueFile;
    //   115: aload 4
    //   117: invokevirtual 125\011java/io/File:delete\011()Z
    //   120: pop
    //   121: iconst_1
    //   122: ireturn
    //   123: astore_2
    //   124: invokestatic 53\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   127: ldc 55
    //   129: new 85\011java/lang/StringBuilder
    //   132: dup
    //   133: invokespecial 86\011java/lang/StringBuilder:<init>\011()V
    //   136: ldc 127
    //   138: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   141: aload_1
    //   142: invokevirtual 95\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   145: invokevirtual 99\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   148: aload_2
    //   149: invokeinterface 63 4 0
    //   154: iconst_0
    //   155: ireturn
    //   156: astore_2
    //   157: aload 4
    //   159: astore_1
    //   160: goto -36 -> 124
    //
    // Exception table:
    //   from\011to\011target\011type
    //   58\011102\011123\011java/lang/Exception
    //   102\011121\011156\011java/lang/Exception
  }

  void doWriteToLog(QueueFile paramQueueFile, int paramInt, long paramLong, String paramString)
  {
    if (paramQueueFile == null);
    while (true)
    {
      return;
      if (paramString == null)
        paramString = "null";
      try
      {
        int i = paramInt / 4;
        if (paramString.length() > i)
          paramString = "..." + paramString.substring(paramString.length() - i);
        String str = paramString.replaceAll("\r", " ").replaceAll("\n", " ");
        Locale localLocale = Locale.US;
        Object[] arrayOfObject = new Object[2];
        arrayOfObject[0] = Long.valueOf(paramLong);
        arrayOfObject[1] = str;
        paramQueueFile.add(String.format(localLocale, "%d %s%n", arrayOfObject).getBytes("UTF-8"));
        while ((!paramQueueFile.isEmpty()) && (paramQueueFile.usedBytes() > paramInt))
          paramQueueFile.remove();
      }
      catch (IOException localIOException)
      {
        Fabric.getLogger().e("Fabric", "There was a problem writing to the Crashlytics log.", localIOException);
      }
    }
  }

  QueueFile getLogFile()
  {
    return this.logFile;
  }

  public void writeToLog(long paramLong, String paramString)
  {
    if (this.logFile == null)
      initLogFile();
    doWriteToLog(this.logFile, 65536, paramLong, paramString);
  }
}