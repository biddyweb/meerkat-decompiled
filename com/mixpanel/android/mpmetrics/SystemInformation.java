package com.mixpanel.android.mpmetrics;

import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build.VERSION;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

class SystemInformation
{
  public static final String LOGTAG = "MixpanelAPI.SystemInformation";
  private final Integer mAppVersionCode;
  private final String mAppVersionName;
  private final Context mContext;
  private final DisplayMetrics mDisplayMetrics;
  private final Boolean mHasNFC;
  private final Boolean mHasTelephony;

  public SystemInformation(Context paramContext)
  {
    this.mContext = paramContext;
    PackageManager localPackageManager = this.mContext.getPackageManager();
    String str = null;
    try
    {
      PackageInfo localPackageInfo = localPackageManager.getPackageInfo(this.mContext.getPackageName(), 0);
      str = localPackageInfo.versionName;
      Integer localInteger2 = Integer.valueOf(localPackageInfo.versionCode);
      localInteger1 = localInteger2;
      this.mAppVersionName = str;
      this.mAppVersionCode = localInteger1;
      localClass = localPackageManager.getClass();
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      try
      {
        while (true)
        {
          Integer localInteger1;
          Class localClass;
          Method localMethod2 = localClass.getMethod("hasSystemFeature", new Class[] { String.class });
          localMethod1 = localMethod2;
          Boolean localBoolean1 = null;
          Boolean localBoolean2 = null;
          if (localMethod1 != null);
          try
          {
            localBoolean1 = (Boolean)localMethod1.invoke(localPackageManager, new Object[] { "android.hardware.nfc" });
            localBoolean2 = (Boolean)localMethod1.invoke(localPackageManager, new Object[] { "android.hardware.telephony" });
            this.mHasNFC = localBoolean1;
            this.mHasTelephony = localBoolean2;
            this.mDisplayMetrics = new DisplayMetrics();
            ((WindowManager)this.mContext.getSystemService("window")).getDefaultDisplay().getMetrics(this.mDisplayMetrics);
            return;
            localNameNotFoundException = localNameNotFoundException;
            Log.w("MixpanelAPI.SystemInformation", "System information constructed with a context that apparently doesn't exist.");
            localInteger1 = null;
          }
          catch (InvocationTargetException localInvocationTargetException)
          {
            while (true)
            {
              Log.w("MixpanelAPI.SystemInformation", "System version appeared to support PackageManager.hasSystemFeature, but we were unable to call it.");
              localBoolean2 = null;
            }
          }
          catch (IllegalAccessException localIllegalAccessException)
          {
            while (true)
            {
              Log.w("MixpanelAPI.SystemInformation", "System version appeared to support PackageManager.hasSystemFeature, but we were unable to call it.");
              localBoolean2 = null;
            }
          }
        }
      }
      catch (NoSuchMethodException localNoSuchMethodException)
      {
        while (true)
          Method localMethod1 = null;
      }
    }
  }

  public Integer getAppVersionCode()
  {
    return this.mAppVersionCode;
  }

  public String getAppVersionName()
  {
    return this.mAppVersionName;
  }

  public String getBluetoothVersion()
  {
    int i = Build.VERSION.SDK_INT;
    String str = null;
    if (i >= 8)
    {
      str = "none";
      if ((Build.VERSION.SDK_INT < 18) || (!this.mContext.getPackageManager().hasSystemFeature("android.hardware.bluetooth_le")))
        break label43;
      str = "ble";
    }
    label43: 
    while (!this.mContext.getPackageManager().hasSystemFeature("android.hardware.bluetooth"))
      return str;
    return "classic";
  }

  public String getCurrentNetworkOperator()
  {
    TelephonyManager localTelephonyManager = (TelephonyManager)this.mContext.getSystemService("phone");
    String str = null;
    if (localTelephonyManager != null)
      str = localTelephonyManager.getNetworkOperatorName();
    return str;
  }

  public DisplayMetrics getDisplayMetrics()
  {
    return this.mDisplayMetrics;
  }

  public String getPhoneRadioType()
  {
    TelephonyManager localTelephonyManager = (TelephonyManager)this.mContext.getSystemService("phone");
    if (localTelephonyManager != null);
    switch (localTelephonyManager.getPhoneType())
    {
    default:
      return null;
    case 0:
      return "none";
    case 1:
      return "gsm";
    case 2:
      return "cdma";
    case 3:
    }
    return "sip";
  }

  public boolean hasNFC()
  {
    return this.mHasNFC.booleanValue();
  }

  public boolean hasTelephony()
  {
    return this.mHasTelephony.booleanValue();
  }

  public Boolean isBluetoothEnabled()
  {
    try
    {
      BluetoothAdapter localBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
      Object localObject = null;
      if (localBluetoothAdapter != null)
      {
        Boolean localBoolean = Boolean.valueOf(localBluetoothAdapter.isEnabled());
        localObject = localBoolean;
      }
      return localObject;
    }
    catch (SecurityException localSecurityException)
    {
    }
    return null;
  }

  public Boolean isWifiConnected()
  {
    int i = this.mContext.checkCallingOrSelfPermission("android.permission.ACCESS_NETWORK_STATE");
    Boolean localBoolean = null;
    if (i == 0)
      localBoolean = Boolean.valueOf(((ConnectivityManager)this.mContext.getSystemService("connectivity")).getNetworkInfo(1).isConnected());
    return localBoolean;
  }
}