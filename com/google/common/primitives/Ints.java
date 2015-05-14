package com.google.common.primitives;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Converter;
import com.google.common.base.Preconditions;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.annotation.CheckForNull;

@GwtCompatible(emulated=true)
public final class Ints
{
  public static final int BYTES = 4;
  public static final int MAX_POWER_OF_TWO = 1073741824;
  private static final byte[] asciiDigits = new byte['\u0080'];

  static
  {
    Arrays.fill(asciiDigits, (byte)-1);
    for (int i = 0; i <= 9; i++)
      asciiDigits[(i + 48)] = ((byte)i);
    for (int j = 0; j <= 26; j++)
    {
      asciiDigits[(j + 65)] = ((byte)(j + 10));
      asciiDigits[(j + 97)] = ((byte)(j + 10));
    }
  }

  public static List<Integer> asList(int[] paramArrayOfInt)
  {
    if (paramArrayOfInt.length == 0)
      return Collections.emptyList();
    return new Ints.IntArrayAsList(paramArrayOfInt);
  }

  public static int checkedCast(long paramLong)
  {
    int i = (int)paramLong;
    if (i != paramLong)
      throw new IllegalArgumentException(34 + "Out of range: " + paramLong);
    return i;
  }

  public static int compare(int paramInt1, int paramInt2)
  {
    if (paramInt1 < paramInt2)
      return -1;
    if (paramInt1 > paramInt2)
      return 1;
    return 0;
  }

  public static int[] concat(int[][] paramArrayOfInt)
  {
    int i = 0;
    int j = paramArrayOfInt.length;
    for (int k = 0; k < j; k++)
      i += paramArrayOfInt[k].length;
    int[] arrayOfInt1 = new int[i];
    int m = 0;
    int n = paramArrayOfInt.length;
    for (int i1 = 0; i1 < n; i1++)
    {
      int[] arrayOfInt2 = paramArrayOfInt[i1];
      System.arraycopy(arrayOfInt2, 0, arrayOfInt1, m, arrayOfInt2.length);
      m += arrayOfInt2.length;
    }
    return arrayOfInt1;
  }

  public static boolean contains(int[] paramArrayOfInt, int paramInt)
  {
    int i = paramArrayOfInt.length;
    for (int j = 0; j < i; j++)
      if (paramArrayOfInt[j] == paramInt)
        return true;
    return false;
  }

  private static int[] copyOf(int[] paramArrayOfInt, int paramInt)
  {
    int[] arrayOfInt = new int[paramInt];
    System.arraycopy(paramArrayOfInt, 0, arrayOfInt, 0, Math.min(paramArrayOfInt.length, paramInt));
    return arrayOfInt;
  }

  private static int digit(char paramChar)
  {
    if (paramChar < '\u0080')
      return asciiDigits[paramChar];
    return -1;
  }

  public static int[] ensureCapacity(int[] paramArrayOfInt, int paramInt1, int paramInt2)
  {
    boolean bool1;
    if (paramInt1 >= 0)
    {
      bool1 = true;
      Object[] arrayOfObject1 = new Object[1];
      arrayOfObject1[0] = Integer.valueOf(paramInt1);
      Preconditions.checkArgument(bool1, "Invalid minLength: %s", arrayOfObject1);
      if (paramInt2 < 0)
        break label79;
    }
    label79: for (boolean bool2 = true; ; bool2 = false)
    {
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = Integer.valueOf(paramInt2);
      Preconditions.checkArgument(bool2, "Invalid padding: %s", arrayOfObject2);
      if (paramArrayOfInt.length < paramInt1)
        paramArrayOfInt = copyOf(paramArrayOfInt, paramInt1 + paramInt2);
      return paramArrayOfInt;
      bool1 = false;
      break;
    }
  }

  @GwtIncompatible("doesn't work")
  public static int fromByteArray(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte.length >= 4);
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Integer.valueOf(paramArrayOfByte.length);
      arrayOfObject[1] = Integer.valueOf(4);
      Preconditions.checkArgument(bool, "array too small: %s < %s", arrayOfObject);
      return fromBytes(paramArrayOfByte[0], paramArrayOfByte[1], paramArrayOfByte[2], paramArrayOfByte[3]);
    }
  }

  @GwtIncompatible("doesn't work")
  public static int fromBytes(byte paramByte1, byte paramByte2, byte paramByte3, byte paramByte4)
  {
    return paramByte1 << 24 | (paramByte2 & 0xFF) << 16 | (paramByte3 & 0xFF) << 8 | paramByte4 & 0xFF;
  }

  public static int hashCode(int paramInt)
  {
    return paramInt;
  }

  public static int indexOf(int[] paramArrayOfInt, int paramInt)
  {
    return indexOf(paramArrayOfInt, paramInt, 0, paramArrayOfInt.length);
  }

  private static int indexOf(int[] paramArrayOfInt, int paramInt1, int paramInt2, int paramInt3)
  {
    for (int i = paramInt2; i < paramInt3; i++)
      if (paramArrayOfInt[i] == paramInt1)
        return i;
    return -1;
  }

  public static int indexOf(int[] paramArrayOfInt1, int[] paramArrayOfInt2)
  {
    Preconditions.checkNotNull(paramArrayOfInt1, "array");
    Preconditions.checkNotNull(paramArrayOfInt2, "target");
    int i;
    if (paramArrayOfInt2.length == 0)
      i = 0;
    label74: 
    while (true)
    {
      return i;
      i = 0;
      if (i >= 1 + (paramArrayOfInt1.length - paramArrayOfInt2.length))
        break;
      for (int j = 0; ; j++)
      {
        if (j >= paramArrayOfInt2.length)
          break label74;
        if (paramArrayOfInt1[(i + j)] != paramArrayOfInt2[j])
        {
          i++;
          break;
        }
      }
    }
    return -1;
  }

  public static String join(String paramString, int[] paramArrayOfInt)
  {
    Preconditions.checkNotNull(paramString);
    if (paramArrayOfInt.length == 0)
      return "";
    StringBuilder localStringBuilder = new StringBuilder(5 * paramArrayOfInt.length);
    localStringBuilder.append(paramArrayOfInt[0]);
    for (int i = 1; i < paramArrayOfInt.length; i++)
      localStringBuilder.append(paramString).append(paramArrayOfInt[i]);
    return localStringBuilder.toString();
  }

  public static int lastIndexOf(int[] paramArrayOfInt, int paramInt)
  {
    return lastIndexOf(paramArrayOfInt, paramInt, 0, paramArrayOfInt.length);
  }

  private static int lastIndexOf(int[] paramArrayOfInt, int paramInt1, int paramInt2, int paramInt3)
  {
    for (int i = paramInt3 - 1; i >= paramInt2; i--)
      if (paramArrayOfInt[i] == paramInt1)
        return i;
    return -1;
  }

  public static Comparator<int[]> lexicographicalComparator()
  {
    return Ints.LexicographicalComparator.INSTANCE;
  }

  public static int max(int[] paramArrayOfInt)
  {
    if (paramArrayOfInt.length > 0);
    int i;
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool);
      i = paramArrayOfInt[0];
      for (int j = 1; j < paramArrayOfInt.length; j++)
        if (paramArrayOfInt[j] > i)
          i = paramArrayOfInt[j];
    }
    return i;
  }

  public static int min(int[] paramArrayOfInt)
  {
    if (paramArrayOfInt.length > 0);
    int i;
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool);
      i = paramArrayOfInt[0];
      for (int j = 1; j < paramArrayOfInt.length; j++)
        if (paramArrayOfInt[j] < i)
          i = paramArrayOfInt[j];
    }
    return i;
  }

  public static int saturatedCast(long paramLong)
  {
    if (paramLong > 2147483647L)
      return 2147483647;
    if (paramLong < -2147483648L)
      return -2147483648;
    return (int)paramLong;
  }

  @Beta
  public static Converter<String, Integer> stringConverter()
  {
    return Ints.IntConverter.INSTANCE;
  }

  public static int[] toArray(Collection<? extends Number> paramCollection)
  {
    int[] arrayOfInt;
    if ((paramCollection instanceof Ints.IntArrayAsList))
      arrayOfInt = ((Ints.IntArrayAsList)paramCollection).toIntArray();
    while (true)
    {
      return arrayOfInt;
      Object[] arrayOfObject = paramCollection.toArray();
      int i = arrayOfObject.length;
      arrayOfInt = new int[i];
      for (int j = 0; j < i; j++)
        arrayOfInt[j] = ((Number)Preconditions.checkNotNull(arrayOfObject[j])).intValue();
    }
  }

  @GwtIncompatible("doesn't work")
  public static byte[] toByteArray(int paramInt)
  {
    byte[] arrayOfByte = new byte[4];
    arrayOfByte[0] = ((byte)(paramInt >> 24));
    arrayOfByte[1] = ((byte)(paramInt >> 16));
    arrayOfByte[2] = ((byte)(paramInt >> 8));
    arrayOfByte[3] = ((byte)paramInt);
    return arrayOfByte;
  }

  @CheckForNull
  @Beta
  public static Integer tryParse(String paramString)
  {
    return tryParse(paramString, 10);
  }

  @CheckForNull
  static Integer tryParse(String paramString, int paramInt)
  {
    int i = 1;
    if (((String)Preconditions.checkNotNull(paramString)).isEmpty())
      return null;
    if ((paramInt < 2) || (paramInt > 36))
      throw new IllegalArgumentException(65 + "radix must be between MIN_RADIX and MAX_RADIX but was " + paramInt);
    int j;
    if (paramString.charAt(0) == '-')
    {
      j = i;
      if (j == 0)
        break label88;
    }
    while (true)
    {
      if (i != paramString.length())
        break label93;
      return null;
      j = 0;
      break;
      label88: i = 0;
    }
    label93: int k = i + 1;
    int m = digit(paramString.charAt(i));
    if ((m < 0) || (m >= paramInt))
      return null;
    int n = -m;
    int i1 = -2147483648 / paramInt;
    int i3;
    for (int i2 = k; i2 < paramString.length(); i2 = i3)
    {
      i3 = i2 + 1;
      int i4 = digit(paramString.charAt(i2));
      if ((i4 < 0) || (i4 >= paramInt) || (n < i1))
        return null;
      int i5 = n * paramInt;
      if (i5 < -2147483648 + i4)
        return null;
      n = i5 - i4;
    }
    if (j != 0)
      return Integer.valueOf(n);
    if (n == -2147483648)
      return null;
    return Integer.valueOf(-n);
  }
}