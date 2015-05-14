package com.google.common.math;

import com.google.common.annotations.GwtCompatible;
import java.math.BigInteger;
import javax.annotation.Nullable;

@GwtCompatible
final class MathPreconditions
{
  static void checkInRange(boolean paramBoolean)
  {
    if (!paramBoolean)
      throw new ArithmeticException("not in range");
  }

  static void checkNoOverflow(boolean paramBoolean)
  {
    if (!paramBoolean)
      throw new ArithmeticException("overflow");
  }

  static double checkNonNegative(@Nullable String paramString, double paramDouble)
  {
    if (paramDouble < 0.0D)
    {
      String str = String.valueOf(String.valueOf(paramString));
      throw new IllegalArgumentException(40 + str.length() + str + " (" + paramDouble + ") must be >= 0");
    }
    return paramDouble;
  }

  static int checkNonNegative(@Nullable String paramString, int paramInt)
  {
    if (paramInt < 0)
    {
      String str = String.valueOf(String.valueOf(paramString));
      throw new IllegalArgumentException(27 + str.length() + str + " (" + paramInt + ") must be >= 0");
    }
    return paramInt;
  }

  static long checkNonNegative(@Nullable String paramString, long paramLong)
  {
    if (paramLong < 0L)
    {
      String str = String.valueOf(String.valueOf(paramString));
      throw new IllegalArgumentException(36 + str.length() + str + " (" + paramLong + ") must be >= 0");
    }
    return paramLong;
  }

  static BigInteger checkNonNegative(@Nullable String paramString, BigInteger paramBigInteger)
  {
    if (paramBigInteger.signum() < 0)
    {
      String str1 = String.valueOf(String.valueOf(paramString));
      String str2 = String.valueOf(String.valueOf(paramBigInteger));
      throw new IllegalArgumentException(16 + str1.length() + str2.length() + str1 + " (" + str2 + ") must be >= 0");
    }
    return paramBigInteger;
  }

  static int checkPositive(@Nullable String paramString, int paramInt)
  {
    if (paramInt <= 0)
    {
      String str = String.valueOf(String.valueOf(paramString));
      throw new IllegalArgumentException(26 + str.length() + str + " (" + paramInt + ") must be > 0");
    }
    return paramInt;
  }

  static long checkPositive(@Nullable String paramString, long paramLong)
  {
    if (paramLong <= 0L)
    {
      String str = String.valueOf(String.valueOf(paramString));
      throw new IllegalArgumentException(35 + str.length() + str + " (" + paramLong + ") must be > 0");
    }
    return paramLong;
  }

  static BigInteger checkPositive(@Nullable String paramString, BigInteger paramBigInteger)
  {
    if (paramBigInteger.signum() <= 0)
    {
      String str1 = String.valueOf(String.valueOf(paramString));
      String str2 = String.valueOf(String.valueOf(paramBigInteger));
      throw new IllegalArgumentException(15 + str1.length() + str2.length() + str1 + " (" + str2 + ") must be > 0");
    }
    return paramBigInteger;
  }

  static void checkRoundingUnnecessary(boolean paramBoolean)
  {
    if (!paramBoolean)
      throw new ArithmeticException("mode was UNNECESSARY, but rounding was necessary");
  }
}