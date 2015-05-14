package com.google.android.gms.internal;

import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class zzmo
{
  private static final List<TimeUnit> zzYu = Arrays.asList(arrayOfTimeUnit);

  static
  {
    TimeUnit[] arrayOfTimeUnit = new TimeUnit[7];
    arrayOfTimeUnit[0] = TimeUnit.NANOSECONDS;
    arrayOfTimeUnit[1] = TimeUnit.MICROSECONDS;
    arrayOfTimeUnit[2] = TimeUnit.MILLISECONDS;
    arrayOfTimeUnit[3] = TimeUnit.SECONDS;
    arrayOfTimeUnit[4] = TimeUnit.MINUTES;
    arrayOfTimeUnit[5] = TimeUnit.HOURS;
    arrayOfTimeUnit[6] = TimeUnit.DAYS;
  }

  public static long zza(long paramLong, TimeUnit paramTimeUnit1, TimeUnit paramTimeUnit2)
  {
    return paramTimeUnit1.convert(paramTimeUnit2.convert(paramLong, paramTimeUnit1), paramTimeUnit2);
  }

  public static boolean zza(TimeUnit paramTimeUnit)
  {
    return zza(paramTimeUnit, TimeUnit.MILLISECONDS);
  }

  private static boolean zza(TimeUnit paramTimeUnit1, TimeUnit paramTimeUnit2)
  {
    return zzYu.indexOf(paramTimeUnit1) < zzYu.indexOf(paramTimeUnit2);
  }
}