package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;

@Beta
@GwtCompatible
public final class Utf8
{
  public static int encodedLength(CharSequence paramCharSequence)
  {
    int i = paramCharSequence.length();
    int j = i;
    for (int k = 0; (k < i) && (paramCharSequence.charAt(k) < '\u0080'); k++);
    while (k < i)
    {
      int m = paramCharSequence.charAt(k);
      if (m < 2048)
      {
        j += (127 - m >>> 31);
        k++;
      }
      else
      {
        j += encodedLengthGeneral(paramCharSequence, k);
      }
    }
    if (j < i)
    {
      long l = 4294967296L + j;
      throw new IllegalArgumentException(54 + "UTF-8 length does not fit in int: " + l);
    }
    return j;
  }

  private static int encodedLengthGeneral(CharSequence paramCharSequence, int paramInt)
  {
    int i = paramCharSequence.length();
    int j = 0;
    int k = paramInt;
    if (k < i)
    {
      int m = paramCharSequence.charAt(k);
      if (m < 2048)
        j += (127 - m >>> 31);
      while (true)
      {
        k++;
        break;
        j += 2;
        if ((55296 <= m) && (m <= 57343))
        {
          if (Character.codePointAt(paramCharSequence, k) < 65536)
            throw new IllegalArgumentException(39 + "Unpaired surrogate at index " + k);
          k++;
        }
      }
    }
    return j;
  }

  public static boolean isWellFormed(byte[] paramArrayOfByte)
  {
    return isWellFormed(paramArrayOfByte, 0, paramArrayOfByte.length);
  }

  public static boolean isWellFormed(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int i = paramInt1 + paramInt2;
    Preconditions.checkPositionIndexes(paramInt1, i, paramArrayOfByte.length);
    for (int j = paramInt1; j < i; j++)
      if (paramArrayOfByte[j] < 0)
        return isWellFormedSlowPath(paramArrayOfByte, j, i);
    return true;
  }

  private static boolean isWellFormedSlowPath(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int i = paramInt1;
    while (true)
    {
      boolean bool;
      if (i >= paramInt2)
        bool = true;
      label12: int j;
      int k;
      int m;
      label71: int n;
      int i7;
      do
      {
        do
        {
          do
          {
            return bool;
            j = i + 1;
            k = paramArrayOfByte[i];
            if (k >= 0)
              break label268;
            if (k >= -32)
              break;
            bool = false;
          }
          while (j == paramInt2);
          bool = false;
        }
        while (k < -62);
        m = j + 1;
        if (paramArrayOfByte[j] <= -65)
          break label261;
        int i6;
        do
        {
          return false;
          if (k >= -16)
            break label173;
          int i5 = j + 1;
          bool = false;
          if (i5 >= paramInt2)
            break;
          m = j + 1;
          i6 = paramArrayOfByte[j];
        }
        while ((i6 > -65) || ((k == -32) && (i6 < -96)) || ((k == -19) && (-96 <= i6)));
        n = m + 1;
        i7 = paramArrayOfByte[m];
        bool = false;
      }
      while (i7 > -65);
      while (true)
      {
        i = n;
        break;
        label173: int i1 = j + 2;
        bool = false;
        if (i1 >= paramInt2)
          break label12;
        m = j + 1;
        int i2 = paramArrayOfByte[j];
        if ((i2 > -65) || ((k << 28) + (i2 + 112) >> 30 != 0))
          break label71;
        int i3 = m + 1;
        int i4 = paramArrayOfByte[m];
        bool = false;
        if (i4 > -65)
          break label12;
        m = i3 + 1;
        if (paramArrayOfByte[i3] > -65)
          break label71;
        label261: n = m;
      }
      label268: i = j;
    }
  }
}