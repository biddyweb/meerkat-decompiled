package com.google.common.escape;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import java.lang.reflect.Array;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

@Beta
@GwtCompatible
public final class ArrayBasedEscaperMap
{
  private static final char[][] EMPTY_REPLACEMENT_ARRAY = (char[][])Array.newInstance(Character.TYPE, arrayOfInt);
  private final char[][] replacementArray;

  static
  {
    int[] arrayOfInt = { 0, 0 };
  }

  private ArrayBasedEscaperMap(char[][] paramArrayOfChar)
  {
    this.replacementArray = paramArrayOfChar;
  }

  public static ArrayBasedEscaperMap create(Map<Character, String> paramMap)
  {
    return new ArrayBasedEscaperMap(createReplacementArray(paramMap));
  }

  @VisibleForTesting
  static char[][] createReplacementArray(Map<Character, String> paramMap)
  {
    Preconditions.checkNotNull(paramMap);
    Object localObject;
    if (paramMap.isEmpty())
      localObject = EMPTY_REPLACEMENT_ARRAY;
    while (true)
    {
      return localObject;
      localObject = new char['\001' + ((Character)Collections.max(paramMap.keySet())).charValue()][];
      Iterator localIterator = paramMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        char c = ((Character)localIterator.next()).charValue();
        localObject[c] = ((String)paramMap.get(Character.valueOf(c))).toCharArray();
      }
    }
  }

  char[][] getReplacementArray()
  {
    return this.replacementArray;
  }
}