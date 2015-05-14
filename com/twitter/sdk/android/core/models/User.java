package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;
import java.io.Serializable;

public class User
  implements Serializable
{
  public static final long INVALID_ID = -1L;
  private static final long serialVersionUID = 4663450696842173958L;

  @SerializedName("contributors_enabled")
  public final boolean contributorsEnabled;

  @SerializedName("created_at")
  public final String createdAt;

  @SerializedName("default_profile")
  public final boolean defaultProfile;

  @SerializedName("default_profile_image")
  public final boolean defaultProfileImage;

  @SerializedName("description")
  public final String description;

  @SerializedName("email")
  public final String email;

  @SerializedName("entities")
  public final UserEntities entities;

  @SerializedName("favourites_count")
  public final int favouritesCount;

  @SerializedName("follow_request_sent")
  public final boolean followRequestSent;

  @SerializedName("followers_count")
  public final int followersCount;

  @SerializedName("friends_count")
  public final int friendsCount;

  @SerializedName("geo_enabled")
  public final boolean geoEnabled;

  @SerializedName("id")
  public final long id;

  @SerializedName("id_str")
  public final String idStr;

  @SerializedName("is_translator")
  public final boolean isTranslator;

  @SerializedName("lang")
  public final String lang;

  @SerializedName("listed_count")
  public final int listedCount;

  @SerializedName("location")
  public final String location;

  @SerializedName("name")
  public final String name;

  @SerializedName("profile_background_color")
  public final String profileBackgroundColor;

  @SerializedName("profile_background_image_url")
  public final String profileBackgroundImageUrl;

  @SerializedName("profile_background_image_url_https")
  public final String profileBackgroundImageUrlHttps;

  @SerializedName("profile_background_tile")
  public final boolean profileBackgroundTile;

  @SerializedName("profile_banner_url")
  public final String profileBannerUrl;

  @SerializedName("profile_image_url")
  public final String profileImageUrl;

  @SerializedName("profile_image_url_https")
  public final String profileImageUrlHttps;

  @SerializedName("profile_link_color")
  public final String profileLinkColor;

  @SerializedName("profile_sidebar_border_color")
  public final String profileSidebarBorderColor;

  @SerializedName("profile_sidebar_fill_color")
  public final String profileSidebarFillColor;

  @SerializedName("profile_text_color")
  public final String profileTextColor;

  @SerializedName("profile_use_background_image")
  public final boolean profileUseBackgroundImage;

  @SerializedName("protected")
  public final boolean protectedUser;

  @SerializedName("screen_name")
  public final String screenName;

  @SerializedName("show_all_inline_media")
  public final boolean showAllInlineMedia;

  @SerializedName("status")
  public final Tweet status;

  @SerializedName("statuses_count")
  public final int statusesCount;

  @SerializedName("time_zone")
  public final String timeZone;

  @SerializedName("url")
  public final String url;

  @SerializedName("utc_offset")
  public final int utcOffset;

  @SerializedName("verified")
  public final boolean verified;

  @SerializedName("withheld_in_countries")
  public final String withheldInCountries;

  @SerializedName("withheld_scope")
  public final String withheldScope;

  public User(boolean paramBoolean1, String paramString1, boolean paramBoolean2, boolean paramBoolean3, String paramString2, String paramString3, UserEntities paramUserEntities, int paramInt1, boolean paramBoolean4, int paramInt2, int paramInt3, boolean paramBoolean5, long paramLong, String paramString4, boolean paramBoolean6, String paramString5, int paramInt4, String paramString6, String paramString7, String paramString8, String paramString9, String paramString10, boolean paramBoolean7, String paramString11, String paramString12, String paramString13, String paramString14, String paramString15, String paramString16, String paramString17, boolean paramBoolean8, boolean paramBoolean9, String paramString18, boolean paramBoolean10, Tweet paramTweet, int paramInt5, String paramString19, String paramString20, int paramInt6, boolean paramBoolean11, String paramString21, String paramString22)
  {
    this.contributorsEnabled = paramBoolean1;
    this.createdAt = paramString1;
    this.defaultProfile = paramBoolean2;
    this.defaultProfileImage = paramBoolean3;
    this.description = paramString2;
    this.email = paramString3;
    this.entities = paramUserEntities;
    this.favouritesCount = paramInt1;
    this.followRequestSent = paramBoolean4;
    this.followersCount = paramInt2;
    this.friendsCount = paramInt3;
    this.geoEnabled = paramBoolean5;
    this.id = paramLong;
    this.idStr = paramString4;
    this.isTranslator = paramBoolean6;
    this.lang = paramString5;
    this.listedCount = paramInt4;
    this.location = paramString6;
    this.name = paramString7;
    this.profileBackgroundColor = paramString8;
    this.profileBackgroundImageUrl = paramString9;
    this.profileBackgroundImageUrlHttps = paramString10;
    this.profileBackgroundTile = paramBoolean7;
    this.profileBannerUrl = paramString11;
    this.profileImageUrl = paramString12;
    this.profileImageUrlHttps = paramString13;
    this.profileLinkColor = paramString14;
    this.profileSidebarBorderColor = paramString15;
    this.profileSidebarFillColor = paramString16;
    this.profileTextColor = paramString17;
    this.profileUseBackgroundImage = paramBoolean8;
    this.protectedUser = paramBoolean9;
    this.screenName = paramString18;
    this.showAllInlineMedia = paramBoolean10;
    this.status = paramTweet;
    this.statusesCount = paramInt5;
    this.timeZone = paramString19;
    this.url = paramString20;
    this.utcOffset = paramInt6;
    this.verified = paramBoolean11;
    this.withheldInCountries = paramString21;
    this.withheldScope = paramString22;
  }
}