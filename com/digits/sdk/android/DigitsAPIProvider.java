package com.digits.sdk.android;

import com.twitter.sdk.android.core.AuthenticatedClient;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.internal.TwitterApi;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import javax.net.ssl.SSLSocketFactory;
import retrofit.RestAdapter;
import retrofit.RestAdapter.Builder;
import retrofit.android.MainThreadExecutor;

class DigitsAPIProvider
{
  private final RestAdapter restAdapter;
  private final ConcurrentHashMap<Class, Object> services = new ConcurrentHashMap();

  DigitsAPIProvider(DigitsSession paramDigitsSession, TwitterAuthConfig paramTwitterAuthConfig, SSLSocketFactory paramSSLSocketFactory, ExecutorService paramExecutorService)
  {
    this.restAdapter = new RestAdapter.Builder().setEndpoint(new TwitterApi().getBaseHostUrl()).setExecutors(paramExecutorService, new MainThreadExecutor()).setClient(new AuthenticatedClient(paramTwitterAuthConfig, paramDigitsSession, paramSSLSocketFactory)).build();
  }

  private <T> T getService(Class<T> paramClass)
  {
    if (!this.services.containsKey(paramClass))
      this.services.put(paramClass, this.restAdapter.create(paramClass));
    return this.services.get(paramClass);
  }

  public DigitsAPIProvider.DeviceService getDeviceService()
  {
    return (DigitsAPIProvider.DeviceService)getService(DigitsAPIProvider.DeviceService.class);
  }

  public DigitsAPIProvider.SdkService getSdkService()
  {
    return (DigitsAPIProvider.SdkService)getService(DigitsAPIProvider.SdkService.class);
  }
}