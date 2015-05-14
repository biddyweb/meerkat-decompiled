package com.twitter.sdk.android;

import android.app.Activity;
import com.digits.sdk.android.Digits;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Session;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.TwitterApiClient;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.TwitterSession;
import com.twitter.sdk.android.tweetcomposer.TweetComposer;
import com.twitter.sdk.android.tweetui.TweetUi;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Kit;
import io.fabric.sdk.android.KitGroup;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;

public class Twitter extends Kit
  implements KitGroup
{
  public final TwitterCore core;
  public final Digits digits;
  public final Collection<? extends Kit> kits;
  public final TweetComposer tweetComposer;
  public final TweetUi tweetUi;

  public Twitter(TwitterAuthConfig paramTwitterAuthConfig)
  {
    this.core = new TwitterCore(paramTwitterAuthConfig);
    this.tweetUi = new TweetUi();
    this.tweetComposer = new TweetComposer();
    this.digits = new Digits();
    Kit[] arrayOfKit = new Kit[4];
    arrayOfKit[0] = this.core;
    arrayOfKit[1] = this.tweetUi;
    arrayOfKit[2] = this.tweetComposer;
    arrayOfKit[3] = this.digits;
    this.kits = Collections.unmodifiableCollection(Arrays.asList(arrayOfKit));
  }

  private static void checkInitialized()
  {
    if (getInstance() == null)
      throw new IllegalStateException("Must start Twitter Kit with Fabric.with() first");
  }

  public static TwitterApiClient getApiClient()
  {
    checkInitialized();
    return getInstance().core.getApiClient();
  }

  public static TwitterApiClient getApiClient(Session paramSession)
  {
    checkInitialized();
    return getInstance().core.getApiClient(paramSession);
  }

  public static Twitter getInstance()
  {
    return (Twitter)Fabric.getKit(Twitter.class);
  }

  public static SessionManager<TwitterSession> getSessionManager()
  {
    checkInitialized();
    return getInstance().core.getSessionManager();
  }

  public static void logIn(Activity paramActivity, Callback<TwitterSession> paramCallback)
  {
    checkInitialized();
    getInstance().core.logIn(paramActivity, paramCallback);
  }

  public static void logOut()
  {
    checkInitialized();
    getInstance().core.logOut();
  }

  protected Object doInBackground()
  {
    return null;
  }

  public String getIdentifier()
  {
    return "com.twitter.sdk.android:twitter";
  }

  public Collection<? extends Kit> getKits()
  {
    return this.kits;
  }

  public String getVersion()
  {
    return "1.3.137";
  }
}