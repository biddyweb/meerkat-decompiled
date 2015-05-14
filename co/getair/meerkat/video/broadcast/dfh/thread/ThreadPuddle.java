package co.getair.meerkat.video.broadcast.dfh.thread;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

public class ThreadPuddle
{
  private final AtomicBoolean dead = new AtomicBoolean(false);
  private final AtomicBoolean flushing = new AtomicBoolean(false);
  private final AtomicInteger inProcess = new AtomicInteger(0);
  private final int limit;
  private final Deque<PuddleThread> puddle;
  private final Deque<Runnable> taskQueue = new ArrayDeque();

  public ThreadPuddle()
  {
    this(1 + Runtime.getRuntime().availableProcessors());
  }

  public ThreadPuddle(int paramInt)
  {
    this(paramInt, paramInt * 100);
  }

  public ThreadPuddle(int paramInt1, int paramInt2)
  {
    if (paramInt1 < 1)
      throw new ThreadPuddleException("thread count must be positive");
    if (paramInt2 < paramInt1)
      throw new ThreadPuddleException("maxTasks must be greater than or equal to thread count");
    this.puddle = new ArrayDeque(paramInt1);
    this.limit = paramInt2;
    for (int i = 0; i < paramInt1; i++)
      this.puddle.add(new PuddleThread(null));
  }

  public void die()
  {
    this.dead.set(true);
    Iterator localIterator = this.puddle.iterator();
    while (localIterator.hasNext())
      ((PuddleThread)localIterator.next()).interrupt();
  }

  public void flush()
  {
    this.flushing.set(true);
    synchronized (this.inProcess)
    {
      while (true)
      {
        int i = this.inProcess.get();
        if (i > 0)
          try
          {
            this.inProcess.wait(1000L);
          }
          catch (InterruptedException localInterruptedException)
          {
            if (this.dead.get())
              return;
            Thread.currentThread().interrupt();
          }
      }
    }
    synchronized (this.flushing)
    {
      this.flushing.set(false);
      this.flushing.notifyAll();
      return;
    }
  }

  public int getPriority()
  {
    if (this.dead.get())
      throw new ThreadPuddleException("puddle is dead!");
    return ((PuddleThread)this.puddle.getFirst()).getPriority();
  }

  public void run(Runnable paramRunnable)
  {
    if (this.dead.get())
      throw new ThreadPuddleException("puddle is dead!");
    synchronized (this.flushing)
    {
      while (true)
      {
        boolean bool = this.flushing.get();
        if (bool)
          try
          {
            this.flushing.wait();
          }
          catch (InterruptedException localInterruptedException2)
          {
            if (this.dead.get())
              return;
            Thread.currentThread().interrupt();
          }
      }
    }
    while (true)
    {
      synchronized (this.inProcess)
      {
        int i = this.inProcess.get();
        int j = this.limit;
        if (i != j)
          break;
        try
        {
          this.inProcess.wait();
        }
        catch (InterruptedException localInterruptedException1)
        {
          if (!this.dead.get())
            break label147;
        }
        return;
      }
      label147: Thread.currentThread().interrupt();
    }
    this.inProcess.incrementAndGet();
    synchronized (this.taskQueue)
    {
      this.taskQueue.add(paramRunnable);
      this.taskQueue.notifyAll();
      this.inProcess.notifyAll();
      return;
    }
  }

  public void setPriority(int paramInt)
  {
    if (this.dead.get())
      throw new ThreadPuddleException("puddle is dead!");
    Iterator localIterator = this.puddle.iterator();
    while (localIterator.hasNext())
      ((Thread)localIterator.next()).setPriority(paramInt);
  }

  private class PuddleThread extends Thread
  {
    Runnable r;

    private PuddleThread()
    {
      setDaemon(true);
      start();
    }

    public void run()
    {
      if (!ThreadPuddle.this.dead.get())
      {
        synchronized (ThreadPuddle.this.taskQueue)
        {
          while (true)
            if (ThreadPuddle.this.taskQueue.isEmpty())
            {
              boolean bool = ThreadPuddle.this.dead.get();
              if (!bool)
                try
                {
                  ThreadPuddle.this.taskQueue.wait();
                }
                catch (InterruptedException localInterruptedException)
                {
                  if (ThreadPuddle.this.dead.get())
                    return;
                  Thread.currentThread().interrupt();
                }
            }
        }
        this.r = ((Runnable)ThreadPuddle.this.taskQueue.remove());
        try
        {
          while (true)
          {
            this.r.run();
            synchronized (ThreadPuddle.this.inProcess)
            {
              ThreadPuddle.this.inProcess.decrementAndGet();
              ThreadPuddle.this.inProcess.notifyAll();
            }
          }
        }
        catch (Throwable localThrowable)
        {
          while ((!(localThrowable instanceof InterruptedException)) || (!ThreadPuddle.this.dead.get()))
            localThrowable.printStackTrace();
        }
      }
    }
  }
}