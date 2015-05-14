package com.twitter.sdk.android.core.services;

import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.models.User;
import retrofit.http.GET;
import retrofit.http.Query;

public abstract interface AccountService
{
  @GET("/1.1/account/verify_credentials.json")
  public abstract User verifyCredentials(@Query("include_entities") Boolean paramBoolean1, @Query("skip_status") Boolean paramBoolean2);

  @GET("/1.1/account/verify_credentials.json")
  public abstract void verifyCredentials(@Query("include_entities") Boolean paramBoolean1, @Query("skip_status") Boolean paramBoolean2, Callback<User> paramCallback);
}