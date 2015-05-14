package com.crashlytics.android;

public abstract interface CrashlyticsListener
{
  public abstract void crashlyticsDidDetectCrashDuringPreviousExecution();
}