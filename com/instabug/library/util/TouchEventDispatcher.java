package com.instabug.library.util;

import android.app.Activity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import com.instabug.library.Instabug;
import com.instabug.library.Instabug.a;

public class TouchEventDispatcher
{
  private int previousX;
  private int previousY;

  private View findTargetView(View paramView, int paramInt1, int paramInt2)
  {
    Object localObject1 = null;
    int[] arrayOfInt = new int[2];
    paramView.getLocationInWindow(arrayOfInt);
    int i;
    View localView1;
    Object localObject3;
    if ((paramInt2 >= arrayOfInt[1]) && (paramInt1 >= arrayOfInt[0]) && (paramInt2 <= arrayOfInt[1] + paramView.getHeight()) && (paramInt1 <= arrayOfInt[0] + paramView.getWidth()))
      if ((paramView instanceof ViewGroup))
      {
        i = 0;
        if (i < ((ViewGroup)paramView).getChildCount())
        {
          localView1 = ((ViewGroup)paramView).getChildAt(i);
          if ((localView1 instanceof ViewGroup))
          {
            localObject3 = findTargetView((ViewGroup)localView1, paramInt1, paramInt2);
            if (localObject3 == null)
              break label168;
          }
        }
      }
    while (true)
    {
      localObject1 = localObject3;
      while (true)
      {
        if (localObject1 != null)
          break label152;
        i++;
        break;
        View localView2 = findTargetView(localView1, paramInt1, paramInt2);
        if (localView2 != null)
          localObject1 = localView2;
      }
      label152: Object localObject2 = localObject1;
      if (localObject2 == null)
      {
        return paramView;
        return null;
      }
      return localObject2;
      label168: localObject3 = localObject1;
    }
  }

  public boolean dispatchTouchEvent(Activity paramActivity, MotionEvent paramMotionEvent)
  {
    if (!Instabug.getInstance().isTrackingUserSteps());
    int i;
    int j;
    do
    {
      return false;
      i = (int)paramMotionEvent.getRawX();
      j = (int)paramMotionEvent.getRawY();
      if (paramMotionEvent.getAction() == 0)
      {
        this.previousX = i;
        this.previousY = j;
        return false;
      }
    }
    while ((paramMotionEvent.getAction() != 1) || (this.previousX != i) || (this.previousY != j));
    long l1 = System.currentTimeMillis();
    View localView = findTargetView(paramActivity.getWindow().getDecorView(), i, j);
    long l2 = System.currentTimeMillis();
    Instabug.a.a("EventProcessor: Found target view in " + (l2 - l1) + " ms");
    Instabug.getInstance().viewTapped(localView);
    return true;
  }

  public void reset()
  {
    this.previousX = -1;
    this.previousY = -1;
  }
}