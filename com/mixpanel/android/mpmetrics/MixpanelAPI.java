package com.mixpanel.android.mpmetrics;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.Bitmap;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.util.Log;
import com.mixpanel.android.R.anim;
import com.mixpanel.android.surveys.SurveyActivity;
import com.mixpanel.android.util.ActivityImageUtils;
import com.mixpanel.android.viewcrawler.TrackingDebug;
import com.mixpanel.android.viewcrawler.UpdatesFromMixpanel;
import com.mixpanel.android.viewcrawler.ViewCrawler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TimeZone;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.locks.ReentrantLock;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MixpanelAPI
{
  private static final String APP_LINKS_LOGTAG = "MixpanelAPI - App Links (OPTIONAL)";
  private static final String ENGAGE_DATE_FORMAT_STRING = "yyyy-MM-dd'T'HH:mm:ss";
  private static final String LOGTAG = "MixpanelAPI.MixpanelAPI";
  public static final String VERSION = "4.5.3";
  private static final Map<String, Map<Context, MixpanelAPI>> sInstanceMap = new HashMap();
  private static final SharedPreferencesLoader sPrefsLoader = new SharedPreferencesLoader();
  private static Future<SharedPreferences> sReferrerPrefs;
  private final MPConfig mConfig;
  private final Context mContext;
  private final DecideMessages mDecideMessages;
  private final Map<String, String> mDeviceInfo;
  private final Map<String, Long> mEventTimings;
  private final AnalyticsMessages mMessages;
  private final PeopleImpl mPeople;
  private final PersistentIdentity mPersistentIdentity;
  private final String mToken;
  private final TrackingDebug mTrackingDebug;
  private final UpdatesFromMixpanel mUpdatesFromMixpanel;
  private final UpdatesListener mUpdatesListener;

  MixpanelAPI(Context paramContext, Future<SharedPreferences> paramFuture, String paramString)
  {
    this.mContext = paramContext;
    this.mToken = paramString;
    this.mEventTimings = new HashMap();
    this.mPeople = new PeopleImpl(null);
    this.mMessages = getAnalyticsMessages();
    this.mConfig = getConfig();
    HashMap localHashMap = new HashMap();
    localHashMap.put("$android_lib_version", "4.5.3");
    localHashMap.put("$android_os", "Android");
    String str1;
    if (Build.VERSION.RELEASE == null)
      str1 = "UNKNOWN";
    while (true)
    {
      localHashMap.put("$android_os_version", str1);
      String str2;
      label119: String str3;
      label141: String str4;
      if (Build.MANUFACTURER == null)
      {
        str2 = "UNKNOWN";
        localHashMap.put("$android_manufacturer", str2);
        if (Build.BRAND != null)
          break label355;
        str3 = "UNKNOWN";
        localHashMap.put("$android_brand", str3);
        if (Build.MODEL != null)
          break label363;
        str4 = "UNKNOWN";
        localHashMap.put("$android_model", str4);
      }
      try
      {
        PackageInfo localPackageInfo = this.mContext.getPackageManager().getPackageInfo(this.mContext.getPackageName(), 0);
        localHashMap.put("$android_app_version", localPackageInfo.versionName);
        localHashMap.put("$android_app_version_code", Integer.toString(localPackageInfo.versionCode));
        this.mDeviceInfo = Collections.unmodifiableMap(localHashMap);
        this.mUpdatesFromMixpanel = constructUpdatesFromMixpanel(paramContext, paramString);
        this.mTrackingDebug = constructTrackingDebug();
        this.mPersistentIdentity = getPersistentIdentity(paramContext, paramFuture, paramString);
        this.mUpdatesListener = constructUpdatesListener();
        this.mDecideMessages = constructDecideUpdates(paramString, this.mUpdatesListener, this.mUpdatesFromMixpanel);
        String str5 = this.mPersistentIdentity.getPeopleDistinctId();
        this.mDecideMessages.setDistinctId(str5);
        this.mMessages.installDecideCheck(this.mDecideMessages);
        registerMixpanelActivityLifecycleCallbacks();
        if (sendAppOpen())
          track("$app_open", null);
        return;
        str1 = Build.VERSION.RELEASE;
        continue;
        str2 = Build.MANUFACTURER;
        break label119;
        label355: str3 = Build.BRAND;
        break label141;
        label363: str4 = Build.MODEL;
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException)
      {
        while (true)
          Log.e("MixpanelAPI.MixpanelAPI", "Exception getting app version name", localNameNotFoundException);
      }
    }
  }

  static void allInstances(InstanceProcessor paramInstanceProcessor)
  {
    synchronized (sInstanceMap)
    {
      Iterator localIterator1 = sInstanceMap.values().iterator();
      while (localIterator1.hasNext())
      {
        Iterator localIterator2 = ((Map)localIterator1.next()).values().iterator();
        if (localIterator2.hasNext())
          paramInstanceProcessor.process((MixpanelAPI)localIterator2.next());
      }
    }
  }

  private static void checkIntentForInboundAppLink(Context paramContext)
  {
    if ((paramContext instanceof Activity))
      try
      {
        Class localClass = Class.forName("bolts.AppLinks");
        Intent localIntent = ((Activity)paramContext).getIntent();
        localClass.getMethod("getTargetUrlFromInboundIntent", new Class[] { Context.class, Intent.class }).invoke(null, new Object[] { paramContext, localIntent });
        return;
      }
      catch (InvocationTargetException localInvocationTargetException)
      {
        Log.d("MixpanelAPI - App Links (OPTIONAL)", "Failed to invoke bolts.AppLinks.getTargetUrlFromInboundIntent() -- Unable to detect inbound App Links", localInvocationTargetException);
        return;
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        Log.d("MixpanelAPI - App Links (OPTIONAL)", "Please install the Bolts library >= 1.1.2 to track App Links: " + localClassNotFoundException.getMessage());
        return;
      }
      catch (NoSuchMethodException localNoSuchMethodException)
      {
        Log.d("MixpanelAPI - App Links (OPTIONAL)", "Please install the Bolts library >= 1.1.2 to track App Links: " + localNoSuchMethodException.getMessage());
        return;
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        Log.d("MixpanelAPI - App Links (OPTIONAL)", "Unable to detect inbound App Links: " + localIllegalAccessException.getMessage());
        return;
      }
    Log.d("MixpanelAPI - App Links (OPTIONAL)", "Context is not an instance of Activity. To detect inbound App Links, pass an instance of an Activity to getInstance.");
  }

  @Deprecated
  public static void enableFallbackServer(Context paramContext, boolean paramBoolean)
  {
    Log.i("MixpanelAPI.MixpanelAPI", "MixpanelAPI.enableFallbackServer is deprecated. This call is a no-op.\n    To enable fallback in your application, add\n    <meta-data android:name=\"com.mixpanel.android.MPConfig.DisableFallback\" android:value=\"false\" />\n    to the <application> section of your AndroidManifest.xml.");
  }

  public static MixpanelAPI getInstance(Context paramContext, String paramString)
  {
    if ((paramString == null) || (paramContext == null))
      return null;
    synchronized (sInstanceMap)
    {
      Context localContext = paramContext.getApplicationContext();
      if (sReferrerPrefs == null)
        sReferrerPrefs = sPrefsLoader.loadPreferences(paramContext, "com.mixpanel.android.mpmetrics.ReferralInfo", null);
      Object localObject2 = (Map)sInstanceMap.get(paramString);
      if (localObject2 == null)
      {
        localObject2 = new HashMap();
        sInstanceMap.put(paramString, localObject2);
      }
      MixpanelAPI localMixpanelAPI = (MixpanelAPI)((Map)localObject2).get(localContext);
      if ((localMixpanelAPI == null) && (ConfigurationChecker.checkBasicConfiguration(localContext)))
      {
        localMixpanelAPI = new MixpanelAPI(localContext, sReferrerPrefs, paramString);
        registerAppLinksListeners(paramContext, localMixpanelAPI);
        ((Map)localObject2).put(localContext, localMixpanelAPI);
      }
      checkIntentForInboundAppLink(paramContext);
      return localMixpanelAPI;
    }
  }

  private void pushWaitingPeopleRecord()
  {
    JSONArray localJSONArray = this.mPersistentIdentity.waitingPeopleRecordsForSending();
    if (localJSONArray != null)
      sendAllPeopleRecords(localJSONArray);
  }

  private void recordPeopleMessage(JSONObject paramJSONObject)
  {
    if (paramJSONObject.has("$distinct_id"))
    {
      this.mMessages.peopleMessage(paramJSONObject);
      return;
    }
    this.mPersistentIdentity.storeWaitingPeopleRecord(paramJSONObject);
  }

  private static void registerAppLinksListeners(Context paramContext, MixpanelAPI paramMixpanelAPI)
  {
    try
    {
      Class localClass = Class.forName("android.support.v4.content.LocalBroadcastManager");
      Method localMethod1 = localClass.getMethod("getInstance", new Class[] { Context.class });
      Method localMethod2 = localClass.getMethod("registerReceiver", new Class[] { BroadcastReceiver.class, IntentFilter.class });
      Object localObject = localMethod1.invoke(null, new Object[] { paramContext });
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = new BroadcastReceiver()
      {
        public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
        {
          JSONObject localJSONObject = new JSONObject();
          Bundle localBundle = paramAnonymousIntent.getBundleExtra("event_args");
          if (localBundle != null)
          {
            Iterator localIterator = localBundle.keySet().iterator();
            while (localIterator.hasNext())
            {
              String str = (String)localIterator.next();
              try
              {
                localJSONObject.put(str, localBundle.get(str));
              }
              catch (JSONException localJSONException)
              {
                Log.e("MixpanelAPI - App Links (OPTIONAL)", "failed to add key \"" + str + "\" to properties for tracking bolts event", localJSONException);
              }
            }
          }
          this.val$mixpanel.track("$" + paramAnonymousIntent.getStringExtra("event_name"), localJSONObject);
        }
      };
      arrayOfObject[1] = new IntentFilter("com.parse.bolts.measurement_event");
      localMethod2.invoke(localObject, arrayOfObject);
      return;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      Log.d("MixpanelAPI - App Links (OPTIONAL)", "Failed to invoke LocalBroadcastManager.registerReceiver() -- App Links tracking will not be enabled due to this exception", localInvocationTargetException);
      return;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      Log.d("MixpanelAPI - App Links (OPTIONAL)", "To enable App Links tracking android.support.v4 must be installed: " + localClassNotFoundException.getMessage());
      return;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      Log.d("MixpanelAPI - App Links (OPTIONAL)", "To enable App Links tracking android.support.v4 must be installed: " + localNoSuchMethodException.getMessage());
      return;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      Log.d("MixpanelAPI - App Links (OPTIONAL)", "App Links tracking will not be enabled due to this exception: " + localIllegalAccessException.getMessage());
    }
  }

  private void sendAllPeopleRecords(JSONArray paramJSONArray)
  {
    int i = 0;
    while (true)
      if (i < paramJSONArray.length())
        try
        {
          JSONObject localJSONObject = paramJSONArray.getJSONObject(i);
          this.mMessages.peopleMessage(localJSONObject);
          i++;
        }
        catch (JSONException localJSONException)
        {
          while (true)
            Log.e("MixpanelAPI.MixpanelAPI", "Malformed people record stored pending identity, will not send it.", localJSONException);
        }
  }

  @Deprecated
  public static void setFlushInterval(Context paramContext, long paramLong)
  {
    Log.i("MixpanelAPI.MixpanelAPI", "MixpanelAPI.setFlushInterval is deprecated. Calling is now a no-op.\n    To set a custom Mixpanel flush interval for your application, add\n    <meta-data android:name=\"com.mixpanel.android.MPConfig.FlushInterval\" android:value=\"YOUR_INTERVAL\" />\n    to the <application> section of your AndroidManifest.xml.");
  }

  public void alias(String paramString1, String paramString2)
  {
    if (paramString2 == null)
      paramString2 = getDistinctId();
    if (paramString1.equals(paramString2))
    {
      Log.w("MixpanelAPI.MixpanelAPI", "Attempted to alias identical distinct_ids " + paramString1 + ". Alias message will not be sent.");
      return;
    }
    try
    {
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("alias", paramString1);
      localJSONObject.put("original", paramString2);
      track("$create_alias", localJSONObject);
      flush();
      return;
    }
    catch (JSONException localJSONException)
    {
      while (true)
        Log.e("MixpanelAPI.MixpanelAPI", "Failed to alias", localJSONException);
    }
  }

  public void clearSuperProperties()
  {
    this.mPersistentIdentity.clearSuperProperties();
  }

  DecideMessages constructDecideUpdates(String paramString, DecideMessages.OnNewResultsListener paramOnNewResultsListener, UpdatesFromMixpanel paramUpdatesFromMixpanel)
  {
    return new DecideMessages(paramString, paramOnNewResultsListener, paramUpdatesFromMixpanel);
  }

  TrackingDebug constructTrackingDebug()
  {
    if ((this.mUpdatesFromMixpanel instanceof ViewCrawler))
      return (TrackingDebug)this.mUpdatesFromMixpanel;
    return null;
  }

  UpdatesFromMixpanel constructUpdatesFromMixpanel(Context paramContext, String paramString)
  {
    if (Build.VERSION.SDK_INT < 16)
    {
      Log.i("MixpanelAPI.MixpanelAPI", "Web Configuration, A/B Testing, and Dynamic Tweaks are not supported on this Android OS Version");
      return new UnsupportedUpdatesFromMixpanel();
    }
    return new ViewCrawler(this.mContext, this.mToken, this);
  }

  UpdatesListener constructUpdatesListener()
  {
    if (Build.VERSION.SDK_INT < 16)
    {
      Log.i("MixpanelAPI.MixpanelAPI", "Surveys and Notifications are not supported on this Android OS Version");
      return new UnsupportedUpdatesListener(null);
    }
    return new SupportedUpdatesListener(null);
  }

  public void flush()
  {
    this.mMessages.postToServer();
  }

  AnalyticsMessages getAnalyticsMessages()
  {
    return AnalyticsMessages.getInstance(this.mContext);
  }

  MPConfig getConfig()
  {
    return MPConfig.getInstance(this.mContext);
  }

  public Map<String, String> getDeviceInfo()
  {
    return this.mDeviceInfo;
  }

  public String getDistinctId()
  {
    return this.mPersistentIdentity.getEventsDistinctId();
  }

  public People getPeople()
  {
    return this.mPeople;
  }

  PersistentIdentity getPersistentIdentity(Context paramContext, Future<SharedPreferences> paramFuture, String paramString)
  {
    SharedPreferencesLoader.OnPrefsLoadedListener local1 = new SharedPreferencesLoader.OnPrefsLoadedListener()
    {
      public void onPrefsLoaded(SharedPreferences paramAnonymousSharedPreferences)
      {
        JSONArray localJSONArray = PersistentIdentity.waitingPeopleRecordsForSending(paramAnonymousSharedPreferences);
        if (localJSONArray != null)
          MixpanelAPI.this.sendAllPeopleRecords(localJSONArray);
      }
    };
    String str = "com.mixpanel.android.mpmetrics.MixpanelAPI_" + paramString;
    return new PersistentIdentity(paramFuture, sPrefsLoader.loadPreferences(paramContext, str, local1));
  }

  public JSONObject getSuperProperties()
  {
    return this.mPersistentIdentity.getSuperProperties();
  }

  public void identify(String paramString)
  {
    this.mPersistentIdentity.setEventsDistinctId(paramString);
  }

  @Deprecated
  public void logPosts()
  {
    Log.i("MixpanelAPI.MixpanelAPI", "MixpanelAPI.logPosts() is deprecated.\n    To get verbose debug level logging, add\n    <meta-data android:name=\"com.mixpanel.android.MPConfig.EnableDebugLogging\" value=\"true\" />\n    to the <application> section of your AndroidManifest.xml.");
  }

  @TargetApi(16)
  void registerMixpanelActivityLifecycleCallbacks()
  {
    if ((Build.VERSION.SDK_INT >= 16) && (this.mConfig.getAutoShowMixpanelUpdates()))
    {
      if ((this.mContext.getApplicationContext() instanceof Application))
        ((Application)this.mContext.getApplicationContext()).registerActivityLifecycleCallbacks(new MixpanelActivityLifecycleCallbacks(this));
    }
    else
      return;
    Log.i("MixpanelAPI.MixpanelAPI", "Context is not an Application, Mixpanel will not automatically show surveys or in-app notifications.");
  }

  public void registerSuperProperties(JSONObject paramJSONObject)
  {
    this.mPersistentIdentity.registerSuperProperties(paramJSONObject);
  }

  public void registerSuperPropertiesOnce(JSONObject paramJSONObject)
  {
    this.mPersistentIdentity.registerSuperPropertiesOnce(paramJSONObject);
  }

  public void reset()
  {
    this.mPersistentIdentity.clearPreferences();
  }

  boolean sendAppOpen()
  {
    return !this.mConfig.getDisableAppOpenEvent();
  }

  public void timeEvent(String paramString)
  {
    long l = System.currentTimeMillis();
    synchronized (this.mEventTimings)
    {
      this.mEventTimings.put(paramString, Long.valueOf(l));
      return;
    }
  }

  public void track(String paramString, JSONObject paramJSONObject)
  {
    do
    {
      Long localLong;
      JSONObject localJSONObject1;
      synchronized (this.mEventTimings)
      {
        localLong = (Long)this.mEventTimings.get(paramString);
        this.mEventTimings.remove(paramString);
        try
        {
          localJSONObject1 = new JSONObject();
          Iterator localIterator1 = this.mPersistentIdentity.getReferrerProperties().entrySet().iterator();
          while (localIterator1.hasNext())
          {
            Map.Entry localEntry = (Map.Entry)localIterator1.next();
            localJSONObject1.put((String)localEntry.getKey(), (String)localEntry.getValue());
          }
        }
        catch (JSONException localJSONException)
        {
          Log.e("MixpanelAPI.MixpanelAPI", "Exception tracking event " + paramString, localJSONException);
          return;
        }
      }
      JSONObject localJSONObject2 = this.mPersistentIdentity.getSuperProperties();
      Iterator localIterator2 = localJSONObject2.keys();
      while (localIterator2.hasNext())
      {
        String str2 = (String)localIterator2.next();
        localJSONObject1.put(str2, localJSONObject2.get(str2));
      }
      double d = System.currentTimeMillis() / 1000.0D;
      localJSONObject1.put("time", ()d);
      localJSONObject1.put("distinct_id", getDistinctId());
      if (localLong != null)
        localJSONObject1.put("$duration", d - localLong.longValue() / 1000.0D);
      if (paramJSONObject != null)
      {
        Iterator localIterator3 = paramJSONObject.keys();
        while (localIterator3.hasNext())
        {
          String str1 = (String)localIterator3.next();
          localJSONObject1.put(str1, paramJSONObject.get(str1));
        }
      }
      AnalyticsMessages.EventDescription localEventDescription = new AnalyticsMessages.EventDescription(paramString, localJSONObject1, this.mToken);
      this.mMessages.eventsMessage(localEventDescription);
    }
    while (this.mTrackingDebug == null);
    this.mTrackingDebug.reportTrack(paramString);
  }

  public void unregisterSuperProperty(String paramString)
  {
    this.mPersistentIdentity.unregisterSuperProperty(paramString);
  }

  static abstract interface InstanceProcessor
  {
    public abstract void process(MixpanelAPI paramMixpanelAPI);
  }

  public static abstract interface People
  {
    public abstract void addOnMixpanelUpdatesReceivedListener(OnMixpanelUpdatesReceivedListener paramOnMixpanelUpdatesReceivedListener);

    public abstract void append(String paramString, Object paramObject);

    @Deprecated
    public abstract void checkForSurvey(SurveyCallbacks paramSurveyCallbacks);

    @Deprecated
    public abstract void checkForSurvey(SurveyCallbacks paramSurveyCallbacks, Activity paramActivity);

    public abstract void clearCharges();

    public abstract void clearPushRegistrationId();

    public abstract void deleteUser();

    public abstract String getDistinctId();

    public abstract InAppNotification getNotificationIfAvailable();

    public abstract Survey getSurveyIfAvailable();

    public abstract void identify(String paramString);

    public abstract void increment(String paramString, double paramDouble);

    public abstract void increment(Map<String, ? extends Number> paramMap);

    public abstract void initPushHandling(String paramString);

    public abstract void removeOnMixpanelUpdatesReceivedListener(OnMixpanelUpdatesReceivedListener paramOnMixpanelUpdatesReceivedListener);

    public abstract void set(String paramString, Object paramObject);

    public abstract void set(JSONObject paramJSONObject);

    public abstract void setOnce(String paramString, Object paramObject);

    public abstract void setOnce(JSONObject paramJSONObject);

    public abstract void setPushRegistrationId(String paramString);

    public abstract void showGivenNotification(InAppNotification paramInAppNotification, Activity paramActivity);

    public abstract void showNotificationById(int paramInt, Activity paramActivity);

    public abstract void showNotificationIfAvailable(Activity paramActivity);

    @Deprecated
    public abstract void showSurvey(Survey paramSurvey, Activity paramActivity);

    public abstract void showSurveyById(int paramInt, Activity paramActivity);

    public abstract void showSurveyIfAvailable(Activity paramActivity);

    public abstract void trackCharge(double paramDouble, JSONObject paramJSONObject);

    public abstract void trackNotification(String paramString, InAppNotification paramInAppNotification);

    public abstract void trackNotificationSeen(InAppNotification paramInAppNotification);

    public abstract void union(String paramString, JSONArray paramJSONArray);

    public abstract void unset(String paramString);

    public abstract People withIdentity(String paramString);
  }

  private class PeopleImpl
    implements MixpanelAPI.People
  {
    private PeopleImpl()
    {
    }

    @TargetApi(19)
    private void registerForPushIdAPI19AndOlder(String paramString)
    {
      try
      {
        if (MPConfig.DEBUG)
          Log.v("MixpanelAPI.MixpanelAPI", "Registering a new push id");
        Intent localIntent = new Intent("com.google.android.c2dm.intent.REGISTER");
        localIntent.putExtra("app", PendingIntent.getBroadcast(MixpanelAPI.this.mContext, 0, new Intent(), 0));
        localIntent.putExtra("sender", paramString);
        MixpanelAPI.this.mContext.startService(localIntent);
        return;
      }
      catch (SecurityException localSecurityException)
      {
        Log.w("MixpanelAPI.MixpanelAPI", localSecurityException);
      }
    }

    @TargetApi(21)
    private void registerForPushIdAPI21AndUp(String paramString)
    {
      MixpanelAPI.this.mMessages.registerForGCM(paramString);
    }

    private void showGivenOrAvailableNotification(final InAppNotification paramInAppNotification, final Activity paramActivity)
    {
      if (Build.VERSION.SDK_INT < 16)
      {
        if (MPConfig.DEBUG)
          Log.v("MixpanelAPI.MixpanelAPI", "Will not show notifications, os version is too low.");
        return;
      }
      paramActivity.runOnUiThread(new Runnable()
      {
        @TargetApi(16)
        public void run()
        {
          ReentrantLock localReentrantLock = UpdateDisplayState.getLockObject();
          localReentrantLock.lock();
          while (true)
          {
            int i;
            try
            {
              if (UpdateDisplayState.hasCurrentProposal())
              {
                if (MPConfig.DEBUG)
                  Log.v("MixpanelAPI.MixpanelAPI", "DisplayState is locked, will not show notifications.");
                return;
              }
              InAppNotification localInAppNotification = paramInAppNotification;
              if (localInAppNotification == null)
                localInAppNotification = MixpanelAPI.PeopleImpl.this.getNotificationIfAvailable();
              if (localInAppNotification == null)
              {
                if (MPConfig.DEBUG)
                  Log.v("MixpanelAPI.MixpanelAPI", "No notification available, will not show.");
                return;
              }
              InAppNotification.Type localType = localInAppNotification.getType();
              if ((localType == InAppNotification.Type.TAKEOVER) && (!ConfigurationChecker.checkSurveyActivityAvailable(paramActivity.getApplicationContext())))
              {
                if (MPConfig.DEBUG)
                  Log.v("MixpanelAPI.MixpanelAPI", "Application is not configured to show takeover notifications, none will be shown.");
                return;
              }
              i = UpdateDisplayState.proposeDisplay(new UpdateDisplayState.DisplayState.InAppNotificationState(localInAppNotification, ActivityImageUtils.getHighlightColorFromBackground(paramActivity)), MixpanelAPI.PeopleImpl.this.getDistinctId(), MixpanelAPI.this.mToken);
              if (i <= 0)
              {
                Log.e("MixpanelAPI.MixpanelAPI", "DisplayState Lock in inconsistent state! Please report this issue to Mixpanel");
                return;
              }
              switch (MixpanelAPI.3.$SwitchMap$com$mixpanel$android$mpmetrics$InAppNotification$Type[localType.ordinal()])
              {
              default:
                Log.e("MixpanelAPI.MixpanelAPI", "Unrecognized notification type " + localType + " can't be shown");
                if (!MixpanelAPI.this.mConfig.getTestMode())
                  MixpanelAPI.PeopleImpl.this.trackNotificationSeen(localInAppNotification);
                return;
              case 1:
                UpdateDisplayState localUpdateDisplayState = UpdateDisplayState.claimDisplayState(i);
                if (localUpdateDisplayState == null)
                {
                  if (MPConfig.DEBUG)
                    Log.v("MixpanelAPI.MixpanelAPI", "Notification's display proposal was already consumed, no notification will be shown.");
                  return;
                }
                InAppFragment localInAppFragment = new InAppFragment();
                localInAppFragment.setDisplayState(MixpanelAPI.this, i, (UpdateDisplayState.DisplayState.InAppNotificationState)localUpdateDisplayState.getDisplayState());
                localInAppFragment.setRetainInstance(true);
                if (MPConfig.DEBUG)
                  Log.v("MixpanelAPI.MixpanelAPI", "Attempting to show mini notification.");
                FragmentTransaction localFragmentTransaction = paramActivity.getFragmentManager().beginTransaction();
                localFragmentTransaction.setCustomAnimations(0, R.anim.com_mixpanel_android_slide_down);
                localFragmentTransaction.add(16908290, localInAppFragment);
                localFragmentTransaction.commit();
                continue;
              case 2:
              }
            }
            finally
            {
              localReentrantLock.unlock();
            }
            if (MPConfig.DEBUG)
              Log.v("MixpanelAPI.MixpanelAPI", "Sending intent for takeover notification.");
            Intent localIntent = new Intent(paramActivity.getApplicationContext(), SurveyActivity.class);
            localIntent.addFlags(268435456);
            localIntent.addFlags(131072);
            localIntent.putExtra("com.mixpanel.android.surveys.SurveyActivity.INTENT_ID_KEY", i);
            paramActivity.startActivity(localIntent);
          }
        }
      });
    }

    private void showGivenOrAvailableSurvey(Survey paramSurvey, final Activity paramActivity)
    {
      if (Build.VERSION.SDK_INT < 16)
        if (MPConfig.DEBUG)
          Log.v("MixpanelAPI.MixpanelAPI", "Will not show survey, os version is too low.");
      do
      {
        return;
        if (ConfigurationChecker.checkSurveyActivityAvailable(paramActivity.getApplicationContext()))
          break;
      }
      while (!MPConfig.DEBUG);
      Log.v("MixpanelAPI.MixpanelAPI", "Will not show survey, application isn't configured appropriately.");
      return;
      ReentrantLock localReentrantLock = UpdateDisplayState.getLockObject();
      localReentrantLock.lock();
      try
      {
        boolean bool = UpdateDisplayState.hasCurrentProposal();
        if (bool)
          return;
        Object localObject2 = paramSurvey;
        if (localObject2 == null)
        {
          Survey localSurvey = getSurveyIfAvailable();
          localObject2 = localSurvey;
        }
        if (localObject2 == null)
          return;
        final UpdateDisplayState.DisplayState.SurveyState localSurveyState = new UpdateDisplayState.DisplayState.SurveyState((Survey)localObject2);
        final int i = UpdateDisplayState.proposeDisplay(localSurveyState, getDistinctId(), MixpanelAPI.this.mToken);
        if (i <= 0)
        {
          Log.e("MixpanelAPI.MixpanelAPI", "DisplayState Lock is in an inconsistent state! Please report this issue to Mixpanel");
          return;
        }
        BackgroundCapture.OnBackgroundCapturedListener local3 = new BackgroundCapture.OnBackgroundCapturedListener()
        {
          public void onBackgroundCaptured(Bitmap paramAnonymousBitmap, int paramAnonymousInt)
          {
            localSurveyState.setBackground(paramAnonymousBitmap);
            localSurveyState.setHighlightColor(paramAnonymousInt);
            Intent localIntent = new Intent(paramActivity.getApplicationContext(), SurveyActivity.class);
            localIntent.addFlags(268435456);
            localIntent.addFlags(131072);
            localIntent.putExtra("com.mixpanel.android.surveys.SurveyActivity.INTENT_ID_KEY", i);
            paramActivity.startActivity(localIntent);
          }
        };
        localReentrantLock.unlock();
        BackgroundCapture.captureBackground(paramActivity, local3);
        return;
      }
      finally
      {
        localReentrantLock.unlock();
      }
    }

    private JSONObject stdPeopleMessage(String paramString, Object paramObject)
      throws JSONException
    {
      JSONObject localJSONObject = new JSONObject();
      String str = getDistinctId();
      localJSONObject.put(paramString, paramObject);
      localJSONObject.put("$token", MixpanelAPI.this.mToken);
      localJSONObject.put("$time", System.currentTimeMillis());
      if (str != null)
        localJSONObject.put("$distinct_id", getDistinctId());
      return localJSONObject;
    }

    public void addOnMixpanelUpdatesReceivedListener(OnMixpanelUpdatesReceivedListener paramOnMixpanelUpdatesReceivedListener)
    {
      MixpanelAPI.this.mUpdatesListener.addOnMixpanelUpdatesReceivedListener(paramOnMixpanelUpdatesReceivedListener);
    }

    public void append(String paramString, Object paramObject)
    {
      try
      {
        JSONObject localJSONObject1 = new JSONObject();
        localJSONObject1.put(paramString, paramObject);
        JSONObject localJSONObject2 = stdPeopleMessage("$append", localJSONObject1);
        MixpanelAPI.this.recordPeopleMessage(localJSONObject2);
        return;
      }
      catch (JSONException localJSONException)
      {
        Log.e("MixpanelAPI.MixpanelAPI", "Exception appending a property", localJSONException);
      }
    }

    @Deprecated
    public void checkForSurvey(SurveyCallbacks paramSurveyCallbacks)
    {
      Log.i("MixpanelAPI.MixpanelAPI", "MixpanelAPI.checkForSurvey is deprecated. Calling is now a no-op.\n    to query surveys, call MixpanelAPI.getPeople().getSurveyIfAvailable()");
    }

    @Deprecated
    public void checkForSurvey(SurveyCallbacks paramSurveyCallbacks, Activity paramActivity)
    {
      Log.i("MixpanelAPI.MixpanelAPI", "MixpanelAPI.checkForSurvey is deprecated. Calling is now a no-op.\n    to query surveys, call MixpanelAPI.getPeople().getSurveyIfAvailable()");
    }

    public void clearCharges()
    {
      unset("$transactions");
    }

    public void clearPushRegistrationId()
    {
      MixpanelAPI.this.mPersistentIdentity.clearPushId();
      set("$android_devices", new JSONArray());
    }

    public void deleteUser()
    {
      try
      {
        JSONObject localJSONObject = stdPeopleMessage("$delete", JSONObject.NULL);
        MixpanelAPI.this.recordPeopleMessage(localJSONObject);
        return;
      }
      catch (JSONException localJSONException)
      {
        Log.e("MixpanelAPI.MixpanelAPI", "Exception deleting a user");
      }
    }

    public String getDistinctId()
    {
      return MixpanelAPI.this.mPersistentIdentity.getPeopleDistinctId();
    }

    public InAppNotification getNotificationIfAvailable()
    {
      return MixpanelAPI.this.mDecideMessages.getNotification(MixpanelAPI.this.mConfig.getTestMode());
    }

    public Survey getSurveyIfAvailable()
    {
      return MixpanelAPI.this.mDecideMessages.getSurvey(MixpanelAPI.this.mConfig.getTestMode());
    }

    public void identify(String paramString)
    {
      MixpanelAPI.this.mPersistentIdentity.setPeopleDistinctId(paramString);
      MixpanelAPI.this.mDecideMessages.setDistinctId(paramString);
      MixpanelAPI.this.pushWaitingPeopleRecord();
    }

    public void increment(String paramString, double paramDouble)
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put(paramString, Double.valueOf(paramDouble));
      increment(localHashMap);
    }

    public void increment(Map<String, ? extends Number> paramMap)
    {
      JSONObject localJSONObject1 = new JSONObject(paramMap);
      try
      {
        JSONObject localJSONObject2 = stdPeopleMessage("$add", localJSONObject1);
        MixpanelAPI.this.recordPeopleMessage(localJSONObject2);
        return;
      }
      catch (JSONException localJSONException)
      {
        Log.e("MixpanelAPI.MixpanelAPI", "Exception incrementing properties", localJSONException);
      }
    }

    public void initPushHandling(String paramString)
    {
      if (!ConfigurationChecker.checkPushConfiguration(MixpanelAPI.this.mContext))
      {
        Log.i("MixpanelAPI.MixpanelAPI", "Can't register for push notification services. Push notifications will not work.");
        Log.i("MixpanelAPI.MixpanelAPI", "See log tagged " + ConfigurationChecker.LOGTAG + " above for details.");
        return;
      }
      final String str = MixpanelAPI.this.mPersistentIdentity.getPushId();
      if (str == null)
      {
        if (Build.VERSION.SDK_INT >= 21)
        {
          registerForPushIdAPI21AndUp(paramString);
          return;
        }
        registerForPushIdAPI19AndOlder(paramString);
        return;
      }
      MixpanelAPI.allInstances(new MixpanelAPI.InstanceProcessor()
      {
        public void process(MixpanelAPI paramAnonymousMixpanelAPI)
        {
          if (MPConfig.DEBUG)
            Log.v("MixpanelAPI.MixpanelAPI", "Using existing pushId " + str);
          paramAnonymousMixpanelAPI.getPeople().setPushRegistrationId(str);
        }
      });
    }

    public void removeOnMixpanelUpdatesReceivedListener(OnMixpanelUpdatesReceivedListener paramOnMixpanelUpdatesReceivedListener)
    {
      MixpanelAPI.this.mUpdatesListener.removeOnMixpanelUpdatesReceivedListener(paramOnMixpanelUpdatesReceivedListener);
    }

    public void set(String paramString, Object paramObject)
    {
      try
      {
        set(new JSONObject().put(paramString, paramObject));
        return;
      }
      catch (JSONException localJSONException)
      {
        Log.e("MixpanelAPI.MixpanelAPI", "set", localJSONException);
      }
    }

    public void set(JSONObject paramJSONObject)
    {
      JSONObject localJSONObject1;
      try
      {
        localJSONObject1 = new JSONObject(MixpanelAPI.this.mDeviceInfo);
        Iterator localIterator = paramJSONObject.keys();
        while (localIterator.hasNext())
        {
          String str = (String)localIterator.next();
          localJSONObject1.put(str, paramJSONObject.get(str));
        }
      }
      catch (JSONException localJSONException)
      {
        Log.e("MixpanelAPI.MixpanelAPI", "Exception setting people properties", localJSONException);
        return;
      }
      JSONObject localJSONObject2 = stdPeopleMessage("$set", localJSONObject1);
      MixpanelAPI.this.recordPeopleMessage(localJSONObject2);
    }

    public void setOnce(String paramString, Object paramObject)
    {
      try
      {
        setOnce(new JSONObject().put(paramString, paramObject));
        return;
      }
      catch (JSONException localJSONException)
      {
        Log.e("MixpanelAPI.MixpanelAPI", "set", localJSONException);
      }
    }

    public void setOnce(JSONObject paramJSONObject)
    {
      try
      {
        JSONObject localJSONObject = stdPeopleMessage("$set_once", paramJSONObject);
        MixpanelAPI.this.recordPeopleMessage(localJSONObject);
        return;
      }
      catch (JSONException localJSONException)
      {
        Log.e("MixpanelAPI.MixpanelAPI", "Exception setting people properties");
      }
    }

    public void setPushRegistrationId(String paramString)
    {
      synchronized (MixpanelAPI.this.mPersistentIdentity)
      {
        if (MixpanelAPI.this.mPersistentIdentity.getPeopleDistinctId() == null)
          return;
        MixpanelAPI.this.mPersistentIdentity.storePushId(paramString);
      }
      try
      {
        union("$android_devices", new JSONArray("[" + paramString + "]"));
        return;
        localObject = finally;
        throw localObject;
      }
      catch (JSONException localJSONException)
      {
        while (true)
          Log.e("MixpanelAPI.MixpanelAPI", "set push registration id error", localJSONException);
      }
    }

    public void showGivenNotification(InAppNotification paramInAppNotification, Activity paramActivity)
    {
      if (paramInAppNotification != null)
        showGivenOrAvailableNotification(paramInAppNotification, paramActivity);
    }

    public void showNotificationById(int paramInt, Activity paramActivity)
    {
      showGivenNotification(MixpanelAPI.this.mDecideMessages.getNotification(paramInt, MixpanelAPI.this.mConfig.getTestMode()), paramActivity);
    }

    public void showNotificationIfAvailable(Activity paramActivity)
    {
      if (Build.VERSION.SDK_INT < 16)
        return;
      showGivenOrAvailableNotification(null, paramActivity);
    }

    @Deprecated
    public void showSurvey(Survey paramSurvey, Activity paramActivity)
    {
      showGivenOrAvailableSurvey(paramSurvey, paramActivity);
    }

    public void showSurveyById(int paramInt, Activity paramActivity)
    {
      Survey localSurvey = MixpanelAPI.this.mDecideMessages.getSurvey(paramInt, MixpanelAPI.this.mConfig.getTestMode());
      if (localSurvey != null)
        showGivenOrAvailableSurvey(localSurvey, paramActivity);
    }

    public void showSurveyIfAvailable(Activity paramActivity)
    {
      if (Build.VERSION.SDK_INT < 16)
        return;
      showGivenOrAvailableSurvey(null, paramActivity);
    }

    public void trackCharge(double paramDouble, JSONObject paramJSONObject)
    {
      Date localDate = new Date();
      SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.US);
      localSimpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
      JSONObject localJSONObject;
      try
      {
        localJSONObject = new JSONObject();
        localJSONObject.put("$amount", paramDouble);
        localJSONObject.put("$time", localSimpleDateFormat.format(localDate));
        if (paramJSONObject != null)
        {
          Iterator localIterator = paramJSONObject.keys();
          while (localIterator.hasNext())
          {
            String str = (String)localIterator.next();
            localJSONObject.put(str, paramJSONObject.get(str));
          }
        }
      }
      catch (JSONException localJSONException)
      {
        Log.e("MixpanelAPI.MixpanelAPI", "Exception creating new charge", localJSONException);
        return;
      }
      append("$transactions", localJSONObject);
    }

    public void trackNotification(String paramString, InAppNotification paramInAppNotification)
    {
      MixpanelAPI.this.track(paramString, paramInAppNotification.getCampaignProperties());
    }

    public void trackNotificationSeen(InAppNotification paramInAppNotification)
    {
      if (paramInAppNotification == null)
        return;
      trackNotification("$campaign_delivery", paramInAppNotification);
      MixpanelAPI.People localPeople = MixpanelAPI.this.getPeople().withIdentity(getDistinctId());
      SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.US);
      JSONObject localJSONObject = paramInAppNotification.getCampaignProperties();
      try
      {
        localJSONObject.put("$time", localSimpleDateFormat.format(new Date()));
        localPeople.append("$campaigns", Integer.valueOf(paramInAppNotification.getId()));
        localPeople.append("$notifications", localJSONObject);
        return;
      }
      catch (JSONException localJSONException)
      {
        while (true)
          Log.e("MixpanelAPI.MixpanelAPI", "Exception trying to track an in app notification seen", localJSONException);
      }
    }

    public void union(String paramString, JSONArray paramJSONArray)
    {
      try
      {
        JSONObject localJSONObject1 = new JSONObject();
        localJSONObject1.put(paramString, paramJSONArray);
        JSONObject localJSONObject2 = stdPeopleMessage("$union", localJSONObject1);
        MixpanelAPI.this.recordPeopleMessage(localJSONObject2);
        return;
      }
      catch (JSONException localJSONException)
      {
        Log.e("MixpanelAPI.MixpanelAPI", "Exception unioning a property");
      }
    }

    public void unset(String paramString)
    {
      try
      {
        JSONArray localJSONArray = new JSONArray();
        localJSONArray.put(paramString);
        JSONObject localJSONObject = stdPeopleMessage("$unset", localJSONArray);
        MixpanelAPI.this.recordPeopleMessage(localJSONObject);
        return;
      }
      catch (JSONException localJSONException)
      {
        Log.e("MixpanelAPI.MixpanelAPI", "Exception unsetting a property", localJSONException);
      }
    }

    public MixpanelAPI.People withIdentity(final String paramString)
    {
      // Byte code:
      //   0: aload_1
      //   1: ifnonnull +5 -> 6
      //   4: aconst_null
      //   5: areturn
      //   6: new 550\011com/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$2
      //   9: dup
      //   10: aload_0
      //   11: aload_1
      //   12: invokespecial 551\011com/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl$2:<init>\011(Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;Ljava/lang/String;)V
      //   15: areturn
    }
  }

  private class SupportedUpdatesListener
    implements MixpanelAPI.UpdatesListener, Runnable
  {
    private final Executor mExecutor = Executors.newSingleThreadExecutor();
    private final Set<OnMixpanelUpdatesReceivedListener> mListeners = new HashSet();

    private SupportedUpdatesListener()
    {
    }

    public void addOnMixpanelUpdatesReceivedListener(OnMixpanelUpdatesReceivedListener paramOnMixpanelUpdatesReceivedListener)
    {
      try
      {
        if (MixpanelAPI.this.mDecideMessages.hasUpdatesAvailable())
          onNewResults();
        this.mListeners.add(paramOnMixpanelUpdatesReceivedListener);
        return;
      }
      finally
      {
      }
    }

    public void onNewResults()
    {
      this.mExecutor.execute(this);
    }

    public void removeOnMixpanelUpdatesReceivedListener(OnMixpanelUpdatesReceivedListener paramOnMixpanelUpdatesReceivedListener)
    {
      try
      {
        this.mListeners.remove(paramOnMixpanelUpdatesReceivedListener);
        return;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }

    public void run()
    {
      try
      {
        Iterator localIterator = this.mListeners.iterator();
        while (localIterator.hasNext())
          ((OnMixpanelUpdatesReceivedListener)localIterator.next()).onMixpanelUpdatesReceived();
      }
      finally
      {
      }
    }
  }

  private class UnsupportedUpdatesFromMixpanel
    implements UpdatesFromMixpanel
  {
    private final Tweaks mEmptyTweaks = new Tweaks();

    public UnsupportedUpdatesFromMixpanel()
    {
    }

    public Tweaks getTweaks()
    {
      return this.mEmptyTweaks;
    }

    public void setEventBindings(JSONArray paramJSONArray)
    {
    }
  }

  private class UnsupportedUpdatesListener
    implements MixpanelAPI.UpdatesListener
  {
    private UnsupportedUpdatesListener()
    {
    }

    public void addOnMixpanelUpdatesReceivedListener(OnMixpanelUpdatesReceivedListener paramOnMixpanelUpdatesReceivedListener)
    {
    }

    public void onNewResults()
    {
    }

    public void removeOnMixpanelUpdatesReceivedListener(OnMixpanelUpdatesReceivedListener paramOnMixpanelUpdatesReceivedListener)
    {
    }
  }

  private static abstract interface UpdatesListener extends DecideMessages.OnNewResultsListener
  {
    public abstract void addOnMixpanelUpdatesReceivedListener(OnMixpanelUpdatesReceivedListener paramOnMixpanelUpdatesReceivedListener);

    public abstract void removeOnMixpanelUpdatesReceivedListener(OnMixpanelUpdatesReceivedListener paramOnMixpanelUpdatesReceivedListener);
  }
}