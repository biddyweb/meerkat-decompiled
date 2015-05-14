package com.twitter.cobalt.metrics;

import android.app.ActivityManager;
import android.app.ActivityManager.AppTask;
import android.app.ActivityManager.RecentTaskInfo;
import android.app.ActivityManager.RunningTaskInfo;
import android.content.Context;
import android.os.Debug;
import android.util.Log;
import java.util.Iterator;
import java.util.List;

public class MemoryMonitor
{
  public static final String TAG = "PerfSnapshot";
  private static MemoryMonitor sInstance;
  private Context mContext;

  public MemoryMonitor(Context paramContext)
  {
    this.mContext = paramContext;
  }

  private void gc()
  {
    Runtime.getRuntime().gc();
    Runtime.getRuntime().runFinalization();
    Runtime.getRuntime().gc();
  }

  public static MemoryMonitor getInstance(Context paramContext)
  {
    try
    {
      if (sInstance == null)
        sInstance = new MemoryMonitor(paramContext);
      MemoryMonitor localMemoryMonitor = sInstance;
      return localMemoryMonitor;
    }
    finally
    {
    }
  }

  public void printStats()
  {
    gc();
    ActivityManager localActivityManager = (ActivityManager)this.mContext.getSystemService("activity");
    Log.e("PerfSnapshot", "----------------------------------------");
    Log.e("PerfSnapshot", "memclass=" + localActivityManager.getMemoryClass());
    Log.e("PerfSnapshot", "nativeMax=" + Debug.getNativeHeapSize() / 1024L);
    Log.e("PerfSnapshot", "nativeAllocated=" + Debug.getNativeHeapAllocatedSize() / 1024L);
    Log.e("PerfSnapshot", "nativeFree=" + Debug.getNativeHeapFreeSize() / 1024L);
    Runtime localRuntime = Runtime.getRuntime();
    Log.e("PerfSnapshot", "dalvikMax=" + localRuntime.totalMemory() / 1024L);
    Log.e("PerfSnapshot", "dalvikFree=" + localRuntime.freeMemory() / 1024L);
    Log.e("PerfSnapshot", "dalvikAllocated=" + (localRuntime.totalMemory() - localRuntime.freeMemory()));
    Log.e("PerfSnapshot", "globalAllocCount=" + Debug.getGlobalAllocCount());
    Log.e("PerfSnapshot", "getGlobalAllocSize=" + Debug.getGlobalAllocSize());
    Log.e("PerfSnapshot", "getGlobalFreedCount=" + Debug.getGlobalFreedCount());
    Log.e("PerfSnapshot", "getGlobalFreedSize=" + Debug.getGlobalFreedSize());
    Log.e("PerfSnapshot", "getGlobalGcInvocationCount=" + Debug.getGlobalGcInvocationCount());
    Log.e("PerfSnapshot", "-----------> TASK INFO <--------------");
    Iterator localIterator1 = localActivityManager.getRunningTasks(100).iterator();
    while (localIterator1.hasNext())
    {
      ActivityManager.RunningTaskInfo localRunningTaskInfo = (ActivityManager.RunningTaskInfo)localIterator1.next();
      Log.e("PerfSnapshot", "    " + localRunningTaskInfo.baseActivity + " " + localRunningTaskInfo.baseActivity + " " + localRunningTaskInfo.numActivities);
    }
    Log.e("PerfSnapshot", "------------> App Tasks <--------------");
    Iterator localIterator2 = localActivityManager.getAppTasks().iterator();
    while (localIterator2.hasNext())
    {
      ActivityManager.RecentTaskInfo localRecentTaskInfo = ((ActivityManager.AppTask)localIterator2.next()).getTaskInfo();
      Log.e("PerfSnapshot", "    " + localRecentTaskInfo.taskDescription + " " + localRecentTaskInfo.origActivity);
    }
    Log.e("PerfSnapshot", "----------------------------------------");
  }

  public void startMeasuring()
  {
    gc();
    Debug.resetAllCounts();
    Debug.startAllocCounting();
  }

  public void stopMeasuring()
  {
    printStats();
  }
}