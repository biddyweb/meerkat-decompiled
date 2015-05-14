package com.instabug.library.internal.theming;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.os.Build.VERSION;
import android.util.TypedValue;
import android.view.View;
import android.view.Window;
import java.util.Arrays;

public final class e
{
  public static a a(Activity paramActivity)
  {
    Resources localResources = paramActivity.getResources();
    a locala = new a();
    int i;
    int j;
    int m;
    int k;
    if (Build.VERSION.SDK_INT >= 14)
    {
      i = 16842964;
      j = 16843659;
      m = 16843512;
      k = 16843470;
    }
    while (true)
    {
      int[] arrayOfInt = { m, i, j };
      Arrays.sort(arrayOfInt);
      TypedValue localTypedValue = new TypedValue();
      paramActivity.getTheme().resolveAttribute(k, localTypedValue, true);
      int n = localTypedValue.resourceId;
      TypedArray localTypedArray = paramActivity.getTheme().obtainStyledAttributes(n, arrayOfInt);
      locala.d = localTypedArray.getResourceId(Arrays.binarySearch(arrayOfInt, m), 0);
      locala.a = localTypedArray.getDrawable(Arrays.binarySearch(arrayOfInt, i));
      locala.b = localTypedArray.getDrawable(Arrays.binarySearch(arrayOfInt, j));
      localTypedArray.recycle();
      paramActivity.getWindow().getDecorView().getBackground();
      return locala;
      i = localResources.getIdentifier("background", "attr", paramActivity.getPackageName());
      j = localResources.getIdentifier("backgroundSplit", "attr", paramActivity.getPackageName());
      k = localResources.getIdentifier("actionBarStyle", "attr", paramActivity.getPackageName());
      m = localResources.getIdentifier("titleTextStyle", "attr", paramActivity.getPackageName());
    }
  }
}