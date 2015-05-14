package com.twitter.sdk.android.tweetui;

import android.text.TextUtils;
import com.twitter.sdk.android.core.models.MediaEntity;
import com.twitter.sdk.android.core.models.Tweet;
import com.twitter.sdk.android.core.models.TweetEntities;
import com.twitter.sdk.android.core.models.UrlEntity;
import com.twitter.sdk.android.tweetui.internal.util.HtmlEntities;
import com.twitter.sdk.android.tweetui.internal.util.HtmlEntities.Unescaped;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

final class TweetTextUtils
{
  private static final String PHOTO_TYPE = "photo";

  static void adjustEntitiesWithOffsets(List<? extends FormattedUrlEntity> paramList, List<Integer> paramList1)
  {
    if ((paramList == null) || (paramList1 == null));
    while (true)
    {
      return;
      Iterator localIterator1 = paramList.iterator();
      while (localIterator1.hasNext())
      {
        FormattedUrlEntity localFormattedUrlEntity = (FormattedUrlEntity)localIterator1.next();
        int i = localFormattedUrlEntity.start;
        int j = 0;
        Iterator localIterator2 = paramList1.iterator();
        while ((localIterator2.hasNext()) && (((Integer)localIterator2.next()).intValue() - j <= i))
          j++;
        localFormattedUrlEntity.start = (j + localFormattedUrlEntity.start);
        localFormattedUrlEntity.end = (j + localFormattedUrlEntity.end);
      }
    }
  }

  static void adjustIndicesForEscapedChars(List<? extends FormattedUrlEntity> paramList, List<int[]> paramList1)
  {
    if ((paramList == null) || (paramList1 == null) || (paramList1.isEmpty()));
    while (true)
    {
      return;
      int i = paramList1.size();
      int j = 0;
      int k = 0;
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        FormattedUrlEntity localFormattedUrlEntity = (FormattedUrlEntity)localIterator.next();
        int m = 0;
        int n = j;
        if (n < i)
        {
          int[] arrayOfInt = (int[])paramList1.get(n);
          int i1 = arrayOfInt[0];
          int i2 = arrayOfInt[1];
          int i3 = i2 - i1;
          if (i2 < localFormattedUrlEntity.start)
          {
            k += i3;
            j++;
          }
          while (true)
          {
            n++;
            break;
            if (i2 < localFormattedUrlEntity.end)
              m += i3;
          }
        }
        localFormattedUrlEntity.start -= k;
        localFormattedUrlEntity.end -= k + m;
      }
    }
  }

  static void adjustIndicesForSupplementaryChars(StringBuilder paramStringBuilder, FormattedTweetText paramFormattedTweetText)
  {
    ArrayList localArrayList = new ArrayList();
    int i = -1 + paramStringBuilder.length();
    for (int j = 0; j < i; j++)
      if ((Character.isHighSurrogate(paramStringBuilder.charAt(j))) && (Character.isLowSurrogate(paramStringBuilder.charAt(j + 1))))
        localArrayList.add(Integer.valueOf(j));
    adjustEntitiesWithOffsets(paramFormattedTweetText.urlEntities, localArrayList);
    adjustEntitiesWithOffsets(paramFormattedTweetText.mediaEntities, localArrayList);
  }

  static void convertEntities(FormattedTweetText paramFormattedTweetText, Tweet paramTweet)
  {
    if (paramTweet.entities == null);
    while (true)
    {
      return;
      List localList1 = paramTweet.entities.urls;
      if (localList1 != null)
      {
        Iterator localIterator2 = localList1.iterator();
        while (localIterator2.hasNext())
        {
          FormattedUrlEntity localFormattedUrlEntity = new FormattedUrlEntity((UrlEntity)localIterator2.next());
          paramFormattedTweetText.urlEntities.add(localFormattedUrlEntity);
        }
      }
      List localList2 = paramTweet.entities.media;
      if (localList2 != null)
      {
        Iterator localIterator1 = localList2.iterator();
        while (localIterator1.hasNext())
        {
          FormattedMediaEntity localFormattedMediaEntity = new FormattedMediaEntity((MediaEntity)localIterator1.next());
          paramFormattedTweetText.mediaEntities.add(localFormattedMediaEntity);
        }
      }
    }
  }

  static void format(FormattedTweetText paramFormattedTweetText, Tweet paramTweet)
  {
    if (TextUtils.isEmpty(paramTweet.text))
      return;
    HtmlEntities.Unescaped localUnescaped = HtmlEntities.HTML40.unescape(paramTweet.text);
    StringBuilder localStringBuilder = new StringBuilder(localUnescaped.unescaped);
    adjustIndicesForEscapedChars(paramFormattedTweetText.urlEntities, localUnescaped.indices);
    adjustIndicesForEscapedChars(paramFormattedTweetText.mediaEntities, localUnescaped.indices);
    adjustIndicesForSupplementaryChars(localStringBuilder, paramFormattedTweetText);
    paramFormattedTweetText.text = localStringBuilder.toString();
  }

  static FormattedTweetText formatTweetText(Tweet paramTweet)
  {
    if (paramTweet == null)
      return null;
    FormattedTweetText localFormattedTweetText = new FormattedTweetText();
    convertEntities(localFormattedTweetText, paramTweet);
    format(localFormattedTweetText, paramTweet);
    return localFormattedTweetText;
  }

  static MediaEntity getLastPhotoEntity(TweetEntities paramTweetEntities)
  {
    MediaEntity localMediaEntity;
    if (paramTweetEntities == null)
    {
      localMediaEntity = null;
      return localMediaEntity;
    }
    List localList = paramTweetEntities.media;
    if ((localList == null) || (localList.isEmpty()))
      return null;
    for (int i = -1 + localList.size(); ; i--)
    {
      if (i < 0)
        break label77;
      localMediaEntity = (MediaEntity)localList.get(i);
      if ((localMediaEntity.type != null) && (localMediaEntity.type.equals("photo")))
        break;
    }
    label77: return null;
  }

  static boolean hasPhotoUrl(TweetEntities paramTweetEntities)
  {
    return getLastPhotoEntity(paramTweetEntities) != null;
  }
}