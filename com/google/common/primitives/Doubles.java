package com.google.common.primitives;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Converter;
import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true)
public final class Doubles
{
  public static final int BYTES = 8;

  @GwtIncompatible("regular expressions")
  static final Pattern FLOATING_POINT_PATTERN = fpPattern();

  public static List<Double> asList(double[] paramArrayOfDouble)
  {
    if (paramArrayOfDouble.length == 0)
      return Collections.emptyList();
    return new Doubles.DoubleArrayAsList(paramArrayOfDouble);
  }

  public static int compare(double paramDouble1, double paramDouble2)
  {
    return Double.compare(paramDouble1, paramDouble2);
  }

  public static double[] concat(double[][] paramArrayOfDouble)
  {
    int i = 0;
    int j = paramArrayOfDouble.length;
    for (int k = 0; k < j; k++)
      i += paramArrayOfDouble[k].length;
    double[] arrayOfDouble1 = new double[i];
    int m = 0;
    int n = paramArrayOfDouble.length;
    for (int i1 = 0; i1 < n; i1++)
    {
      double[] arrayOfDouble2 = paramArrayOfDouble[i1];
      System.arraycopy(arrayOfDouble2, 0, arrayOfDouble1, m, arrayOfDouble2.length);
      m += arrayOfDouble2.length;
    }
    return arrayOfDouble1;
  }

  public static boolean contains(double[] paramArrayOfDouble, double paramDouble)
  {
    int i = paramArrayOfDouble.length;
    for (int j = 0; j < i; j++)
      if (paramArrayOfDouble[j] == paramDouble)
        return true;
    return false;
  }

  private static double[] copyOf(double[] paramArrayOfDouble, int paramInt)
  {
    double[] arrayOfDouble = new double[paramInt];
    System.arraycopy(paramArrayOfDouble, 0, arrayOfDouble, 0, Math.min(paramArrayOfDouble.length, paramInt));
    return arrayOfDouble;
  }

  public static double[] ensureCapacity(double[] paramArrayOfDouble, int paramInt1, int paramInt2)
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
      if (paramArrayOfDouble.length < paramInt1)
        paramArrayOfDouble = copyOf(paramArrayOfDouble, paramInt1 + paramInt2);
      return paramArrayOfDouble;
      bool1 = false;
      break;
    }
  }

  @GwtIncompatible("regular expressions")
  private static Pattern fpPattern()
  {
    String str1 = String.valueOf("(?:\\d++(?:\\.\\d*+)?|\\.\\d++)").concat("(?:[eE][+-]?\\d++)?[fFdD]?");
    String str2 = String.valueOf(String.valueOf("(?:\\p{XDigit}++(?:\\.\\p{XDigit}*+)?|\\.\\p{XDigit}++)"));
    String str3 = 25 + str2.length() + "0[xX]" + str2 + "[pP][+-]?\\d++[fFdD]?";
    String str4 = String.valueOf(String.valueOf(str1));
    String str5 = String.valueOf(String.valueOf(str3));
    return Pattern.compile(23 + str4.length() + str5.length() + "[+-]?(?:NaN|Infinity|" + str4 + "|" + str5 + ")");
  }

  public static int hashCode(double paramDouble)
  {
    return Double.valueOf(paramDouble).hashCode();
  }

  public static int indexOf(double[] paramArrayOfDouble, double paramDouble)
  {
    return indexOf(paramArrayOfDouble, paramDouble, 0, paramArrayOfDouble.length);
  }

  private static int indexOf(double[] paramArrayOfDouble, double paramDouble, int paramInt1, int paramInt2)
  {
    for (int i = paramInt1; i < paramInt2; i++)
      if (paramArrayOfDouble[i] == paramDouble)
        return i;
    return -1;
  }

  public static int indexOf(double[] paramArrayOfDouble1, double[] paramArrayOfDouble2)
  {
    Preconditions.checkNotNull(paramArrayOfDouble1, "array");
    Preconditions.checkNotNull(paramArrayOfDouble2, "target");
    int i;
    if (paramArrayOfDouble2.length == 0)
      i = 0;
    label75: 
    while (true)
    {
      return i;
      i = 0;
      if (i >= 1 + (paramArrayOfDouble1.length - paramArrayOfDouble2.length))
        break;
      for (int j = 0; ; j++)
      {
        if (j >= paramArrayOfDouble2.length)
          break label75;
        if (paramArrayOfDouble1[(i + j)] != paramArrayOfDouble2[j])
        {
          i++;
          break;
        }
      }
    }
    return -1;
  }

  public static boolean isFinite(double paramDouble)
  {
    int i = 1;
    int j;
    if ((-1.0D / 0.0D) < paramDouble)
    {
      j = i;
      if (paramDouble >= (1.0D / 0.0D))
        break label29;
    }
    while (true)
    {
      return i & j;
      j = 0;
      break;
      label29: i = 0;
    }
  }

  public static String join(String paramString, double[] paramArrayOfDouble)
  {
    Preconditions.checkNotNull(paramString);
    if (paramArrayOfDouble.length == 0)
      return "";
    StringBuilder localStringBuilder = new StringBuilder(12 * paramArrayOfDouble.length);
    localStringBuilder.append(paramArrayOfDouble[0]);
    for (int i = 1; i < paramArrayOfDouble.length; i++)
      localStringBuilder.append(paramString).append(paramArrayOfDouble[i]);
    return localStringBuilder.toString();
  }

  public static int lastIndexOf(double[] paramArrayOfDouble, double paramDouble)
  {
    return lastIndexOf(paramArrayOfDouble, paramDouble, 0, paramArrayOfDouble.length);
  }

  private static int lastIndexOf(double[] paramArrayOfDouble, double paramDouble, int paramInt1, int paramInt2)
  {
    for (int i = paramInt2 - 1; i >= paramInt1; i--)
      if (paramArrayOfDouble[i] == paramDouble)
        return i;
    return -1;
  }

  public static Comparator<double[]> lexicographicalComparator()
  {
    return Doubles.LexicographicalComparator.INSTANCE;
  }

  public static double max(double[] paramArrayOfDouble)
  {
    if (paramArrayOfDouble.length > 0);
    double d;
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool);
      d = paramArrayOfDouble[0];
      for (int i = 1; i < paramArrayOfDouble.length; i++)
        d = Math.max(d, paramArrayOfDouble[i]);
    }
    return d;
  }

  public static double min(double[] paramArrayOfDouble)
  {
    if (paramArrayOfDouble.length > 0);
    double d;
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool);
      d = paramArrayOfDouble[0];
      for (int i = 1; i < paramArrayOfDouble.length; i++)
        d = Math.min(d, paramArrayOfDouble[i]);
    }
    return d;
  }

  @Beta
  public static Converter<String, Double> stringConverter()
  {
    return Doubles.DoubleConverter.INSTANCE;
  }

  public static double[] toArray(Collection<? extends Number> paramCollection)
  {
    double[] arrayOfDouble;
    if ((paramCollection instanceof Doubles.DoubleArrayAsList))
      arrayOfDouble = ((Doubles.DoubleArrayAsList)paramCollection).toDoubleArray();
    while (true)
    {
      return arrayOfDouble;
      Object[] arrayOfObject = paramCollection.toArray();
      int i = arrayOfObject.length;
      arrayOfDouble = new double[i];
      for (int j = 0; j < i; j++)
        arrayOfDouble[j] = ((Number)Preconditions.checkNotNull(arrayOfObject[j])).doubleValue();
    }
  }

  @Nullable
  @Beta
  @GwtIncompatible("regular expressions")
  public static Double tryParse(String paramString)
  {
    if (FLOATING_POINT_PATTERN.matcher(paramString).matches())
      try
      {
        Double localDouble = Double.valueOf(Double.parseDouble(paramString));
        return localDouble;
      }
      catch (NumberFormatException localNumberFormatException)
      {
      }
    return null;
  }
}