package com.twitter.sdk.android.core;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.twitter.sdk.android.core.internal.TwitterApi;
import com.twitter.sdk.android.core.models.SafeListAdapter;
import com.twitter.sdk.android.core.models.SafeMapAdapter;
import com.twitter.sdk.android.core.services.AccountService;
import com.twitter.sdk.android.core.services.FavoriteService;
import com.twitter.sdk.android.core.services.SearchService;
import com.twitter.sdk.android.core.services.StatusesService;
import io.fabric.sdk.android.Fabric;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import javax.net.ssl.SSLSocketFactory;
import retrofit.RestAdapter;
import retrofit.RestAdapter.Builder;
import retrofit.android.MainThreadExecutor;
import retrofit.converter.GsonConverter;

public class TwitterApiClient
{
  final RestAdapter adapter;
  final ConcurrentHashMap<Class, Object> services;

  public TwitterApiClient(Session paramSession)
  {
    this(TwitterCore.getInstance().getAuthConfig(), paramSession, new TwitterApi(), TwitterCore.getInstance().getSSLSocketFactory(), TwitterCore.getInstance().getFabric().getExecutorService());
  }

  TwitterApiClient(TwitterAuthConfig paramTwitterAuthConfig, Session paramSession, TwitterApi paramTwitterApi, SSLSocketFactory paramSSLSocketFactory, ExecutorService paramExecutorService)
  {
    if (paramSession == null)
      throw new IllegalArgumentException("Session must not be null.");
    this.services = new ConcurrentHashMap();
    Gson localGson = new GsonBuilder().registerTypeAdapterFactory(new SafeListAdapter()).registerTypeAdapterFactory(new SafeMapAdapter()).create();
    this.adapter = new RestAdapter.Builder().setClient(new AuthenticatedClient(paramTwitterAuthConfig, paramSession, paramSSLSocketFactory)).setEndpoint(paramTwitterApi.getBaseHostUrl()).setConverter(new GsonConverter(localGson)).setExecutors(paramExecutorService, new MainThreadExecutor()).build();
  }

  public AccountService getAccountService()
  {
    return (AccountService)getService(AccountService.class);
  }

  public FavoriteService getFavoriteService()
  {
    return (FavoriteService)getService(FavoriteService.class);
  }

  public SearchService getSearchService()
  {
    return (SearchService)getService(SearchService.class);
  }

  protected <T> T getService(Class<T> paramClass)
  {
    if (!this.services.contains(paramClass))
      this.services.putIfAbsent(paramClass, this.adapter.create(paramClass));
    return this.services.get(paramClass);
  }

  public StatusesService getStatusesService()
  {
    return (StatusesService)getService(StatusesService.class);
  }
}