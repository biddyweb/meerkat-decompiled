package com.google.android.exoplayer.util;

import android.os.HandlerThread;
import android.os.Process;

public class PriorityHandlerThread extends HandlerThread
{
  private final int priority;

  public PriorityHandlerThread(String paramString, int paramInt)
  {
    super(paramString);
    this.priority = paramInt;
  }

  public void run()
  {
    Process.setThreadPriority(this.priority);
    super.run();
  }
}