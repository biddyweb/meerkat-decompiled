package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import javax.annotation.Nullable;

@GwtCompatible
final class Hashing
{
  private static final int C1 = -862048943;
  private static final int C2 = 461845907;
  private static int MAX_TABLE_SIZE = 1073741824;

  static int closedTableSize(int paramInt, double paramDouble)
  {
    int i = Math.max(paramInt, 2);
    int j = Integer.highestOneBit(i);
    if (i > (int)(paramDouble * j))
    {
      int k = j << 1;
      if (k > 0)
        return k;
      return MAX_TABLE_SIZE;
    }
    return j;
  }

  static boolean needsResizing(int paramInt1, int paramInt2, double paramDouble)
  {
    return (paramInt1 > paramDouble * paramInt2) && (paramInt2 < MAX_TABLE_SIZE);
  }

  static int smear(int paramInt)
  {
    return 461845907 * Integer.rotateLeft(-862048943 * paramInt, 15);
  }

  static int smearedHash(@Nullable Object paramObject)
  {
    if (paramObject == null);
    for (int i = 0; ; i = paramObject.hashCode())
      return smear(i);
  }
}