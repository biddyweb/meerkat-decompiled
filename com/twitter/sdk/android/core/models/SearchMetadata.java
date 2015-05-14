package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;

public class SearchMetadata
{

  @SerializedName("completed_in")
  public final double completedIn;

  @SerializedName("count")
  public final long count;

  @SerializedName("max_id")
  public final long maxId;

  @SerializedName("max_id_str")
  public final String maxIdStr;

  @SerializedName("next_results")
  public final String nextResults;

  @SerializedName("query")
  public final String query;

  @SerializedName("refresh_url")
  public final String refreshUrl;

  @SerializedName("since_id")
  public final long sinceId;

  @SerializedName("since_id_str")
  public final String sinceIdStr;

  public SearchMetadata(int paramInt1, int paramInt2, String paramString1, String paramString2, int paramInt3, double paramDouble, String paramString3, String paramString4, String paramString5)
  {
    this.maxId = paramInt1;
    this.sinceId = paramInt2;
    this.refreshUrl = paramString1;
    this.nextResults = paramString2;
    this.count = paramInt3;
    this.completedIn = paramDouble;
    this.sinceIdStr = paramString3;
    this.query = paramString4;
    this.maxIdStr = paramString5;
  }
}