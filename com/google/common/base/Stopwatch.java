package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import java.util.concurrent.TimeUnit;

@Beta
@GwtCompatible(emulated=true)
public final class Stopwatch
{
  private long elapsedNanos;
  private boolean isRunning;
  private long startTick;
  private final Ticker ticker;

  @Deprecated
  Stopwatch()
  {
    this(Ticker.systemTicker());
  }

  @Deprecated
  Stopwatch(Ticker paramTicker)
  {
    this.ticker = ((Ticker)Preconditions.checkNotNull(paramTicker, "ticker"));
  }

  private static String abbreviate(TimeUnit paramTimeUnit)
  {
    switch (1.$SwitchMap$java$util$concurrent$TimeUnit[paramTimeUnit.ordinal()])
    {
    default:
      throw new AssertionError();
    case 1:
      return "ns";
    case 2:
      return "\u03BCs";
    case 3:
      return "ms";
    case 4:
      return "s";
    case 5:
      return "min";
    case 6:
      return "h";
    case 7:
    }
    return "d";
  }

  private static TimeUnit chooseUnit(long paramLong)
  {
    if (TimeUnit.DAYS.convert(paramLong, TimeUnit.NANOSECONDS) > 0L)
      return TimeUnit.DAYS;
    if (TimeUnit.HOURS.convert(paramLong, TimeUnit.NANOSECONDS) > 0L)
      return TimeUnit.HOURS;
    if (TimeUnit.MINUTES.convert(paramLong, TimeUnit.NANOSECONDS) > 0L)
      return TimeUnit.MINUTES;
    if (TimeUnit.SECONDS.convert(paramLong, TimeUnit.NANOSECONDS) > 0L)
      return TimeUnit.SECONDS;
    if (TimeUnit.MILLISECONDS.convert(paramLong, TimeUnit.NANOSECONDS) > 0L)
      return TimeUnit.MILLISECONDS;
    if (TimeUnit.MICROSECONDS.convert(paramLong, TimeUnit.NANOSECONDS) > 0L)
      return TimeUnit.MICROSECONDS;
    return TimeUnit.NANOSECONDS;
  }

  public static Stopwatch createStarted()
  {
    return new Stopwatch().start();
  }

  public static Stopwatch createStarted(Ticker paramTicker)
  {
    return new Stopwatch(paramTicker).start();
  }

  public static Stopwatch createUnstarted()
  {
    return new Stopwatch();
  }

  public static Stopwatch createUnstarted(Ticker paramTicker)
  {
    return new Stopwatch(paramTicker);
  }

  private long elapsedNanos()
  {
    if (this.isRunning)
      return this.ticker.read() - this.startTick + this.elapsedNanos;
    return this.elapsedNanos;
  }

  public long elapsed(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(elapsedNanos(), TimeUnit.NANOSECONDS);
  }

  public boolean isRunning()
  {
    return this.isRunning;
  }

  public Stopwatch reset()
  {
    this.elapsedNanos = 0L;
    this.isRunning = false;
    return this;
  }

  public Stopwatch start()
  {
    if (!this.isRunning);
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkState(bool, "This stopwatch is already running.");
      this.isRunning = true;
      this.startTick = this.ticker.read();
      return this;
    }
  }

  public Stopwatch stop()
  {
    long l = this.ticker.read();
    Preconditions.checkState(this.isRunning, "This stopwatch is already stopped.");
    this.isRunning = false;
    this.elapsedNanos += l - this.startTick;
    return this;
  }

  @GwtIncompatible("String.format()")
  public String toString()
  {
    long l = elapsedNanos();
    TimeUnit localTimeUnit = chooseUnit(l);
    double d = l / TimeUnit.NANOSECONDS.convert(1L, localTimeUnit);
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Double.valueOf(d);
    arrayOfObject[1] = abbreviate(localTimeUnit);
    return String.format("%.4g %s", arrayOfObject);
  }
}