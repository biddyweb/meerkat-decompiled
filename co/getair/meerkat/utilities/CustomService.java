package co.getair.meerkat.utilities;

import com.google.gson.JsonObject;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.models.User;
import retrofit.http.GET;
import retrofit.http.POST;
import retrofit.http.Path;
import retrofit.http.Query;

public abstract interface CustomService
{
  @POST("/1.1/favorites/create.json")
  public abstract void favoriteTweet(@Query("id") String paramString, Callback<JsonObject> paramCallback);

  @GET("/1.1/friends/ids.json")
  public abstract void getFriendsIds(@Query("user_id") long paramLong1, @Query("cursor") long paramLong2, Callback<JsonObject> paramCallback);

  @POST("/1.1/statuses/update.json")
  public abstract void replyTweet(@Query("status") String paramString1, @Query("in_reply_to_status_id") String paramString2, Callback<JsonObject> paramCallback);

  @POST("/1.1/statuses/retweet/{id}.json")
  public abstract void retweet(@Path("id") String paramString, Callback<JsonObject> paramCallback);

  @GET("/1.1/users/show.json")
  public abstract void show(@Query("user_id") long paramLong, Callback<User> paramCallback);

  @POST("/1.1/statuses/update.json")
  public abstract void tweet(@Query("status") String paramString, Callback<JsonObject> paramCallback);
}