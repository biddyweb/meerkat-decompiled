package rx.internal.util.unsafe;

public final class Pow2
{
  private Pow2()
  {
    throw new IllegalStateException("No instances!");
  }

  public static boolean isPowerOfTwo(int paramInt)
  {
    return (paramInt & paramInt - 1) == 0;
  }

  public static int roundToPowerOfTwo(int paramInt)
  {
    return 1 << 32 - Integer.numberOfLeadingZeros(paramInt - 1);
  }
}