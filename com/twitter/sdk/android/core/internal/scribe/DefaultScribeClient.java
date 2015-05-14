package com.twitter.sdk.android.core.internal.scribe;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.twitter.sdk.android.core.Session;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.TwitterCore;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Kit;
import io.fabric.sdk.android.services.common.ExecutorUtils;
import io.fabric.sdk.android.services.common.IdManager;
import io.fabric.sdk.android.services.settings.AnalyticsSettingsData;
import io.fabric.sdk.android.services.settings.Settings;
import io.fabric.sdk.android.services.settings.SettingsData;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ScheduledExecutorService;

public class DefaultScribeClient extends ScribeClient
{
  private static final String SCRIBE_PATH_TYPE = "sdk";
  private static final String SCRIBE_PATH_VERSION = "i";
  private static final String SCRIBE_URL = "https://syndication.twitter.com";
  private static volatile ScheduledExecutorService executor;
  private final String advertisingId;
  private final Kit kit;
  private final List<SessionManager<? extends Session>> sessionManagers;

  public DefaultScribeClient(Kit paramKit, String paramString, Gson paramGson, List<SessionManager<? extends Session>> paramList, IdManager paramIdManager)
  {
    super(paramKit, getExecutor(), getScribeConfig(Settings.getInstance().awaitSettingsData(), getUserAgent(paramString, paramKit)), new ScribeEvent.Transform(paramGson), TwitterCore.getInstance().getAuthConfig(), paramList, TwitterCore.getInstance().getSSLSocketFactory(), paramIdManager);
    this.sessionManagers = paramList;
    this.kit = paramKit;
    this.advertisingId = paramIdManager.getAdvertisingId();
  }

  public DefaultScribeClient(Kit paramKit, String paramString, List<SessionManager<? extends Session>> paramList, IdManager paramIdManager)
  {
    this(paramKit, paramString, getGson(), paramList, paramIdManager);
  }

  private static ScheduledExecutorService getExecutor()
  {
    if (executor == null);
    try
    {
      if (executor == null)
        executor = ExecutorUtils.buildSingleThreadScheduledExecutorService("scribe");
      return executor;
    }
    finally
    {
    }
  }

  private static Gson getGson()
  {
    return new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES).create();
  }

  static ScribeConfig getScribeConfig(SettingsData paramSettingsData, String paramString)
  {
    int i;
    if ((paramSettingsData != null) && (paramSettingsData.analyticsSettingsData != null))
      i = paramSettingsData.analyticsSettingsData.maxPendingSendFileCount;
    for (int j = paramSettingsData.analyticsSettingsData.flushIntervalSeconds; ; j = 600)
    {
      return new ScribeConfig(true, getScribeUrl("https://syndication.twitter.com", ""), "i", "sdk", "", paramString, i, j);
      i = 100;
    }
  }

  static String getScribeUrl(String paramString1, String paramString2)
  {
    if (!TextUtils.isEmpty(paramString2))
      return paramString2;
    return paramString1;
  }

  static String getUserAgent(String paramString, Kit paramKit)
  {
    return "Fabric/" + paramKit.getFabric().getVersion() + " (Android " + Build.VERSION.SDK_INT + ") " + paramString + "/" + paramKit.getVersion();
  }

  Session getActiveSession()
  {
    Session localSession = null;
    Iterator localIterator = this.sessionManagers.iterator();
    do
    {
      if (!localIterator.hasNext())
        break;
      localSession = ((SessionManager)localIterator.next()).getActiveSession();
    }
    while (localSession == null);
    return localSession;
  }

  long getScribeSessionId(Session paramSession)
  {
    if (paramSession != null)
      return paramSession.getId();
    return 0L;
  }

  public void scribe(ScribeEvent paramScribeEvent)
  {
    super.scribe(paramScribeEvent, getScribeSessionId(getActiveSession()));
  }

  public void scribeSyndicatedSdkImpressionEvents(EventNamespace[] paramArrayOfEventNamespace)
  {
    if (this.kit.getContext() != null);
    for (String str = this.kit.getContext().getResources().getConfiguration().locale.getLanguage(); ; str = "")
    {
      long l = System.currentTimeMillis();
      int i = paramArrayOfEventNamespace.length;
      for (int j = 0; j < i; j++)
        scribe(new SyndicatedSdkImpressionEvent(paramArrayOfEventNamespace[j], l, str, this.advertisingId));
    }
  }
}