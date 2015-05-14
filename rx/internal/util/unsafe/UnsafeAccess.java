package rx.internal.util.unsafe;

import java.lang.reflect.Field;
import sun.misc.Unsafe;

public final class UnsafeAccess
{
  public static final Unsafe UNSAFE;

  static
  {
    try
    {
      Field localField = Unsafe.class.getDeclaredField("theUnsafe");
      localField.setAccessible(true);
      localUnsafe = (Unsafe)localField.get(null);
      UNSAFE = localUnsafe;
      return;
    }
    catch (Throwable localThrowable)
    {
      while (true)
        Unsafe localUnsafe = null;
    }
  }

  private UnsafeAccess()
  {
    throw new IllegalStateException("No instances!");
  }

  public static boolean compareAndSwapInt(Object paramObject, long paramLong, int paramInt1, int paramInt2)
  {
    return UNSAFE.compareAndSwapInt(paramObject, paramLong, paramInt1, paramInt2);
  }

  public static int getAndAddInt(Object paramObject, long paramLong, int paramInt)
  {
    int i;
    int j;
    do
    {
      i = UNSAFE.getIntVolatile(paramObject, paramLong);
      j = i + paramInt;
    }
    while (!UNSAFE.compareAndSwapInt(paramObject, paramLong, i, j));
    return i;
  }

  public static int getAndIncrementInt(Object paramObject, long paramLong)
  {
    int i;
    int j;
    do
    {
      i = UNSAFE.getIntVolatile(paramObject, paramLong);
      j = i + 1;
    }
    while (!UNSAFE.compareAndSwapInt(paramObject, paramLong, i, j));
    return i;
  }

  public static int getAndSetInt(Object paramObject, long paramLong, int paramInt)
  {
    int i;
    do
      i = UNSAFE.getIntVolatile(paramObject, paramLong);
    while (!UNSAFE.compareAndSwapInt(paramObject, paramLong, i, paramInt));
    return i;
  }

  public static final boolean isUnsafeAvailable()
  {
    return UNSAFE != null;
  }
}