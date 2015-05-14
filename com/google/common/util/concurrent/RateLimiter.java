package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import com.google.common.base.Stopwatch;
import java.util.concurrent.TimeUnit;
import javax.annotation.concurrent.ThreadSafe;

@Beta
@ThreadSafe
public abstract class RateLimiter
{
  private volatile Object mutexDoNotUseDirectly;
  private final SleepingStopwatch stopwatch;

  RateLimiter(SleepingStopwatch paramSleepingStopwatch)
  {
    this.stopwatch = ((SleepingStopwatch)Preconditions.checkNotNull(paramSleepingStopwatch));
  }

  private boolean canAcquire(long paramLong1, long paramLong2)
  {
    return queryEarliestAvailable(paramLong1) - paramLong2 <= paramLong1;
  }

  private static int checkPermits(int paramInt)
  {
    if (paramInt > 0);
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Integer.valueOf(paramInt);
      Preconditions.checkArgument(bool, "Requested permits (%s) must be positive", arrayOfObject);
      return paramInt;
    }
  }

  public static RateLimiter create(double paramDouble)
  {
    return create(SleepingStopwatch.createFromSystemTimer(), paramDouble);
  }

  public static RateLimiter create(double paramDouble, long paramLong, TimeUnit paramTimeUnit)
  {
    if (paramLong >= 0L);
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Long.valueOf(paramLong);
      Preconditions.checkArgument(bool, "warmupPeriod must not be negative: %s", arrayOfObject);
      return create(SleepingStopwatch.createFromSystemTimer(), paramDouble, paramLong, paramTimeUnit);
    }
  }

  @VisibleForTesting
  static RateLimiter create(SleepingStopwatch paramSleepingStopwatch, double paramDouble)
  {
    SmoothRateLimiter.SmoothBursty localSmoothBursty = new SmoothRateLimiter.SmoothBursty(paramSleepingStopwatch, 1.0D);
    localSmoothBursty.setRate(paramDouble);
    return localSmoothBursty;
  }

  @VisibleForTesting
  static RateLimiter create(SleepingStopwatch paramSleepingStopwatch, double paramDouble, long paramLong, TimeUnit paramTimeUnit)
  {
    SmoothRateLimiter.SmoothWarmingUp localSmoothWarmingUp = new SmoothRateLimiter.SmoothWarmingUp(paramSleepingStopwatch, paramLong, paramTimeUnit);
    localSmoothWarmingUp.setRate(paramDouble);
    return localSmoothWarmingUp;
  }

  private Object mutex()
  {
    Object localObject1 = this.mutexDoNotUseDirectly;
    if (localObject1 == null);
    try
    {
      Object localObject5 = this.mutexDoNotUseDirectly;
      Object localObject6;
      if (localObject5 == null)
        localObject6 = new Object();
      try
      {
        this.mutexDoNotUseDirectly = localObject6;
        localObject5 = localObject6;
        return localObject5;
        label42: Object localObject2;
        throw localObject2;
      }
      finally
      {
      }
      return localObject1;
    }
    finally
    {
      break label42;
    }
  }

  public double acquire()
  {
    return acquire(1);
  }

  public double acquire(int paramInt)
  {
    long l = reserve(paramInt);
    this.stopwatch.sleepMicrosUninterruptibly(l);
    return 1.0D * l / TimeUnit.SECONDS.toMicros(1L);
  }

  abstract double doGetRate();

  abstract void doSetRate(double paramDouble, long paramLong);

  public final double getRate()
  {
    synchronized (mutex())
    {
      double d = doGetRate();
      return d;
    }
  }

  abstract long queryEarliestAvailable(long paramLong);

  final long reserve(int paramInt)
  {
    checkPermits(paramInt);
    synchronized (mutex())
    {
      long l = reserveAndGetWaitLength(paramInt, this.stopwatch.readMicros());
      return l;
    }
  }

  final long reserveAndGetWaitLength(int paramInt, long paramLong)
  {
    return Math.max(reserveEarliestAvailable(paramInt, paramLong) - paramLong, 0L);
  }

  abstract long reserveEarliestAvailable(int paramInt, long paramLong);

  public final void setRate(double paramDouble)
  {
    if ((paramDouble > 0.0D) && (!Double.isNaN(paramDouble)));
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool, "rate must be positive");
      synchronized (mutex())
      {
        doSetRate(paramDouble, this.stopwatch.readMicros());
        return;
      }
    }
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Double.valueOf(getRate());
    return String.format("RateLimiter[stableRate=%3.1fqps]", arrayOfObject);
  }

  public boolean tryAcquire()
  {
    return tryAcquire(1, 0L, TimeUnit.MICROSECONDS);
  }

  public boolean tryAcquire(int paramInt)
  {
    return tryAcquire(paramInt, 0L, TimeUnit.MICROSECONDS);
  }

  public boolean tryAcquire(int paramInt, long paramLong, TimeUnit paramTimeUnit)
  {
    long l1 = Math.max(paramTimeUnit.toMicros(paramLong), 0L);
    checkPermits(paramInt);
    synchronized (mutex())
    {
      long l2 = this.stopwatch.readMicros();
      if (!canAcquire(l2, l1))
        return false;
      long l3 = reserveAndGetWaitLength(paramInt, l2);
      this.stopwatch.sleepMicrosUninterruptibly(l3);
      return true;
    }
  }

  public boolean tryAcquire(long paramLong, TimeUnit paramTimeUnit)
  {
    return tryAcquire(1, paramLong, paramTimeUnit);
  }

  @VisibleForTesting
  static abstract class SleepingStopwatch
  {
    static final SleepingStopwatch createFromSystemTimer()
    {
      return new SleepingStopwatch()
      {
        final Stopwatch stopwatch = Stopwatch.createStarted();

        long readMicros()
        {
          return this.stopwatch.elapsed(TimeUnit.MICROSECONDS);
        }

        void sleepMicrosUninterruptibly(long paramAnonymousLong)
        {
          if (paramAnonymousLong > 0L)
            Uninterruptibles.sleepUninterruptibly(paramAnonymousLong, TimeUnit.MICROSECONDS);
        }
      };
    }

    abstract long readMicros();

    abstract void sleepMicrosUninterruptibly(long paramLong);
  }
}