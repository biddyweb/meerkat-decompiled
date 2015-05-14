package com.instabug.library.internal.theming;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.util.TypedValue;
import android.view.View;
import android.view.Window;
import java.util.Arrays;

public final class c
{
  public static a a(Activity paramActivity)
  {
    Resources localResources = paramActivity.getResources();
    a locala = new a();
    int i = localResources.getIdentifier("background", "attr", paramActivity.getPackageName());
    int j = localResources.getIdentifier("backgroundSplit", "attr", paramActivity.getPackageName());
    int k = localResources.getIdentifier("actionBarStyle", "attr", paramActivity.getPackageName());
    int m = localResources.getIdentifier("titleTextStyle", "attr", paramActivity.getPackageName());
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
  }
}