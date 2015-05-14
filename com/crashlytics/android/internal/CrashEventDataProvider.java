package com.crashlytics.android.internal;

import com.crashlytics.android.internal.models.SessionEventData;

public abstract interface CrashEventDataProvider
{
  public abstract SessionEventData getCrashEventData();
}