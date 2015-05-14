package com.google.common.util.concurrent;

import java.util.concurrent.TimeUnit;

abstract class SmoothRateLimiter extends RateLimiter
{
  double maxPermits;
  private long nextFreeTicketMicros = 0L;
  double stableIntervalMicros;
  double storedPermits;

  private SmoothRateLimiter(RateLimiter.SleepingStopwatch paramSleepingStopwatch)
  {
    super(paramSleepingStopwatch);
  }

  private void resync(long paramLong)
  {
    if (paramLong > this.nextFreeTicketMicros)
    {
      this.storedPermits = Math.min(this.maxPermits, this.storedPermits + (paramLong - this.nextFreeTicketMicros) / this.stableIntervalMicros);
      this.nextFreeTicketMicros = paramLong;
    }
  }

  final double doGetRate()
  {
    return TimeUnit.SECONDS.toMicros(1L) / this.stableIntervalMicros;
  }

  abstract void doSetRate(double paramDouble1, double paramDouble2);

  final void doSetRate(double paramDouble, long paramLong)
  {
    resync(paramLong);
    double d = TimeUnit.SECONDS.toMicros(1L) / paramDouble;
    this.stableIntervalMicros = d;
    doSetRate(paramDouble, d);
  }

  final long queryEarliestAvailable(long paramLong)
  {
    return this.nextFreeTicketMicros;
  }

  final long reserveEarliestAvailable(int paramInt, long paramLong)
  {
    resync(paramLong);
    long l = this.nextFreeTicketMicros;
    double d1 = Math.min(paramInt, this.storedPermits);
    double d2 = paramInt - d1;
    this.nextFreeTicketMicros = (storedPermitsToWaitTime(this.storedPermits, d1) + ()(d2 * this.stableIntervalMicros) + this.nextFreeTicketMicros);
    this.storedPermits -= d1;
    return l;
  }

  abstract long storedPermitsToWaitTime(double paramDouble1, double paramDouble2);

  static final class SmoothBursty extends SmoothRateLimiter
  {
    final double maxBurstSeconds;

    SmoothBursty(RateLimiter.SleepingStopwatch paramSleepingStopwatch, double paramDouble)
    {
      super(null);
      this.maxBurstSeconds = paramDouble;
    }

    void doSetRate(double paramDouble1, double paramDouble2)
    {
      double d1 = 0.0D;
      double d2 = this.maxPermits;
      this.maxPermits = (paramDouble1 * this.maxBurstSeconds);
      if (d2 == (1.0D / 0.0D))
      {
        this.storedPermits = this.maxPermits;
        return;
      }
      if (d2 == d1);
      while (true)
      {
        this.storedPermits = d1;
        return;
        d1 = this.storedPermits * this.maxPermits / d2;
      }
    }

    long storedPermitsToWaitTime(double paramDouble1, double paramDouble2)
    {
      return 0L;
    }
  }

  static final class SmoothWarmingUp extends SmoothRateLimiter
  {
    private double halfPermits;
    private double slope;
    private final long warmupPeriodMicros;

    SmoothWarmingUp(RateLimiter.SleepingStopwatch paramSleepingStopwatch, long paramLong, TimeUnit paramTimeUnit)
    {
      super(null);
      this.warmupPeriodMicros = paramTimeUnit.toMicros(paramLong);
    }

    private double permitsToTime(double paramDouble)
    {
      return this.stableIntervalMicros + paramDouble * this.slope;
    }

    void doSetRate(double paramDouble1, double paramDouble2)
    {
      double d1 = this.maxPermits;
      this.maxPermits = (this.warmupPeriodMicros / paramDouble2);
      this.halfPermits = (this.maxPermits / 2.0D);
      this.slope = ((paramDouble2 * 3.0D - paramDouble2) / this.halfPermits);
      if (d1 == (1.0D / 0.0D))
      {
        this.storedPermits = 0.0D;
        return;
      }
      if (d1 == 0.0D);
      for (double d2 = this.maxPermits; ; d2 = this.storedPermits * this.maxPermits / d1)
      {
        this.storedPermits = d2;
        return;
      }
    }

    long storedPermitsToWaitTime(double paramDouble1, double paramDouble2)
    {
      double d1 = paramDouble1 - this.halfPermits;
      long l = 0L;
      if (d1 > 0.0D)
      {
        double d2 = Math.min(d1, paramDouble2);
        l = ()(d2 * (permitsToTime(d1) + permitsToTime(d1 - d2)) / 2.0D);
        paramDouble2 -= d2;
      }
      return ()(l + paramDouble2 * this.stableIntervalMicros);
    }
  }
}