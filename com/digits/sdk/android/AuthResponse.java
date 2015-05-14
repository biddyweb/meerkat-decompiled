package com.digits.sdk.android;

import com.google.gson.annotations.SerializedName;

class AuthResponse
{

  @SerializedName("login_verification_request_id")
  public String requestId;

  @SerializedName("login_verification_user_id")
  public long userId;
}