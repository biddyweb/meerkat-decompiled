package com.twitter.sdk.android.tweetui;

import com.twitter.sdk.android.core.internal.scribe.EventNamespace;
import com.twitter.sdk.android.core.internal.scribe.ScribeEvent;
import com.twitter.sdk.android.core.internal.scribe.SyndicatedSdkImpressionEvent;

class ScribeEventFactory
{
  static ScribeEvent newScribeEvent(EventNamespace paramEventNamespace, long paramLong, String paramString1, String paramString2)
  {
    String str = paramEventNamespace.client;
    int i = -1;
    switch (str.hashCode())
    {
    default:
    case 114757:
    }
    while (true)
      switch (i)
      {
      default:
        return new SyndicatedSdkImpressionEvent(paramEventNamespace, paramLong, paramString1, paramString2);
        if (str.equals("tfw"))
          i = 0;
        break;
      case 0:
      }
    return new SyndicationClientEvent(paramEventNamespace, paramLong, paramString1, paramString2);
  }
}