package com.google.android.gms.common;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.AppOpsManager;
import android.app.Dialog;
import android.app.Notification;
import android.app.Notification.BigTextStyle;
import android.app.Notification.Builder;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface.OnCancelListener;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageInstaller;
import android.content.pm.PackageInstaller.SessionInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import com.google.android.gms.R.drawable;
import com.google.android.gms.R.string;
import com.google.android.gms.common.internal.zze;
import com.google.android.gms.common.internal.zzg;
import com.google.android.gms.common.internal.zzo;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzlu;
import com.google.android.gms.internal.zzme;
import java.util.Iterator;
import java.util.List;

public final class GooglePlayServicesUtil
{
  public static final String GMS_ERROR_DIALOG = "GooglePlayServicesErrorDialog";
  public static final String GOOGLE_PLAY_SERVICES_PACKAGE = "com.google.android.gms";
  public static final int GOOGLE_PLAY_SERVICES_VERSION_CODE = 7095000;
  public static final String GOOGLE_PLAY_STORE_PACKAGE = "com.android.vending";
  public static boolean zzLD = false;
  public static boolean zzLE = false;
  private static int zzLF = -1;
  private static final Object zzLG = new Object();

  public static Dialog getErrorDialog(int paramInt1, Activity paramActivity, int paramInt2)
  {
    return getErrorDialog(paramInt1, paramActivity, paramInt2, null);
  }

  public static Dialog getErrorDialog(int paramInt1, Activity paramActivity, int paramInt2, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    return zza(paramInt1, paramActivity, null, paramInt2, paramOnCancelListener);
  }

  protected static int getErrorNotificationId(int paramInt)
  {
    switch (paramInt)
    {
    case 2:
    default:
      return 39789;
    case 1:
    case 3:
    }
    return 10436;
  }

  public static PendingIntent getErrorPendingIntent(int paramInt1, Context paramContext, int paramInt2)
  {
    Intent localIntent = zzan(paramInt1);
    if (localIntent == null)
      return null;
    return PendingIntent.getActivity(paramContext, paramInt2, localIntent, 268435456);
  }

  public static String getErrorString(int paramInt)
  {
    switch (paramInt)
    {
    case 12:
    case 13:
    case 14:
    case 15:
    default:
      return "UNKNOWN_ERROR_CODE";
    case 0:
      return "SUCCESS";
    case 1:
      return "SERVICE_MISSING";
    case 2:
      return "SERVICE_VERSION_UPDATE_REQUIRED";
    case 3:
      return "SERVICE_DISABLED";
    case 4:
      return "SIGN_IN_REQUIRED";
    case 5:
      return "INVALID_ACCOUNT";
    case 6:
      return "RESOLUTION_REQUIRED";
    case 7:
      return "NETWORK_ERROR";
    case 8:
      return "INTERNAL_ERROR";
    case 9:
      return "SERVICE_INVALID";
    case 10:
      return "DEVELOPER_ERROR";
    case 11:
      return "LICENSE_CHECK_FAILED";
    case 16:
    }
    return "API_UNAVAILABLE";
  }

  // ERROR //
  public static String getOpenSourceSoftwareLicenseInfo(Context paramContext)
  {
    // Byte code:
    //   0: new 99\011android/net/Uri$Builder
    //   3: dup
    //   4: invokespecial 100\011android/net/Uri$Builder:<init>\011()V
    //   7: ldc 102
    //   9: invokevirtual 106\011android/net/Uri$Builder:scheme\011(Ljava/lang/String;)Landroid/net/Uri$Builder;
    //   12: ldc 11
    //   14: invokevirtual 109\011android/net/Uri$Builder:authority\011(Ljava/lang/String;)Landroid/net/Uri$Builder;
    //   17: ldc 111
    //   19: invokevirtual 114\011android/net/Uri$Builder:appendPath\011(Ljava/lang/String;)Landroid/net/Uri$Builder;
    //   22: ldc 116
    //   24: invokevirtual 114\011android/net/Uri$Builder:appendPath\011(Ljava/lang/String;)Landroid/net/Uri$Builder;
    //   27: invokevirtual 120\011android/net/Uri$Builder:build\011()Landroid/net/Uri;
    //   30: astore_1
    //   31: aload_0
    //   32: invokevirtual 126\011android/content/Context:getContentResolver\011()Landroid/content/ContentResolver;
    //   35: aload_1
    //   36: invokevirtual 132\011android/content/ContentResolver:openInputStream\011(Landroid/net/Uri;)Ljava/io/InputStream;
    //   39: astore 4
    //   41: new 134\011java/util/Scanner
    //   44: dup
    //   45: aload 4
    //   47: invokespecial 137\011java/util/Scanner:<init>\011(Ljava/io/InputStream;)V
    //   50: ldc 139
    //   52: invokevirtual 143\011java/util/Scanner:useDelimiter\011(Ljava/lang/String;)Ljava/util/Scanner;
    //   55: invokevirtual 147\011java/util/Scanner:next\011()Ljava/lang/String;
    //   58: astore 7
    //   60: aload 7
    //   62: astore_3
    //   63: aload 4
    //   65: ifnull +43 -> 108
    //   68: aload 4
    //   70: invokevirtual 152\011java/io/InputStream:close\011()V
    //   73: aload_3
    //   74: areturn
    //   75: astore 6
    //   77: aload 4
    //   79: ifnull +31 -> 110
    //   82: aload 4
    //   84: invokevirtual 152\011java/io/InputStream:close\011()V
    //   87: goto +23 -> 110
    //   90: astore 5
    //   92: aload 4
    //   94: ifnull +8 -> 102
    //   97: aload 4
    //   99: invokevirtual 152\011java/io/InputStream:close\011()V
    //   102: aload 5
    //   104: athrow
    //   105: astore_2
    //   106: aconst_null
    //   107: astore_3
    //   108: aload_3
    //   109: areturn
    //   110: aconst_null
    //   111: areturn
    //
    // Exception table:
    //   from\011to\011target\011type
    //   41\01160\01175\011java/util/NoSuchElementException
    //   41\01160\01190\011finally
    //   31\01141\011105\011java/lang/Exception
    //   68\01173\011105\011java/lang/Exception
    //   82\01187\011105\011java/lang/Exception
    //   97\011102\011105\011java/lang/Exception
    //   102\011105\011105\011java/lang/Exception
  }

  public static Context getRemoteContext(Context paramContext)
  {
    try
    {
      Context localContext = paramContext.createPackageContext("com.google.android.gms", 3);
      return localContext;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
    }
    return null;
  }

  public static Resources getRemoteResource(Context paramContext)
  {
    try
    {
      Resources localResources = paramContext.getPackageManager().getResourcesForApplication("com.google.android.gms");
      return localResources;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
    }
    return null;
  }

  public static int isGooglePlayServicesAvailable(Context paramContext)
  {
    PackageManager localPackageManager = paramContext.getPackageManager();
    if (!zze.zzPq);
    PackageInfo localPackageInfo1;
    zzc localzzc;
    try
    {
      paramContext.getResources().getString(R.string.common_google_play_services_unknown_issue);
      if (!zze.zzPq)
        zzJ(paramContext);
    }
    catch (Throwable localThrowable)
    {
      try
      {
        localPackageInfo1 = localPackageManager.getPackageInfo("com.google.android.gms", 64);
        localzzc = zzc.zzhP();
        if ((zzlu.zzbd(localPackageInfo1.versionCode)) || (zzlu.zzQ(paramContext)))
        {
          if (localzzc.zza(localPackageInfo1, zzb.zzaq.zzLC) != null)
            break label194;
          Log.w("GooglePlayServicesUtil", "Google Play services signature invalid.");
          return 9;
          localThrowable = localThrowable;
          Log.e("GooglePlayServicesUtil", "The Google Play services resources were not found. Check your project configuration to ensure that the resources are included.");
        }
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException1)
      {
        Log.w("GooglePlayServicesUtil", "Google Play services is missing.");
        return 1;
      }
    }
    zzb.zza localzza;
    try
    {
      PackageInfo localPackageInfo2 = localPackageManager.getPackageInfo("com.android.vending", 64);
      localzza = localzzc.zza(localPackageInfo2, zzb.zzaq.zzLC);
      if (localzza == null)
      {
        Log.w("GooglePlayServicesUtil", "Google Play Store signature invalid.");
        return 9;
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException3)
    {
      Log.w("GooglePlayServicesUtil", "Google Play Store is missing.");
      return 9;
    }
    if (localzzc.zza(localPackageInfo1, new zzb.zza[] { localzza }) == null)
    {
      Log.w("GooglePlayServicesUtil", "Google Play services signature invalid.");
      return 9;
    }
    label194: int i = zzlu.zzbb(7095000);
    if (zzlu.zzbb(localPackageInfo1.versionCode) < i)
    {
      Log.w("GooglePlayServicesUtil", "Google Play services out of date.  Requires 7095000 but found " + localPackageInfo1.versionCode);
      return 2;
    }
    try
    {
      ApplicationInfo localApplicationInfo = localPackageManager.getApplicationInfo("com.google.android.gms", 0);
      if (!localApplicationInfo.enabled)
        return 3;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException2)
    {
      Log.wtf("GooglePlayServicesUtil", "Google Play services missing when getting application info.");
      localNameNotFoundException2.printStackTrace();
      return 1;
    }
    return 0;
  }

  public static boolean isUserRecoverableError(int paramInt)
  {
    switch (paramInt)
    {
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    default:
      return false;
    case 1:
    case 2:
    case 3:
    case 9:
    }
    return true;
  }

  public static boolean showErrorDialogFragment(int paramInt1, Activity paramActivity, int paramInt2)
  {
    return showErrorDialogFragment(paramInt1, paramActivity, paramInt2, null);
  }

  public static boolean showErrorDialogFragment(int paramInt1, Activity paramActivity, int paramInt2, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    return showErrorDialogFragment(paramInt1, paramActivity, null, paramInt2, paramOnCancelListener);
  }

  public static boolean showErrorDialogFragment(int paramInt1, Activity paramActivity, Fragment paramFragment, int paramInt2, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    Dialog localDialog = zza(paramInt1, paramActivity, paramFragment, paramInt2, paramOnCancelListener);
    if (localDialog == null)
      return false;
    try
    {
      bool = paramActivity instanceof FragmentActivity;
      if (bool)
      {
        android.support.v4.app.FragmentManager localFragmentManager1 = ((FragmentActivity)paramActivity).getSupportFragmentManager();
        SupportErrorDialogFragment.newInstance(localDialog, paramOnCancelListener).show(localFragmentManager1, "GooglePlayServicesErrorDialog");
      }
      while (true)
      {
        return true;
        if (!zzme.zzkd())
          break;
        android.app.FragmentManager localFragmentManager = paramActivity.getFragmentManager();
        ErrorDialogFragment.newInstance(localDialog, paramOnCancelListener).show(localFragmentManager, "GooglePlayServicesErrorDialog");
      }
      throw new RuntimeException("This Activity does not support Fragments.");
    }
    catch (NoClassDefFoundError localNoClassDefFoundError)
    {
      while (true)
        boolean bool = false;
    }
  }

  public static void showErrorNotification(int paramInt, Context paramContext)
  {
    if ((zzlu.zzQ(paramContext)) && (paramInt == 2))
      paramInt = 42;
    if ((zzh(paramContext, paramInt)) || (zzi(paramContext, paramInt)))
    {
      zzK(paramContext);
      return;
    }
    zza(paramInt, paramContext);
  }

  public static void zzI(Context paramContext)
    throws GooglePlayServicesRepairableException, GooglePlayServicesNotAvailableException
  {
    int i = isGooglePlayServicesAvailable(paramContext);
    if (i != 0)
    {
      Intent localIntent = zzan(i);
      Log.e("GooglePlayServicesUtil", "GooglePlayServices not available due to error " + i);
      if (localIntent == null)
        throw new GooglePlayServicesNotAvailableException(i);
      throw new GooglePlayServicesRepairableException(i, "Google Play Services not available", localIntent);
    }
  }

  private static void zzJ(Context paramContext)
  {
    int i;
    try
    {
      ApplicationInfo localApplicationInfo2 = paramContext.getPackageManager().getApplicationInfo(paramContext.getPackageName(), 128);
      localApplicationInfo1 = localApplicationInfo2;
      Bundle localBundle = localApplicationInfo1.metaData;
      if (localBundle == null)
        break label123;
      i = localBundle.getInt("com.google.android.gms.version");
      if (i == 7095000)
        return;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      while (true)
      {
        Log.wtf("GooglePlayServicesUtil", "This should never happen.", localNameNotFoundException);
        ApplicationInfo localApplicationInfo1 = null;
      }
    }
    throw new IllegalStateException("The meta-data tag in your app's AndroidManifest.xml does not have the right value.  Expected 7095000 but found " + i + ".  You must have the" + " following declaration within the <application> element: " + "    <meta-data android:name=\"" + "com.google.android.gms.version" + "\" android:value=\"@integer/google_play_services_version\" />");
    label123: throw new IllegalStateException("A required meta-data tag in your app's AndroidManifest.xml does not exist.  You must have the following declaration within the <application> element:     <meta-data android:name=\"com.google.android.gms.version\" android:value=\"@integer/google_play_services_version\" />");
  }

  private static void zzK(Context paramContext)
  {
    zza localzza = new zza(paramContext);
    localzza.sendMessageDelayed(localzza.obtainMessage(1), 120000L);
  }

  public static void zzL(Context paramContext)
  {
    try
    {
      ((NotificationManager)paramContext.getSystemService("notification")).cancel(10436);
      return;
    }
    catch (SecurityException localSecurityException)
    {
    }
  }

  private static String zzM(Context paramContext)
  {
    String str = paramContext.getApplicationInfo().name;
    PackageManager localPackageManager;
    if (TextUtils.isEmpty(str))
    {
      str = paramContext.getPackageName();
      localPackageManager = paramContext.getApplicationContext().getPackageManager();
    }
    try
    {
      ApplicationInfo localApplicationInfo2 = localPackageManager.getApplicationInfo(paramContext.getPackageName(), 0);
      localApplicationInfo1 = localApplicationInfo2;
      if (localApplicationInfo1 != null)
        str = localPackageManager.getApplicationLabel(localApplicationInfo1).toString();
      return str;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      while (true)
        ApplicationInfo localApplicationInfo1 = null;
    }
  }

  private static Dialog zza(int paramInt1, Activity paramActivity, Fragment paramFragment, int paramInt2, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    if ((zzlu.zzQ(paramActivity)) && (paramInt1 == 2))
      paramInt1 = 42;
    if (zzme.zzkg())
    {
      TypedValue localTypedValue = new TypedValue();
      paramActivity.getTheme().resolveAttribute(16843529, localTypedValue, true);
      if (!"Theme.Dialog.Alert".equals(paramActivity.getResources().getResourceEntryName(localTypedValue.resourceId)));
    }
    for (AlertDialog.Builder localBuilder = new AlertDialog.Builder(paramActivity, 5); ; localBuilder = null)
    {
      if (localBuilder == null)
        localBuilder = new AlertDialog.Builder(paramActivity);
      localBuilder.setMessage(zze(paramActivity, paramInt1));
      if (paramOnCancelListener != null)
        localBuilder.setOnCancelListener(paramOnCancelListener);
      Intent localIntent = zzan(paramInt1);
      if (paramFragment == null);
      for (zzg localzzg = new zzg(paramActivity, localIntent, paramInt2); ; localzzg = new zzg(paramFragment, localIntent, paramInt2))
      {
        String str = zzf(paramActivity, paramInt1);
        if (str != null)
          localBuilder.setPositiveButton(str, localzzg);
        switch (paramInt1)
        {
        default:
          Log.e("GooglePlayServicesUtil", "Unexpected error code " + paramInt1);
          return localBuilder.create();
        case 0:
        case 4:
        case 6:
        case 1:
        case 3:
        case 2:
        case 42:
        case 9:
        case 7:
        case 8:
        case 10:
        case 5:
        case 11:
        case 16:
        case 17:
        }
      }
      return null;
      return localBuilder.create();
      return localBuilder.setTitle(R.string.common_google_play_services_install_title).create();
      return localBuilder.setTitle(R.string.common_google_play_services_enable_title).create();
      return localBuilder.setTitle(R.string.common_google_play_services_update_title).create();
      return localBuilder.setTitle(R.string.common_android_wear_update_title).create();
      Log.e("GooglePlayServicesUtil", "Google Play services is invalid. Cannot recover.");
      return localBuilder.setTitle(R.string.common_google_play_services_unsupported_title).create();
      Log.e("GooglePlayServicesUtil", "Network error occurred. Please retry request later.");
      return localBuilder.setTitle(R.string.common_google_play_services_network_error_title).create();
      Log.e("GooglePlayServicesUtil", "Internal error occurred. Please see logs for detailed information");
      return localBuilder.create();
      Log.e("GooglePlayServicesUtil", "Developer error occurred. Please see logs for detailed information");
      return localBuilder.create();
      Log.e("GooglePlayServicesUtil", "An invalid account was specified when connecting. Please provide a valid account.");
      return localBuilder.setTitle(R.string.common_google_play_services_invalid_account_title).create();
      Log.e("GooglePlayServicesUtil", "The application is not licensed to the user.");
      return localBuilder.create();
      Log.e("GooglePlayServicesUtil", "One of the API components you attempted to connect to is not available.");
      return localBuilder.create();
      Log.e("GooglePlayServicesUtil", "The specified account could not be signed in.");
      return localBuilder.setTitle(R.string.common_google_play_services_sign_in_failed_title).create();
    }
  }

  private static void zza(int paramInt, Context paramContext)
  {
    zza(paramInt, paramContext, null);
  }

  private static void zza(int paramInt, Context paramContext, String paramString)
  {
    Resources localResources = paramContext.getResources();
    String str1 = zzg(paramContext, paramInt);
    int i = R.string.common_google_play_services_error_notification_requested_by_msg;
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = zzM(paramContext);
    String str2 = localResources.getString(i, arrayOfObject);
    PendingIntent localPendingIntent = getErrorPendingIntent(paramInt, paramContext, 0);
    Object localObject;
    NotificationManager localNotificationManager;
    if (zzlu.zzQ(paramContext))
    {
      zzx.zzN(zzme.zzkh());
      localObject = new Notification.Builder(paramContext).setSmallIcon(R.drawable.common_ic_googleplayservices).setPriority(2).setAutoCancel(true).setStyle(new Notification.BigTextStyle().bigText(str1 + " " + str2)).addAction(R.drawable.common_full_open_on_phone, localResources.getString(R.string.common_open_on_phone), localPendingIntent).build();
      localNotificationManager = (NotificationManager)paramContext.getSystemService("notification");
      if (paramString != null)
        localNotificationManager.notify(paramString, getErrorNotificationId(paramInt), (Notification)localObject);
    }
    else
    {
      Notification localNotification = new Notification(17301642, localResources.getString(R.string.common_google_play_services_notification_ticker), System.currentTimeMillis());
      localNotification.flags = (0x10 | localNotification.flags);
      if (Build.VERSION.SDK_INT >= 21)
        localNotification.flags = (0x100 | localNotification.flags);
      while (true)
      {
        localNotification.setLatestEventInfo(paramContext, str1, str2, localPendingIntent);
        localObject = localNotification;
        break;
        if (Build.VERSION.SDK_INT >= 19)
          localNotification.extras.putBoolean("android.support.localOnly", true);
      }
    }
    localNotificationManager.notify(getErrorNotificationId(paramInt), (Notification)localObject);
  }

  public static boolean zza(Context paramContext, int paramInt, String paramString)
  {
    AppOpsManager localAppOpsManager;
    if (zzme.zzkj())
      localAppOpsManager = (AppOpsManager)paramContext.getSystemService("appops");
    try
    {
      localAppOpsManager.checkPackage(paramInt, paramString);
      boolean bool = true;
      String[] arrayOfString;
      do
      {
        do
        {
          return bool;
          arrayOfString = paramContext.getPackageManager().getPackagesForUid(paramInt);
          bool = false;
        }
        while (paramString == null);
        bool = false;
      }
      while (arrayOfString == null);
      for (int i = 0; ; i++)
      {
        int j = arrayOfString.length;
        bool = false;
        if (i >= j)
          break;
        if (paramString.equals(arrayOfString[i]))
          return true;
      }
    }
    catch (SecurityException localSecurityException)
    {
    }
    return false;
  }

  public static boolean zza(Resources paramResources)
  {
    if (paramResources == null);
    while (true)
    {
      return false;
      if ((0xF & paramResources.getConfiguration().screenLayout) > 3);
      for (int i = 1; ((zzme.zzkd()) && (i != 0)) || (zzb(paramResources)); i = 0)
        return true;
    }
  }

  public static Intent zzan(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return null;
    case 1:
    case 2:
      return zzo.zzbl("com.google.android.gms");
    case 42:
      return zzo.zzjl();
    case 3:
    }
    return zzo.zzbj("com.google.android.gms");
  }

  public static boolean zzb(PackageManager paramPackageManager)
  {
    synchronized (zzLG)
    {
      int i = zzLF;
      if (i == -1);
      try
      {
        PackageInfo localPackageInfo = paramPackageManager.getPackageInfo("com.google.android.gms", 64);
        zzc localzzc = zzc.zzhP();
        zzb.zza[] arrayOfzza = new zzb.zza[1];
        arrayOfzza[0] = zzb.zzLv[1];
        if (localzzc.zza(localPackageInfo, arrayOfzza) != null);
        for (zzLF = 1; zzLF != 0; zzLF = 0)
          return true;
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException)
      {
        while (true)
          zzLF = 0;
      }
    }
    return false;
  }

  @Deprecated
  public static boolean zzb(PackageManager paramPackageManager, String paramString)
  {
    return zzc.zzhP().zzb(paramPackageManager, paramString);
  }

  private static boolean zzb(Resources paramResources)
  {
    Configuration localConfiguration = paramResources.getConfiguration();
    boolean bool1 = zzme.zzkf();
    boolean bool2 = false;
    if (bool1)
    {
      int i = 0xF & localConfiguration.screenLayout;
      bool2 = false;
      if (i <= 3)
      {
        int j = localConfiguration.smallestScreenWidthDp;
        bool2 = false;
        if (j >= 600)
          bool2 = true;
      }
    }
    return bool2;
  }

  public static boolean zzc(PackageManager paramPackageManager)
  {
    return (zzb(paramPackageManager)) || (!zzhO());
  }

  public static boolean zzd(Context paramContext, int paramInt)
  {
    return (zza(paramContext, paramInt, "com.google.android.gms")) && (zzb(paramContext.getPackageManager(), "com.google.android.gms"));
  }

  public static String zze(Context paramContext, int paramInt)
  {
    Resources localResources = paramContext.getResources();
    switch (paramInt)
    {
    default:
      return localResources.getString(R.string.common_google_play_services_unknown_issue);
    case 1:
      if (zza(paramContext.getResources()))
        return localResources.getString(R.string.common_google_play_services_install_text_tablet);
      return localResources.getString(R.string.common_google_play_services_install_text_phone);
    case 3:
      return localResources.getString(R.string.common_google_play_services_enable_text);
    case 2:
      return localResources.getString(R.string.common_google_play_services_update_text);
    case 42:
      return localResources.getString(R.string.common_android_wear_update_text);
    case 9:
      return localResources.getString(R.string.common_google_play_services_unsupported_text);
    case 7:
      return localResources.getString(R.string.common_google_play_services_network_error_text);
    case 5:
      return localResources.getString(R.string.common_google_play_services_invalid_account_text);
    case 16:
      return localResources.getString(R.string.commono_google_play_services_api_unavailable_text);
    case 17:
    }
    return localResources.getString(R.string.common_google_play_services_sign_in_failed_text);
  }

  public static String zzf(Context paramContext, int paramInt)
  {
    Resources localResources = paramContext.getResources();
    switch (paramInt)
    {
    default:
      return localResources.getString(17039370);
    case 1:
      return localResources.getString(R.string.common_google_play_services_install_button);
    case 3:
      return localResources.getString(R.string.common_google_play_services_enable_button);
    case 2:
    case 42:
    }
    return localResources.getString(R.string.common_google_play_services_update_button);
  }

  public static String zzg(Context paramContext, int paramInt)
  {
    Resources localResources = paramContext.getResources();
    switch (paramInt)
    {
    default:
      return localResources.getString(R.string.common_google_play_services_unknown_issue);
    case 1:
      return localResources.getString(R.string.common_google_play_services_notification_needs_installation_title);
    case 2:
      return localResources.getString(R.string.common_google_play_services_notification_needs_update_title);
    case 42:
      return localResources.getString(R.string.common_android_wear_notification_needs_update_text);
    case 3:
      return localResources.getString(R.string.common_google_play_services_needs_enabling_title);
    case 9:
      return localResources.getString(R.string.common_google_play_services_unsupported_text);
    case 7:
      return localResources.getString(R.string.common_google_play_services_network_error_text);
    case 5:
      return localResources.getString(R.string.common_google_play_services_invalid_account_text);
    case 16:
      return localResources.getString(R.string.commono_google_play_services_api_unavailable_text);
    case 17:
    }
    return localResources.getString(R.string.common_google_play_services_sign_in_failed_text);
  }

  private static boolean zzg(Context paramContext, String paramString)
  {
    if (zzme.zzkl())
    {
      Iterator localIterator = paramContext.getPackageManager().getPackageInstaller().getAllSessions().iterator();
      do
        if (!localIterator.hasNext())
          break;
      while (!paramString.equals(((PackageInstaller.SessionInfo)localIterator.next()).getAppPackageName()));
      return true;
    }
    PackageManager localPackageManager = paramContext.getPackageManager();
    try
    {
      boolean bool = localPackageManager.getApplicationInfo(paramString, 8192).enabled;
      if (bool)
        return true;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
    }
    return false;
  }

  public static boolean zzh(Context paramContext, int paramInt)
  {
    if (paramInt == 1)
      return zzg(paramContext, "com.google.android.gms");
    return false;
  }

  public static boolean zzhO()
  {
    if (zzLD)
      return zzLE;
    return "user".equals(Build.TYPE);
  }

  public static boolean zzi(Context paramContext, int paramInt)
  {
    if (paramInt == 9)
      return zzg(paramContext, "com.android.vending");
    return false;
  }

  private static class zza extends Handler
  {
    private final Context zznk;

    zza(Context paramContext)
    {
    }

    public void handleMessage(Message paramMessage)
    {
      switch (paramMessage.what)
      {
      default:
        Log.w("GooglePlayServicesUtil", "Don't know how to handle this message: " + paramMessage.what);
      case 1:
      }
      int i;
      do
      {
        return;
        i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(this.zznk);
      }
      while (!GooglePlayServicesUtil.isUserRecoverableError(i));
      GooglePlayServicesUtil.zzb(i, this.zznk);
    }
  }
}