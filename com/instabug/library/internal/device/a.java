package com.instabug.library.internal.device;

import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.instabug.library.Instabug.a;
import com.instabug.library.util.d;
import com.instabug.library.util.d.a;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.UUID;

public class a
{
  private long a;
  private WeakReference b;
  private String c;

  public a(Context paramContext)
  {
    this.b = new WeakReference(paramContext);
  }

  public static String a()
  {
    return Build.MANUFACTURER + " " + Build.MODEL;
  }

  public static String a(long paramLong)
  {
    boolean bool = paramLong < 1024L;
    String str = null;
    if (!bool)
    {
      str = " KB";
      paramLong /= 1024L;
      if (paramLong >= 1024L)
      {
        str = " MB";
        paramLong /= 1024L;
      }
    }
    StringBuilder localStringBuilder = new StringBuilder(Long.toString(paramLong));
    for (int i = -3 + localStringBuilder.length(); i > 0; i -= 3)
      localStringBuilder.insert(i, ',');
    if (str != null)
      localStringBuilder.append(str);
    return localStringBuilder.toString();
  }

  public static String c()
  {
    while (true)
    {
      int j;
      try
      {
        String str = Build.TAGS;
        int i;
        if ((str != null) && (str.contains("test-keys")))
        {
          i = 1;
          if ((i != 0) || (t()))
            break label90;
          new d();
          if (d.a(d.a.a) != null)
          {
            j = 1;
            break label82;
            if (k == 0)
              break label79;
            return "Rooted";
          }
        }
        else
        {
          i = 0;
          continue;
        }
        j = 0;
      }
      catch (Exception localException)
      {
        Instabug.a.a(localException.toString());
      }
      label79: return "Not rooted";
      label82: int k = 0;
      if (j != 0)
        label90: k = 1;
    }
  }

  public static String l()
  {
    BufferedReader localBufferedReader;
    StringBuilder localStringBuilder;
    ArrayList localArrayList;
    try
    {
      localBufferedReader = new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec("logcat -v time -d " + android.os.Process.myPid()).getInputStream()));
      localStringBuilder = new StringBuilder();
      localArrayList = new ArrayList();
      while (true)
      {
        String str1 = localBufferedReader.readLine();
        if (str1 == null)
          break;
        localArrayList.add(str1);
      }
    }
    catch (IOException localIOException)
    {
      Log.d("Instabug Utils", "Could not read logcat log. Exception is:\n" + localIOException.toString());
      return "Error in reading Log File";
    }
    localBufferedReader.close();
    localArrayList.trimToSize();
    int i = localArrayList.size();
    int j = 0;
    if (i > 700)
      j = -700 + localArrayList.size();
    while (true)
    {
      int k;
      if (k < localArrayList.size())
      {
        localStringBuilder.append((String)localArrayList.get(k));
        localStringBuilder.append("\n");
        k++;
      }
      else
      {
        localArrayList.clear();
        String str2 = localStringBuilder.toString();
        return str2;
        k = j;
      }
    }
  }

  public static String p()
  {
    if (s())
    {
      StatFs localStatFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
      long l1 = localStatFs.getBlockSize();
      long l2 = localStatFs.getAvailableBlocks();
      return a(l1 * (localStatFs.getBlockCount() - l2));
    }
    return "No external memory mounted";
  }

  public static String q()
  {
    if (s())
    {
      StatFs localStatFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
      return a(localStatFs.getBlockSize() * localStatFs.getAvailableBlocks());
    }
    return "No external memory mounted";
  }

  public static String r()
  {
    if (s())
    {
      StatFs localStatFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
      return a(localStatFs.getBlockSize() * localStatFs.getBlockCount());
    }
    return "No external memory mounted";
  }

  public static boolean s()
  {
    return Environment.getExternalStorageState().equals("mounted");
  }

  public static boolean t()
  {
    try
    {
      boolean bool = new File("/system/app/Superuser.apk").exists();
      return bool;
    }
    catch (Exception localException)
    {
    }
    return false;
  }

  private void u()
  {
    try
    {
      RandomAccessFile localRandomAccessFile = new RandomAccessFile("/proc/meminfo", "r");
      this.c = localRandomAccessFile.readLine();
      this.c = this.c.split(":")[1].trim();
      this.c = this.c.substring(0, -3 + this.c.length()).trim();
      this.a = (Long.parseLong(this.c) << 10);
      this.c = a(this.a);
      localRandomAccessFile.close();
      return;
    }
    catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
  }

  public final boolean b()
  {
    Resources localResources = ((Context)this.b.get()).getResources();
    try
    {
      boolean bool = localResources.getBoolean(localResources.getIdentifier("isTablet", "bool", ((Context)this.b.get()).getPackageName()));
      return bool;
    }
    catch (Exception localException)
    {
    }
    return false;
  }

  public final String d()
  {
    try
    {
      IntentFilter localIntentFilter = new IntentFilter("android.intent.action.BATTERY_CHANGED");
      Intent localIntent = ((Context)this.b.get()).registerReceiver(null, localIntentFilter);
      int i = localIntent.getIntExtra("level", -1);
      int j = localIntent.getIntExtra("scale", -1);
      float f = i / j;
      String str = (int)(f * 100.0F) + "%";
      return str;
    }
    catch (Exception localException)
    {
    }
    return "Could not get information";
  }

  public final String e()
  {
    while (true)
    {
      int k;
      int m;
      label74: String str;
      try
      {
        IntentFilter localIntentFilter = new IntentFilter("android.intent.action.BATTERY_CHANGED");
        Intent localIntent = ((Context)this.b.get()).registerReceiver(null, localIntentFilter);
        int i = localIntent.getIntExtra("status", -1);
        if (i != 2)
        {
          if (i != 5)
            break label139;
          break label121;
          k = localIntent.getIntExtra("plugged", -1);
          if (k != 2)
            break label145;
          m = 1;
          break label127;
          if (j != 0)
          {
            StringBuilder localStringBuilder = new StringBuilder("Charging");
            if (n == 0)
              break label157;
            str = " through AC Charger";
            return str;
          }
          return "Unplugged";
        }
      }
      catch (Exception localException)
      {
        return "Could not get information";
      }
      label121: int j = 1;
      continue;
      while (true)
      {
        label127: if (k != 1)
          break label151;
        n = 1;
        break label74;
        label139: j = 0;
        break;
        label145: m = 0;
      }
      label151: int n = 0;
      continue;
      label157: if (m != 0)
        str = " through USB cable";
      else
        str = "";
    }
  }

  public final String f()
  {
    try
    {
      localTelephonyManager = (TelephonyManager)((Context)this.b.get()).getSystemService("phone");
      if (localTelephonyManager != null)
        return localTelephonyManager.getNetworkOperatorName();
    }
    catch (Exception localException)
    {
      while (true)
        TelephonyManager localTelephonyManager = null;
    }
    return "Unknown";
  }

  public final String g()
  {
    PackageInfo localPackageInfo1 = new PackageInfo();
    try
    {
      PackageInfo localPackageInfo3 = ((Context)this.b.get()).getPackageManager().getPackageInfo(((Context)this.b.get()).getPackageName(), 0);
      localPackageInfo2 = localPackageInfo3;
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = localPackageInfo2.versionName;
      arrayOfObject[1] = Integer.valueOf(localPackageInfo2.versionCode);
      return String.format("%s (%s)", arrayOfObject);
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      while (true)
      {
        localNameNotFoundException.printStackTrace();
        PackageInfo localPackageInfo2 = localPackageInfo1;
      }
    }
  }

  public final String h()
  {
    try
    {
      String str = ((Context)this.b.get()).getPackageName();
      return str;
    }
    catch (Exception localException)
    {
    }
    return "Could not get information";
  }

  public final boolean i()
  {
    try
    {
      NetworkInfo localNetworkInfo = ((ConnectivityManager)((Context)this.b.get()).getSystemService("connectivity")).getActiveNetworkInfo();
      if (localNetworkInfo != null)
      {
        boolean bool = localNetworkInfo.isConnectedOrConnecting();
        if (bool)
          return true;
      }
    }
    catch (SecurityException localSecurityException)
    {
      Instabug.a.a("Could not read network state. To enable please add the following line in your AndroidManifest.xml <uses-permission android:name=\"android.permission.ACCESS_NETWORK_STATE\"/>");
      return false;
    }
    catch (Exception localException)
    {
      label47: break label47;
    }
  }

  public final String j()
  {
    SharedPreferences localSharedPreferences = ((Context)this.b.get()).getSharedPreferences("instabug", 0);
    String str = localSharedPreferences.getString("ib_uuid", null);
    if (str == null)
    {
      str = UUID.randomUUID().toString();
      localSharedPreferences.edit().putString("ib_uuid", str).apply();
    }
    return str;
  }

  public final String k()
  {
    try
    {
      boolean bool = ((ConnectivityManager)((Context)this.b.get()).getSystemService("connectivity")).getNetworkInfo(1).isConnected();
      if (bool)
        try
        {
          String str = ((WifiManager)((Context)this.b.get()).getSystemService("wifi")).getConnectionInfo().getSSID();
          return str;
        }
        catch (SecurityException localSecurityException)
        {
          Instabug.a.a("Could not read wifi SSID. To enable please add the following line in your AndroidManifest.xml <uses-permission android:name=\"android.permission.ACCESS_WIFI_STATE\"/>");
          return "Connected";
        }
      return "Not Connected";
    }
    catch (Exception localException)
    {
    }
    return "Could not get information";
  }

  public final String m()
  {
    ActivityManager localActivityManager = (ActivityManager)((Context)this.b.get()).getSystemService("activity");
    ActivityManager.MemoryInfo localMemoryInfo = new ActivityManager.MemoryInfo();
    localActivityManager.getMemoryInfo(localMemoryInfo);
    if (this.a <= 0L)
      u();
    return a(this.a - localMemoryInfo.availMem);
  }

  public final String n()
  {
    if (this.c == null)
      u();
    return this.c;
  }

  public final String o()
  {
    ActivityManager localActivityManager = (ActivityManager)((Context)this.b.get()).getSystemService("activity");
    ActivityManager.MemoryInfo localMemoryInfo = new ActivityManager.MemoryInfo();
    localActivityManager.getMemoryInfo(localMemoryInfo);
    return a(localMemoryInfo.availMem);
  }
}