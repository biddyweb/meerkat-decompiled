package com.digits.sdk.android;

import com.twitter.sdk.android.core.Callback;
import retrofit.client.Response;
import retrofit.http.Field;
import retrofit.http.FormUrlEncoded;
import retrofit.http.POST;

public abstract interface DigitsAPIProvider$DeviceService
{
  @FormUrlEncoded
  @POST("/1.1/device/register.json")
  public abstract void register(@Field("raw_phone_number") String paramString1, @Field("text_key") String paramString2, @Field("send_numeric_pin") Boolean paramBoolean, Callback<Response> paramCallback);
}