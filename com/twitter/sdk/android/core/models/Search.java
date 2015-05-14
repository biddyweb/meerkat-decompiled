package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;
import java.util.List;

public class Search
{

  @SerializedName("search_metadata")
  public final SearchMetadata searchMetadata;

  @SerializedName("statuses")
  public final List<Tweet> tweets;

  public Search(List<Tweet> paramList, SearchMetadata paramSearchMetadata)
  {
    this.tweets = paramList;
    this.searchMetadata = paramSearchMetadata;
  }
}