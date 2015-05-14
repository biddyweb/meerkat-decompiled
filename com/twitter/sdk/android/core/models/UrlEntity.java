package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;

public class UrlEntity extends Entity
{

  @SerializedName("display_url")
  public final String displayUrl;

  @SerializedName("expanded_url")
  public final String expandedUrl;

  @SerializedName("url")
  public final String url;

  public UrlEntity(String paramString1, String paramString2, String paramString3, int paramInt1, int paramInt2)
  {
    super(paramInt1, paramInt2);
    this.url = paramString1;
    this.expandedUrl = paramString2;
    this.displayUrl = paramString3;
  }
}