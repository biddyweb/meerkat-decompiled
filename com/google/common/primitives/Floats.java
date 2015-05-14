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
public final class Floats
{
  public static final int BYTES = 4;

  public static List<Float> asList(float[] paramArrayOfFloat)
  {
    if (paramArrayOfFloat.length == 0)
      return Collections.emptyList();
    return new Floats.FloatArrayAsList(paramArrayOfFloat);
  }

  public static int compare(float paramFloat1, float paramFloat2)
  {
    return Float.compare(paramFloat1, paramFloat2);
  }

  public static float[] concat(float[][] paramArrayOfFloat)
  {
    int i = 0;
    int j = paramArrayOfFloat.length;
    for (int k = 0; k < j; k++)
      i += paramArrayOfFloat[k].length;
    float[] arrayOfFloat1 = new float[i];
    int m = 0;
    int n = paramArrayOfFloat.length;
    for (int i1 = 0; i1 < n; i1++)
    {
      float[] arrayOfFloat2 = paramArrayOfFloat[i1];
      System.arraycopy(arrayOfFloat2, 0, arrayOfFloat1, m, arrayOfFloat2.length);
      m += arrayOfFloat2.length;
    }
    return arrayOfFloat1;
  }

  public static boolean contains(float[] paramArrayOfFloat, float paramFloat)
  {
    int i = paramArrayOfFloat.length;
    for (int j = 0; j < i; j++)
      if (paramArrayOfFloat[j] == paramFloat)
        return true;
    return false;
  }

  private static float[] copyOf(float[] paramArrayOfFloat, int paramInt)
  {
    float[] arrayOfFloat = new float[paramInt];
    System.arraycopy(paramArrayOfFloat, 0, arrayOfFloat, 0, Math.min(paramArrayOfFloat.length, paramInt));
    return arrayOfFloat;
  }

  public static float[] ensureCapacity(float[] paramArrayOfFloat, int paramInt1, int paramInt2)
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
      if (paramArrayOfFloat.length < paramInt1)
        paramArrayOfFloat = copyOf(paramArrayOfFloat, paramInt1 + paramInt2);
      return paramArrayOfFloat;
      bool1 = false;
      break;
    }
  }

  public static int hashCode(float paramFloat)
  {
    return Float.valueOf(paramFloat).hashCode();
  }

  public static int indexOf(float[] paramArrayOfFloat, float paramFloat)
  {
    return indexOf(paramArrayOfFloat, paramFloat, 0, paramArrayOfFloat.length);
  }

  private static int indexOf(float[] paramArrayOfFloat, float paramFloat, int paramInt1, int paramInt2)
  {
    for (int i = paramInt1; i < paramInt2; i++)
      if (paramArrayOfFloat[i] == paramFloat)
        return i;
    return -1;
  }

  public static int indexOf(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2)
  {
    Preconditions.checkNotNull(paramArrayOfFloat1, "array");
    Preconditions.checkNotNull(paramArrayOfFloat2, "target");
    int i;
    if (paramArrayOfFloat2.length == 0)
      i = 0;
    label75: 
    while (true)
    {
      return i;
      i = 0;
      if (i >= 1 + (paramArrayOfFloat1.length - paramArrayOfFloat2.length))
        break;
      for (int j = 0; ; j++)
      {
        if (j >= paramArrayOfFloat2.length)
          break label75;
        if (paramArrayOfFloat1[(i + j)] != paramArrayOfFloat2[j])
        {
          i++;
          break;
        }
      }
    }
    return -1;
  }

  public static boolean isFinite(float paramFloat)
  {
    int i = 1;
    int j;
    if ((1.0F / -1.0F) < paramFloat)
    {
      j = i;
      if (paramFloat >= (1.0F / 1.0F))
        break label27;
    }
    while (true)
    {
      return i & j;
      j = 0;
      break;
      label27: i = 0;
    }
  }

  public static String join(String paramString, float[] paramArrayOfFloat)
  {
    Preconditions.checkNotNull(paramString);
    if (paramArrayOfFloat.length == 0)
      return "";
    StringBuilder localStringBuilder = new StringBuilder(12 * paramArrayOfFloat.length);
    localStringBuilder.append(paramArrayOfFloat[0]);
    for (int i = 1; i < paramArrayOfFloat.length; i++)
      localStringBuilder.append(paramString).append(paramArrayOfFloat[i]);
    return localStringBuilder.toString();
  }

  public static int lastIndexOf(float[] paramArrayOfFloat, float paramFloat)
  {
    return lastIndexOf(paramArrayOfFloat, paramFloat, 0, paramArrayOfFloat.length);
  }

  private static int lastIndexOf(float[] paramArrayOfFloat, float paramFloat, int paramInt1, int paramInt2)
  {
    for (int i = paramInt2 - 1; i >= paramInt1; i--)
      if (paramArrayOfFloat[i] == paramFloat)
        return i;
    return -1;
  }

  public static Comparator<float[]> lexicographicalComparator()
  {
    return Floats.LexicographicalComparator.INSTANCE;
  }

  public static float max(float[] paramArrayOfFloat)
  {
    if (paramArrayOfFloat.length > 0);
    float f;
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool);
      f = paramArrayOfFloat[0];
      for (int i = 1; i < paramArrayOfFloat.length; i++)
        f = Math.max(f, paramArrayOfFloat[i]);
    }
    return f;
  }

  public static float min(float[] paramArrayOfFloat)
  {
    if (paramArrayOfFloat.length > 0);
    float f;
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool);
      f = paramArrayOfFloat[0];
      for (int i = 1; i < paramArrayOfFloat.length; i++)
        f = Math.min(f, paramArrayOfFloat[i]);
    }
    return f;
  }

  @Beta
  public static Converter<String, Float> stringConverter()
  {
    return Floats.FloatConverter.INSTANCE;
  }

  public static float[] toArray(Collection<? extends Number> paramCollection)
  {
    float[] arrayOfFloat;
    if ((paramCollection instanceof Floats.FloatArrayAsList))
      arrayOfFloat = ((Floats.FloatArrayAsList)paramCollection).toFloatArray();
    while (true)
    {
      return arrayOfFloat;
      Object[] arrayOfObject = paramCollection.toArray();
      int i = arrayOfObject.length;
      arrayOfFloat = new float[i];
      for (int j = 0; j < i; j++)
        arrayOfFloat[j] = ((Number)Preconditions.checkNotNull(arrayOfObject[j])).floatValue();
    }
  }

  @Nullable
  @Beta
  @GwtIncompatible("regular expressions")
  public static Float tryParse(String paramString)
  {
    if (Doubles.FLOATING_POINT_PATTERN.matcher(paramString).matches())
      try
      {
        Float localFloat = Float.valueOf(Float.parseFloat(paramString));
        return localFloat;
      }
      catch (NumberFormatException localNumberFormatException)
      {
      }
    return null;
  }
}