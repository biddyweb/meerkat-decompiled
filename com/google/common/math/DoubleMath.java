package com.google.common.math;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import com.google.common.primitives.Booleans;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.util.Iterator;

@GwtCompatible(emulated=true)
public final class DoubleMath
{
  private static final double LN_2 = 0.0D;

  @VisibleForTesting
  static final int MAX_FACTORIAL = 170;
  private static final double MAX_INT_AS_DOUBLE = 2147483647.0D;
  private static final double MAX_LONG_AS_DOUBLE_PLUS_ONE = 9.223372036854776E+18D;
  private static final double MIN_INT_AS_DOUBLE = -2147483648.0D;
  private static final double MIN_LONG_AS_DOUBLE = -9.223372036854776E+18D;

  @VisibleForTesting
  static final double[] everySixteenthFactorial = { 1.0D, 20922789888000.0D, 2.631308369336935E+35D, 1.241391559253607E+61D, 1.268869321858842E+89D, 7.156945704626381E+118D, 9.916779348709497E+149D, 1.974506857221074E+182D, 3.856204823625804E+215D, 5.550293832739304E+249D, 4.714723635992062E+284D };

  public static double factorial(int paramInt)
  {
    MathPreconditions.checkNonNegative("n", paramInt);
    if (paramInt > 170)
      return (1.0D / 0.0D);
    double d = 1.0D;
    for (int i = 1 + (paramInt & 0xFFFFFFF0); i <= paramInt; i++)
      d *= i;
    return d * everySixteenthFactorial[(paramInt >> 4)];
  }

  public static int fuzzyCompare(double paramDouble1, double paramDouble2, double paramDouble3)
  {
    if (fuzzyEquals(paramDouble1, paramDouble2, paramDouble3))
      return 0;
    if (paramDouble1 < paramDouble2)
      return -1;
    if (paramDouble1 > paramDouble2)
      return 1;
    return Booleans.compare(Double.isNaN(paramDouble1), Double.isNaN(paramDouble2));
  }

  public static boolean fuzzyEquals(double paramDouble1, double paramDouble2, double paramDouble3)
  {
    MathPreconditions.checkNonNegative("tolerance", paramDouble3);
    return (Math.copySign(paramDouble1 - paramDouble2, 1.0D) <= paramDouble3) || (paramDouble1 == paramDouble2) || ((Double.isNaN(paramDouble1)) && (Double.isNaN(paramDouble2)));
  }

  @GwtIncompatible("java.lang.Math.getExponent, com.google.common.math.DoubleUtils")
  public static boolean isMathematicalInteger(double paramDouble)
  {
    return (DoubleUtils.isFinite(paramDouble)) && ((paramDouble == 0.0D) || (52 - Long.numberOfTrailingZeros(DoubleUtils.getSignificand(paramDouble)) <= Math.getExponent(paramDouble)));
  }

  @GwtIncompatible("com.google.common.math.DoubleUtils")
  public static boolean isPowerOfTwo(double paramDouble)
  {
    return (paramDouble > 0.0D) && (DoubleUtils.isFinite(paramDouble)) && (LongMath.isPowerOfTwo(DoubleUtils.getSignificand(paramDouble)));
  }

  public static double log2(double paramDouble)
  {
    return Math.log(paramDouble) / LN_2;
  }

  @GwtIncompatible("java.lang.Math.getExponent, com.google.common.math.DoubleUtils")
  public static int log2(double paramDouble, RoundingMode paramRoundingMode)
  {
    boolean bool1 = true;
    boolean bool2;
    int i;
    if ((paramDouble > 0.0D) && (DoubleUtils.isFinite(paramDouble)))
    {
      bool2 = bool1;
      Preconditions.checkArgument(bool2, "x must be positive and finite");
      i = Math.getExponent(paramDouble);
      if (DoubleUtils.isNormal(paramDouble))
        break label61;
      i = -52 + log2(4503599627370496.0D * paramDouble, paramRoundingMode);
    }
    label61: 
    do
    {
      return i;
      bool2 = false;
      break;
      switch (1.$SwitchMap$java$math$RoundingMode[paramRoundingMode.ordinal()])
      {
      default:
        throw new AssertionError();
      case 1:
        MathPreconditions.checkRoundingUnnecessary(isPowerOfTwo(paramDouble));
      case 2:
        j = 0;
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      }
    }
    while (j == 0);
    return i + 1;
    if (!isPowerOfTwo(paramDouble));
    for (int j = bool1; ; j = 0)
      break;
    int m;
    if (i < 0)
    {
      m = bool1;
      label171: if (isPowerOfTwo(paramDouble))
        break label193;
    }
    while (true)
    {
      j = m & bool1;
      break;
      m = 0;
      break label171;
      label193: bool1 = false;
    }
    int k;
    if (i >= 0)
    {
      k = bool1;
      label206: if (isPowerOfTwo(paramDouble))
        break label228;
    }
    while (true)
    {
      j = k & bool1;
      break;
      k = 0;
      break label206;
      label228: bool1 = false;
    }
    double d = DoubleUtils.scaleNormalize(paramDouble);
    if (d * d > 2.0D);
    for (j = bool1; ; j = 0)
      break;
  }

  @GwtIncompatible("MeanAccumulator")
  public static double mean(Iterable<? extends Number> paramIterable)
  {
    MeanAccumulator localMeanAccumulator = new MeanAccumulator(null);
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
      localMeanAccumulator.add(((Number)localIterator.next()).doubleValue());
    return localMeanAccumulator.mean();
  }

  @GwtIncompatible("MeanAccumulator")
  public static double mean(Iterator<? extends Number> paramIterator)
  {
    MeanAccumulator localMeanAccumulator = new MeanAccumulator(null);
    while (paramIterator.hasNext())
      localMeanAccumulator.add(((Number)paramIterator.next()).doubleValue());
    return localMeanAccumulator.mean();
  }

  @GwtIncompatible("MeanAccumulator")
  public static double mean(double[] paramArrayOfDouble)
  {
    MeanAccumulator localMeanAccumulator = new MeanAccumulator(null);
    int i = paramArrayOfDouble.length;
    for (int j = 0; j < i; j++)
      localMeanAccumulator.add(paramArrayOfDouble[j]);
    return localMeanAccumulator.mean();
  }

  @GwtIncompatible("MeanAccumulator")
  public static double mean(int[] paramArrayOfInt)
  {
    MeanAccumulator localMeanAccumulator = new MeanAccumulator(null);
    int i = paramArrayOfInt.length;
    for (int j = 0; j < i; j++)
      localMeanAccumulator.add(paramArrayOfInt[j]);
    return localMeanAccumulator.mean();
  }

  @GwtIncompatible("MeanAccumulator")
  public static double mean(long[] paramArrayOfLong)
  {
    MeanAccumulator localMeanAccumulator = new MeanAccumulator(null);
    int i = paramArrayOfLong.length;
    for (int j = 0; j < i; j++)
      localMeanAccumulator.add(paramArrayOfLong[j]);
    return localMeanAccumulator.mean();
  }

  @GwtIncompatible("#isMathematicalInteger, com.google.common.math.DoubleUtils")
  static double roundIntermediate(double paramDouble, RoundingMode paramRoundingMode)
  {
    if (!DoubleUtils.isFinite(paramDouble))
      throw new ArithmeticException("input is infinite or NaN");
    switch (1.$SwitchMap$java$math$RoundingMode[paramRoundingMode.ordinal()])
    {
    default:
      throw new AssertionError();
    case 1:
      MathPreconditions.checkRoundingUnnecessary(isMathematicalInteger(paramDouble));
    case 4:
    case 2:
    case 3:
    case 5:
    case 6:
    case 7:
    case 8:
    }
    double d1;
    do
    {
      do
      {
        do
        {
          do
            return paramDouble;
          while ((paramDouble >= 0.0D) || (isMathematicalInteger(paramDouble)));
          return paramDouble - 1.0D;
        }
        while ((paramDouble <= 0.0D) || (isMathematicalInteger(paramDouble)));
        return paramDouble + 1.0D;
      }
      while (isMathematicalInteger(paramDouble));
      return paramDouble + Math.copySign(1.0D, paramDouble);
      return Math.rint(paramDouble);
      double d2 = Math.rint(paramDouble);
      if (Math.abs(paramDouble - d2) == 0.5D)
        return paramDouble + Math.copySign(0.5D, paramDouble);
      return d2;
      d1 = Math.rint(paramDouble);
    }
    while (Math.abs(paramDouble - d1) == 0.5D);
    return d1;
  }

  @GwtIncompatible("#roundIntermediate, java.lang.Math.getExponent, com.google.common.math.DoubleUtils")
  public static BigInteger roundToBigInteger(double paramDouble, RoundingMode paramRoundingMode)
  {
    int i = 1;
    double d = roundIntermediate(paramDouble, paramRoundingMode);
    int j;
    label32: BigInteger localBigInteger;
    if (-9.223372036854776E+18D - d < 1.0D)
    {
      j = i;
      if (d >= 9.223372036854776E+18D)
        break label56;
      if ((i & j) == 0)
        break label61;
      localBigInteger = BigInteger.valueOf(()d);
    }
    label56: label61: 
    do
    {
      return localBigInteger;
      j = 0;
      break;
      i = 0;
      break label32;
      int k = Math.getExponent(d);
      localBigInteger = BigInteger.valueOf(DoubleUtils.getSignificand(d)).shiftLeft(k - 52);
    }
    while (d >= 0.0D);
    return localBigInteger.negate();
  }

  @GwtIncompatible("#roundIntermediate")
  public static int roundToInt(double paramDouble, RoundingMode paramRoundingMode)
  {
    int i = 1;
    double d = roundIntermediate(paramDouble, paramRoundingMode);
    int j;
    if (d > -2147483649.0D)
    {
      j = i;
      if (d >= 2147483648.0D)
        break label47;
    }
    while (true)
    {
      MathPreconditions.checkInRange(i & j);
      return (int)d;
      j = 0;
      break;
      label47: i = 0;
    }
  }

  @GwtIncompatible("#roundIntermediate")
  public static long roundToLong(double paramDouble, RoundingMode paramRoundingMode)
  {
    int i = 1;
    double d = roundIntermediate(paramDouble, paramRoundingMode);
    int j;
    if (-9.223372036854776E+18D - d < 1.0D)
    {
      j = i;
      if (d >= 9.223372036854776E+18D)
        break label49;
    }
    while (true)
    {
      MathPreconditions.checkInRange(i & j);
      return ()d;
      j = 0;
      break;
      label49: i = 0;
    }
  }

  @GwtIncompatible("com.google.common.math.DoubleUtils")
  private static final class MeanAccumulator
  {
    private long count = 0L;
    private double mean = 0.0D;

    void add(double paramDouble)
    {
      Preconditions.checkArgument(DoubleUtils.isFinite(paramDouble));
      this.count = (1L + this.count);
      this.mean += (paramDouble - this.mean) / this.count;
    }

    double mean()
    {
      if (this.count > 0L);
      for (boolean bool = true; ; bool = false)
      {
        Preconditions.checkArgument(bool, "Cannot take mean of 0 values");
        return this.mean;
      }
    }
  }
}