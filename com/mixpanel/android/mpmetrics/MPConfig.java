package com.mixpanel.android.mpmetrics;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.util.Log;

public class MPConfig
{
  public static boolean DEBUG = false;
  private static final String LOGTAG = "MixpanelAPI.Configuration";
  static final int MAX_NOTIFICATION_CACHE_COUNT = 2;
  static final String REFERRER_PREFS_NAME = "com.mixpanel.android.mpmetrics.ReferralInfo";
  public static final int UI_FEATURES_MIN_API = 16;
  public static final String VERSION = "4.5.3";
  private static MPConfig sInstance;
  private static final Object sInstanceLock = new Object();
  private final boolean mAutoShowMixpanelUpdates;
  private final int mBulkUploadLimit;
  private final int mDataExpiration;
  private final String mDecideEndpoint;
  private final String mDecideFallbackEndpoint;
  private final boolean mDisableAppOpenEvent;
  private final boolean mDisableEmulatorBindingUI;
  private final boolean mDisableFallback;
  private final boolean mDisableGestureBindingUI;
  private final String mEditorUrl;
  private final String mEventsEndpoint;
  private final String mEventsFallbackEndpoint;
  private final int mFlushInterval;
  private final String mPeopleEndpoint;
  private final String mPeopleFallbackEndpoint;
  private final String mResourcePackageName;
  private final boolean mTestMode;

  MPConfig(Bundle paramBundle)
  {
    DEBUG = paramBundle.getBoolean("com.mixpanel.android.MPConfig.EnableDebugLogging", false);
    if (paramBundle.containsKey("com.mixpanel.android.MPConfig.AutoCheckForSurveys"))
      Log.w("MixpanelAPI.Configuration", "com.mixpanel.android.MPConfig.AutoCheckForSurveys has been deprecated in favor of com.mixpanel.android.MPConfig.AutoShowMixpanelUpdates. Please update this key as soon as possible.");
    this.mBulkUploadLimit = paramBundle.getInt("com.mixpanel.android.MPConfig.BulkUploadLimit", 40);
    this.mFlushInterval = paramBundle.getInt("com.mixpanel.android.MPConfig.FlushInterval", 60000);
    this.mDataExpiration = paramBundle.getInt("com.mixpanel.android.MPConfig.DataExpiration", 432000000);
    this.mDisableFallback = paramBundle.getBoolean("com.mixpanel.android.MPConfig.DisableFallback", bool1);
    this.mResourcePackageName = paramBundle.getString("com.mixpanel.android.MPConfig.ResourcePackageName");
    this.mDisableGestureBindingUI = paramBundle.getBoolean("com.mixpanel.android.MPConfig.DisableGestureBindingUI", false);
    this.mDisableEmulatorBindingUI = paramBundle.getBoolean("com.mixpanel.android.MPConfig.DisableEmulatorBindingUI", false);
    this.mDisableAppOpenEvent = paramBundle.getBoolean("com.mixpanel.android.MPConfig.DisableAppOpenEvent", bool1);
    boolean bool2 = paramBundle.getBoolean("com.mixpanel.android.MPConfig.AutoCheckForSurveys", bool1);
    boolean bool3 = paramBundle.getBoolean("com.mixpanel.android.MPConfig.AutoShowMixpanelUpdates", bool1);
    if ((bool2) && (bool3));
    while (true)
    {
      this.mAutoShowMixpanelUpdates = bool1;
      this.mTestMode = paramBundle.getBoolean("com.mixpanel.android.MPConfig.TestMode", false);
      String str1 = paramBundle.getString("com.mixpanel.android.MPConfig.EventsEndpoint");
      if (str1 == null)
        str1 = "https://api.mixpanel.com/track?ip=1";
      this.mEventsEndpoint = str1;
      String str2 = paramBundle.getString("com.mixpanel.android.MPConfig.EventsFallbackEndpoint");
      if (str2 == null)
        str2 = "http://api.mixpanel.com/track?ip=1";
      this.mEventsFallbackEndpoint = str2;
      String str3 = paramBundle.getString("com.mixpanel.android.MPConfig.PeopleEndpoint");
      if (str3 == null)
        str3 = "https://api.mixpanel.com/engage";
      this.mPeopleEndpoint = str3;
      String str4 = paramBundle.getString("com.mixpanel.android.MPConfig.PeopleFallbackEndpoint");
      if (str4 == null)
        str4 = "http://api.mixpanel.com/engage";
      this.mPeopleFallbackEndpoint = str4;
      String str5 = paramBundle.getString("com.mixpanel.android.MPConfig.DecideEndpoint");
      if (str5 == null)
        str5 = "https://decide.mixpanel.com/decide";
      this.mDecideEndpoint = str5;
      String str6 = paramBundle.getString("com.mixpanel.android.MPConfig.DecideFallbackEndpoint");
      if (str6 == null)
        str6 = "http://decide.mixpanel.com/decide";
      this.mDecideFallbackEndpoint = str6;
      String str7 = paramBundle.getString("com.mixpanel.android.MPConfig.EditorUrl");
      if (str7 == null)
        str7 = "wss://switchboard.mixpanel.com/connect/";
      this.mEditorUrl = str7;
      if (DEBUG)
        Log.v("MixpanelAPI.Configuration", "Mixpanel configured with:\n    AutoShowMixpanelUpdates " + getAutoShowMixpanelUpdates() + "\n" + "    BulkUploadLimit " + getBulkUploadLimit() + "\n" + "    FlushInterval " + getFlushInterval() + "\n" + "    DataExpiration " + getDataExpiration() + "\n" + "    DisableFallback " + getDisableFallback() + "\n" + "    DisableAppOpenEvent " + getDisableAppOpenEvent() + "\n" + "    DisableDeviceUIBinding " + getDisableGestureBindingUI() + "\n" + "    DisableEmulatorUIBinding " + getDisableEmulatorBindingUI() + "\n" + "    EnableDebugLogging " + DEBUG + "\n" + "    TestMode " + getTestMode() + "\n" + "    EventsEndpoint " + getEventsEndpoint() + "\n" + "    PeopleEndpoint " + getPeopleEndpoint() + "\n" + "    DecideEndpoint " + getDecideEndpoint() + "\n" + "    EventsFallbackEndpoint " + getEventsFallbackEndpoint() + "\n" + "    PeopleFallbackEndpoint " + getPeopleFallbackEndpoint() + "\n" + "    DecideFallbackEndpoint " + getDecideFallbackEndpoint() + "\n" + "    EditorUrl " + getEditorUrl() + "\n");
      return;
      bool1 = false;
    }
  }

  public static MPConfig getInstance(Context paramContext)
  {
    synchronized (sInstanceLock)
    {
      if (sInstance == null)
        sInstance = readConfig(paramContext.getApplicationContext());
      return sInstance;
    }
  }

  static MPConfig readConfig(Context paramContext)
  {
    String str = paramContext.getPackageName();
    try
    {
      Bundle localBundle = paramContext.getPackageManager().getApplicationInfo(str, 128).metaData;
      if (localBundle == null)
        localBundle = new Bundle();
      MPConfig localMPConfig = new MPConfig(localBundle);
      return localMPConfig;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      throw new RuntimeException("Can't configure Mixpanel with package name " + str, localNameNotFoundException);
    }
  }

  public boolean getAutoShowMixpanelUpdates()
  {
    return this.mAutoShowMixpanelUpdates;
  }

  public int getBulkUploadLimit()
  {
    return this.mBulkUploadLimit;
  }

  public int getDataExpiration()
  {
    return this.mDataExpiration;
  }

  public String getDecideEndpoint()
  {
    return this.mDecideEndpoint;
  }

  public String getDecideFallbackEndpoint()
  {
    return this.mDecideFallbackEndpoint;
  }

  public boolean getDisableAppOpenEvent()
  {
    return this.mDisableAppOpenEvent;
  }

  public boolean getDisableEmulatorBindingUI()
  {
    return this.mDisableEmulatorBindingUI;
  }

  public boolean getDisableFallback()
  {
    return this.mDisableFallback;
  }

  public boolean getDisableGestureBindingUI()
  {
    return this.mDisableGestureBindingUI;
  }

  public String getEditorUrl()
  {
    return this.mEditorUrl;
  }

  public String getEventsEndpoint()
  {
    return this.mEventsEndpoint;
  }

  public String getEventsFallbackEndpoint()
  {
    return this.mEventsFallbackEndpoint;
  }

  public int getFlushInterval()
  {
    return this.mFlushInterval;
  }

  public String getPeopleEndpoint()
  {
    return this.mPeopleEndpoint;
  }

  public String getPeopleFallbackEndpoint()
  {
    return this.mPeopleFallbackEndpoint;
  }

  public String getResourcePackageName()
  {
    return this.mResourcePackageName;
  }

  public boolean getTestMode()
  {
    return this.mTestMode;
  }
}