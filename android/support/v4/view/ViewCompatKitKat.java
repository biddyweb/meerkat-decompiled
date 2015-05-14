package android.support.v4.view;

import android.view.View;

class ViewCompatKitKat
{
  public static int getAccessibilityLiveRegion(View paramView)
  {
    return paramView.getAccessibilityLiveRegion();
  }

  public static boolean isLaidOut(View paramView)
  {
    return paramView.isLaidOut();
  }

  public static void setAccessibilityLiveRegion(View paramView, int paramInt)
  {
    paramView.setAccessibilityLiveRegion(paramInt);
  }
}