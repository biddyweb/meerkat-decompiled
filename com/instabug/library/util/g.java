package com.instabug.library.util;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;

public final class g
{
  public static Bundle a(Context paramContext)
  {
    try
    {
      Bundle localBundle = paramContext.getPackageManager().getApplicationInfo(paramContext.getPackageName(), 128).metaData;
      return localBundle;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
    }
    return new Bundle();
  }
}