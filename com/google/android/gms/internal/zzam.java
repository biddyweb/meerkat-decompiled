package com.google.android.gms.internal;

import android.app.Activity;
import android.app.Application;
import android.app.Application.ActivityLifecycleCallbacks;
import android.content.Context;
import android.os.Bundle;

@zzgi
public class zzam
  implements Application.ActivityLifecycleCallbacks
{
  private Context mContext;
  private final Object zznh = new Object();
  private Activity zzoi;

  public zzam(Application paramApplication, Activity paramActivity)
  {
    paramApplication.registerActivityLifecycleCallbacks(this);
    setActivity(paramActivity);
    this.mContext = paramApplication.getApplicationContext();
  }

  private void setActivity(Activity paramActivity)
  {
    synchronized (this.zznh)
    {
      if (!paramActivity.getClass().getName().startsWith("com.google.android.gms.ads"))
        this.zzoi = paramActivity;
      return;
    }
  }

  public Activity getActivity()
  {
    return this.zzoi;
  }

  public Context getContext()
  {
    return this.mContext;
  }

  public void onActivityCreated(Activity paramActivity, Bundle paramBundle)
  {
  }

  public void onActivityDestroyed(Activity paramActivity)
  {
    synchronized (this.zznh)
    {
      if (this.zzoi == null)
        return;
      if (this.zzoi.equals(paramActivity))
        this.zzoi = null;
      return;
    }
  }

  public void onActivityPaused(Activity paramActivity)
  {
    setActivity(paramActivity);
  }

  public void onActivityResumed(Activity paramActivity)
  {
    setActivity(paramActivity);
  }

  public void onActivitySaveInstanceState(Activity paramActivity, Bundle paramBundle)
  {
  }

  public void onActivityStarted(Activity paramActivity)
  {
    setActivity(paramActivity);
  }

  public void onActivityStopped(Activity paramActivity)
  {
  }
}