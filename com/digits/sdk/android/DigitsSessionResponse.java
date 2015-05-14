package com.digits.sdk.android;

import com.google.gson.annotations.SerializedName;

class DigitsSessionResponse
{

  @SerializedName("screen_name")
  public String screenName;

  @SerializedName("oauth_token_secret")
  public String secret;

  @SerializedName("oauth_token")
  public String token;

  @SerializedName("user_id")
  public long userId;

  public boolean isEmpty()
  {
    return (this.token == null) && (this.secret == null) && (this.screenName == null) && (this.userId == 0L);
  }
}