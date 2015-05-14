package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;

public class MentionEntity extends Entity
{

  @SerializedName("id")
  public final long id;

  @SerializedName("id_str")
  public final String idStr;

  @SerializedName("name")
  public final String name;

  @SerializedName("screen_name")
  public final String screenName;

  public MentionEntity(long paramLong, String paramString1, String paramString2, String paramString3, int paramInt1, int paramInt2)
  {
    super(paramInt1, paramInt2);
    this.id = paramLong;
    this.idStr = paramString1;
    this.name = paramString2;
    this.screenName = paramString3;
  }
}