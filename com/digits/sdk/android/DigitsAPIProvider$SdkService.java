package com.digits.sdk.android;

import com.twitter.sdk.android.core.Callback;
import retrofit.http.Field;
import retrofit.http.FormUrlEncoded;
import retrofit.http.POST;

public abstract interface DigitsAPIProvider$SdkService
{
  @FormUrlEncoded
  @POST("/1.1/sdk/account.json")
  public abstract void account(@Field("phone_number") String paramString1, @Field("numeric_pin") String paramString2, Callback<DigitsUser> paramCallback);

  @FormUrlEncoded
  @POST("/auth/1/xauth_phone_number.json")
  public abstract void auth(@Field("x_auth_phone_number") String paramString, Callback<AuthResponse> paramCallback);

  @FormUrlEncoded
  @POST("/auth/1/xauth_challenge.json")
  public abstract void login(@Field("login_verification_request_id") String paramString1, @Field("login_verification_user_id") long paramLong, @Field("login_verification_challenge_response") String paramString2, Callback<DigitsSessionResponse> paramCallback);

  @FormUrlEncoded
  @POST("/auth/1/xauth_pin.json")
  public abstract void verifyPin(@Field("login_verification_request_id") String paramString1, @Field("login_verification_user_id") long paramLong, @Field("pin") String paramString2, Callback<DigitsSessionResponse> paramCallback);
}