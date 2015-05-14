package com.twitter.sdk.android.tweetui;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.squareup.picasso.Picasso;
import com.twitter.cobalt.metrics.ConsoleReporter;
import com.twitter.cobalt.metrics.MetricsManager;
import com.twitter.sdk.android.core.Session;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.internal.scribe.DefaultScribeClient;
import com.twitter.sdk.android.core.internal.scribe.EventNamespace;
import com.twitter.sdk.android.tweetui.internal.ActiveSessionProvider;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Kit;
import io.fabric.sdk.android.services.common.IdManager;
import io.fabric.sdk.android.services.concurrency.DependsOn;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicReference;

@DependsOn({"Lcom/twitter/sdk/android/core/TwitterCore;"})
public class TweetUi extends Kit<Boolean>
{
  private static final String KIT_SCRIBE_NAME = "TweetUi";
  static final String LOGTAG = "TweetUi";
  static final String NOT_STARTED_ERROR = "Must start TweetUi Kit in Fabric.with().";
  ActiveSessionProvider activeSessionProvider;
  String advertisingId;
  private final AtomicReference<Gson> gsonRef = new AtomicReference();
  private Picasso imageLoader;
  private MetricsManager metricsManager;
  private AuthRequestQueue queue;
  DefaultScribeClient scribeClient;
  List<SessionManager<? extends Session>> sessionManagers;
  private TweetRepository tweetRepository;

  private static void checkInitialized()
  {
    if (Fabric.getKit(TweetUi.class) == null)
      throw new IllegalStateException("Must start TweetUi Kit in Fabric.with().");
  }

  public static TweetUi getInstance()
  {
    checkInitialized();
    return (TweetUi)Fabric.getKit(TweetUi.class);
  }

  private void setUpScribeClient()
  {
    this.scribeClient = new DefaultScribeClient(this, "TweetUi", (Gson)this.gsonRef.get(), this.sessionManagers, getIdManager());
  }

  void clearAppSession(long paramLong)
  {
    TwitterCore.getInstance().getAppSessionManager().clearSession(paramLong);
  }

  protected Boolean doInBackground()
  {
    this.imageLoader = Picasso.with(getContext());
    this.queue.sessionRestored(this.activeSessionProvider.getActiveSession());
    initGson();
    initMetricsManager();
    setUpScribeClient();
    this.advertisingId = getIdManager().getAdvertisingId();
    return Boolean.valueOf(true);
  }

  public String getIdentifier()
  {
    return "com.twitter.sdk.android:tweet-ui";
  }

  Picasso getImageLoader()
  {
    return this.imageLoader;
  }

  MetricsManager getMetricsManager()
  {
    return this.metricsManager;
  }

  TweetRepository getTweetRepository()
  {
    return this.tweetRepository;
  }

  public String getVersion()
  {
    return "1.0.6.37";
  }

  void initGson()
  {
    if (this.gsonRef.get() == null)
    {
      Gson localGson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES).create();
      this.gsonRef.compareAndSet(null, localGson);
    }
  }

  void initMetricsManager()
  {
    MetricsManager.initialize(getContext().getApplicationContext());
    this.metricsManager = MetricsManager.getInstance();
    this.metricsManager.addReporter(new ConsoleReporter());
  }

  protected boolean onPreExecute()
  {
    super.onPreExecute();
    TwitterCore localTwitterCore = TwitterCore.getInstance();
    this.sessionManagers = new ArrayList(2);
    this.sessionManagers.add(localTwitterCore.getSessionManager());
    this.sessionManagers.add(localTwitterCore.getAppSessionManager());
    this.activeSessionProvider = new ActiveSessionProvider(this.sessionManagers);
    this.queue = new AuthRequestQueue(localTwitterCore, this.activeSessionProvider);
    this.tweetRepository = new TweetRepository(this, getFabric().getExecutorService(), getFabric().getMainHandler(), this.queue);
    return true;
  }

  void scribe(EventNamespace[] paramArrayOfEventNamespace)
  {
    if (this.scribeClient == null);
    while (true)
    {
      return;
      String str = getContext().getResources().getConfiguration().locale.getLanguage();
      long l = System.currentTimeMillis();
      int i = paramArrayOfEventNamespace.length;
      for (int j = 0; j < i; j++)
      {
        EventNamespace localEventNamespace = paramArrayOfEventNamespace[j];
        this.scribeClient.scribe(ScribeEventFactory.newScribeEvent(localEventNamespace, l, str, this.advertisingId));
      }
    }
  }

  void setImageLoader(Picasso paramPicasso)
  {
    this.imageLoader = paramPicasso;
  }

  void setTweetRepository(TweetRepository paramTweetRepository)
  {
    this.tweetRepository = paramTweetRepository;
  }
}