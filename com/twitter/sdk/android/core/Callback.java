package com.twitter.sdk.android.core;

import retrofit.RetrofitError;
import retrofit.client.Response;

public abstract class Callback<T>
  implements retrofit.Callback<T>
{
  public abstract void failure(TwitterException paramTwitterException);

  public final void failure(RetrofitError paramRetrofitError)
  {
    failure(TwitterApiException.convert(paramRetrofitError));
  }

  public abstract void success(Result<T> paramResult);

  public final void success(T paramT, Response paramResponse)
  {
    success(new Result(paramT, paramResponse));
  }
}