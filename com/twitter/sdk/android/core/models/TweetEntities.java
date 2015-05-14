package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;
import java.util.Collections;
import java.util.List;

public class TweetEntities
{

  @SerializedName("hashtags")
  public final List<HashtagEntity> hashtags = getSafeList(paramList3);

  @SerializedName("media")
  public final List<MediaEntity> media = getSafeList(paramList2);

  @SerializedName("urls")
  public final List<UrlEntity> urls = getSafeList(paramList);

  @SerializedName("user_mentions")
  public final List<MentionEntity> userMentions = getSafeList(paramList1);

  public TweetEntities(List<UrlEntity> paramList, List<MentionEntity> paramList1, List<MediaEntity> paramList2, List<HashtagEntity> paramList3)
  {
  }

  private <T> List<T> getSafeList(List<T> paramList)
  {
    if (paramList == null)
      return Collections.EMPTY_LIST;
    return Collections.unmodifiableList(paramList);
  }
}