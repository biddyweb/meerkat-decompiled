package com.twitter.sdk.android.tweetui;

import android.graphics.Color;

final class ColorUtils
{
  static int calculateOpacityTransform(double paramDouble, int paramInt1, int paramInt2)
  {
    int i = Color.red(paramInt2);
    int j = Color.red(paramInt1);
    int k = Color.green(paramInt2);
    int m = Color.green(paramInt1);
    int n = Color.blue(paramInt2);
    int i1 = Color.blue(paramInt1);
    return Color.rgb((int)((1.0D - paramDouble) * i + paramDouble * j), (int)((1.0D - paramDouble) * k + paramDouble * m), (int)((1.0D - paramDouble) * n + paramDouble * i1));
  }

  static boolean isLightColor(int paramInt)
  {
    int i = Color.red(paramInt);
    int j = Color.green(paramInt);
    int k = Color.blue(paramInt);
    return 0.21D * i + 0.72D * j + 0.07000000000000001D * k > 128.0D;
  }
}