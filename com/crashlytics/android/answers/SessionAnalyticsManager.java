package com.crashlytics.android.answers;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import io.fabric.sdk.android.services.common.ExecutorUtils;
import io.fabric.sdk.android.services.network.HttpRequestFactory;
import io.fabric.sdk.android.services.settings.AnalyticsSettingsData;
import java.util.Map;
import java.util.concurrent.ScheduledExecutorService;

class SessionAnalyticsManager
{
  private static final String EXECUTOR_SERVICE = "Crashlytics SAM";
  static final String ON_CRASH_ERROR_MSG = "onCrash called from main thread!!!";
  final SessionEventsHandler eventsHandler;
  final SessionEventMetadata metadata;

  SessionAnalyticsManager(SessionEventMetadata paramSessionEventMetadata, SessionEventsHandler paramSessionEventsHandler)
  {
    this.metadata = paramSessionEventMetadata;
    this.eventsHandler = paramSessionEventsHandler;
  }

  public static SessionAnalyticsManager build(Context paramContext, SessionEventMetadata paramSessionEventMetadata, SessionAnalyticsFilesManager paramSessionAnalyticsFilesManager, HttpRequestFactory paramHttpRequestFactory)
  {
    ScheduledExecutorService localScheduledExecutorService = ExecutorUtils.buildSingleThreadScheduledExecutorService("Crashlytics SAM");
    return new SessionAnalyticsManager(paramSessionEventMetadata, new SessionEventsHandler(paramContext, new EnabledSessionAnalyticsManagerStrategy(paramContext, localScheduledExecutorService, paramSessionAnalyticsFilesManager, paramHttpRequestFactory), paramSessionAnalyticsFilesManager, localScheduledExecutorService));
  }

  public void disable()
  {
    this.eventsHandler.disable();
  }

  public void onCrash(String paramString)
  {
    if (Looper.myLooper() == Looper.getMainLooper())
      throw new IllegalStateException("onCrash called from main thread!!!");
    this.eventsHandler.recordEventSync(SessionEvent.buildCrashEvent(this.metadata, paramString));
  }

  public void onCreate(Activity paramActivity)
  {
    this.eventsHandler.recordEventAsync(SessionEvent.buildActivityLifecycleEvent(this.metadata, SessionEvent.Type.CREATE, paramActivity), false);
  }

  public void onCustom(String paramString, Map<String, Object> paramMap)
  {
    this.eventsHandler.recordEventAsync(SessionEvent.buildCustomEvent(this.metadata, paramString, paramMap), false);
  }

  public void onDestroy(Activity paramActivity)
  {
    this.eventsHandler.recordEventAsync(SessionEvent.buildActivityLifecycleEvent(this.metadata, SessionEvent.Type.DESTROY, paramActivity), false);
  }

  public void onError(String paramString)
  {
    this.eventsHandler.recordEventAsync(SessionEvent.buildErrorEvent(this.metadata, paramString), false);
  }

  public void onInstall()
  {
    this.eventsHandler.recordEventAsync(SessionEvent.buildInstallEvent(this.metadata), true);
  }

  public void onPause(Activity paramActivity)
  {
    this.eventsHandler.recordEventAsync(SessionEvent.buildActivityLifecycleEvent(this.metadata, SessionEvent.Type.PAUSE, paramActivity), false);
  }

  public void onResume(Activity paramActivity)
  {
    this.eventsHandler.recordEventAsync(SessionEvent.buildActivityLifecycleEvent(this.metadata, SessionEvent.Type.RESUME, paramActivity), false);
  }

  public void onSaveInstanceState(Activity paramActivity)
  {
    this.eventsHandler.recordEventAsync(SessionEvent.buildActivityLifecycleEvent(this.metadata, SessionEvent.Type.SAVE_INSTANCE_STATE, paramActivity), false);
  }

  public void onStart(Activity paramActivity)
  {
    this.eventsHandler.recordEventAsync(SessionEvent.buildActivityLifecycleEvent(this.metadata, SessionEvent.Type.START, paramActivity), false);
  }

  public void onStop(Activity paramActivity)
  {
    this.eventsHandler.recordEventAsync(SessionEvent.buildActivityLifecycleEvent(this.metadata, SessionEvent.Type.STOP, paramActivity), false);
  }

  public void setAnalyticsSettingsData(AnalyticsSettingsData paramAnalyticsSettingsData, String paramString)
  {
    this.eventsHandler.setAnalyticsSettingsData(paramAnalyticsSettingsData, paramString);
  }
}