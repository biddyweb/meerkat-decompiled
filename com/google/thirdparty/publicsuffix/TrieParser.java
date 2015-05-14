package com.google.thirdparty.publicsuffix;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Joiner;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;
import com.google.common.collect.Lists;
import java.util.List;

@GwtCompatible
class TrieParser
{
  private static final Joiner PREFIX_JOINER = Joiner.on("");

  private static int doParseTrieToBuilder(List<CharSequence> paramList, CharSequence paramCharSequence, ImmutableMap.Builder<String, PublicSuffixType> paramBuilder)
  {
    int i = paramCharSequence.length();
    int j = 0;
    char c = '\000';
    while (true)
    {
      if (j < i)
      {
        c = paramCharSequence.charAt(j);
        if ((c != '&') && (c != '?') && (c != '!') && (c != ':') && (c != ','));
      }
      else
      {
        paramList.add(0, reverse(paramCharSequence.subSequence(0, j)));
        if ((c == '!') || (c == '?') || (c == ':') || (c == ','))
        {
          String str = PREFIX_JOINER.join(paramList);
          if (str.length() > 0)
            paramBuilder.put(str, PublicSuffixType.fromCode(c));
        }
        for (int k = j + 1; (c != '?') && (c != ',') && (k < i); k++)
        {
          label160: k += doParseTrieToBuilder(paramList, paramCharSequence.subSequence(k, i), paramBuilder);
          if ((paramCharSequence.charAt(k) != '?') && (paramCharSequence.charAt(k) != ','))
            break label160;
        }
        paramList.remove(0);
        return k;
      }
      j++;
    }
  }

  static ImmutableMap<String, PublicSuffixType> parseTrie(CharSequence paramCharSequence)
  {
    ImmutableMap.Builder localBuilder = ImmutableMap.builder();
    int i = paramCharSequence.length();
    int j = 0;
    while (j < i)
      j += doParseTrieToBuilder(Lists.newLinkedList(), paramCharSequence.subSequence(j, i), localBuilder);
    return localBuilder.build();
  }

  private static CharSequence reverse(CharSequence paramCharSequence)
  {
    int i = paramCharSequence.length();
    if (i <= 1)
      return paramCharSequence;
    char[] arrayOfChar = new char[i];
    arrayOfChar[0] = paramCharSequence.charAt(i - 1);
    for (int j = 1; j < i; j++)
    {
      arrayOfChar[j] = paramCharSequence.charAt(i - 1 - j);
      if (Character.isSurrogatePair(arrayOfChar[j], arrayOfChar[(j - 1)]))
        swap(arrayOfChar, j - 1, j);
    }
    return new String(arrayOfChar);
  }

  private static void swap(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    int i = paramArrayOfChar[paramInt1];
    paramArrayOfChar[paramInt1] = paramArrayOfChar[paramInt2];
    paramArrayOfChar[paramInt2] = i;
  }
}