package com.google.android.gms.internal;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.os.Binder;
import java.util.Iterator;
import java.util.List;

public class zzmf
{
  public static String zzR(Context paramContext)
  {
    return zzj(paramContext, Binder.getCallingPid());
  }

  private static String zza(StackTraceElement[] paramArrayOfStackTraceElement, int paramInt)
  {
    if (paramInt + 4 >= paramArrayOfStackTraceElement.length)
      return "<bottom of call stack>";
    StackTraceElement localStackTraceElement = paramArrayOfStackTraceElement[(paramInt + 4)];
    return localStackTraceElement.getClassName() + "." + localStackTraceElement.getMethodName() + ":" + localStackTraceElement.getLineNumber();
  }

  public static String zzj(Context paramContext, int paramInt)
  {
    List localList = ((ActivityManager)paramContext.getSystemService("activity")).getRunningAppProcesses();
    if (localList != null)
    {
      Iterator localIterator = localList.iterator();
      while (localIterator.hasNext())
      {
        ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)localIterator.next();
        if (localRunningAppProcessInfo.pid == paramInt)
          return localRunningAppProcessInfo.processName;
      }
    }
    return null;
  }

  public static String zzl(int paramInt1, int paramInt2)
  {
    StackTraceElement[] arrayOfStackTraceElement = Thread.currentThread().getStackTrace();
    StringBuffer localStringBuffer = new StringBuffer();
    int i = paramInt2 + paramInt1;
    while (paramInt1 < i)
    {
      localStringBuffer.append(zza(arrayOfStackTraceElement, paramInt1)).append(" ");
      paramInt1++;
    }
    return localStringBuffer.toString();
  }
}