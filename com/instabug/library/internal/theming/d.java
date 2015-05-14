package com.instabug.library.internal.theming;

import android.app.Activity;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.util.TypedValue;
import android.view.View;
import android.view.Window;
import java.util.Arrays;

public final class d
{
  public static a a(Activity paramActivity)
  {
    int[] arrayOfInt = { 16842964, 16843659, 16843512 };
    Arrays.sort(arrayOfInt);
    TypedValue localTypedValue = new TypedValue();
    paramActivity.getTheme().resolveAttribute(16843470, localTypedValue, true);
    TypedArray localTypedArray = paramActivity.getTheme().obtainStyledAttributes(localTypedValue.resourceId, arrayOfInt);
    a locala = new a();
    locala.d = localTypedArray.getResourceId(Arrays.binarySearch(arrayOfInt, 16843512), 0);
    locala.a = localTypedArray.getDrawable(Arrays.binarySearch(arrayOfInt, 16842964));
    locala.b = localTypedArray.getDrawable(Arrays.binarySearch(arrayOfInt, 16843659));
    paramActivity.getWindow().getDecorView().getBackground();
    localTypedArray.recycle();
    return locala;
  }
}