package co.getair.meerkat.video.broadcast.googlecode.mp4parser.util;

public class Math
{
  public static int gcd(int paramInt1, int paramInt2)
  {
    while (paramInt2 > 0)
    {
      int i = paramInt2;
      paramInt2 = paramInt1 % paramInt2;
      paramInt1 = i;
    }
    return paramInt1;
  }

  public static long gcd(long paramLong1, long paramLong2)
  {
    while (paramLong2 > 0L)
    {
      long l = paramLong2;
      paramLong2 = paramLong1 % paramLong2;
      paramLong1 = l;
    }
    return paramLong1;
  }

  public static int lcm(int paramInt1, int paramInt2)
  {
    return paramInt1 * (paramInt2 / gcd(paramInt1, paramInt2));
  }

  public static long lcm(long paramLong1, long paramLong2)
  {
    return paramLong1 * (paramLong2 / gcd(paramLong1, paramLong2));
  }
}