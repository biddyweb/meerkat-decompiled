package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import com.google.common.base.Throwables;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import javax.annotation.concurrent.GuardedBy;

@Beta
public final class Monitor
{

  @GuardedBy("lock")
  private Guard activeGuards = null;
  private final boolean fair;
  private final ReentrantLock lock;

  public Monitor()
  {
    this(false);
  }

  public Monitor(boolean paramBoolean)
  {
    this.fair = paramBoolean;
    this.lock = new ReentrantLock(paramBoolean);
  }

  @GuardedBy("lock")
  private void await(Guard paramGuard, boolean paramBoolean)
    throws InterruptedException
  {
    if (paramBoolean)
      signalNextWaiter();
    beginWaitingFor(paramGuard);
    try
    {
      boolean bool;
      do
      {
        paramGuard.condition.await();
        bool = paramGuard.isSatisfied();
      }
      while (!bool);
      return;
    }
    finally
    {
      endWaitingFor(paramGuard);
    }
  }

  @GuardedBy("lock")
  private boolean awaitNanos(Guard paramGuard, long paramLong, boolean paramBoolean)
    throws InterruptedException
  {
    if (paramBoolean)
      signalNextWaiter();
    beginWaitingFor(paramGuard);
    while (true)
    {
      if (paramLong < 0L)
      {
        endWaitingFor(paramGuard);
        return false;
      }
      try
      {
        paramLong = paramGuard.condition.awaitNanos(paramLong);
        boolean bool = paramGuard.isSatisfied();
        if (!bool)
          continue;
        return true;
      }
      finally
      {
        endWaitingFor(paramGuard);
      }
    }
  }

  @GuardedBy("lock")
  private void awaitUninterruptibly(Guard paramGuard, boolean paramBoolean)
  {
    if (paramBoolean)
      signalNextWaiter();
    beginWaitingFor(paramGuard);
    try
    {
      boolean bool;
      do
      {
        paramGuard.condition.awaitUninterruptibly();
        bool = paramGuard.isSatisfied();
      }
      while (!bool);
      return;
    }
    finally
    {
      endWaitingFor(paramGuard);
    }
  }

  @GuardedBy("lock")
  private void beginWaitingFor(Guard paramGuard)
  {
    int i = paramGuard.waiterCount;
    paramGuard.waiterCount = (i + 1);
    if (i == 0)
    {
      paramGuard.next = this.activeGuards;
      this.activeGuards = paramGuard;
    }
  }

  @GuardedBy("lock")
  private void endWaitingFor(Guard paramGuard)
  {
    int i = -1 + paramGuard.waiterCount;
    paramGuard.waiterCount = i;
    Guard localGuard1;
    Guard localGuard2;
    if (i == 0)
    {
      localGuard1 = this.activeGuards;
      localGuard2 = null;
    }
    while (true)
    {
      if (localGuard1 == paramGuard)
      {
        if (localGuard2 == null)
          this.activeGuards = localGuard1.next;
        while (true)
        {
          localGuard1.next = null;
          return;
          localGuard2.next = localGuard1.next;
        }
      }
      localGuard2 = localGuard1;
      localGuard1 = localGuard1.next;
    }
  }

  @GuardedBy("lock")
  private boolean isSatisfied(Guard paramGuard)
  {
    try
    {
      boolean bool = paramGuard.isSatisfied();
      return bool;
    }
    catch (Throwable localThrowable)
    {
      signalAllWaiters();
      throw Throwables.propagate(localThrowable);
    }
  }

  @GuardedBy("lock")
  private void signalAllWaiters()
  {
    for (Guard localGuard = this.activeGuards; localGuard != null; localGuard = localGuard.next)
      localGuard.condition.signalAll();
  }

  @GuardedBy("lock")
  private void signalNextWaiter()
  {
    for (Guard localGuard = this.activeGuards; ; localGuard = localGuard.next)
      if (localGuard != null)
      {
        if (isSatisfied(localGuard))
          localGuard.condition.signal();
      }
      else
        return;
  }

  public void enter()
  {
    this.lock.lock();
  }

  public boolean enter(long paramLong, TimeUnit paramTimeUnit)
  {
    long l1 = paramTimeUnit.toNanos(paramLong);
    ReentrantLock localReentrantLock = this.lock;
    boolean bool3;
    if ((!this.fair) && (localReentrantLock.tryLock()))
      bool3 = true;
    while (true)
    {
      return bool3;
      long l2 = l1 + System.nanoTime();
      boolean bool1 = Thread.interrupted();
      try
      {
        boolean bool2 = localReentrantLock.tryLock(l1, TimeUnit.NANOSECONDS);
        bool3 = bool2;
        return bool3;
      }
      catch (InterruptedException localInterruptedException)
      {
        while (true)
        {
          bool1 = true;
          long l3 = System.nanoTime();
          l1 = l2 - l3;
        }
      }
      finally
      {
        if (bool1)
          Thread.currentThread().interrupt();
      }
    }
  }

  public boolean enterIf(Guard paramGuard)
  {
    if (paramGuard.monitor != this)
      throw new IllegalMonitorStateException();
    ReentrantLock localReentrantLock = this.lock;
    localReentrantLock.lock();
    try
    {
      boolean bool = paramGuard.isSatisfied();
      if (!bool)
        localReentrantLock.unlock();
      return bool;
    }
    finally
    {
      if (0 == 0)
        localReentrantLock.unlock();
    }
  }

  public boolean enterIf(Guard paramGuard, long paramLong, TimeUnit paramTimeUnit)
  {
    if (paramGuard.monitor != this)
      throw new IllegalMonitorStateException();
    boolean bool2;
    if (!enter(paramLong, paramTimeUnit))
      bool2 = false;
    while (true)
    {
      return bool2;
      try
      {
        boolean bool1 = paramGuard.isSatisfied();
        bool2 = bool1;
        if (bool2)
          continue;
        this.lock.unlock();
        return bool2;
      }
      finally
      {
        if (0 == 0)
          this.lock.unlock();
      }
    }
  }

  public boolean enterIfInterruptibly(Guard paramGuard)
    throws InterruptedException
  {
    if (paramGuard.monitor != this)
      throw new IllegalMonitorStateException();
    ReentrantLock localReentrantLock = this.lock;
    localReentrantLock.lockInterruptibly();
    try
    {
      boolean bool = paramGuard.isSatisfied();
      if (!bool)
        localReentrantLock.unlock();
      return bool;
    }
    finally
    {
      if (0 == 0)
        localReentrantLock.unlock();
    }
  }

  public boolean enterIfInterruptibly(Guard paramGuard, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    if (paramGuard.monitor != this)
      throw new IllegalMonitorStateException();
    ReentrantLock localReentrantLock = this.lock;
    boolean bool2;
    if (!localReentrantLock.tryLock(paramLong, paramTimeUnit))
      bool2 = false;
    while (true)
    {
      return bool2;
      try
      {
        boolean bool1 = paramGuard.isSatisfied();
        bool2 = bool1;
        if (bool2)
          continue;
        localReentrantLock.unlock();
        return bool2;
      }
      finally
      {
        if (0 == 0)
          localReentrantLock.unlock();
      }
    }
  }

  public void enterInterruptibly()
    throws InterruptedException
  {
    this.lock.lockInterruptibly();
  }

  public boolean enterInterruptibly(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    return this.lock.tryLock(paramLong, paramTimeUnit);
  }

  public void enterWhen(Guard paramGuard)
    throws InterruptedException
  {
    if (paramGuard.monitor != this)
      throw new IllegalMonitorStateException();
    ReentrantLock localReentrantLock = this.lock;
    boolean bool = localReentrantLock.isHeldByCurrentThread();
    localReentrantLock.lockInterruptibly();
    try
    {
      if (!paramGuard.isSatisfied())
        await(paramGuard, bool);
      if (1 == 0)
        leave();
      return;
    }
    finally
    {
      if (0 == 0)
        leave();
    }
  }

  public boolean enterWhen(Guard paramGuard, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    long l1 = paramTimeUnit.toNanos(paramLong);
    if (paramGuard.monitor != this)
      throw new IllegalMonitorStateException();
    ReentrantLock localReentrantLock = this.lock;
    boolean bool1 = localReentrantLock.isHeldByCurrentThread();
    long l2;
    boolean bool2;
    if ((this.fair) || (!localReentrantLock.tryLock()))
    {
      l2 = l1 + System.nanoTime();
      if (!localReentrantLock.tryLock(paramLong, paramTimeUnit))
        bool2 = false;
    }
    while (true)
    {
      return bool2;
      l1 = l2 - System.nanoTime();
      try
      {
        if (!paramGuard.isSatisfied())
        {
          boolean bool3 = awaitNanos(paramGuard, l1, bool1);
          if (!bool3);
        }
        else
        {
          bool2 = true;
          if (bool2)
            continue;
          if ((0 == 0) || (bool1));
        }
      }
      finally
      {
        if (0 == 0)
          if ((1 == 0) || (bool1));
      }
    }
  }

  public void enterWhenUninterruptibly(Guard paramGuard)
  {
    if (paramGuard.monitor != this)
      throw new IllegalMonitorStateException();
    ReentrantLock localReentrantLock = this.lock;
    boolean bool = localReentrantLock.isHeldByCurrentThread();
    localReentrantLock.lock();
    try
    {
      if (!paramGuard.isSatisfied())
        awaitUninterruptibly(paramGuard, bool);
      if (1 == 0)
        leave();
      return;
    }
    finally
    {
      if (0 == 0)
        leave();
    }
  }

  public boolean enterWhenUninterruptibly(Guard paramGuard, long paramLong, TimeUnit paramTimeUnit)
  {
    long l1 = paramTimeUnit.toNanos(paramLong);
    if (paramGuard.monitor != this)
      throw new IllegalMonitorStateException();
    ReentrantLock localReentrantLock = this.lock;
    long l2 = l1 + System.nanoTime();
    boolean bool1 = localReentrantLock.isHeldByCurrentThread();
    boolean bool2 = Thread.interrupted();
    try
    {
      int i;
      if (!this.fair)
      {
        boolean bool6 = localReentrantLock.tryLock();
        if (bool6);
      }
      else
      {
        i = 0;
      }
      while (true)
      {
        boolean bool3;
        try
        {
          boolean bool5 = localReentrantLock.tryLock(l1, TimeUnit.NANOSECONDS);
          i = bool5;
          if (i == 0)
          {
            bool3 = false;
            return bool3;
          }
        }
        catch (InterruptedException localInterruptedException1)
        {
          bool2 = true;
          long l3 = System.nanoTime();
          l1 = l2 - l3;
        }
        if (i == 0)
          continue;
        try
        {
          if (!paramGuard.isSatisfied())
          {
            boolean bool4 = awaitNanos(paramGuard, l1, bool1);
            if (!bool4)
              break label182;
          }
          label182: for (bool3 = true; ; bool3 = false)
          {
            if (!bool3)
              localReentrantLock.unlock();
            return bool3;
          }
        }
        catch (InterruptedException localInterruptedException2)
        {
          while (true)
          {
            bool2 = true;
            long l4 = System.nanoTime();
            l1 = l2 - l4;
            bool1 = false;
          }
        }
        finally
        {
          if (0 == 0)
            localReentrantLock.unlock();
        }
      }
    }
    finally
    {
      if (bool2)
        Thread.currentThread().interrupt();
    }
  }

  public int getOccupiedDepth()
  {
    return this.lock.getHoldCount();
  }

  public int getQueueLength()
  {
    return this.lock.getQueueLength();
  }

  public int getWaitQueueLength(Guard paramGuard)
  {
    if (paramGuard.monitor != this)
      throw new IllegalMonitorStateException();
    this.lock.lock();
    try
    {
      int i = paramGuard.waiterCount;
      return i;
    }
    finally
    {
      this.lock.unlock();
    }
  }

  public boolean hasQueuedThread(Thread paramThread)
  {
    return this.lock.hasQueuedThread(paramThread);
  }

  public boolean hasQueuedThreads()
  {
    return this.lock.hasQueuedThreads();
  }

  public boolean hasWaiters(Guard paramGuard)
  {
    return getWaitQueueLength(paramGuard) > 0;
  }

  public boolean isFair()
  {
    return this.fair;
  }

  public boolean isOccupied()
  {
    return this.lock.isLocked();
  }

  public boolean isOccupiedByCurrentThread()
  {
    return this.lock.isHeldByCurrentThread();
  }

  public void leave()
  {
    ReentrantLock localReentrantLock = this.lock;
    try
    {
      if (localReentrantLock.getHoldCount() == 1)
        signalNextWaiter();
      return;
    }
    finally
    {
      localReentrantLock.unlock();
    }
  }

  public boolean tryEnter()
  {
    return this.lock.tryLock();
  }

  public boolean tryEnterIf(Guard paramGuard)
  {
    if (paramGuard.monitor != this)
      throw new IllegalMonitorStateException();
    ReentrantLock localReentrantLock = this.lock;
    boolean bool2;
    if (!localReentrantLock.tryLock())
      bool2 = false;
    while (true)
    {
      return bool2;
      try
      {
        boolean bool1 = paramGuard.isSatisfied();
        bool2 = bool1;
        if (bool2)
          continue;
        localReentrantLock.unlock();
        return bool2;
      }
      finally
      {
        if (0 == 0)
          localReentrantLock.unlock();
      }
    }
  }

  public void waitFor(Guard paramGuard)
    throws InterruptedException
  {
    if (paramGuard.monitor == this);
    for (int i = 1; (i & this.lock.isHeldByCurrentThread()) == 0; i = 0)
      throw new IllegalMonitorStateException();
    if (!paramGuard.isSatisfied())
      await(paramGuard, true);
  }

  public boolean waitFor(Guard paramGuard, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    long l = paramTimeUnit.toNanos(paramLong);
    if (paramGuard.monitor == this);
    for (int i = 1; (i & this.lock.isHeldByCurrentThread()) == 0; i = 0)
      throw new IllegalMonitorStateException();
    boolean bool1;
    if (!paramGuard.isSatisfied())
    {
      boolean bool2 = awaitNanos(paramGuard, l, true);
      bool1 = false;
      if (!bool2);
    }
    else
    {
      bool1 = true;
    }
    return bool1;
  }

  public void waitForUninterruptibly(Guard paramGuard)
  {
    if (paramGuard.monitor == this);
    for (int i = 1; (i & this.lock.isHeldByCurrentThread()) == 0; i = 0)
      throw new IllegalMonitorStateException();
    if (!paramGuard.isSatisfied())
      awaitUninterruptibly(paramGuard, true);
  }

  public boolean waitForUninterruptibly(Guard paramGuard, long paramLong, TimeUnit paramTimeUnit)
  {
    long l1 = paramTimeUnit.toNanos(paramLong);
    if (paramGuard.monitor == this);
    for (int i = 1; (i & this.lock.isHeldByCurrentThread()) == 0; i = 0)
      throw new IllegalMonitorStateException();
    boolean bool4;
    if (paramGuard.isSatisfied())
      bool4 = true;
    while (true)
    {
      return bool4;
      boolean bool1 = true;
      long l2 = l1 + System.nanoTime();
      boolean bool2 = Thread.interrupted();
      try
      {
        boolean bool5 = awaitNanos(paramGuard, l1, bool1);
        bool4 = bool5;
        return bool4;
      }
      catch (InterruptedException localInterruptedException)
      {
        while (true)
        {
          bool2 = true;
          boolean bool3 = paramGuard.isSatisfied();
          if (bool3)
          {
            bool4 = true;
            return bool4;
          }
          long l3 = System.nanoTime();
          l1 = l2 - l3;
          bool1 = false;
        }
      }
      finally
      {
        if (bool2)
          Thread.currentThread().interrupt();
      }
    }
  }

  @Beta
  public static abstract class Guard
  {
    final Condition condition;
    final Monitor monitor;

    @GuardedBy("monitor.lock")
    Guard next;

    @GuardedBy("monitor.lock")
    int waiterCount = 0;

    protected Guard(Monitor paramMonitor)
    {
      this.monitor = ((Monitor)Preconditions.checkNotNull(paramMonitor, "monitor"));
      this.condition = paramMonitor.lock.newCondition();
    }

    public abstract boolean isSatisfied();
  }
}