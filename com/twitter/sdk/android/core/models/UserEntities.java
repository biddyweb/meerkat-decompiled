package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;
import java.util.Collections;
import java.util.List;

public class UserEntities
{

  @SerializedName("description")
  public final UrlEntities description;

  @SerializedName("url")
  public final UrlEntities url;

  public UserEntities(UrlEntities paramUrlEntities1, UrlEntities paramUrlEntities2)
  {
    this.url = paramUrlEntities1;
    this.description = paramUrlEntities2;
  }

  public static class UrlEntities
  {

    @SerializedName("urls")
    public final List<UrlEntity> urls = getSafeList(paramList);

    public UrlEntities(List<UrlEntity> paramList)
    {
    }

    private <T> List<T> getSafeList(List<T> paramList)
    {
      if (paramList == null)
        return Collections.EMPTY_LIST;
      return Collections.unmodifiableList(paramList);
    }
  }
}