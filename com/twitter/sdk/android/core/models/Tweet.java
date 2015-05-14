package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;
import java.util.List;

public class Tweet
{
  public static final long INVALID_ID = -1L;

  @SerializedName("coordinates")
  public final Coordinates coordinates;

  @SerializedName("created_at")
  public final String createdAt;

  @SerializedName("current_user_retweet")
  public final Object currentUserRetweet;

  @SerializedName("entities")
  public final TweetEntities entities;

  @SerializedName("favorite_count")
  public final Integer favoriteCount;

  @SerializedName("favorited")
  public final boolean favorited;

  @SerializedName("filter_level")
  public final String filterLevel;

  @SerializedName("id")
  public final long id;

  @SerializedName("id_str")
  public final String idStr;

  @SerializedName("in_reply_to_screen_name")
  public final String inReplyToScreenName;

  @SerializedName("in_reply_to_status_id")
  public final long inReplyToStatusId;

  @SerializedName("in_reply_to_status_id_str")
  public final String inReplyToStatusIdStr;

  @SerializedName("in_reply_to_user_id")
  public final long inReplyToUserId;

  @SerializedName("in_reply_to_user_id_str")
  public final String inReplyToUserIdStr;

  @SerializedName("lang")
  public final String lang;

  @SerializedName("place")
  public final Place place;

  @SerializedName("possibly_sensitive")
  public final boolean possiblySensitive;

  @SerializedName("retweet_count")
  public final int retweetCount;

  @SerializedName("retweeted")
  public final boolean retweeted;

  @SerializedName("retweeted_status")
  public final Tweet retweetedStatus;

  @SerializedName("scopes")
  public final Object scopes;

  @SerializedName("source")
  public final String source;

  @SerializedName("text")
  public final String text;

  @SerializedName("truncated")
  public final boolean truncated;

  @SerializedName("user")
  public final User user;

  @SerializedName("withheld_copyright")
  public final boolean withheldCopyright;

  @SerializedName("withheld_in_countries")
  public final List<String> withheldInCountries;

  @SerializedName("withheld_scope")
  public final String withheldScope;

  public Tweet(Coordinates paramCoordinates, String paramString1, Object paramObject1, TweetEntities paramTweetEntities, Integer paramInteger, boolean paramBoolean1, String paramString2, long paramLong1, String paramString3, String paramString4, long paramLong2, String paramString5, long paramLong3, String paramString6, String paramString7, Place paramPlace, boolean paramBoolean2, Object paramObject2, int paramInt, boolean paramBoolean3, Tweet paramTweet, String paramString8, String paramString9, boolean paramBoolean4, User paramUser, boolean paramBoolean5, List<String> paramList, String paramString10)
  {
    this.coordinates = paramCoordinates;
    this.createdAt = paramString1;
    this.currentUserRetweet = paramObject1;
    this.entities = paramTweetEntities;
    this.favoriteCount = paramInteger;
    this.favorited = paramBoolean1;
    this.filterLevel = paramString2;
    this.id = paramLong1;
    this.idStr = paramString3;
    this.inReplyToScreenName = paramString4;
    this.inReplyToStatusId = paramLong2;
    this.inReplyToStatusIdStr = paramString5;
    this.inReplyToUserId = paramLong3;
    this.inReplyToUserIdStr = paramString6;
    this.lang = paramString7;
    this.place = paramPlace;
    this.possiblySensitive = paramBoolean2;
    this.scopes = paramObject2;
    this.retweetCount = paramInt;
    this.retweeted = paramBoolean3;
    this.retweetedStatus = paramTweet;
    this.source = paramString8;
    this.text = paramString9;
    this.truncated = paramBoolean4;
    this.user = paramUser;
    this.withheldCopyright = paramBoolean5;
    this.withheldInCountries = paramList;
    this.withheldScope = paramString10;
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == null);
    Tweet localTweet;
    do
    {
      do
        return false;
      while (!(paramObject instanceof Tweet));
      localTweet = (Tweet)paramObject;
    }
    while (this.id != localTweet.id);
    return true;
  }

  public int hashCode()
  {
    return (int)this.id;
  }
}