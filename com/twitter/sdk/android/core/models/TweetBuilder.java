package com.twitter.sdk.android.core.models;

import java.util.List;

public class TweetBuilder
{
  private Coordinates coordinates;
  private String createdAt;
  private Object currentUserRetweet;
  private TweetEntities entities;
  private Integer favoriteCount;
  private boolean favorited;
  private String filterLevel;
  private long id = -1L;
  private String idStr;
  private String inReplyToScreenName;
  private long inReplyToStatusId;
  private String inReplyToStatusIdStr;
  private long inReplyToUserId;
  private String inReplyToUserIdStr;
  private String lang;
  private Place place;
  private boolean possiblySensitive;
  private int retweetCount;
  private boolean retweeted;
  private Tweet retweetedStatus;
  private Object scopes;
  private String source;
  private String text;
  private boolean truncated;
  private User user;
  private boolean withheldCopyright;
  private List<String> withheldInCountries;
  private String withheldScope;

  public Tweet build()
  {
    return new Tweet(this.coordinates, this.createdAt, this.currentUserRetweet, this.entities, this.favoriteCount, this.favorited, this.filterLevel, this.id, this.idStr, this.inReplyToScreenName, this.inReplyToStatusId, this.inReplyToStatusIdStr, this.inReplyToUserId, this.inReplyToUserIdStr, this.lang, this.place, this.possiblySensitive, this.scopes, this.retweetCount, this.retweeted, this.retweetedStatus, this.source, this.text, this.truncated, this.user, this.withheldCopyright, this.withheldInCountries, this.withheldScope);
  }

  public TweetBuilder setCoordinates(Coordinates paramCoordinates)
  {
    this.coordinates = paramCoordinates;
    return this;
  }

  public TweetBuilder setCreatedAt(String paramString)
  {
    this.createdAt = paramString;
    return this;
  }

  public TweetBuilder setCurrentUserRetweet(Object paramObject)
  {
    this.currentUserRetweet = paramObject;
    return this;
  }

  public TweetBuilder setEntities(TweetEntities paramTweetEntities)
  {
    this.entities = paramTweetEntities;
    return this;
  }

  public TweetBuilder setFavoriteCount(Integer paramInteger)
  {
    this.favoriteCount = paramInteger;
    return this;
  }

  public TweetBuilder setFavorited(boolean paramBoolean)
  {
    this.favorited = paramBoolean;
    return this;
  }

  public TweetBuilder setFilterLevel(String paramString)
  {
    this.filterLevel = paramString;
    return this;
  }

  public TweetBuilder setId(long paramLong)
  {
    this.id = paramLong;
    return this;
  }

  public TweetBuilder setIdStr(String paramString)
  {
    this.idStr = paramString;
    return this;
  }

  public TweetBuilder setInReplyToScreenName(String paramString)
  {
    this.inReplyToScreenName = paramString;
    return this;
  }

  public TweetBuilder setInReplyToStatusId(long paramLong)
  {
    this.inReplyToStatusId = paramLong;
    return this;
  }

  public TweetBuilder setInReplyToStatusIdStr(String paramString)
  {
    this.inReplyToStatusIdStr = paramString;
    return this;
  }

  public TweetBuilder setInReplyToUserId(long paramLong)
  {
    this.inReplyToUserId = paramLong;
    return this;
  }

  public TweetBuilder setInReplyToUserIdStr(String paramString)
  {
    this.inReplyToUserIdStr = paramString;
    return this;
  }

  public TweetBuilder setLang(String paramString)
  {
    this.lang = paramString;
    return this;
  }

  public TweetBuilder setPlace(Place paramPlace)
  {
    this.place = paramPlace;
    return this;
  }

  public TweetBuilder setPossiblySensitive(boolean paramBoolean)
  {
    this.possiblySensitive = paramBoolean;
    return this;
  }

  public TweetBuilder setRetweetCount(int paramInt)
  {
    this.retweetCount = paramInt;
    return this;
  }

  public TweetBuilder setRetweeted(boolean paramBoolean)
  {
    this.retweeted = paramBoolean;
    return this;
  }

  public TweetBuilder setRetweetedStatus(Tweet paramTweet)
  {
    this.retweetedStatus = paramTweet;
    return this;
  }

  public TweetBuilder setScopes(Object paramObject)
  {
    this.scopes = paramObject;
    return this;
  }

  public TweetBuilder setSource(String paramString)
  {
    this.source = paramString;
    return this;
  }

  public TweetBuilder setText(String paramString)
  {
    this.text = paramString;
    return this;
  }

  public TweetBuilder setTruncated(boolean paramBoolean)
  {
    this.truncated = paramBoolean;
    return this;
  }

  public TweetBuilder setUser(User paramUser)
  {
    this.user = paramUser;
    return this;
  }

  public TweetBuilder setWithheldCopyright(boolean paramBoolean)
  {
    this.withheldCopyright = paramBoolean;
    return this;
  }

  public TweetBuilder setWithheldInCountries(List<String> paramList)
  {
    this.withheldInCountries = paramList;
    return this;
  }

  public TweetBuilder setWithheldScope(String paramString)
  {
    this.withheldScope = paramString;
    return this;
  }
}