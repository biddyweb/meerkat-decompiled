package com.instabug.library.util;

import android.app.Activity;
import android.app.Application.ActivityLifecycleCallbacks;
import android.os.Bundle;
import com.instabug.library.Instabug;
import com.instabug.library.Instabug.a;
import com.instabug.library.InstabugFeedbackActivity;

public final class e
  implements Application.ActivityLifecycleCallbacks
{
  public final void onActivityCreated(Activity paramActivity, Bundle paramBundle)
  {
    Instabug.a.a("ActivityLifecycleListener: " + paramActivity.getClass().getSimpleName() + " created");
  }

  public final void onActivityDestroyed(Activity paramActivity)
  {
    Instabug.a.a("ActivityLifecycleListener: " + paramActivity.getClass().getSimpleName() + " destroyed");
    if (!(paramActivity instanceof InstabugFeedbackActivity))
      Instabug.getInstance().onDestroy(paramActivity);
  }

  public final void onActivityPaused(Activity paramActivity)
  {
    Instabug.a.a("ActivityLifecycleListener: " + paramActivity.getClass().getSimpleName() + " paused");
    if (!(paramActivity instanceof InstabugFeedbackActivity))
      Instabug.getInstance().onPause(paramActivity);
  }

  public final void onActivityResumed(Activity paramActivity)
  {
    Instabug.a.a("ActivityLifecycleListener: " + paramActivity.getClass().getSimpleName() + " resumed");
    if (!(paramActivity instanceof InstabugFeedbackActivity))
      Instabug.getInstance().onResume(paramActivity);
  }

  public final void onActivitySaveInstanceState(Activity paramActivity, Bundle paramBundle)
  {
    Instabug.a.a("ActivityLifecycleListener: " + paramActivity.getClass().getSimpleName() + " SaveInstanceState");
  }

  public final void onActivityStarted(Activity paramActivity)
  {
    Instabug.a.a("ActivityLifecycleListener: " + paramActivity.getClass().getSimpleName() + " started");
  }

  public final void onActivityStopped(Activity paramActivity)
  {
    Instabug.a.a("ActivityLifecycleListener: " + paramActivity.getClass().getSimpleName() + " stopped");
  }
}