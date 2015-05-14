package com.digits.sdk.android;

import com.google.gson.annotations.SerializedName;

public class DigitsUser
{

  @SerializedName("id")
  public final long id;

  @SerializedName("id_str")
  public final String idStr;

  public DigitsUser(long paramLong, String paramString)
  {
    this.id = paramLong;
    this.idStr = paramString;
  }
}