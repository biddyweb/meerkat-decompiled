package com.mixpanel.android.mpmetrics;

import android.content.Context;
import android.content.SharedPreferences;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;

class SharedPreferencesLoader
{
  private final Executor mExecutor = Executors.newSingleThreadExecutor();

  public Future<SharedPreferences> loadPreferences(Context paramContext, String paramString, OnPrefsLoadedListener paramOnPrefsLoadedListener)
  {
    FutureTask localFutureTask = new FutureTask(new LoadSharedPreferences(paramContext, paramString, paramOnPrefsLoadedListener));
    this.mExecutor.execute(localFutureTask);
    return localFutureTask;
  }

  private static class LoadSharedPreferences
    implements Callable<SharedPreferences>
  {
    private final Context mContext;
    private final SharedPreferencesLoader.OnPrefsLoadedListener mListener;
    private final String mPrefsName;

    public LoadSharedPreferences(Context paramContext, String paramString, SharedPreferencesLoader.OnPrefsLoadedListener paramOnPrefsLoadedListener)
    {
      this.mContext = paramContext;
      this.mPrefsName = paramString;
      this.mListener = paramOnPrefsLoadedListener;
    }

    public SharedPreferences call()
    {
      SharedPreferences localSharedPreferences = this.mContext.getSharedPreferences(this.mPrefsName, 0);
      if (this.mListener != null)
        this.mListener.onPrefsLoaded(localSharedPreferences);
      return localSharedPreferences;
    }
  }

  static abstract interface OnPrefsLoadedListener
  {
    public abstract void onPrefsLoaded(SharedPreferences paramSharedPreferences);
  }
}