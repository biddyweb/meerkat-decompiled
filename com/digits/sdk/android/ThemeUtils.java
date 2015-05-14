package com.digits.sdk.android;

import android.annotation.TargetApi;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.graphics.Color;
import android.os.Build.VERSION;
import android.util.TypedValue;
import java.lang.reflect.Field;

class ThemeUtils
{
  public static final int DEFAULT_THEME = 0;
  public static final String THEME_RESOURCE_ID = "THEME_RESOURCE_ID";

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

  @TargetApi(21)
  static int getAccentColor(Resources paramResources, Resources.Theme paramTheme)
  {
    TypedValue localTypedValue1 = getTypedValueColor(paramTheme, R.attr.dgts__accentColor);
    if (localTypedValue1 != null)
      return localTypedValue1.data;
    if (Build.VERSION.SDK_INT >= 21)
    {
      TypedValue localTypedValue3 = getTypedValueColor(paramTheme, 16843829);
      if (localTypedValue3 != null)
        return localTypedValue3.data;
    }
    try
    {
      Field localField = R.attr.class.getDeclaredField("colorAccent");
      TypedValue localTypedValue2 = getTypedValueColor(paramTheme, localField.getInt(localField.getType()));
      if (localTypedValue2 != null)
      {
        int i = localTypedValue2.data;
        return i;
      }
    }
    catch (Exception localException)
    {
    }
    return paramResources.getColor(R.color.dgts__default_accent);
  }

  static TypedValue getTypedValueColor(Resources.Theme paramTheme, int paramInt)
  {
    TypedValue localTypedValue = new TypedValue();
    paramTheme.resolveAttribute(paramInt, localTypedValue, true);
    if ((localTypedValue.type >= 28) && (localTypedValue.type <= 31))
      return localTypedValue;
    return null;
  }

  static boolean isLightColor(int paramInt)
  {
    int i = Color.red(paramInt);
    int j = Color.green(paramInt);
    int k = Color.blue(paramInt);
    return 0.21D * i + 0.72D * j + 0.07000000000000001D * k > 170.0D;
  }
}