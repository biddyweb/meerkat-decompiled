package android.support.v4.widget;

import android.widget.OverScroller;

class ScrollerCompatIcs
{
  public static float getCurrVelocity(Object paramObject)
  {
    return ((OverScroller)paramObject).getCurrVelocity();
  }
}