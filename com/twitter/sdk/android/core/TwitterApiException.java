package com.twitter.sdk.android.core;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;
import com.twitter.sdk.android.core.models.ApiError;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import java.io.UnsupportedEncodingException;
import retrofit.RetrofitError;
import retrofit.client.Response;
import retrofit.mime.TypedByteArray;

public class TwitterApiException extends TwitterException
{
  public static final int DEFAULT_ERROR_CODE;
  private final ApiError apiError;
  private final RetrofitError retrofitError;
  private final TwitterRateLimit twitterRateLimit;

  TwitterApiException(ApiError paramApiError, TwitterRateLimit paramTwitterRateLimit, RetrofitError paramRetrofitError)
  {
    super(paramRetrofitError.getMessage());
    this.retrofitError = paramRetrofitError;
    this.apiError = paramApiError;
    this.twitterRateLimit = paramTwitterRateLimit;
  }

  TwitterApiException(RetrofitError paramRetrofitError)
  {
    super(createExceptionMessage(paramRetrofitError));
    setStackTrace(paramRetrofitError.getStackTrace());
    this.retrofitError = paramRetrofitError;
    this.twitterRateLimit = createRateLimit(paramRetrofitError);
    this.apiError = readApiError(paramRetrofitError);
  }

  public static final TwitterApiException convert(RetrofitError paramRetrofitError)
  {
    return new TwitterApiException(paramRetrofitError);
  }

  private static String createExceptionMessage(RetrofitError paramRetrofitError)
  {
    if (paramRetrofitError.getMessage() != null)
      return paramRetrofitError.getMessage();
    if (paramRetrofitError.getResponse() != null)
      return "Status: " + paramRetrofitError.getResponse().getStatus();
    return "unknown error";
  }

  private static TwitterRateLimit createRateLimit(RetrofitError paramRetrofitError)
  {
    if (paramRetrofitError.getResponse() != null)
      return new TwitterRateLimit(paramRetrofitError.getResponse().getHeaders());
    return null;
  }

  static ApiError parseApiError(String paramString)
  {
    Gson localGson = new Gson();
    try
    {
      ApiError[] arrayOfApiError = (ApiError[])localGson.fromJson(new JsonParser().parse(paramString).getAsJsonObject().get("errors"), [Lcom.twitter.sdk.android.core.models.ApiError.class);
      if (arrayOfApiError.length == 0)
        return null;
      ApiError localApiError = arrayOfApiError[0];
      return localApiError;
    }
    catch (JsonSyntaxException localJsonSyntaxException)
    {
      Fabric.getLogger().e("Twitter", "Invalid json: " + paramString, localJsonSyntaxException);
      return null;
    }
    catch (Exception localException)
    {
      Fabric.getLogger().e("Twitter", "Unexpected response: " + paramString, localException);
    }
    return null;
  }

  public static ApiError readApiError(RetrofitError paramRetrofitError)
  {
    if ((paramRetrofitError == null) || (paramRetrofitError.getResponse() == null) || (paramRetrofitError.getResponse().getBody() == null))
      return null;
    byte[] arrayOfByte = ((TypedByteArray)paramRetrofitError.getResponse().getBody()).getBytes();
    if (arrayOfByte == null)
      return null;
    try
    {
      ApiError localApiError = parseApiError(new String(arrayOfByte, "UTF-8"));
      return localApiError;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      Fabric.getLogger().e("Twitter", "Failed to convert to string", localUnsupportedEncodingException);
    }
    return null;
  }

  public boolean canRetry()
  {
    int i = this.retrofitError.getResponse().getStatus();
    return (i < 400) || (i > 499);
  }

  public int getErrorCode()
  {
    if (this.apiError == null)
      return 0;
    return this.apiError.getCode();
  }

  public String getErrorMessage()
  {
    if (this.apiError == null)
      return null;
    return this.apiError.getMessage();
  }

  public RetrofitError getRetrofitError()
  {
    return this.retrofitError;
  }

  public TwitterRateLimit getTwitterRateLimit()
  {
    return this.twitterRateLimit;
  }
}