package retrofit;

import retrofit.client.Response;

public abstract interface Callback<T>
{
  public abstract void failure(RetrofitError paramRetrofitError);

  public abstract void success(T paramT, Response paramResponse);
}