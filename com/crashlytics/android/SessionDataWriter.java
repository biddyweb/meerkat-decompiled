package com.crashlytics.android;

import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.os.Build.VERSION;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import io.fabric.sdk.android.services.common.ApiKey;
import io.fabric.sdk.android.services.common.CommonUtils;
import io.fabric.sdk.android.services.common.IdManager.DeviceIdentifierType;
import io.fabric.sdk.android.services.common.QueueFile;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class SessionDataWriter
{
  private static final String SIGNAL_DEFAULT = "0";
  private static final ByteString SIGNAL_DEFAULT_BYTE_STRING = ByteString.copyFromUtf8("0");
  private final Context context;
  private StackTraceElement[] exceptionStack;
  private final int maxChainedExceptionsDepth = 8;
  private final ByteString optionalBuildIdBytes;
  private final ByteString packageNameBytes;
  private ActivityManager.RunningAppProcessInfo runningAppProcessInfo;
  private List<StackTraceElement[]> stacks;
  private Thread[] threads;

  public SessionDataWriter(Context paramContext, String paramString1, String paramString2)
  {
    this.context = paramContext;
    this.packageNameBytes = ByteString.copyFromUtf8(paramString2);
    if (paramString1 == null);
    for (ByteString localByteString = null; ; localByteString = ByteString.copyFromUtf8(paramString1.replace("-", "")))
    {
      this.optionalBuildIdBytes = localByteString;
      return;
    }
  }

  private int getBinaryImageSize()
  {
    int i = 0 + CodedOutputStream.computeUInt64Size(1, 0L) + CodedOutputStream.computeUInt64Size(2, 0L) + CodedOutputStream.computeBytesSize(3, this.packageNameBytes);
    if (this.optionalBuildIdBytes != null)
      i += CodedOutputStream.computeBytesSize(4, this.optionalBuildIdBytes);
    return i;
  }

  private int getDeviceIdentifierSize(IdManager.DeviceIdentifierType paramDeviceIdentifierType, String paramString)
  {
    return CodedOutputStream.computeEnumSize(1, paramDeviceIdentifierType.protobufIndex) + CodedOutputStream.computeBytesSize(2, ByteString.copyFromUtf8(paramString));
  }

  private int getEventAppCustomAttributeSize(String paramString1, String paramString2)
  {
    int i = CodedOutputStream.computeBytesSize(1, ByteString.copyFromUtf8(paramString1));
    if (paramString2 == null)
      paramString2 = "";
    return i + CodedOutputStream.computeBytesSize(2, ByteString.copyFromUtf8(paramString2));
  }

  private int getEventAppExecutionExceptionSize(Throwable paramThrowable, int paramInt)
  {
    int i = 0 + CodedOutputStream.computeBytesSize(1, ByteString.copyFromUtf8(paramThrowable.getClass().getName()));
    String str = paramThrowable.getLocalizedMessage();
    if (str != null)
      i += CodedOutputStream.computeBytesSize(3, ByteString.copyFromUtf8(str));
    StackTraceElement[] arrayOfStackTraceElement = paramThrowable.getStackTrace();
    int j = arrayOfStackTraceElement.length;
    for (int k = 0; k < j; k++)
    {
      int i1 = getFrameSize(arrayOfStackTraceElement[k], true);
      i += i1 + (CodedOutputStream.computeTagSize(4) + CodedOutputStream.computeRawVarint32Size(i1));
    }
    Throwable localThrowable = paramThrowable.getCause();
    if (localThrowable != null)
    {
      if (paramInt < this.maxChainedExceptionsDepth)
      {
        int n = getEventAppExecutionExceptionSize(localThrowable, paramInt + 1);
        i += n + (CodedOutputStream.computeTagSize(6) + CodedOutputStream.computeRawVarint32Size(n));
      }
    }
    else
      return i;
    for (int m = 0; localThrowable != null; m++)
      localThrowable = localThrowable.getCause();
    return i + CodedOutputStream.computeUInt32Size(7, m);
  }

  private int getEventAppExecutionSignalSize()
  {
    return 0 + CodedOutputStream.computeBytesSize(1, SIGNAL_DEFAULT_BYTE_STRING) + CodedOutputStream.computeBytesSize(2, SIGNAL_DEFAULT_BYTE_STRING) + CodedOutputStream.computeUInt64Size(3, 0L);
  }

  private int getEventAppExecutionSize(Thread paramThread, Throwable paramThrowable)
  {
    int i = getThreadSize(paramThread, this.exceptionStack, 4, true);
    int j = 0 + (i + (CodedOutputStream.computeTagSize(1) + CodedOutputStream.computeRawVarint32Size(i)));
    int k = this.threads.length;
    for (int m = 0; m < k; m++)
    {
      int i5 = getThreadSize(this.threads[m], (StackTraceElement[])this.stacks.get(m), 0, false);
      j += i5 + (CodedOutputStream.computeTagSize(1) + CodedOutputStream.computeRawVarint32Size(i5));
    }
    int n = getEventAppExecutionExceptionSize(paramThrowable, 1);
    int i1 = j + (n + (CodedOutputStream.computeTagSize(2) + CodedOutputStream.computeRawVarint32Size(n)));
    int i2 = getEventAppExecutionSignalSize();
    int i3 = i1 + (i2 + (CodedOutputStream.computeTagSize(3) + CodedOutputStream.computeRawVarint32Size(i2)));
    int i4 = getBinaryImageSize();
    return i3 + (i4 + (CodedOutputStream.computeTagSize(3) + CodedOutputStream.computeRawVarint32Size(i4)));
  }

  private int getEventAppSize(Thread paramThread, Throwable paramThrowable, int paramInt, Map<String, String> paramMap)
  {
    int i = getEventAppExecutionSize(paramThread, paramThrowable);
    int j = 0 + (i + (CodedOutputStream.computeTagSize(1) + CodedOutputStream.computeRawVarint32Size(i)));
    if (paramMap != null)
    {
      Iterator localIterator = paramMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        int k = getEventAppCustomAttributeSize((String)localEntry.getKey(), (String)localEntry.getValue());
        j += k + (CodedOutputStream.computeTagSize(2) + CodedOutputStream.computeRawVarint32Size(k));
      }
    }
    if (this.runningAppProcessInfo != null)
      if (this.runningAppProcessInfo.importance == 100)
        break label155;
    label155: for (boolean bool = true; ; bool = false)
    {
      j += CodedOutputStream.computeBoolSize(3, bool);
      return j + CodedOutputStream.computeUInt32Size(4, paramInt);
    }
  }

  private int getEventDeviceSize(float paramFloat, int paramInt1, boolean paramBoolean, int paramInt2, long paramLong1, long paramLong2)
  {
    return 0 + CodedOutputStream.computeFloatSize(1, paramFloat) + CodedOutputStream.computeSInt32Size(2, paramInt1) + CodedOutputStream.computeBoolSize(3, paramBoolean) + CodedOutputStream.computeUInt32Size(4, paramInt2) + CodedOutputStream.computeUInt64Size(5, paramLong1) + CodedOutputStream.computeUInt64Size(6, paramLong2);
  }

  private int getEventLogSize(ByteString paramByteString)
  {
    return CodedOutputStream.computeBytesSize(1, paramByteString);
  }

  private int getFrameSize(StackTraceElement paramStackTraceElement, boolean paramBoolean)
  {
    int i = 2;
    int j;
    int k;
    if (paramStackTraceElement.isNativeMethod())
    {
      j = 0 + CodedOutputStream.computeUInt64Size(1, Math.max(paramStackTraceElement.getLineNumber(), 0));
      k = j + CodedOutputStream.computeBytesSize(i, ByteString.copyFromUtf8(paramStackTraceElement.getClassName() + "." + paramStackTraceElement.getMethodName()));
      if (paramStackTraceElement.getFileName() != null)
        k += CodedOutputStream.computeBytesSize(3, ByteString.copyFromUtf8(paramStackTraceElement.getFileName()));
      if ((!paramStackTraceElement.isNativeMethod()) && (paramStackTraceElement.getLineNumber() > 0))
        k += CodedOutputStream.computeUInt64Size(4, paramStackTraceElement.getLineNumber());
      if (!paramBoolean)
        break label143;
    }
    while (true)
    {
      return k + CodedOutputStream.computeUInt32Size(5, i);
      j = 0 + CodedOutputStream.computeUInt64Size(1, 0L);
      break;
      label143: i = 0;
    }
  }

  private int getSessionAppOrgSize()
  {
    return 0 + CodedOutputStream.computeBytesSize(1, ByteString.copyFromUtf8(new ApiKey().getValue(this.context)));
  }

  private int getSessionAppSize(ByteString paramByteString1, ByteString paramByteString2, ByteString paramByteString3, ByteString paramByteString4, int paramInt)
  {
    int i = 0 + CodedOutputStream.computeBytesSize(1, paramByteString1) + CodedOutputStream.computeBytesSize(2, paramByteString2) + CodedOutputStream.computeBytesSize(3, paramByteString3);
    int j = getSessionAppOrgSize();
    return i + (j + (CodedOutputStream.computeTagSize(5) + CodedOutputStream.computeRawVarint32Size(j))) + CodedOutputStream.computeBytesSize(6, paramByteString4) + CodedOutputStream.computeEnumSize(10, paramInt);
  }

  private int getSessionDeviceSize(int paramInt1, ByteString paramByteString1, ByteString paramByteString2, int paramInt2, long paramLong1, long paramLong2, boolean paramBoolean, Map<IdManager.DeviceIdentifierType, String> paramMap, int paramInt3, ByteString paramByteString3, ByteString paramByteString4)
  {
    int i = 0 + CodedOutputStream.computeBytesSize(1, paramByteString1) + CodedOutputStream.computeEnumSize(3, paramInt1);
    if (paramByteString2 == null);
    int k;
    for (int j = 0; ; j = CodedOutputStream.computeBytesSize(4, paramByteString2))
    {
      k = i + j + CodedOutputStream.computeUInt32Size(5, paramInt2) + CodedOutputStream.computeUInt64Size(6, paramLong1) + CodedOutputStream.computeUInt64Size(7, paramLong2) + CodedOutputStream.computeBoolSize(10, paramBoolean);
      if (paramMap == null)
        break;
      Iterator localIterator = paramMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        int i3 = getDeviceIdentifierSize((IdManager.DeviceIdentifierType)localEntry.getKey(), (String)localEntry.getValue());
        k += i3 + (CodedOutputStream.computeTagSize(11) + CodedOutputStream.computeRawVarint32Size(i3));
      }
    }
    int m = k + CodedOutputStream.computeUInt32Size(12, paramInt3);
    int n;
    int i1;
    if (paramByteString3 == null)
    {
      n = 0;
      i1 = m + n;
      if (paramByteString4 != null)
        break label212;
    }
    label212: for (int i2 = 0; ; i2 = CodedOutputStream.computeBytesSize(14, paramByteString4))
    {
      return i1 + i2;
      n = CodedOutputStream.computeBytesSize(13, paramByteString3);
      break;
    }
  }

  private int getSessionEventSize(Thread paramThread, Throwable paramThrowable, String paramString, long paramLong1, Map<String, String> paramMap, float paramFloat, int paramInt1, boolean paramBoolean, int paramInt2, long paramLong2, long paramLong3, ByteString paramByteString)
  {
    int i = 0 + CodedOutputStream.computeUInt64Size(1, paramLong1) + CodedOutputStream.computeBytesSize(2, ByteString.copyFromUtf8(paramString));
    int j = getEventAppSize(paramThread, paramThrowable, paramInt2, paramMap);
    int k = i + (j + (CodedOutputStream.computeTagSize(3) + CodedOutputStream.computeRawVarint32Size(j)));
    int m = getEventDeviceSize(paramFloat, paramInt1, paramBoolean, paramInt2, paramLong2, paramLong3);
    int n = k + (m + (CodedOutputStream.computeTagSize(5) + CodedOutputStream.computeRawVarint32Size(m)));
    if (paramByteString != null)
    {
      int i1 = getEventLogSize(paramByteString);
      n += i1 + (CodedOutputStream.computeTagSize(6) + CodedOutputStream.computeRawVarint32Size(i1));
    }
    return n;
  }

  private int getSessionOSSize(ByteString paramByteString1, ByteString paramByteString2, boolean paramBoolean)
  {
    return 0 + CodedOutputStream.computeEnumSize(1, 3) + CodedOutputStream.computeBytesSize(2, paramByteString1) + CodedOutputStream.computeBytesSize(3, paramByteString2) + CodedOutputStream.computeBoolSize(4, paramBoolean);
  }

  private int getThreadSize(Thread paramThread, StackTraceElement[] paramArrayOfStackTraceElement, int paramInt, boolean paramBoolean)
  {
    int i = CodedOutputStream.computeBytesSize(1, ByteString.copyFromUtf8(paramThread.getName())) + CodedOutputStream.computeUInt32Size(2, paramInt);
    int j = paramArrayOfStackTraceElement.length;
    for (int k = 0; k < j; k++)
    {
      int m = getFrameSize(paramArrayOfStackTraceElement[k], paramBoolean);
      i += m + (CodedOutputStream.computeTagSize(3) + CodedOutputStream.computeRawVarint32Size(m));
    }
    return i;
  }

  private ByteString stringToByteString(String paramString)
  {
    if (paramString == null)
      return null;
    return ByteString.copyFromUtf8(paramString);
  }

  private void writeFrame(CodedOutputStream paramCodedOutputStream, int paramInt, StackTraceElement paramStackTraceElement, boolean paramBoolean)
    throws Exception
  {
    int i = 4;
    paramCodedOutputStream.writeTag(paramInt, 2);
    paramCodedOutputStream.writeRawVarint32(getFrameSize(paramStackTraceElement, paramBoolean));
    if (paramStackTraceElement.isNativeMethod())
    {
      paramCodedOutputStream.writeUInt64(1, Math.max(paramStackTraceElement.getLineNumber(), 0));
      paramCodedOutputStream.writeBytes(2, ByteString.copyFromUtf8(paramStackTraceElement.getClassName() + "." + paramStackTraceElement.getMethodName()));
      if (paramStackTraceElement.getFileName() != null)
        paramCodedOutputStream.writeBytes(3, ByteString.copyFromUtf8(paramStackTraceElement.getFileName()));
      if ((!paramStackTraceElement.isNativeMethod()) && (paramStackTraceElement.getLineNumber() > 0))
        paramCodedOutputStream.writeUInt64(i, paramStackTraceElement.getLineNumber());
      if (!paramBoolean)
        break label144;
    }
    while (true)
    {
      paramCodedOutputStream.writeUInt32(5, i);
      return;
      paramCodedOutputStream.writeUInt64(1, 0L);
      break;
      label144: i = 0;
    }
  }

  private void writeSessionEventApp(CodedOutputStream paramCodedOutputStream, Thread paramThread, Throwable paramThrowable, int paramInt, Map<String, String> paramMap)
    throws Exception
  {
    paramCodedOutputStream.writeTag(3, 2);
    paramCodedOutputStream.writeRawVarint32(getEventAppSize(paramThread, paramThrowable, paramInt, paramMap));
    writeSessionEventAppExecution(paramCodedOutputStream, paramThread, paramThrowable);
    if ((paramMap != null) && (!paramMap.isEmpty()))
      writeSessionEventAppCustomAttributes(paramCodedOutputStream, paramMap);
    if (this.runningAppProcessInfo != null)
      if (this.runningAppProcessInfo.importance == 100)
        break label86;
    label86: for (boolean bool = true; ; bool = false)
    {
      paramCodedOutputStream.writeBool(3, bool);
      paramCodedOutputStream.writeUInt32(4, paramInt);
      return;
    }
  }

  private void writeSessionEventAppCustomAttributes(CodedOutputStream paramCodedOutputStream, Map<String, String> paramMap)
    throws Exception
  {
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      paramCodedOutputStream.writeTag(2, 2);
      paramCodedOutputStream.writeRawVarint32(getEventAppCustomAttributeSize((String)localEntry.getKey(), (String)localEntry.getValue()));
      paramCodedOutputStream.writeBytes(1, ByteString.copyFromUtf8((String)localEntry.getKey()));
      String str = (String)localEntry.getValue();
      if (str == null)
        str = "";
      paramCodedOutputStream.writeBytes(2, ByteString.copyFromUtf8(str));
    }
  }

  private void writeSessionEventAppExecution(CodedOutputStream paramCodedOutputStream, Thread paramThread, Throwable paramThrowable)
    throws Exception
  {
    paramCodedOutputStream.writeTag(1, 2);
    paramCodedOutputStream.writeRawVarint32(getEventAppExecutionSize(paramThread, paramThrowable));
    writeThread(paramCodedOutputStream, paramThread, this.exceptionStack, 4, true);
    int i = this.threads.length;
    for (int j = 0; j < i; j++)
      writeThread(paramCodedOutputStream, this.threads[j], (StackTraceElement[])this.stacks.get(j), 0, false);
    writeSessionEventAppExecutionException(paramCodedOutputStream, paramThrowable, 1, 2);
    paramCodedOutputStream.writeTag(3, 2);
    paramCodedOutputStream.writeRawVarint32(getEventAppExecutionSignalSize());
    paramCodedOutputStream.writeBytes(1, SIGNAL_DEFAULT_BYTE_STRING);
    paramCodedOutputStream.writeBytes(2, SIGNAL_DEFAULT_BYTE_STRING);
    paramCodedOutputStream.writeUInt64(3, 0L);
    paramCodedOutputStream.writeTag(4, 2);
    paramCodedOutputStream.writeRawVarint32(getBinaryImageSize());
    paramCodedOutputStream.writeUInt64(1, 0L);
    paramCodedOutputStream.writeUInt64(2, 0L);
    paramCodedOutputStream.writeBytes(3, this.packageNameBytes);
    if (this.optionalBuildIdBytes != null)
      paramCodedOutputStream.writeBytes(4, this.optionalBuildIdBytes);
  }

  private void writeSessionEventAppExecutionException(CodedOutputStream paramCodedOutputStream, Throwable paramThrowable, int paramInt1, int paramInt2)
    throws Exception
  {
    paramCodedOutputStream.writeTag(paramInt2, 2);
    paramCodedOutputStream.writeRawVarint32(getEventAppExecutionExceptionSize(paramThrowable, 1));
    paramCodedOutputStream.writeBytes(1, ByteString.copyFromUtf8(paramThrowable.getClass().getName()));
    String str = paramThrowable.getLocalizedMessage();
    if (str != null)
      paramCodedOutputStream.writeBytes(3, ByteString.copyFromUtf8(str));
    StackTraceElement[] arrayOfStackTraceElement = paramThrowable.getStackTrace();
    int i = arrayOfStackTraceElement.length;
    for (int j = 0; j < i; j++)
      writeFrame(paramCodedOutputStream, 4, arrayOfStackTraceElement[j], true);
    Throwable localThrowable = paramThrowable.getCause();
    if (localThrowable != null)
    {
      if (paramInt1 < this.maxChainedExceptionsDepth)
        writeSessionEventAppExecutionException(paramCodedOutputStream, localThrowable, paramInt1 + 1, 6);
    }
    else
      return;
    for (int k = 0; localThrowable != null; k++)
      localThrowable = localThrowable.getCause();
    paramCodedOutputStream.writeUInt32(7, k);
  }

  private void writeSessionEventDevice(CodedOutputStream paramCodedOutputStream, float paramFloat, int paramInt1, boolean paramBoolean, int paramInt2, long paramLong1, long paramLong2)
    throws Exception
  {
    paramCodedOutputStream.writeTag(5, 2);
    paramCodedOutputStream.writeRawVarint32(getEventDeviceSize(paramFloat, paramInt1, paramBoolean, paramInt2, paramLong1, paramLong2));
    paramCodedOutputStream.writeFloat(1, paramFloat);
    paramCodedOutputStream.writeSInt32(2, paramInt1);
    paramCodedOutputStream.writeBool(3, paramBoolean);
    paramCodedOutputStream.writeUInt32(4, paramInt2);
    paramCodedOutputStream.writeUInt64(5, paramLong1);
    paramCodedOutputStream.writeUInt64(6, paramLong2);
  }

  private void writeSessionEventLog(CodedOutputStream paramCodedOutputStream, ByteString paramByteString)
    throws Exception
  {
    if (paramByteString != null)
    {
      paramCodedOutputStream.writeTag(6, 2);
      paramCodedOutputStream.writeRawVarint32(getEventLogSize(paramByteString));
      paramCodedOutputStream.writeBytes(1, paramByteString);
    }
  }

  private void writeThread(CodedOutputStream paramCodedOutputStream, Thread paramThread, StackTraceElement[] paramArrayOfStackTraceElement, int paramInt, boolean paramBoolean)
    throws Exception
  {
    paramCodedOutputStream.writeTag(1, 2);
    paramCodedOutputStream.writeRawVarint32(getThreadSize(paramThread, paramArrayOfStackTraceElement, paramInt, paramBoolean));
    paramCodedOutputStream.writeBytes(1, ByteString.copyFromUtf8(paramThread.getName()));
    paramCodedOutputStream.writeUInt32(2, paramInt);
    int i = paramArrayOfStackTraceElement.length;
    for (int j = 0; j < i; j++)
      writeFrame(paramCodedOutputStream, 3, paramArrayOfStackTraceElement[j], paramBoolean);
  }

  public void writeBeginSession(CodedOutputStream paramCodedOutputStream, String paramString1, String paramString2, long paramLong)
    throws Exception
  {
    paramCodedOutputStream.writeBytes(1, ByteString.copyFromUtf8(paramString2));
    paramCodedOutputStream.writeBytes(2, ByteString.copyFromUtf8(paramString1));
    paramCodedOutputStream.writeUInt64(3, paramLong);
  }

  public void writeSessionApp(CodedOutputStream paramCodedOutputStream, String paramString1, String paramString2, String paramString3, String paramString4, int paramInt)
    throws Exception
  {
    ByteString localByteString1 = ByteString.copyFromUtf8(paramString1);
    ByteString localByteString2 = ByteString.copyFromUtf8(paramString2);
    ByteString localByteString3 = ByteString.copyFromUtf8(paramString3);
    ByteString localByteString4 = ByteString.copyFromUtf8(paramString4);
    paramCodedOutputStream.writeTag(7, 2);
    paramCodedOutputStream.writeRawVarint32(getSessionAppSize(localByteString1, localByteString2, localByteString3, localByteString4, paramInt));
    paramCodedOutputStream.writeBytes(1, localByteString1);
    paramCodedOutputStream.writeBytes(2, localByteString2);
    paramCodedOutputStream.writeBytes(3, localByteString3);
    paramCodedOutputStream.writeTag(5, 2);
    paramCodedOutputStream.writeRawVarint32(getSessionAppOrgSize());
    paramCodedOutputStream.writeString(1, new ApiKey().getValue(this.context));
    paramCodedOutputStream.writeBytes(6, localByteString4);
    paramCodedOutputStream.writeEnum(10, paramInt);
  }

  public void writeSessionDevice(CodedOutputStream paramCodedOutputStream, String paramString1, int paramInt1, String paramString2, int paramInt2, long paramLong1, long paramLong2, boolean paramBoolean, Map<IdManager.DeviceIdentifierType, String> paramMap, int paramInt3, String paramString3, String paramString4)
    throws Exception
  {
    ByteString localByteString1 = ByteString.copyFromUtf8(paramString1);
    ByteString localByteString2 = stringToByteString(paramString2);
    ByteString localByteString3 = stringToByteString(paramString4);
    ByteString localByteString4 = stringToByteString(paramString3);
    paramCodedOutputStream.writeTag(9, 2);
    paramCodedOutputStream.writeRawVarint32(getSessionDeviceSize(paramInt1, localByteString1, localByteString2, paramInt2, paramLong1, paramLong2, paramBoolean, paramMap, paramInt3, localByteString4, localByteString3));
    paramCodedOutputStream.writeBytes(1, localByteString1);
    paramCodedOutputStream.writeEnum(3, paramInt1);
    paramCodedOutputStream.writeBytes(4, localByteString2);
    paramCodedOutputStream.writeUInt32(5, paramInt2);
    paramCodedOutputStream.writeUInt64(6, paramLong1);
    paramCodedOutputStream.writeUInt64(7, paramLong2);
    paramCodedOutputStream.writeBool(10, paramBoolean);
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      paramCodedOutputStream.writeTag(11, 2);
      paramCodedOutputStream.writeRawVarint32(getDeviceIdentifierSize((IdManager.DeviceIdentifierType)localEntry.getKey(), (String)localEntry.getValue()));
      paramCodedOutputStream.writeEnum(1, ((IdManager.DeviceIdentifierType)localEntry.getKey()).protobufIndex);
      paramCodedOutputStream.writeBytes(2, ByteString.copyFromUtf8((String)localEntry.getValue()));
    }
    paramCodedOutputStream.writeUInt32(12, paramInt3);
    if (localByteString4 != null)
      paramCodedOutputStream.writeBytes(13, localByteString4);
    if (localByteString3 != null)
      paramCodedOutputStream.writeBytes(14, localByteString3);
  }

  public void writeSessionEvent(CodedOutputStream paramCodedOutputStream, long paramLong1, Thread paramThread, Throwable paramThrowable, String paramString, Thread[] paramArrayOfThread, float paramFloat, int paramInt1, boolean paramBoolean, int paramInt2, long paramLong2, long paramLong3, ActivityManager.RunningAppProcessInfo paramRunningAppProcessInfo, List<StackTraceElement[]> paramList, StackTraceElement[] paramArrayOfStackTraceElement, QueueFile paramQueueFile, Map<String, String> paramMap)
    throws Exception
  {
    this.runningAppProcessInfo = paramRunningAppProcessInfo;
    this.stacks = paramList;
    this.exceptionStack = paramArrayOfStackTraceElement;
    this.threads = paramArrayOfThread;
    ByteString localByteString = LogFileManager.getByteStringForLog(paramQueueFile);
    if (localByteString == null)
      Fabric.getLogger().d("Fabric", "No log data to include with this event.");
    CommonUtils.closeOrLog(paramQueueFile, "There was a problem closing the Crashlytics log file.");
    paramCodedOutputStream.writeTag(10, 2);
    paramCodedOutputStream.writeRawVarint32(getSessionEventSize(paramThread, paramThrowable, paramString, paramLong1, paramMap, paramFloat, paramInt1, paramBoolean, paramInt2, paramLong2, paramLong3, localByteString));
    paramCodedOutputStream.writeUInt64(1, paramLong1);
    paramCodedOutputStream.writeBytes(2, ByteString.copyFromUtf8(paramString));
    writeSessionEventApp(paramCodedOutputStream, paramThread, paramThrowable, paramInt2, paramMap);
    writeSessionEventDevice(paramCodedOutputStream, paramFloat, paramInt1, paramBoolean, paramInt2, paramLong2, paramLong3);
    writeSessionEventLog(paramCodedOutputStream, localByteString);
  }

  public void writeSessionOS(CodedOutputStream paramCodedOutputStream, boolean paramBoolean)
    throws Exception
  {
    ByteString localByteString1 = ByteString.copyFromUtf8(Build.VERSION.RELEASE);
    ByteString localByteString2 = ByteString.copyFromUtf8(Build.VERSION.CODENAME);
    paramCodedOutputStream.writeTag(8, 2);
    paramCodedOutputStream.writeRawVarint32(getSessionOSSize(localByteString1, localByteString2, paramBoolean));
    paramCodedOutputStream.writeEnum(1, 3);
    paramCodedOutputStream.writeBytes(2, localByteString1);
    paramCodedOutputStream.writeBytes(3, localByteString2);
    paramCodedOutputStream.writeBool(4, paramBoolean);
  }

  public void writeSessionUser(CodedOutputStream paramCodedOutputStream, String paramString1, String paramString2, String paramString3)
    throws Exception
  {
    if (paramString1 == null)
      paramString1 = "";
    ByteString localByteString1 = ByteString.copyFromUtf8(paramString1);
    ByteString localByteString2 = stringToByteString(paramString2);
    ByteString localByteString3 = stringToByteString(paramString3);
    int i = 0 + CodedOutputStream.computeBytesSize(1, localByteString1);
    if (paramString2 != null)
      i += CodedOutputStream.computeBytesSize(2, localByteString2);
    if (paramString3 != null)
      i += CodedOutputStream.computeBytesSize(3, localByteString3);
    paramCodedOutputStream.writeTag(6, 2);
    paramCodedOutputStream.writeRawVarint32(i);
    paramCodedOutputStream.writeBytes(1, localByteString1);
    if (paramString2 != null)
      paramCodedOutputStream.writeBytes(2, localByteString2);
    if (paramString3 != null)
      paramCodedOutputStream.writeBytes(3, localByteString3);
  }
}