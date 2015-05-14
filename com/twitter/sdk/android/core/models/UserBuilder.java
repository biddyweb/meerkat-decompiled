package com.twitter.sdk.android.core.models;

public class UserBuilder
{
  private boolean contributorsEnabled;
  private String createdAt;
  private boolean defaultProfile;
  private boolean defaultProfileImage;
  private String description;
  private String email;
  private UserEntities entities;
  private int favouritesCount;
  private boolean followRequestSent;
  private int followersCount;
  private int friendsCount;
  private boolean geoEnabled;
  private long id = -1L;
  private String idStr;
  private boolean isTranslator;
  private String lang;
  private int listedCount;
  private String location;
  private String name;
  private String profileBackgroundColor;
  private String profileBackgroundImageUrl;
  private String profileBackgroundImageUrlHttps;
  private boolean profileBackgroundTile;
  private String profileBannerUrl;
  private String profileImageUrl;
  private String profileImageUrlHttps;
  private String profileLinkColor;
  private String profileSidebarBorderColor;
  private String profileSidebarFillColor;
  private String profileTextColor;
  private boolean profileUseBackgroundImage;
  private boolean protectedUser;
  private String screenName;
  private boolean showAllInlineMedia;
  private Tweet status;
  private int statusesCount;
  private String timeZone;
  private String url;
  private int utcOffset;
  private boolean verified;
  private String withheldInCountries;
  private String withheldScope;

  public User build()
  {
    return new User(this.contributorsEnabled, this.createdAt, this.defaultProfile, this.defaultProfileImage, this.description, this.email, this.entities, this.favouritesCount, this.followRequestSent, this.followersCount, this.friendsCount, this.geoEnabled, this.id, this.idStr, this.isTranslator, this.lang, this.listedCount, this.location, this.name, this.profileBackgroundColor, this.profileBackgroundImageUrl, this.profileBackgroundImageUrlHttps, this.profileBackgroundTile, this.profileBannerUrl, this.profileImageUrl, this.profileImageUrlHttps, this.profileLinkColor, this.profileSidebarBorderColor, this.profileSidebarFillColor, this.profileTextColor, this.profileUseBackgroundImage, this.protectedUser, this.screenName, this.showAllInlineMedia, this.status, this.statusesCount, this.timeZone, this.url, this.utcOffset, this.verified, this.withheldInCountries, this.withheldScope);
  }

  public UserBuilder setContributorsEnabled(boolean paramBoolean)
  {
    this.contributorsEnabled = paramBoolean;
    return this;
  }

  public UserBuilder setCreatedAt(String paramString)
  {
    this.createdAt = paramString;
    return this;
  }

  public UserBuilder setDefaultProfile(boolean paramBoolean)
  {
    this.defaultProfile = paramBoolean;
    return this;
  }

  public UserBuilder setDefaultProfileImage(boolean paramBoolean)
  {
    this.defaultProfileImage = paramBoolean;
    return this;
  }

  public UserBuilder setDescription(String paramString)
  {
    this.description = paramString;
    return this;
  }

  public UserBuilder setEmail(String paramString)
  {
    this.email = paramString;
    return this;
  }

  public UserBuilder setEntities(UserEntities paramUserEntities)
  {
    this.entities = paramUserEntities;
    return this;
  }

  public UserBuilder setFavouritesCount(int paramInt)
  {
    this.favouritesCount = paramInt;
    return this;
  }

  public UserBuilder setFollowRequestSent(boolean paramBoolean)
  {
    this.followRequestSent = paramBoolean;
    return this;
  }

  public UserBuilder setFollowersCount(int paramInt)
  {
    this.followersCount = paramInt;
    return this;
  }

  public UserBuilder setFriendsCount(int paramInt)
  {
    this.friendsCount = paramInt;
    return this;
  }

  public UserBuilder setGeoEnabled(boolean paramBoolean)
  {
    this.geoEnabled = paramBoolean;
    return this;
  }

  public UserBuilder setId(long paramLong)
  {
    this.id = paramLong;
    return this;
  }

  public UserBuilder setIdStr(String paramString)
  {
    this.idStr = paramString;
    return this;
  }

  public UserBuilder setIsTranslator(boolean paramBoolean)
  {
    this.isTranslator = paramBoolean;
    return this;
  }

  public UserBuilder setLang(String paramString)
  {
    this.lang = paramString;
    return this;
  }

  public UserBuilder setListedCount(int paramInt)
  {
    this.listedCount = paramInt;
    return this;
  }

  public UserBuilder setLocation(String paramString)
  {
    this.location = paramString;
    return this;
  }

  public UserBuilder setName(String paramString)
  {
    this.name = paramString;
    return this;
  }

  public UserBuilder setProfileBackgroundColor(String paramString)
  {
    this.profileBackgroundColor = paramString;
    return this;
  }

  public UserBuilder setProfileBackgroundImageUrl(String paramString)
  {
    this.profileBackgroundImageUrl = paramString;
    return this;
  }

  public UserBuilder setProfileBackgroundImageUrlHttps(String paramString)
  {
    this.profileBackgroundImageUrlHttps = paramString;
    return this;
  }

  public UserBuilder setProfileBackgroundTile(boolean paramBoolean)
  {
    this.profileBackgroundTile = paramBoolean;
    return this;
  }

  public UserBuilder setProfileBannerUrl(String paramString)
  {
    this.profileBannerUrl = paramString;
    return this;
  }

  public UserBuilder setProfileImageUrl(String paramString)
  {
    this.profileImageUrl = paramString;
    return this;
  }

  public UserBuilder setProfileImageUrlHttps(String paramString)
  {
    this.profileImageUrlHttps = paramString;
    return this;
  }

  public UserBuilder setProfileLinkColor(String paramString)
  {
    this.profileLinkColor = paramString;
    return this;
  }

  public UserBuilder setProfileSidebarBorderColor(String paramString)
  {
    this.profileSidebarBorderColor = paramString;
    return this;
  }

  public UserBuilder setProfileSidebarFillColor(String paramString)
  {
    this.profileSidebarFillColor = paramString;
    return this;
  }

  public UserBuilder setProfileTextColor(String paramString)
  {
    this.profileTextColor = paramString;
    return this;
  }

  public UserBuilder setProfileUseBackgroundImage(boolean paramBoolean)
  {
    this.profileUseBackgroundImage = paramBoolean;
    return this;
  }

  public UserBuilder setProtectedUser(boolean paramBoolean)
  {
    this.protectedUser = paramBoolean;
    return this;
  }

  public UserBuilder setScreenName(String paramString)
  {
    this.screenName = paramString;
    return this;
  }

  public UserBuilder setShowAllInlineMedia(boolean paramBoolean)
  {
    this.showAllInlineMedia = paramBoolean;
    return this;
  }

  public UserBuilder setStatus(Tweet paramTweet)
  {
    this.status = paramTweet;
    return this;
  }

  public UserBuilder setStatusesCount(int paramInt)
  {
    this.statusesCount = paramInt;
    return this;
  }

  public UserBuilder setTimeZone(String paramString)
  {
    this.timeZone = paramString;
    return this;
  }

  public UserBuilder setUrl(String paramString)
  {
    this.url = paramString;
    return this;
  }

  public UserBuilder setUtcOffset(int paramInt)
  {
    this.utcOffset = paramInt;
    return this;
  }

  public UserBuilder setVerified(boolean paramBoolean)
  {
    this.verified = paramBoolean;
    return this;
  }

  public UserBuilder setWithheldInCountries(String paramString)
  {
    this.withheldInCountries = paramString;
    return this;
  }

  public UserBuilder setWithheldScope(String paramString)
  {
    this.withheldScope = paramString;
    return this;
  }
}