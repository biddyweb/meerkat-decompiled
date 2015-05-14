package com.twitter.sdk.android.tweetui;

import com.twitter.sdk.android.core.models.Tweet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

final class Utils
{
  static CharSequence charSeqOrDefault(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    if (paramCharSequence1 != null)
      return paramCharSequence1;
    return paramCharSequence2;
  }

  static CharSequence charSeqOrEmpty(CharSequence paramCharSequence)
  {
    return charSeqOrDefault(paramCharSequence, "");
  }

  static Long numberOrDefault(String paramString, long paramLong)
  {
    try
    {
      Long localLong = Long.valueOf(Long.parseLong(paramString));
      return localLong;
    }
    catch (NumberFormatException localNumberFormatException)
    {
    }
    return Long.valueOf(paramLong);
  }

  static List<Tweet> orderTweets(List<Long> paramList, List<Tweet> paramList1)
  {
    HashMap localHashMap = new HashMap();
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator1 = paramList1.iterator();
    while (localIterator1.hasNext())
    {
      Tweet localTweet = (Tweet)localIterator1.next();
      localHashMap.put(Long.valueOf(localTweet.id), localTweet);
    }
    Iterator localIterator2 = paramList.iterator();
    while (localIterator2.hasNext())
    {
      Long localLong = (Long)localIterator2.next();
      if (localHashMap.containsKey(localLong))
        localArrayList.add(localHashMap.get(localLong));
    }
    return localArrayList;
  }

  static String stringOrDefault(String paramString1, String paramString2)
  {
    if (paramString1 != null)
      return paramString1;
    return paramString2;
  }

  static String stringOrEmpty(String paramString)
  {
    return stringOrDefault(paramString, "");
  }
}