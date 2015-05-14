package com.digits.sdk.android;

import android.content.Context;
import android.content.res.TypedArray;
import java.lang.reflect.Field;

class ActivityClassManagerFactory
{
  ActivityClassManager createActivityClassManager(Context paramContext, int paramInt)
  {
    try
    {
      Class.forName("android.support.v7.app.ActionBarActivity");
      if (isAppCompatTheme(paramContext, paramInt, new ThemeAttributes()))
        return new AppCompatClassManagerImp();
      ActivityClassManagerImp localActivityClassManagerImp = new ActivityClassManagerImp();
      return localActivityClassManagerImp;
    }
    catch (Exception localException)
    {
    }
    return new ActivityClassManagerImp();
  }

  boolean isAppCompatTheme(Context paramContext, int paramInt, ThemeAttributes paramThemeAttributes)
  {
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramInt, paramThemeAttributes.styleableTheme);
    boolean bool = localTypedArray.hasValue(paramThemeAttributes.styleableThemeWindowActionBar);
    localTypedArray.recycle();
    return bool;
  }

  static class ThemeAttributes
  {
    private static final String CLASS_NAME = "android.support.v7.appcompat.R$styleable";
    private final int[] styleableTheme;
    private final int styleableThemeWindowActionBar;

    public ThemeAttributes()
      throws Exception
    {
      Class localClass = Class.forName("android.support.v7.appcompat.R$styleable");
      Field localField1 = localClass.getField("Theme");
      this.styleableTheme = ((int[])localField1.get(localField1.getType()));
      Field localField2 = localClass.getField("Theme_windowActionBar");
      this.styleableThemeWindowActionBar = ((Integer)localField2.get(localField2.getType())).intValue();
    }
  }
}