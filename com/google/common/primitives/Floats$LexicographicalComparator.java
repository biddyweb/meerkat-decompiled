package com.google.common.primitives;

import java.util.Comparator;

 enum Floats$LexicographicalComparator
  implements Comparator<float[]>
{
  static
  {
    LexicographicalComparator[] arrayOfLexicographicalComparator = new LexicographicalComparator[1];
    arrayOfLexicographicalComparator[0] = INSTANCE;
  }

  public int compare(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2)
  {
    int i = Math.min(paramArrayOfFloat1.length, paramArrayOfFloat2.length);
    for (int j = 0; j < i; j++)
    {
      int k = Float.compare(paramArrayOfFloat1[j], paramArrayOfFloat2[j]);
      if (k != 0)
        return k;
    }
    return paramArrayOfFloat1.length - paramArrayOfFloat2.length;
  }
}