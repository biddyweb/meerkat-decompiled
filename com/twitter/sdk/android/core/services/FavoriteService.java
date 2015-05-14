package com.twitter.sdk.android.core.services;

import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.models.Tweet;
import java.util.List;
import retrofit.http.Field;
import retrofit.http.FormUrlEncoded;
import retrofit.http.GET;
import retrofit.http.POST;
import retrofit.http.Query;

public abstract interface FavoriteService
{
  @FormUrlEncoded
  @POST("/1.1/favorites/create.json")
  public abstract void create(@Field("id") Long paramLong, @Field("include_entities") Boolean paramBoolean, Callback<Tweet> paramCallback);

  @FormUrlEncoded
  @POST("/1.1/favorites/destroy.json")
  public abstract void destroy(@Field("id") Long paramLong, @Field("include_entities") Boolean paramBoolean, Callback<Tweet> paramCallback);

  @GET("/1.1/favorites/list.json")
  public abstract void list(@Query("user_id") Long paramLong, @Query("screen_name") String paramString1, @Query("count") Integer paramInteger, @Query("since_id") String paramString2, @Query("max_id") String paramString3, @Query("include_entities") Boolean paramBoolean, Callback<List<Tweet>> paramCallback);
}