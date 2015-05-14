package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;

public class ApiError
{

  @SerializedName("code")
  private final int code;

  @SerializedName("message")
  private final String message;

  public ApiError(String paramString, int paramInt)
  {
    this.message = paramString;
    this.code = paramInt;
  }

  public int getCode()
  {
    return this.code;
  }

  public String getMessage()
  {
    return this.message;
  }
}