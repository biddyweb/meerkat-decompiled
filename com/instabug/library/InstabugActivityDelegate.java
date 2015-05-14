package com.instabug.library;

import android.app.Activity;
import android.os.Build.VERSION;
import android.support.v4.view.GestureDetectorCompat;
import android.view.MotionEvent;
import com.instabug.library.interaction.InstabugSwipeDelegate;
import com.instabug.library.interaction.InstabugSwipeDelegate.GestureConfig;
import com.instabug.library.interaction.InstabugSwipeDelegate.GestureListener;
import com.instabug.library.interaction.InstabugSwipeDelegate.InstabugTouchEventForwarder;
import com.instabug.library.util.TouchEventDispatcher;

public class InstabugActivityDelegate
  implements InstabugSwipeDelegate.InstabugTouchEventForwarder
{
  private TouchEventDispatcher dispatcher = new TouchEventDispatcher();
  private final Activity mActivity;
  private GestureDetectorCompat mDetector;
  private InstabugSwipeDelegate mSwipeDelegate;

  public InstabugActivityDelegate(Activity paramActivity)
  {
    this.mActivity = paramActivity;
    if (Instabug.access$000(Instabug.getInstance().iG().a).s().e() == Instabug.IBGInvocationEvent.IBGInvocationEventTwoFingersSwipeLeft)
    {
      this.mSwipeDelegate = new InstabugSwipeDelegate(this, InstabugSwipeDelegate.GestureConfig.TwoSwipeLeft);
      InstabugSwipeDelegate localInstabugSwipeDelegate = this.mSwipeDelegate;
      localInstabugSwipeDelegate.getClass();
      this.mDetector = new GestureDetectorCompat(paramActivity, new InstabugSwipeDelegate.GestureListener(localInstabugSwipeDelegate));
    }
  }

  public boolean dispatchTouchEvent(MotionEvent paramMotionEvent)
  {
    if (this.mSwipeDelegate != null)
      this.mSwipeDelegate.onTouchEvent(paramMotionEvent);
    return this.dispatcher.dispatchTouchEvent(this.mActivity, paramMotionEvent);
  }

  public void onDestroy()
  {
    Instabug.getInstance().onDestroy(this.mActivity);
  }

  public void onInstabugGestureEvent(MotionEvent paramMotionEvent)
  {
    this.mDetector.onTouchEvent(paramMotionEvent);
  }

  public void onPause()
  {
    if (Build.VERSION.SDK_INT < 14)
      Instabug.getInstance().onPause(this.mActivity);
  }

  public void onResume()
  {
    if (Build.VERSION.SDK_INT < 14)
      Instabug.getInstance().onResume(this.mActivity);
  }
}