package com.google.common.escape;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.Map;

@Beta
@GwtCompatible
public abstract class ArrayBasedCharEscaper extends CharEscaper
{
  private final char[][] replacements;
  private final int replacementsLength;
  private final char safeMax;
  private final char safeMin;

  protected ArrayBasedCharEscaper(ArrayBasedEscaperMap paramArrayBasedEscaperMap, char paramChar1, char paramChar2)
  {
    Preconditions.checkNotNull(paramArrayBasedEscaperMap);
    this.replacements = paramArrayBasedEscaperMap.getReplacementArray();
    this.replacementsLength = this.replacements.length;
    if (paramChar2 < paramChar1)
    {
      paramChar2 = '\000';
      paramChar1 = 65535;
    }
    this.safeMin = paramChar1;
    this.safeMax = paramChar2;
  }

  protected ArrayBasedCharEscaper(Map<Character, String> paramMap, char paramChar1, char paramChar2)
  {
    this(ArrayBasedEscaperMap.create(paramMap), paramChar1, paramChar2);
  }

  public final String escape(String paramString)
  {
    Preconditions.checkNotNull(paramString);
    for (int i = 0; ; i++)
      if (i < paramString.length())
      {
        int j = paramString.charAt(i);
        if (((j < this.replacementsLength) && (this.replacements[j] != null)) || (j > this.safeMax) || (j < this.safeMin))
          paramString = escapeSlow(paramString, i);
      }
      else
      {
        return paramString;
      }
  }

  protected final char[] escape(char paramChar)
  {
    if (paramChar < this.replacementsLength)
    {
      char[] arrayOfChar = this.replacements[paramChar];
      if (arrayOfChar != null)
        return arrayOfChar;
    }
    if ((paramChar >= this.safeMin) && (paramChar <= this.safeMax))
      return null;
    return escapeUnsafe(paramChar);
  }

  protected abstract char[] escapeUnsafe(char paramChar);
}