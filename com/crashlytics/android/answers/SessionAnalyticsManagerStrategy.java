package com.crashlytics.android.answers;

import io.fabric.sdk.android.services.events.EventsStrategy;
import io.fabric.sdk.android.services.settings.AnalyticsSettingsData;

abstract interface SessionAnalyticsManagerStrategy<T> extends EventsStrategy<T>
{
  public abstract void setAnalyticsSettingsData(AnalyticsSettingsData paramAnalyticsSettingsData, String paramString);
}