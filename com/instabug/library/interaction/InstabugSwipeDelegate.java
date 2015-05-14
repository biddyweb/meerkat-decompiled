package com.instabug.library.interaction;

import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import com.instabug.library.Instabug;

public class InstabugSwipeDelegate
{
  private static final int DIRECTION_DOWN = 2;
  private static final int DIRECTION_LEFT = 3;
  private static final int DIRECTION_RIGHT = 4;
  private static final int DIRECTION_UP = 1;
  private int mDirectionNeeded;
  private final InstabugSwipeDelegate.InstabugTouchEventForwarder mForwarder;
  private boolean mGoodCycle = false;
  private int mPointerCountNeeded = 0;

  public InstabugSwipeDelegate(InstabugSwipeDelegate.InstabugTouchEventForwarder paramInstabugTouchEventForwarder, GestureConfig paramGestureConfig)
  {
    this.mForwarder = paramInstabugTouchEventForwarder;
    if (paramGestureConfig == null)
      paramGestureConfig = GestureConfig.ThreeSwipeUp;
    switch (a.a[paramGestureConfig.ordinal()])
    {
    default:
      return;
    case 1:
      this.mDirectionNeeded = 1;
      this.mPointerCountNeeded = 3;
      return;
    case 2:
    }
    this.mDirectionNeeded = 3;
    this.mPointerCountNeeded = 2;
  }

  private boolean isDirectionValid(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2)
  {
    boolean bool = true;
    switch (this.mDirectionNeeded)
    {
    case 2:
    default:
      bool = false;
    case 1:
    case 3:
    }
    do
    {
      do
        return bool;
      while (paramMotionEvent1.getY() > paramMotionEvent2.getY());
      return false;
    }
    while ((paramMotionEvent1.getX() > paramMotionEvent2.getX()) && (paramMotionEvent1.getX() - paramMotionEvent2.getX() >= Math.abs(paramMotionEvent1.getY() - paramMotionEvent2.getY())));
    return false;
  }

  public void onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (paramMotionEvent.getPointerCount() >= this.mPointerCountNeeded)
      this.mGoodCycle = true;
    switch (0xFF & paramMotionEvent.getAction())
    {
    default:
    case 2:
    }
    do
    {
      this.mForwarder.onInstabugGestureEvent(paramMotionEvent);
      return;
    }
    while (paramMotionEvent.getPointerCount() >= this.mPointerCountNeeded);
  }

  public static enum GestureConfig
  {
    static
    {
      GestureConfig[] arrayOfGestureConfig = new GestureConfig[2];
      arrayOfGestureConfig[0] = ThreeSwipeUp;
      arrayOfGestureConfig[1] = TwoSwipeLeft;
    }
  }

  public class GestureListener extends GestureDetector.SimpleOnGestureListener
  {
    public GestureListener()
    {
    }

    public boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
    {
      if ((InstabugSwipeDelegate.this.isDirectionValid(paramMotionEvent1, paramMotionEvent2)) && (InstabugSwipeDelegate.this.mGoodCycle))
        Instabug.getInstance().invokeFeedbackProcess();
      InstabugSwipeDelegate.access$102(InstabugSwipeDelegate.this, false);
      return false;
    }
  }
}