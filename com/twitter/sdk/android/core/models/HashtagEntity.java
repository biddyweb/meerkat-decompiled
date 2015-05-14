package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;

public class HashtagEntity extends Entity
{

  @SerializedName("text")
  public final String text;

  public HashtagEntity(String paramString, int paramInt1, int paramInt2)
  {
    super(paramInt1, paramInt2);
    this.text = paramString;
  }
}