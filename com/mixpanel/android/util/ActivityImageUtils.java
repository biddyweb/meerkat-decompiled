package com.mixpanel.android.util;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.util.Log;
import android.view.View;

public class ActivityImageUtils
{
  private static final String LOGTAG = "MixpanelAPI.ActivityImageUtils";

  public static int getHighlightColor(int paramInt)
  {
    float[] arrayOfFloat = new float[3];
    Color.colorToHSV(paramInt, arrayOfFloat);
    arrayOfFloat[2] = 0.3F;
    return Color.HSVToColor(242, arrayOfFloat);
  }

  public static int getHighlightColorFromBackground(Activity paramActivity)
  {
    int i = -16777216;
    Bitmap localBitmap = getScaledScreenshot(paramActivity, 1, 1, false);
    if (localBitmap != null)
      i = localBitmap.getPixel(0, 0);
    return getHighlightColor(i);
  }

  public static int getHighlightColorFromBitmap(Bitmap paramBitmap)
  {
    int i = -16777216;
    if (paramBitmap != null)
      i = Bitmap.createScaledBitmap(paramBitmap, 1, 1, false).getPixel(0, 0);
    return getHighlightColor(i);
  }

  public static Bitmap getScaledScreenshot(Activity paramActivity, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    View localView = paramActivity.findViewById(16908290).getRootView();
    boolean bool = localView.isDrawingCacheEnabled();
    localView.setDrawingCacheEnabled(true);
    localView.buildDrawingCache(true);
    Bitmap localBitmap1 = localView.getDrawingCache();
    Object localObject = null;
    if (localBitmap1 != null)
    {
      int i = localBitmap1.getWidth();
      localObject = null;
      if (i > 0)
      {
        int j = localBitmap1.getHeight();
        localObject = null;
        if (j > 0)
        {
          if (paramBoolean)
          {
            paramInt1 = localBitmap1.getWidth() / paramInt1;
            paramInt2 = localBitmap1.getHeight() / paramInt2;
          }
          localObject = null;
          if (paramInt1 > 0)
          {
            localObject = null;
            if (paramInt2 <= 0);
          }
        }
      }
    }
    try
    {
      Bitmap localBitmap2 = Bitmap.createScaledBitmap(localBitmap1, paramInt1, paramInt2, false);
      localObject = localBitmap2;
      if (!bool)
        localView.setDrawingCacheEnabled(false);
      return localObject;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      while (true)
      {
        Log.i("MixpanelAPI.ActivityImageUtils", "Not enough memory to produce scaled image, returning a null screenshot");
        localObject = null;
      }
    }
  }
}