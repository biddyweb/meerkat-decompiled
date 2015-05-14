package com.google.common.escape;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.Map;
import javax.annotation.Nullable;

@Beta
@GwtCompatible
public abstract class ArrayBasedUnicodeEscaper extends UnicodeEscaper
{
  private final char[][] replacements;
  private final int replacementsLength;
  private final int safeMax;
  private final char safeMaxChar;
  private final int safeMin;
  private final char safeMinChar;

  protected ArrayBasedUnicodeEscaper(ArrayBasedEscaperMap paramArrayBasedEscaperMap, int paramInt1, int paramInt2, @Nullable String paramString)
  {
    Preconditions.checkNotNull(paramArrayBasedEscaperMap);
    this.replacements = paramArrayBasedEscaperMap.getReplacementArray();
    this.replacementsLength = this.replacements.length;
    if (paramInt2 < paramInt1)
    {
      paramInt2 = -1;
      paramInt1 = 2147483647;
    }
    this.safeMin = paramInt1;
    this.safeMax = paramInt2;
    if (paramInt1 >= 55296)
    {
      this.safeMinChar = 65535;
      this.safeMaxChar = '\000';
      return;
    }
    this.safeMinChar = ((char)paramInt1);
    this.safeMaxChar = ((char)Math.min(paramInt2, 55295));
  }

  protected ArrayBasedUnicodeEscaper(Map<Character, String> paramMap, int paramInt1, int paramInt2, @Nullable String paramString)
  {
    this(ArrayBasedEscaperMap.create(paramMap), paramInt1, paramInt2, paramString);
  }

  public final String escape(String paramString)
  {
    Preconditions.checkNotNull(paramString);
    for (int i = 0; ; i++)
      if (i < paramString.length())
      {
        int j = paramString.charAt(i);
        if (((j < this.replacementsLength) && (this.replacements[j] != null)) || (j > this.safeMaxChar) || (j < this.safeMinChar))
          paramString = escapeSlow(paramString, i);
      }
      else
      {
        return paramString;
      }
  }

  protected final char[] escape(int paramInt)
  {
    if (paramInt < this.replacementsLength)
    {
      char[] arrayOfChar = this.replacements[paramInt];
      if (arrayOfChar != null)
        return arrayOfChar;
    }
    if ((paramInt >= this.safeMin) && (paramInt <= this.safeMax))
      return null;
    return escapeUnsafe(paramInt);
  }

  protected abstract char[] escapeUnsafe(int paramInt);

  protected final int nextEscapeIndex(CharSequence paramCharSequence, int paramInt1, int paramInt2)
  {
    while (true)
    {
      if (paramInt1 < paramInt2)
      {
        int i = paramCharSequence.charAt(paramInt1);
        if (((i >= this.replacementsLength) || (this.replacements[i] == null)) && (i <= this.safeMaxChar) && (i >= this.safeMinChar));
      }
      else
      {
        return paramInt1;
      }
      paramInt1++;
    }
  }
}