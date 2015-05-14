package com.mixpanel.android.mpmetrics;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application.ActivityLifecycleCallbacks;
import android.os.Bundle;

@TargetApi(16)
class MixpanelActivityLifecycleCallbacks
  implements Application.ActivityLifecycleCallbacks
{
  private final MixpanelAPI mMpInstance;

  public MixpanelActivityLifecycleCallbacks(MixpanelAPI paramMixpanelAPI)
  {
    this.mMpInstance = paramMixpanelAPI;
  }

  public void onActivityCreated(Activity paramActivity, Bundle paramBundle)
  {
  }

  public void onActivityDestroyed(Activity paramActivity)
  {
  }

  public void onActivityPaused(Activity paramActivity)
  {
  }

  public void onActivityResumed(Activity paramActivity)
  {
  }

  public void onActivitySaveInstanceState(Activity paramActivity, Bundle paramBundle)
  {
  }

  public void onActivityStarted(Activity paramActivity)
  {
    if (!paramActivity.isTaskRoot())
      return;
    this.mMpInstance.getPeople().showNotificationIfAvailable(paramActivity);
    this.mMpInstance.getPeople().showSurveyIfAvailable(paramActivity);
  }

  public void onActivityStopped(Activity paramActivity)
  {
  }
}