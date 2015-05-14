package com.google.common.primitives;

import java.util.Comparator;

 enum Doubles$LexicographicalComparator
  implements Comparator<double[]>
{
  static
  {
    LexicographicalComparator[] arrayOfLexicographicalComparator = new LexicographicalComparator[1];
    arrayOfLexicographicalComparator[0] = INSTANCE;
  }

  public int compare(double[] paramArrayOfDouble1, double[] paramArrayOfDouble2)
  {
    int i = Math.min(paramArrayOfDouble1.length, paramArrayOfDouble2.length);
    for (int j = 0; j < i; j++)
    {
      int k = Double.compare(paramArrayOfDouble1[j], paramArrayOfDouble2[j]);
      if (k != 0)
        return k;
    }
    return paramArrayOfDouble1.length - paramArrayOfDouble2.length;
  }
}