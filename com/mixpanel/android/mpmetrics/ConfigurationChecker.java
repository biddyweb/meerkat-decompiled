package com.mixpanel.android.mpmetrics;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ResolveInfo;
import android.os.Build.VERSION;
import android.util.Log;
import com.mixpanel.android.surveys.SurveyActivity;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

class ConfigurationChecker
{
  public static String LOGTAG = "MixpanelAPI.ConfigurationChecker";

  public static boolean checkBasicConfiguration(Context paramContext)
  {
    if (paramContext.getPackageManager().checkPermission("android.permission.INTERNET", paramContext.getPackageName()) != 0)
    {
      Log.w(LOGTAG, "Package does not have permission android.permission.INTERNET - Mixpanel will not work at all!");
      Log.i(LOGTAG, "You can fix this by adding the following to your AndroidManifest.xml file:\n<uses-permission android:name=\"android.permission.INTERNET\" />");
      return false;
    }
    return true;
  }

  public static boolean checkPushConfiguration(Context paramContext)
  {
    if (Build.VERSION.SDK_INT < 8)
      Log.i(LOGTAG, "Mixpanel push notifications not supported in SDK " + Build.VERSION.SDK_INT);
    while (true)
    {
      return false;
      PackageManager localPackageManager = paramContext.getPackageManager();
      String str1 = paramContext.getPackageName();
      String str2 = str1 + ".permission.C2D_MESSAGE";
      try
      {
        localPackageManager.getPermissionInfo(str2, 4096);
        if (localPackageManager.checkPermission("com.google.android.c2dm.permission.RECEIVE", str1) != 0)
        {
          Log.w(LOGTAG, "Package does not have permission com.google.android.c2dm.permission.RECEIVE");
          Log.i(LOGTAG, "You can fix this by adding the following to your AndroidManifest.xml file:\n<uses-permission android:name=\"com.google.android.c2dm.permission.RECEIVE\" />");
          return false;
        }
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException1)
      {
        Log.w(LOGTAG, "Application does not define permission " + str2);
        Log.i(LOGTAG, "You will need to add the following lines to your application manifest:\n<permission android:name=\"" + str1 + ".permission.C2D_MESSAGE\" android:protectionLevel=\"signature\" />\n" + "<uses-permission android:name=\"" + str1 + ".permission.C2D_MESSAGE\" />");
        return false;
      }
      if (localPackageManager.checkPermission("android.permission.INTERNET", str1) != 0)
      {
        Log.w(LOGTAG, "Package does not have permission android.permission.INTERNET");
        Log.i(LOGTAG, "You can fix this by adding the following to your AndroidManifest.xml file:\n<uses-permission android:name=\"android.permission.INTERNET\" />");
        return false;
      }
      if (localPackageManager.checkPermission("android.permission.WAKE_LOCK", str1) != 0)
      {
        Log.w(LOGTAG, "Package does not have permission android.permission.WAKE_LOCK");
        Log.i(LOGTAG, "You can fix this by adding the following to your AndroidManifest.xml file:\n<uses-permission android:name=\"android.permission.WAKE_LOCK\" />");
        return false;
      }
      if (localPackageManager.checkPermission("android.permission.GET_ACCOUNTS", str1) != 0)
      {
        Log.i(LOGTAG, "Package does not have permission android.permission.GET_ACCOUNTS");
        Log.i(LOGTAG, "Android versions below 4.1 require GET_ACCOUNTS to receive Mixpanel push notifications.\nDevices with later OS versions will still be able to receive messages, but if you'd like to support older devices, you'll need to add the following to your AndroidManifest.xml file:\n<uses-permission android:name=\"android.permission.GET_ACCOUNTS\" />");
        if (Build.VERSION.SDK_INT < 16)
          continue;
      }
      ActivityInfo[] arrayOfActivityInfo;
      try
      {
        PackageInfo localPackageInfo = localPackageManager.getPackageInfo(str1, 2);
        arrayOfActivityInfo = localPackageInfo.receivers;
        if ((arrayOfActivityInfo == null) || (arrayOfActivityInfo.length == 0))
        {
          Log.w(LOGTAG, "No receiver for package " + str1);
          Log.i(LOGTAG, "You can fix this with the following into your <application> tag:\n" + samplePushConfigurationMessage(str1));
          return false;
        }
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException2)
      {
        Log.w(LOGTAG, "Could not get receivers for package " + str1);
        return false;
      }
      HashSet localHashSet = new HashSet();
      int i = arrayOfActivityInfo.length;
      for (int j = 0; j < i; j++)
      {
        ActivityInfo localActivityInfo = arrayOfActivityInfo[j];
        if ("com.google.android.c2dm.permission.SEND".equals(localActivityInfo.permission))
          localHashSet.add(localActivityInfo.name);
      }
      if (localHashSet.isEmpty())
      {
        Log.w(LOGTAG, "No receiver allowed to receive com.google.android.c2dm.permission.SEND");
        Log.i(LOGTAG, "You can fix by pasting the following into the <application> tag in your AndroidManifest.xml:\n" + samplePushConfigurationMessage(str1));
        return false;
      }
      if (!checkReceiver(paramContext, localHashSet, "com.google.android.c2dm.intent.RECEIVE"))
        continue;
      try
      {
        Class.forName("com.google.android.gms.common.GooglePlayServicesUtil");
        k = 1;
        int m = 1;
        if (!checkReceiver(paramContext, localHashSet, "com.google.android.c2dm.intent.REGISTRATION"))
        {
          Log.i(LOGTAG, "(You can still receive push notifications on Lollipop/API 21 or greater with this configuration)");
          m = 0;
        }
        if ((k == 0) && (m == 0))
          continue;
        return true;
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        while (true)
        {
          Log.w(LOGTAG, "Google Play Services aren't included in your build- push notifications won't work on Lollipop/API 21 or greater");
          Log.i(LOGTAG, "You can fix this by adding com.google.android.gms:play-services as a dependency of your gradle or maven project");
          int k = 0;
        }
      }
    }
  }

  private static boolean checkReceiver(Context paramContext, Set<String> paramSet, String paramString)
  {
    PackageManager localPackageManager = paramContext.getPackageManager();
    String str1 = paramContext.getPackageName();
    Intent localIntent = new Intent(paramString);
    localIntent.setPackage(str1);
    List localList = localPackageManager.queryBroadcastReceivers(localIntent, 32);
    if (localList.isEmpty())
    {
      Log.w(LOGTAG, "No receivers for action " + paramString);
      Log.i(LOGTAG, "You can fix by pasting the following into the <application> tag in your AndroidManifest.xml:\n" + samplePushConfigurationMessage(str1));
      return false;
    }
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
    {
      String str2 = ((ResolveInfo)localIterator.next()).activityInfo.name;
      if (!paramSet.contains(str2))
      {
        Log.w(LOGTAG, "Receiver " + str2 + " is not set with permission com.google.android.c2dm.permission.SEND");
        Log.i(LOGTAG, "Please add the attribute 'android:permission=\"com.google.android.c2dm.permission.SEND\"' to your <receiver> tag");
        return false;
      }
    }
    return true;
  }

  public static boolean checkSurveyActivityAvailable(Context paramContext)
  {
    if (Build.VERSION.SDK_INT < 16)
      return false;
    Intent localIntent = new Intent(paramContext, SurveyActivity.class);
    localIntent.addFlags(268435456);
    localIntent.addFlags(131072);
    if (paramContext.getPackageManager().queryIntentActivities(localIntent, 0).size() == 0)
    {
      Log.w(LOGTAG, SurveyActivity.class.getName() + " is not registered as an activity in your application, so surveys can't be shown.");
      Log.i(LOGTAG, "Please add the child tag <activity android:name=\"com.mixpanel.android.surveys.SurveyActivity\" /> to your <application> tag.");
      return false;
    }
    return true;
  }

  private static String samplePushConfigurationMessage(String paramString)
  {
    return "<receiver android:name=\"com.mixpanel.android.mpmetrics.GCMReceiver\"\n          android:permission=\"com.google.android.c2dm.permission.SEND\" >\n    <intent-filter>\n       <action android:name=\"com.google.android.c2dm.intent.RECEIVE\" />\n       <action android:name=\"com.google.android.c2dm.intent.REGISTRATION\" />\n       <category android:name=\"" + paramString + "\" />\n" + "    </intent-filter>\n" + "</receiver>";
  }
}