package com.google.android.exoplayer.upstream;

import java.io.IOException;
import java.util.PriorityQueue;

public final class NetworkLock
{
  public static final int DOWNLOAD_PRIORITY = 10;
  public static final int STREAMING_PRIORITY;
  public static final NetworkLock instance = new NetworkLock();
  private int highestPriority = 2147483647;
  private final Object lock = new Object();
  private final PriorityQueue<Integer> queue = new PriorityQueue();

  public void add(int paramInt)
  {
    synchronized (this.lock)
    {
      this.queue.add(Integer.valueOf(paramInt));
      this.highestPriority = Math.min(this.highestPriority, paramInt);
      return;
    }
  }

  public void proceed(int paramInt)
    throws InterruptedException
  {
    synchronized (this.lock)
    {
      if (this.highestPriority < paramInt)
        this.lock.wait();
    }
  }

  public boolean proceedNonBlocking(int paramInt)
  {
    while (true)
    {
      synchronized (this.lock)
      {
        if (this.highestPriority >= paramInt)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }

  public void proceedOrThrow(int paramInt)
    throws NetworkLock.PriorityTooLowException
  {
    synchronized (this.lock)
    {
      if (this.highestPriority < paramInt)
        throw new PriorityTooLowException(paramInt, this.highestPriority);
    }
  }

  public void remove(int paramInt)
  {
    synchronized (this.lock)
    {
      this.queue.remove(Integer.valueOf(paramInt));
      if (this.queue.isEmpty())
      {
        i = 2147483647;
        this.highestPriority = i;
        this.lock.notifyAll();
        return;
      }
      int i = ((Integer)this.queue.peek()).intValue();
    }
  }

  public static class PriorityTooLowException extends IOException
  {
    public PriorityTooLowException(int paramInt1, int paramInt2)
    {
      super();
    }
  }
}