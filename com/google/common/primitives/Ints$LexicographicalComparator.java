package com.google.common.primitives;

import java.util.Comparator;

 enum Ints$LexicographicalComparator
  implements Comparator<int[]>
{
  static
  {
    LexicographicalComparator[] arrayOfLexicographicalComparator = new LexicographicalComparator[1];
    arrayOfLexicographicalComparator[0] = INSTANCE;
  }

  public int compare(int[] paramArrayOfInt1, int[] paramArrayOfInt2)
  {
    int i = Math.min(paramArrayOfInt1.length, paramArrayOfInt2.length);
    for (int j = 0; j < i; j++)
    {
      int k = Ints.compare(paramArrayOfInt1[j], paramArrayOfInt2[j]);
      if (k != 0)
        return k;
    }
    return paramArrayOfInt1.length - paramArrayOfInt2.length;
  }
}