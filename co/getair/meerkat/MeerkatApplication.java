package co.getair.meerkat;

import android.app.Application;
import android.content.Context;
import android.support.multidex.MultiDex;
import co.getair.meerkat.facades.ApplicationFacade;
import com.crashlytics.android.Crashlytics;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.Tracker;
import com.instabug.library.Instabug;
import com.instabug.library.Instabug.GestureMode;
import com.instabug.library.Instabug.IBGInvocationEvent;
import com.mixpanel.android.mpmetrics.MixpanelAPI;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration.Builder;
import com.twitter.sdk.android.Twitter;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Kit;
import java.io.IOException;
import vijay.expirabledisklrucache.cache.ExpirableDiskLruCache;

public class MeerkatApplication extends Application
{
  private static final String APPLICATION_CLASS_NAME = "MeerkatApplication";
  private static final String MIXPANEL_TOKEN = "f0935fb131ceafacf72df9498b930edd";
  Tracker global_tracker = null;
  private MixpanelAPI mixpanelAPI;

  public static String getName()
  {
    return "MeerkatApplication";
  }

  protected void attachBaseContext(Context paramContext)
  {
    super.attachBaseContext(paramContext);
    MultiDex.install(this);
  }

  public MixpanelAPI getMixpanelAPI()
  {
    return this.mixpanelAPI;
  }

  Tracker getTracker()
  {
    try
    {
      if (this.global_tracker == null)
        this.global_tracker = GoogleAnalytics.getInstance(this).newTracker(2131165184);
      Tracker localTracker = this.global_tracker;
      return localTracker;
    }
    finally
    {
    }
  }

  public void onCreate()
  {
    super.onCreate();
    ImageLoaderConfiguration localImageLoaderConfiguration = new ImageLoaderConfiguration.Builder(this).build();
    ImageLoader.getInstance().init(localImageLoaderConfiguration);
    TwitterAuthConfig localTwitterAuthConfig = new TwitterAuthConfig("vbCVlT5uFMl7OmtnMtCX4PQlQ", "sREWXEkAVUfGQ0IxSQxtSigfYKH5oTRKHFFV2qWwbG7sudF6Uq");
    Kit[] arrayOfKit = new Kit[2];
    arrayOfKit[0] = new Twitter(localTwitterAuthConfig);
    arrayOfKit[1] = new Crashlytics();
    Fabric.with(this, arrayOfKit);
    this.mixpanelAPI = MixpanelAPI.getInstance(getApplicationContext(), "f0935fb131ceafacf72df9498b930edd");
    Instabug.initialize(this, "8667f584a82f0821297dbce9d7ca2f8e").setInvocationEvent(Instabug.IBGInvocationEvent.IBGInvocationEventTwoFingersSwipeLeft).setGestureInvocationMode(Instabug.GestureMode.TwoFingersSwipeLeft).setIsTrackingCrashes(false).setWillShowStartAlert(false).setWillShowTutorialAlert(false).setCommentIsRequired(true);
    ApplicationFacade.getInst(getName()).startup(getApplicationContext());
    try
    {
      ExpirableDiskLruCache.getInstance().init(this, Long.valueOf(4096L));
      return;
    }
    catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
  }
}