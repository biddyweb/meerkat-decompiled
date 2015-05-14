package com.google.common.cache;

import java.lang.reflect.Field;
import java.security.AccessController;
import java.security.PrivilegedActionException;
import java.security.PrivilegedExceptionAction;
import java.util.Random;
import sun.misc.Unsafe;

abstract class Striped64 extends Number
{
  static final int NCPU = Runtime.getRuntime().availableProcessors();
  private static final Unsafe UNSAFE;
  private static final long baseOffset;
  private static final long busyOffset;
  static final Random rng;
  static final ThreadLocal<int[]> threadHashCode = new ThreadLocal();
  volatile transient long base;
  volatile transient int busy;
  volatile transient Cell[] cells;

  static
  {
    rng = new Random();
    try
    {
      UNSAFE = getUnsafe();
      baseOffset = UNSAFE.objectFieldOffset(Striped64.class.getDeclaredField("base"));
      busyOffset = UNSAFE.objectFieldOffset(Striped64.class.getDeclaredField("busy"));
      return;
    }
    catch (Exception localException)
    {
      throw new Error(localException);
    }
  }

  private static Unsafe getUnsafe()
  {
    try
    {
      Unsafe localUnsafe2 = Unsafe.getUnsafe();
      return localUnsafe2;
    }
    catch (SecurityException localSecurityException)
    {
      try
      {
        Unsafe localUnsafe1 = (Unsafe)AccessController.doPrivileged(new PrivilegedExceptionAction()
        {
          public Unsafe run()
            throws Exception
          {
            for (Field localField : Unsafe.class.getDeclaredFields())
            {
              localField.setAccessible(true);
              Object localObject = localField.get(null);
              if (Unsafe.class.isInstance(localObject))
                return (Unsafe)Unsafe.class.cast(localObject);
            }
            throw new NoSuchFieldError("the Unsafe");
          }
        });
        return localUnsafe1;
      }
      catch (PrivilegedActionException localPrivilegedActionException)
      {
        throw new RuntimeException("Could not initialize intrinsics", localPrivilegedActionException.getCause());
      }
    }
  }

  final boolean casBase(long paramLong1, long paramLong2)
  {
    return UNSAFE.compareAndSwapLong(this, baseOffset, paramLong1, paramLong2);
  }

  final boolean casBusy()
  {
    return UNSAFE.compareAndSwapInt(this, busyOffset, 0, 1);
  }

  abstract long fn(long paramLong1, long paramLong2);

  final void internalReset(long paramLong)
  {
    Cell[] arrayOfCell = this.cells;
    this.base = paramLong;
    if (arrayOfCell != null)
    {
      int i = arrayOfCell.length;
      for (int j = 0; j < i; j++)
      {
        Cell localCell = arrayOfCell[j];
        if (localCell != null)
          localCell.value = paramLong;
      }
    }
  }

  final void retryUpdate(long paramLong, int[] paramArrayOfInt, boolean paramBoolean)
  {
    int i7;
    int i;
    label40: int j;
    if (paramArrayOfInt == null)
    {
      ThreadLocal localThreadLocal = threadHashCode;
      paramArrayOfInt = new int[1];
      localThreadLocal.set(paramArrayOfInt);
      i7 = rng.nextInt();
      if (i7 == 0)
      {
        i = 1;
        paramArrayOfInt[0] = i;
        j = 0;
      }
    }
    label183: label249: long l1;
    label318: 
    do
    {
      while (true)
      {
        Cell[] arrayOfCell1;
        int n;
        Cell localCell2;
        while (true)
        {
          arrayOfCell1 = this.cells;
          if (arrayOfCell1 == null)
            break label403;
          n = arrayOfCell1.length;
          if (n <= 0)
            break label403;
          localCell2 = arrayOfCell1[(i & n - 1)];
          if (localCell2 != null)
            break label249;
          if (this.busy == 0)
          {
            Cell localCell3 = new Cell(paramLong);
            if ((this.busy == 0) && (casBusy()))
              try
              {
                Cell[] arrayOfCell5 = this.cells;
                int i4 = 0;
                if (arrayOfCell5 != null)
                {
                  int i5 = arrayOfCell5.length;
                  i4 = 0;
                  if (i5 > 0)
                  {
                    int i6 = i & i5 - 1;
                    Cell localCell4 = arrayOfCell5[i6];
                    i4 = 0;
                    if (localCell4 == null)
                    {
                      arrayOfCell5[i6] = localCell3;
                      i4 = 1;
                    }
                  }
                }
                this.busy = 0;
                if (i4 != 0)
                {
                  return;
                  i = i7;
                  break;
                  i = paramArrayOfInt[0];
                  break label40;
                }
              }
              finally
              {
                this.busy = 0;
              }
          }
        }
        j = 0;
        do
          while (true)
          {
            int i1 = i ^ i << 13;
            int i2 = i1 ^ i1 >>> 17;
            i = i2 ^ i2 << 5;
            paramArrayOfInt[0] = i;
            break;
            if (!paramBoolean)
            {
              paramBoolean = true;
            }
            else
            {
              long l2 = localCell2.value;
              if (localCell2.cas(l2, fn(l2, paramLong)))
                break label183;
              if ((n >= NCPU) || (this.cells != arrayOfCell1))
              {
                j = 0;
              }
              else
              {
                if (j != 0)
                  break label318;
                j = 1;
              }
            }
          }
        while ((this.busy != 0) || (!casBusy()));
        try
        {
          if (this.cells == arrayOfCell1)
          {
            Cell[] arrayOfCell4 = new Cell[n << 1];
            for (int i3 = 0; i3 < n; i3++)
              arrayOfCell4[i3] = arrayOfCell1[i3];
            this.cells = arrayOfCell4;
          }
          this.busy = 0;
          j = 0;
          continue;
        }
        finally
        {
          this.busy = 0;
        }
        if ((this.busy == 0) && (this.cells == arrayOfCell1) && (casBusy()))
          try
          {
            Cell[] arrayOfCell2 = this.cells;
            int k = 0;
            if (arrayOfCell2 == arrayOfCell1)
            {
              Cell[] arrayOfCell3 = new Cell[2];
              int m = i & 0x1;
              Cell localCell1 = new Cell(paramLong);
              arrayOfCell3[m] = localCell1;
              this.cells = arrayOfCell3;
              k = 1;
            }
            this.busy = 0;
            if (k != 0)
              return;
          }
          finally
          {
            this.busy = 0;
          }
      }
      l1 = this.base;
    }
    while (!casBase(l1, fn(l1, paramLong)));
    label403:
  }

  static final class Cell
  {
    private static final Unsafe UNSAFE;
    private static final long valueOffset;
    volatile long p0;
    volatile long p1;
    volatile long p2;
    volatile long p3;
    volatile long p4;
    volatile long p5;
    volatile long p6;
    volatile long q0;
    volatile long q1;
    volatile long q2;
    volatile long q3;
    volatile long q4;
    volatile long q5;
    volatile long q6;
    volatile long value;

    static
    {
      try
      {
        UNSAFE = Striped64.access$000();
        valueOffset = UNSAFE.objectFieldOffset(Cell.class.getDeclaredField("value"));
        return;
      }
      catch (Exception localException)
      {
        throw new Error(localException);
      }
    }

    Cell(long paramLong)
    {
      this.value = paramLong;
    }

    final boolean cas(long paramLong1, long paramLong2)
    {
      return UNSAFE.compareAndSwapLong(this, valueOffset, paramLong1, paramLong2);
    }
  }
}