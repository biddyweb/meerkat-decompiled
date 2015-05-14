package com.twitter.sdk.android.tweetui;

import android.text.SpannableStringBuilder;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.style.ClickableSpan;
import android.view.View;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

final class TweetTextLinkifier
{
  private static final String PHOTO_TYPE = "photo";

  private static void addUrlEntities(SpannableStringBuilder paramSpannableStringBuilder, List<FormattedUrlEntity> paramList, FormattedMediaEntity paramFormattedMediaEntity, LinkClickListener paramLinkClickListener, final int paramInt)
  {
    if ((paramList == null) || (paramList.isEmpty()));
    while (true)
    {
      return;
      int i = 0;
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        final FormattedUrlEntity localFormattedUrlEntity = (FormattedUrlEntity)localIterator.next();
        int j = localFormattedUrlEntity.start - i;
        int k = localFormattedUrlEntity.end - i;
        if ((j >= 0) && (k <= paramSpannableStringBuilder.length()))
          if ((paramFormattedMediaEntity != null) && (paramFormattedMediaEntity.start == localFormattedUrlEntity.start))
          {
            paramSpannableStringBuilder.replace(j, k, "");
            int i1 = k - j;
            (k - i1);
            i += i1;
          }
          else if (!TextUtils.isEmpty(localFormattedUrlEntity.displayUrl))
          {
            paramSpannableStringBuilder.replace(j, k, localFormattedUrlEntity.displayUrl);
            int m = k - (j + localFormattedUrlEntity.displayUrl.length());
            int n = k - m;
            i += m;
            paramSpannableStringBuilder.setSpan(new ClickableSpan()
            {
              public void onClick(View paramAnonymousView)
              {
                if (this.val$listener == null)
                  return;
                this.val$listener.onUrlClicked(localFormattedUrlEntity.url);
              }

              public void updateDrawState(TextPaint paramAnonymousTextPaint)
              {
                paramAnonymousTextPaint.setColor(paramInt);
                paramAnonymousTextPaint.setUnderlineText(false);
              }
            }
            , j, n, 33);
          }
      }
    }
  }

  private static FormattedMediaEntity getLastPhotoEntity(FormattedTweetText paramFormattedTweetText)
  {
    FormattedMediaEntity localFormattedMediaEntity;
    if (paramFormattedTweetText == null)
    {
      localFormattedMediaEntity = null;
      return localFormattedMediaEntity;
    }
    List localList = paramFormattedTweetText.mediaEntities;
    if (localList.isEmpty())
      return null;
    for (int i = -1 + localList.size(); ; i--)
    {
      if (i < 0)
        break label66;
      localFormattedMediaEntity = (FormattedMediaEntity)localList.get(i);
      if ("photo".equals(localFormattedMediaEntity.type))
        break;
    }
    label66: return null;
  }

  static CharSequence linkifyUrls(FormattedTweetText paramFormattedTweetText, LinkClickListener paramLinkClickListener, boolean paramBoolean, int paramInt)
  {
    if (paramFormattedTweetText == null)
      return null;
    if (TextUtils.isEmpty(paramFormattedTweetText.text))
      return paramFormattedTweetText.text;
    SpannableStringBuilder localSpannableStringBuilder = new SpannableStringBuilder(paramFormattedTweetText.text);
    List localList1 = paramFormattedTweetText.urlEntities;
    List localList2 = paramFormattedTweetText.mediaEntities;
    if (paramBoolean);
    for (FormattedMediaEntity localFormattedMediaEntity = getLastPhotoEntity(paramFormattedTweetText); ; localFormattedMediaEntity = null)
    {
      addUrlEntities(localSpannableStringBuilder, mergeAndSortEntities(localList1, localList2), localFormattedMediaEntity, paramLinkClickListener, paramInt);
      return localSpannableStringBuilder;
    }
  }

  static List<FormattedUrlEntity> mergeAndSortEntities(List<FormattedUrlEntity> paramList, List<FormattedMediaEntity> paramList1)
  {
    if (paramList1 == null)
      return paramList;
    ArrayList localArrayList = new ArrayList(paramList);
    localArrayList.addAll(paramList1);
    Collections.sort(localArrayList, new Comparator()
    {
      public int compare(FormattedUrlEntity paramAnonymousFormattedUrlEntity1, FormattedUrlEntity paramAnonymousFormattedUrlEntity2)
      {
        if ((paramAnonymousFormattedUrlEntity1 == null) && (paramAnonymousFormattedUrlEntity2 != null));
        do
        {
          return -1;
          if ((paramAnonymousFormattedUrlEntity1 != null) && (paramAnonymousFormattedUrlEntity2 == null))
            return 1;
          if ((paramAnonymousFormattedUrlEntity1 == null) && (paramAnonymousFormattedUrlEntity2 == null))
            return 0;
        }
        while (paramAnonymousFormattedUrlEntity1.start < paramAnonymousFormattedUrlEntity2.start);
        if (paramAnonymousFormattedUrlEntity1.start > paramAnonymousFormattedUrlEntity2.start)
          return 1;
        return 0;
      }
    });
    return localArrayList;
  }
}