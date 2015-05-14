package com.twitter.sdk.android.core;

import retrofit.client.Response;

public class Result<T>
{
  public final T data;
  public final Response response;

  public Result(T paramT, Response paramResponse)
  {
    this.data = paramT;
    this.response = paramResponse;
  }
}