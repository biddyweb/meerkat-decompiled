package com.twitter.sdk.android.core;

import android.app.Activity;
import com.twitter.sdk.android.core.identity.TwitterAuthClient;
import com.twitter.sdk.android.core.internal.SessionMonitor;
import com.twitter.sdk.android.core.internal.TwitterApi;
import com.twitter.sdk.android.core.internal.oauth.OAuth2Service;
import com.twitter.sdk.android.core.internal.scribe.TwitterCoreScribeClientHolder;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Kit;
import io.fabric.sdk.android.Logger;
import io.fabric.sdk.android.services.network.NetworkUtils;
import io.fabric.sdk.android.services.persistence.PreferenceStoreImpl;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import javax.net.ssl.SSLSocketFactory;

public class TwitterCore extends Kit<Boolean>
{
  static final String PREF_KEY_ACTIVE_APP_SESSION = "active_appsession";
  static final String PREF_KEY_ACTIVE_TWITTER_SESSION = "active_twittersession";
  static final String PREF_KEY_APP_SESSION = "appsession";
  static final String PREF_KEY_TWITTER_SESSION = "twittersession";
  public static final String TAG = "Twitter";
  private final ConcurrentHashMap<Session, TwitterApiClient> apiClients;
  SessionManager<AppSession> appSessionManager;
  private final TwitterAuthConfig authConfig;
  SessionMonitor<TwitterSession> sessionMonitor;
  private volatile SSLSocketFactory sslSocketFactory;
  SessionManager<TwitterSession> twitterSessionManager;

  public TwitterCore(TwitterAuthConfig paramTwitterAuthConfig)
  {
    this.authConfig = paramTwitterAuthConfig;
    this.apiClients = new ConcurrentHashMap();
  }

  TwitterCore(TwitterAuthConfig paramTwitterAuthConfig, ConcurrentHashMap<Session, TwitterApiClient> paramConcurrentHashMap)
  {
    this.authConfig = paramTwitterAuthConfig;
    this.apiClients = paramConcurrentHashMap;
  }

  private static void checkInitialized()
  {
    if (Fabric.getKit(TwitterCore.class) == null)
      throw new IllegalStateException("Must start Twitter Kit with Fabric.with() first");
  }

  private void createSSLSocketFactory()
  {
    try
    {
      SSLSocketFactory localSSLSocketFactory = this.sslSocketFactory;
      if (localSSLSocketFactory == null);
      try
      {
        this.sslSocketFactory = NetworkUtils.getSSLSocketFactory(new TwitterPinningInfoProvider(getContext()));
        Fabric.getLogger().d("Twitter", "Custom SSL pinning enabled");
        return;
      }
      catch (Exception localException)
      {
        while (true)
          Fabric.getLogger().e("Twitter", "Exception setting up custom SSL pinning", localException);
      }
    }
    finally
    {
    }
  }

  private Session getActiveSession()
  {
    Session localSession = this.twitterSessionManager.getActiveSession();
    if (localSession == null)
      localSession = this.appSessionManager.getActiveSession();
    return localSession;
  }

  public static TwitterCore getInstance()
  {
    checkInitialized();
    return (TwitterCore)Fabric.getKit(TwitterCore.class);
  }

  private void initializeScribeClient()
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(this.twitterSessionManager);
    localArrayList.add(this.appSessionManager);
    TwitterCoreScribeClientHolder.initialize(this, localArrayList, getIdManager());
  }

  protected Boolean doInBackground()
  {
    this.twitterSessionManager.getActiveSession();
    this.appSessionManager.getActiveSession();
    getSSLSocketFactory();
    initializeScribeClient();
    this.sessionMonitor.triggerVerificationIfNecessary();
    this.sessionMonitor.monitorActivityLifecycle(getFabric().getActivityLifecycleManager());
    return Boolean.valueOf(true);
  }

  public TwitterApiClient getApiClient()
  {
    checkInitialized();
    Session localSession = getActiveSession();
    if (localSession == null)
      throw new IllegalStateException("Must have valid session. Did you authenticate with Twitter?");
    return getApiClient(localSession);
  }

  public TwitterApiClient getApiClient(Session paramSession)
  {
    checkInitialized();
    if (!this.apiClients.containsKey(paramSession))
      this.apiClients.putIfAbsent(paramSession, new TwitterApiClient(paramSession));
    return (TwitterApiClient)this.apiClients.get(paramSession);
  }

  public SessionManager<AppSession> getAppSessionManager()
  {
    checkInitialized();
    return this.appSessionManager;
  }

  public TwitterAuthConfig getAuthConfig()
  {
    return this.authConfig;
  }

  public String getIdentifier()
  {
    return "com.twitter.sdk.android:twitter-core";
  }

  public SSLSocketFactory getSSLSocketFactory()
  {
    checkInitialized();
    if (this.sslSocketFactory == null)
      createSSLSocketFactory();
    return this.sslSocketFactory;
  }

  public SessionManager<TwitterSession> getSessionManager()
  {
    checkInitialized();
    return this.twitterSessionManager;
  }

  public String getVersion()
  {
    return "1.3.1.37";
  }

  public void logIn(Activity paramActivity, Callback<TwitterSession> paramCallback)
  {
    checkInitialized();
    new TwitterAuthClient().authorize(paramActivity, paramCallback);
  }

  public void logInGuest(Callback<AppSession> paramCallback)
  {
    checkInitialized();
    new GuestAuthClient(new OAuth2Service(this, null, new TwitterApi())).authorize(this.appSessionManager, paramCallback);
  }

  public void logOut()
  {
    checkInitialized();
    SessionManager localSessionManager = getSessionManager();
    if (localSessionManager != null)
      localSessionManager.clearActiveSession();
  }

  protected boolean onPreExecute()
  {
    this.twitterSessionManager = new PersistedSessionManager(new PreferenceStoreImpl(this), new TwitterSession.Serializer(), "active_twittersession", "twittersession");
    this.sessionMonitor = new SessionMonitor(this.twitterSessionManager, getFabric().getExecutorService());
    this.appSessionManager = new PersistedSessionManager(new PreferenceStoreImpl(this), new AppSession.Serializer(), "active_appsession", "appsession");
    return true;
  }
}